# This will generate an output 

import requests
import os
import sys

if not os.path.exists('.token'):
    print('.token file not found.')
    sys.exit(1)

with open('.token', 'r') as filey:
    token = filey.read().strip('\n')

if len(sys.argv) < 2:
    print('The milestone number should be the first argument.')
    sys.exit(1)

milestone = sys.argv[1]
full_name = os.environ.get('GITHUB_REPOSITORY')

if full_name is None:
    print('export GITHUB_REPOSITORY title to continue.')
    sys.exit(1)

username, repository = full_name.split('/')

query = """{
  repository(owner: "%s", name: "%s") {
    milestone(number: %s) {
      pullRequests(first: 100) {
        edges {
          node {
            commits(first: 100) {
              edges {
                node {
                  commit {
                    id,
                    commitUrl,
                    message
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
""" % (username, repository, milestone)

headers = {"Authorization": "Bearer %s" % token}

def run_query(query): # A simple function to use requests.post to make the API call. Note the json= section.
    request = requests.post('https://api.github.com/graphql', json={'query': query}, headers=headers)
    if request.status_code == 200:
        return request.json()
    else:
        raise Exception("Query failed to run by returning code of {}. {}".format(request.status_code, query))

# Execute the query
result = run_query(query)

# Return string to console
found_commits = set()

for node in result['data']['repository']['milestone']['pullRequests']['edges']:  
    for commit in node['node']['commits']['edges']:
        url = commit['node']['commit']['commitUrl']
        message = commit['node']['commit']['message']
        commit = url.split('/')[-1]
        found_commits.add(commit)
    
print(' '.join(list(found_commits)))
