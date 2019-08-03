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

When you are ready, run the script! You need to provide the path to the repository to change to.

```bash
$ /bin/bash run_check.sh /home/vanessa/Documents/Dropbox/Code/Google/go/src/github.com/sylabs/singularity
==========================================================================
Found milestone "3.3.1" with ID 36
Git Branch is master
Evaluating commits for milestone 3.3.1 against master

Checking Pull Request https://github.com/sylabs/singularity/pull/4108
Missing https://github.com/sylabs/singularity/commit/18d1fafbf2182df2775dfa6dd2cad7ef5fab1025
Missing https://github.com/sylabs/singularity/commit/953c7f92c3822d02b9f77f7d1aa59d233a3dc41e
Missing https://github.com/sylabs/singularity/commit/109144c5e1948d85dd125d708998b1c25b5fd754
Missing https://github.com/sylabs/singularity/commit/cc14c436623943919d5b99dc147d7d017c1b6f22
Missing https://github.com/sylabs/singularity/commit/54fd7b7af6957cd4f86b809ce8a3a7a9384e3467
Missing https://github.com/sylabs/singularity/commit/63658aa6e01186328dc3266f7ae6922ec9b0762e

Checking Pull Request https://github.com/sylabs/singularity/pull/4105
Missing https://github.com/sylabs/singularity/commit/a92eddde654c3f26a0444b9f012a69049bc762ee
Missing https://github.com/sylabs/singularity/commit/47cd8462d6845e31f5f404f19937a47568596348

Checking Pull Request https://github.com/sylabs/singularity/pull/4089
Missing https://github.com/sylabs/singularity/commit/35c3f48a2852201d8d81ded22180c6d70eb1bd72
Missing https://github.com/sylabs/singularity/commit/e370fc62b5814bb8b06a510c46b4ea82443043c3
Missing https://github.com/sylabs/singularity/commit/185d4909d32622450f87c2ac6a888f4954a7ab35
Missing https://github.com/sylabs/singularity/commit/edcca5764a4c452a060975ebbacd372c7d507be2

Checking Pull Request https://github.com/sylabs/singularity/pull/4076
Missing https://github.com/sylabs/singularity/commit/02a98bfdcebbffb4d10e245ca71e86a124814819

Checking Pull Request https://github.com/sylabs/singularity/pull/4075
Missing https://github.com/sylabs/singularity/commit/332b14e13d0a3969b38bd6494a1ed62f7c9a2bf2

Checking Pull Request https://github.com/sylabs/singularity/pull/4069
Missing https://github.com/sylabs/singularity/commit/4114d5180e85709646ebbf2e1ed6ae00ebbefff3

Checking Pull Request https://github.com/sylabs/singularity/pull/4057
Missing https://github.com/sylabs/singularity/commit/b511066f6ffe65eb7e444683d60c0d139bc4814c
Missing https://github.com/sylabs/singularity/commit/9c12a162608f14a98555d008bee2aa24ee4f55f5
Missing https://github.com/sylabs/singularity/commit/9f07e379c85b04643adbb565042ffe9bbb801638

Checking Pull Request https://github.com/sylabs/singularity/pull/4040
Missing https://github.com/sylabs/singularity/commit/36d0e7661151ef0a042b7f87570ba1f0bd41c387

Checking Pull Request https://github.com/sylabs/singularity/pull/4007
Missing https://github.com/sylabs/singularity/commit/ff9536810837e96d07d131f1009e5d48331c7029
Missing https://github.com/sylabs/singularity/commit/0951b9f8d5a8c5b8213e0a460626f254dee54696

Checking Pull Request https://github.com/sylabs/singularity/pull/3997
Missing https://github.com/sylabs/singularity/commit/53474c8dd0b719b19afef97496e955b6e11d1a85

Checking Pull Request https://github.com/sylabs/singularity/pull/3969
Missing https://github.com/sylabs/singularity/commit/3117927715ac8375f48b00ca05121347d22477b2

Checking Pull Request https://github.com/sylabs/singularity/pull/3968
Missing https://github.com/sylabs/singularity/commit/79cfbe1fb379bafd5129bb08d4714f0305a80f29
Missing https://github.com/sylabs/singularity/commit/db38ec72104e55486081a49012d5b3fb9b87cfda
Missing https://github.com/sylabs/singularity/commit/d86e779f889c91b3284d0f19b918c03b5f8caab8
Missing https://github.com/sylabs/singularity/commit/9100b37418c97025749d4c563c0f7cd53bd34a1d
Missing https://github.com/sylabs/singularity/commit/d1a5e8af833f334803fe86f86a0b7dd52691aa6a
Missing https://github.com/sylabs/singularity/commit/47c5ac9c5cb99d90113fb95be4df13544ef4dca3
Missing https://github.com/sylabs/singularity/commit/8797b22749e725fac17c5fd4d02f09603a23e23a
Missing https://github.com/sylabs/singularity/commit/453a7f97385c0661b51d60abd0e0c0dacb6eb263

Checking Pull Request https://github.com/sylabs/singularity/pull/3967
Missing https://github.com/sylabs/singularity/commit/0e0f22d2a3232932fab5553eb0d78bb490802268

Checking Pull Request https://github.com/sylabs/singularity/pull/3966
Missing https://github.com/sylabs/singularity/commit/311285845bedf0625e36c0263df779c8794ae0d6

Checking Pull Request https://github.com/sylabs/singularity/pull/3952
Missing https://github.com/sylabs/singularity/commit/fa288eae6f0eb3a799d7137d7b5d0f8797b9553f
Missing https://github.com/sylabs/singularity/commit/2b5e0eb9cf6762f290b9e88afd715e7eb70013a3
Missing https://github.com/sylabs/singularity/commit/d0cd99cb52487e2f29c66da7f3c5dbeecd6e4348
Missing https://github.com/sylabs/singularity/commit/f0ba064c7df394b29dd8b8c1c2259ae13fb22e2a
Missing https://github.com/sylabs/singularity/commit/6fcb4723b9240ac7ed5f9f76ebc6cc2a0aa18d7b
Missing https://github.com/sylabs/singularity/commit/ebf384928b99fa9913283bf8a6846ccd2fbfa17f
Missing https://github.com/sylabs/singularity/commit/587a3f210c264be33827e60a3c9a16fdc7191abd
Missing https://github.com/sylabs/singularity/commit/793d6876117ccace89134641d6d8726078b14d90
Missing https://github.com/sylabs/singularity/commit/d901db71cb33f5e2f1ec68e800813c335de18bfd
Missing https://github.com/sylabs/singularity/commit/bfbce577728da3bc75c5c7e527e833392ba99b54

Checking Pull Request https://github.com/sylabs/singularity/pull/3921
Missing https://github.com/sylabs/singularity/commit/9e108bcd53ae773a97f5c8ad9e9d4c9a8c91c8b4
Missing https://github.com/sylabs/singularity/commit/dcaef100c1f10d12fbd674cfc8b415c3576f28c1
Missing https://github.com/sylabs/singularity/commit/79d975dd60eae3e62c5fd5486e18a0aa2c405146
Missing https://github.com/sylabs/singularity/commit/ebacae0515fd291f73b39b0816b62ed0f07eb408
Missing https://github.com/sylabs/singularity/commit/88ddaa5c55c345c4f7dc67032d4b4fe41bd01e74
Missing https://github.com/sylabs/singularity/commit/cef3431d3898f1f618c785ea72b72a7064d39c4e
Missing https://github.com/sylabs/singularity/commit/6d62c3476840b043994a84a6e25d39e5a80062d6
Missing https://github.com/sylabs/singularity/commit/51f16a8a42dfd55e7fdc127b42fe6a76c1d1f3ac
Missing https://github.com/sylabs/singularity/commit/6cb861ce7ca375d71bebad3b24d206ec6d1eab47

Checking Pull Request https://github.com/sylabs/singularity/pull/3801
Missing https://github.com/sylabs/singularity/commit/74049e6678be3a01c51bb1c025c223cba0ccab09

Checking Pull Request https://github.com/sylabs/singularity/pull/3794
Missing https://github.com/sylabs/singularity/commit/3738500f3ccdad4492c820fe4d0f86bfb48be472
Missing https://github.com/sylabs/singularity/commit/88fda448057af25e4ab12dc6353cfc0df61f5303
Missing https://github.com/sylabs/singularity/commit/28906c8ef412487170834e66d35e6e48e949113d
Missing https://github.com/sylabs/singularity/commit/1bea4554c2072a45e7650dc375dbf59ddc1c2c3d

Checking Pull Request https://github.com/sylabs/singularity/pull/3693
Missing https://github.com/sylabs/singularity/commit/641ac11714553c20d6000cad35f1ff604ef27b79
Missing https://github.com/sylabs/singularity/commit/432cde378f0c85e8c3eed180097ad9314534bcc4

Checking Pull Request https://github.com/sylabs/singularity/pull/3652
Missing https://github.com/sylabs/singularity/commit/cfec92a07518bcd789933e8e4acc25a16407c0ca

Checking Pull Request https://github.com/sylabs/singularity/pull/3466
Missing https://github.com/sylabs/singularity/commit/6643e71517d16fb8d9d9b058cb06cf0499492aed
Missing https://github.com/sylabs/singularity/commit/06ae38227ec2a924dc4342b4b9a63bfb6c74b339
Missing https://github.com/sylabs/singularity/commit/0ae43973ff392eb2ef7b2b6e1bccaaf18adda713
Missing https://github.com/sylabs/singularity/commit/100530655159b38f96cdce3e6584ac312ce18e0d
Missing https://github.com/sylabs/singularity/commit/55cac155f0bbed7bd88a52d4de33b6ee4afffa54
Missing https://github.com/sylabs/singularity/commit/32e9b060af9f2536972fc73de9535bac94ee0178
Missing https://github.com/sylabs/singularity/commit/2e5b5b04d43e5e9695f522c1f02d33b04d43aff0
Missing https://github.com/sylabs/singularity/commit/4b6e32296506500157f3e0507e15b221cc28cd5f
Missing https://github.com/sylabs/singularity/commit/1f662bf7ab00b2c98a6648fc7481c81ca39ee23e
Missing https://github.com/sylabs/singularity/commit/0fc95cd384ee7102e2965f575d03a3f2b3024f31
Missing https://github.com/sylabs/singularity/commit/7a30dd3dc18e254cd8cd425c2f5f10d2da860df5
Missing https://github.com/sylabs/singularity/commit/9ac56dbbf9c0ce80d15ab1557c7ddbef1afbc38d
Missing https://github.com/sylabs/singularity/commit/4745d4d2435c8b965f5805e85ce502a2a9e5baa3
Missing https://github.com/sylabs/singularity/commit/0c3d33184667c97183f475a4f4a1aaa37e50db8d
Missing https://github.com/sylabs/singularity/commit/356204d84e89b2b2cf5bf4411199bd191ebcb936
Missing https://github.com/sylabs/singularity/commit/b3c490575b62d25595438711eab61097dc75ac80
Missing https://github.com/sylabs/singularity/commit/ed2c0e2b8bfb400180d540f36f4689c2a1bc4557
Missing https://github.com/sylabs/singularity/commit/8450e8c5033b164ff3ed257ae9936da26d5207d4
Missing https://github.com/sylabs/singularity/commit/4d782aeeefa0048c40e35de7de84e39b169b8c40
Missing https://github.com/sylabs/singularity/commit/0695c0295951550d0768107d309fd431ee3cdbf0
Missing https://github.com/sylabs/singularity/commit/15eb6bedce188f20e13d54ad5bccfb94725c026c
Missing https://github.com/sylabs/singularity/commit/022b7d4a9455bf35250bb51292f980021c12eb1c
Missing https://github.com/sylabs/singularity/commit/97b0c7add12a2faacd90c6eec4b0e4d702aed26d
Missing https://github.com/sylabs/singularity/commit/83e7d36fdc56ae59cf84ff44200ffc7e9775ca23
Missing https://github.com/sylabs/singularity/commit/cdc12b19c798403e885a42d3f4935e49427d4144
Missing https://github.com/sylabs/singularity/commit/d81406b3d002887113048b1d7cb802263cabec30
Missing https://github.com/sylabs/singularity/commit/3df85ea27b7b6c325749778defd7ab0174853929

Checking Pull Request https://github.com/sylabs/singularity/pull/3165
CORRECT Found de5a5961cc99256682af6986e4b72b6e1ac9c69c in branch master
CORRECT Found b916aa959f03247f9f70ec4a6438a7526948ddeb in branch master
CORRECT Found 2e29e6e3026299fe44890087e87eca6c5752820a in branch master
CORRECT Found 964814b6ce145221d65e6d39b6bbd6e281addbae in branch master
CORRECT Found 5ed2eb0ff8670d89855d1fda0d2d8e82b267909d in branch master
CORRECT Found bb9b0f50dc51282b70d4461b7e454377aeba73a1 in branch master
CORRECT Found fcf43ba791cd956a85ddac80aef874e452f506e6 in branch master
CORRECT Found 132510f0a472ab940449ca4c6fddf476c8ea19e5 in branch master
CORRECT Found 6d2d9a1ee2131f3d43eec28bcc41fe7ef8e54c6f in branch master
CORRECT Found 7134d80f648b5d26f23fd76041f01154fc09196f in branch master
CORRECT Found fa424b829991597deaa12448a76baca7d11b1e05 in branch master
CORRECT Found caa033ce08520fd8bc6bb7f8bb63ceb9cb2f8ef6 in branch master
CORRECT Found 097b7149c2c8d8b6ea24da4dcdc2459d0bf936da in branch master
CORRECT Found 117acf10bb6568622586b4373041214d2769f431 in branch master
CORRECT Found 2d1874acb2b05acc8405aea79a643c41f0a5f83b in branch master
CORRECT Found eb0f21ab7d5205fea65c9e49410e1bbbeb4934a7 in branch master
CORRECT Found 2be4177dbd0059cc167ca5bf8fdae9c30db89afa in branch master
CORRECT Found ab1680693b818b2e5d0d6b4d074a267c34f60459 in branch master
CORRECT Found c917a08eaec903544535ce92e0a28479bb96752d in branch master
CORRECT Found 6d0c9cb24933adc74a09ca14b500574739f886a2 in branch master
CORRECT Found 1f8c0f8855d24363e431b4867e6869de86282d1d in branch master
CORRECT Found f9c628373f076e8d71a470e65f69d6dc14515e01 in branch master
CORRECT Found ce29ea76eb21537cc5d90ae671419857e3b1111a in branch master
CORRECT Found ccc0fd0fec046da3c5780b9527e824e06da2ffbf in branch master
CORRECT Found 4788987d6770dd0ab7fe08bec449ee55392c5139 in branch master
CORRECT Found b57cccce0710566419bb7b406e410c49f0913f06 in branch master
CORRECT Found ba90b804f586d236ed5a654d94e010572279a504 in branch master
CORRECT Found 6e185ee9bb4591ecf58f374ca3e4d39074c1c731 in branch master
CORRECT Found 574c1259663890a011f18ae45c44d81f8deda24e in branch master
CORRECT Found b02bdc3913d4d8e0f0fef1c1f1b5da89ac3029f4 in branch master

Checking Pull Request https://github.com/sylabs/singularity/pull/2841
Missing https://github.com/sylabs/singularity/commit/77931759d0ed43991dc4c9e6b2fb72206c270dca
Missing https://github.com/sylabs/singularity/commit/e7706180052f4bd46c15ae5b7d003e896e00895c
Missing https://github.com/sylabs/singularity/commit/73fe619c570bad69037385e02224971140d5826d
Missing https://github.com/sylabs/singularity/commit/16d110bb7f78552516d96e06e8a783485b61925d
Missing https://github.com/sylabs/singularity/commit/b7ff565fc6cf8eb00658b917a45c54173222eca3

Checking Pull Request https://github.com/sylabs/singularity/pull/2729
CORRECT Found dd599c873778c140b7b53077e7052111d56e6526 in branch master
Missing https://github.com/sylabs/singularity/commit/7cc4126ac96e25f17e5ed17bf5f02271ec8beb6e

Checking Pull Request https://github.com/sylabs/singularity/pull/2704
Missing https://github.com/sylabs/singularity/commit/61381bb5328f82f0105b41ec62eba15d280d8039
Missing https://github.com/sylabs/singularity/commit/fc9deb1555339081c0806be25b74e11fb1bf13b5
Missing https://github.com/sylabs/singularity/commit/6f50e206e77894df09aa76febf4697049402add5
==========================================================================
```

For the above, we get a total of 18 pull requests that are tagged with the milestone,
and for each we can see the commits that are present (CORRECT) or Missing.
Note that I need to check how this API handles squash and merge.
