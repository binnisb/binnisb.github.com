---
title:  "Pytest and Coverage in Visual Studio Team Service (VSTS)"
date:   2018-03-18 14:00:00 +0100
categories: devops
tags: vsts pytest coverage docker git
---

I am working on a code base, version controlled in git, that we have recently moved to [Visual Studio Team Services][vsts]. Though I am not liking how teams, projects and repositories are organised, compared to GitHub, I can live with it. I believe it will make more sense once we start using the planning, scheduling etc built into the service.

I set up a build definition to run the tests defined in the code base, and I noticed that it offers to publish the test results and coverage results along with the build status. I had some issues with getting it working but I wanted to share my python & pytest setup to help others get to the solution quicker (I hope :) ).

The code can be found [here][github-repo] (in GitHub since VSTS does not allow repositories to be public), and the build definition is found there under [Demo.json][demo_json]. Here you should update the name of the build definition, and use a hosted linux queue agent. You should also update source to the master branch of the example.

You can then `Save & Queue` and wait for the results. In the build summary, you can now click the `Code Coverage` and the `Tests` tabs to see the results of the tests and coverage.

The problem I had was that the coverage was malformed since the results from pytest coverage do not inline the stylesheet for the html. That is what the pytest-style-inliner fixes.


Check out [Binnisb repo][github-binnisb]

[vsts]:   https://www.visualstudio.com/team-services/
[github-repo]:  https://github.com/binnisb/pytest-vsts-demo.git
[demo_json]: https://raw.githubusercontent.com/binnisb/pytest-vsts-demo/master/Demo.json
