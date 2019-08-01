# Milestone Check

This script will use the GitHub API to check a repository on your host
against a Milestrone, the idea being to ensure that all pull requests 
(commits) from the milestone are included.

## Setup

You'll need to generate a GitHub token for the tool. Go to Settings -> Developer Settings -> Personal Access Tokens
and generate a token just for this tool. I checked the following:

```
repo:status
public_repo
```

Copy the token and save to `.token` in your local directory. Be sure to add it
to your .gitignore. Next, export the name of your repository, and the
name of the Milestone you want to check for. 

```bash
export GITHUB_REPOSITORY=sylabs/singularity
export GITHUB_MILESTONE="3.3.1"
```

If it isn't obvious (probably not) you should be sitting in the GitHub
repository with the branch that you want to check against the milestone.
If you haven't done that yet, do it now. When you are ready, run the script!
You need to provide the path to the repository to change to.

```bash
$ /bin/bash run_check.sh /home/vanessa/Documents/Dropbox/Code/Google/go/src/github.com/sylabs/singularity
==========================================================================
Found milestone "3.3.1" with ID 36
Commits: 2737e74f02c76cab65ce03896ef4ff67a79d8c23 5baaa08b8be287354782cf48c308536e13599758 c32b1d046558c8f9f27aea2eb801e4f4c587792f aa3562bad57b490dd08f94404a288d9847ef7854 89180afcea353e4cb2fb0da97d2e45110693fcd0 c017a2e4654560111aa197749f08acaefab57532 f8ba838fd1d877ebcc3eae75be0bb11a9e0aace4 86f32e8ee120d366e037e28d52b4992dcfeae093 658185cfd43b1a0e136a223308b7db2f2efbe4c7 122fd8267ce73858fc5b61959c94c12806966c27 cbd658b7c1c89ef848c433b9bc7f0ccf9fdfb9f7 96f4414f30efb76f29c3158560739e677f9d7b24 698476a7fdf614139413d5a40c62f1b8771c74c5 680ffd1ed27bb92557ffbb1ef05458a6f875b01e cad9fd957e03c7342c8968274fecbf66239bf1c3 17ad71fa9db9790e54429c27853682d541e96b1b 75d0c540bf1b01b9ba93a1b035d3aff438ffb37a 3a657bf2dbd6d76351a3f199a8e016f205216a6e
Git Branch is master
Evaluating commits for milestone 3.3.1 against master
CORRECT Found 2737e74f02c76cab65ce03896ef4ff67a79d8c23 in branch master
CORRECT Found 5baaa08b8be287354782cf48c308536e13599758 in branch master
CORRECT Found c017a2e4654560111aa197749f08acaefab57532 in branch master
CORRECT Found c32b1d046558c8f9f27aea2eb801e4f4c587792f in branch master
CORRECT Found 96f4414f30efb76f29c3158560739e677f9d7b24 in branch master
CORRECT Found 17ad71fa9db9790e54429c27853682d541e96b1b in branch master
CORRECT Found f8ba838fd1d877ebcc3eae75be0bb11a9e0aace4 in branch master
error: no such commit 3a657bf2dbd6d76351a3f199a8e016f205216a6e
Missing commit 3a657bf2dbd6d76351a3f199a8e016f205216a6e
CORRECT Found 698476a7fdf614139413d5a40c62f1b8771c74c5 in branch master
CORRECT Found 122fd8267ce73858fc5b61959c94c12806966c27 in branch master
CORRECT Found 89180afcea353e4cb2fb0da97d2e45110693fcd0 in branch master
CORRECT Found 86f32e8ee120d366e037e28d52b4992dcfeae093 in branch master
CORRECT Found cad9fd957e03c7342c8968274fecbf66239bf1c3 in branch master
CORRECT Found 75d0c540bf1b01b9ba93a1b035d3aff438ffb37a in branch master
CORRECT Found aa3562bad57b490dd08f94404a288d9847ef7854 in branch master
CORRECT Found cbd658b7c1c89ef848c433b9bc7f0ccf9fdfb9f7 in branch master
error: no such commit 680ffd1ed27bb92557ffbb1ef05458a6f875b01e
Missing commit 680ffd1ed27bb92557ffbb1ef05458a6f875b01e
CORRECT Found 658185cfd43b1a0e136a223308b7db2f2efbe4c7 in branch master
==========================================================================
```

For the above, we get a total of 18 commits, and 16 are found in master,
but two are missing. (Note I need to check how this API handles squash and merge).

Note that it currently uses both the v3 and v4 (graphQL) GitHub APIS - this
was because there is a bug with version 2 that it didn't seem to filter
issues by pull requests. When GitHub supports responds I'd like to switch to
using v3, and remove the Python script.
