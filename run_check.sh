#!/bin/bash

set -o pipefail

################################################################################
# Global Variables (we can't use GITHUB_ prefix)
################################################################################

if [[ ! -f ".token" ]]; then
    echo ".token file with personal access token not found. Generate first!"
    exit 1;
fi

# The user needs to have exported the GitHub repository and milestone
if [[ -z "${GITHUB_REPOSITORY}" ]]; then
    echo "You must export the GITHUB_REPOSITORY as an environment variable."
    exit 1
fi

# The user needs to have exported the GitHub repository and milestone
if [[ -z "${GITHUB_MILESTONE}" ]]; then
    echo "You must export the GITHUB_MILESTONE as an environment variable."
    exit 1
fi

# You should have saved a token to .token
GITHUB_TOKEN=$(cat .token)

# Now we need the path to change to
if [ $# -eq 0 ]; then
    echo "Please provide the full path to the repository to check, with the branch active to check."
fi

FULLPATH=$1

# Make sure it exists
if [[ ! -d "${FULLPATH}" ]]; then
    echo "$FULLPATH is not a directory on the filesystem"
    exit 1;
fi

API_VERSION=v3
BASE=https://api.github.com
AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"
HEADER="Accept: application/vnd.github.${API_VERSION}+json"
HEADER="${HEADER}; application/vnd.github.antiope-preview+json; application/vnd.github.shadow-cat-preview+json"

# URLs
REPO_URL="${BASE}/repos/${GITHUB_REPOSITORY}"
ISSUES_URL=${REPO_URL}/issues
PULLS_URL=${REPO_URL}/pulls
MILESTONES_URL=${REPO_URL}/milestones

################################################################################
# Helper Functions
################################################################################

check_credentials() {

    if [[ -z "${GITHUB_TOKEN}" ]]; then
        echo "You must include the GITHUB_TOKEN as an environment variable."
        exit 1
    fi

}

ensure_repository() {

    if [[ ! -d ".git" ]]; then
        echo "You must be in the folder of a git repository to check."
        exit 1
    fi
  
}

check_milestone() {

    # In case the milestone was closed, get all (default is open)
    DATA="{\"state\":\"all\"}"
    RESPONSE=$(curl -sSL -H "${AUTH_HEADER}" -H "${HEADER}" -X GET --data "${DATA}" ${MILESTONES_URL})

    # Raw output, compact (one entry per line)
    MILESTONES=$(echo "$RESPONSE" | jq --raw-output -c '.[] | @base64')

    for M in ${MILESTONES}; do
        MILESTONE="$(echo "$M" | base64 --decode)"

        MILESTONE_TITLE=$(echo "$MILESTONE" | jq --raw-output '.title')

	if [[ "$MILESTONE_TITLE" == "${GITHUB_MILESTONE}" ]]; then
            MILESTONE_ID=$(echo "$MILESTONE" | jq --raw-output '.number')
            MILESTONE_URL=$(echo "$MILESTONE" | jq --raw-output '.url')
            break
        fi
    done

    # If we didn't find the milestone, poop out
    if [[ -z "${MILESTONE_ID}" ]]; then
        echo "We couldn't find a milestone with title ${GITHUB_MILESTONE}."
        exit 1
    fi
    echo "Found milestone \"$GITHUB_MILESTONE\" with ID $MILESTONE_ID"

    cd $FULLPATH
    ensure_repository
    BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
    echo "Git Branch is $BRANCH"
    echo "Evaluating commits for milestone $MILESTONE_TITLE against $BRANCH"

    # First get pull requests - they are considered issues. Won't work without quotes
    # echo "curl -sSL -H "${AUTH_HEADER}" -H "${HEADER}" -X GET \"${ISSUES_URL}?milestone=$MILESTONE_ID&state=all\""
    RESPONSE=$(curl -sSL -H "${AUTH_HEADER}" -H "${HEADER}" -X GET "${ISSUES_URL}?milestone=$MILESTONE_ID&state=all")

    PRS=$(echo "$RESPONSE" | jq --raw-output -c '.[] | @base64')
    for P in ${PRS}; do
        PR="$(echo "$P" | base64 --decode)"
        PR_URL=$(echo "$PR" | jq --raw-output '.pull_request.html_url')
        PR_NUMBER=$(echo ${PR_URL##*/})

        # Only continue if there is a pull request
        if [[ ! -z "${PR_URL}" ]]; then
            COMMITS_URL=${PULLS_URL}/${PR_NUMBER}/commits
            echo
            echo "Checking Pull Request ${PR_URL}"

            # The commits_url includes commits from the pull request, and NOT merge (squash, regular, or rebase) 
            COMMITS=$(curl -sSL -H "${AUTH_HEADER}" -H "${HEADER}" -X GET ${COMMITS_URL} | jq --raw-output -c '.[] | @base64')
            for C in ${COMMITS}; do
                COMMIT="$(echo "$C" | base64 --decode)"
                SHA=$(echo "$COMMIT" | jq --raw-output '.sha')
                HTML_URL=$(echo "$COMMIT" | jq --raw-output '.html_url')  
                check_commit $SHA $HTML_URL
            done
        fi
    done

}

check_commit() {

    COMMIT=$1
    HTML_URL=$2
    FOUND_BRANCH=$(git branch -q --contains $COMMIT /dev/null 2>&1)
    retval=$?

    # Case 1: commit not found
    if [[ $retval == 129 ]]; then
       echo "Missing $HTML_URL"

    # Case 2: found, ensure correct branch
    elif [[ $retval == 0 ]]; then
       FOUND_BRANCH=$(git branch --contains $COMMIT | grep \* | cut -d ' ' -f2)
       if [[ "$FOUND_BRANCH" != "$BRANCH" ]]; then
           echo "WRONG BRANCH $COMMIT is in branch $FOUND_BRANCH";
       fi
       echo "CORRECT Found $COMMIT in branch $BRANCH";           
    else
       echo "Unrecognized return value $retval"
    fi
}

main () {
    check_credentials
    check_milestone
}

echo "==========================================================================";
main;
echo "==========================================================================";
