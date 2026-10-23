Git & GitHub Interview Questions with Answers Practice Test 4 - Results
Attempt 1





Question 1
Skipped
As a developer, you're working on a feature branch and you want to get the latest changes from the remote repository without merging them into your local branch. Which configuration achieves this?
Correct answer
git fetch
Explanation
This is the correct answer. `git fetch` contacts the remote repository, downloads new commits, and updates the remote‑tracking branches, but it never touches your current checked‑out branch. Because no merge or rebase occurs, you can review the incoming changes before deciding how to integrate them, which is exactly what the scenario requires.
git pull --rebase
Explanation
This option is incorrect. `git pull --rebase` first performs a `fetch` and then rebases your local commits on top of the upstream branch, effectively rewriting your history and integrating the remote changes. While it avoids a merge commit, it still applies the remote changes to your local branch, contrary to the requirement of keeping them separate.
git pull --no-ff
Explanation
This option is incorrect. The `--no-ff` flag forces Git to create a merge commit even when a fast‑forward merge is possible, which means the remote changes are merged into your branch. It does not provide a way to retrieve updates without merging, so it violates the stated goal.
git merge origin/main
Explanation
This option is incorrect. Running `git merge origin/main` explicitly merges the specified remote‑tracking branch into your current branch, immediately incorporating all fetched changes. The merge directly modifies your working branch, which is the opposite of what the question is asking for.
git pull --ff-only
Explanation
This option is incorrect. `--ff-only` tells Git to perform the pull only if it can be fast‑forwarded; otherwise it aborts. Even when it succeeds, it still moves your branch pointer forward, effectively merging the remote changes into your branch. Hence it does not keep the changes isolated.
git clone --depth 1
Explanation
This option is incorrect. `git clone --depth 1` creates a shallow copy of a repository in a new directory; it does not update an existing branch. It neither fetches new changes into your current feature branch nor respects the requirement to keep your work untouched.
Overall explanation
The question tests knowledge of how to synchronize with a remote repository without altering the current branch. `git fetch` is the only command that downloads new commits and updates remote‑tracking references while leaving the checked‑out branch unchanged, allowing developers to inspect changes before deciding to merge or rebase. The other options either merge or reapply the remote changes onto the local branch, which contradicts the requirement to keep the local work untouched. Common misconceptions include believing that `git pull --rebase` or `--ff-only` avoids merging; they still incorporate remote changes. Best practice is to run `git fetch` regularly on feature branches, review the fetched commits, and then explicitly choose an integration strategy that suits the workflow.
Domain
Branch Management
Question 2
Skipped
You're a data engineer tasked with optimizing the performance of a data pipeline, and you suspect that the Git repository is causing issues due to its large size. What is the MOST likely root cause?
The repository contains many small commits, which cause Git to process more objects during each operation.
Explanation
This option is incorrect. While a very high number of commits can increase the amount of metadata Git must walk through, the impact on performance is usually negligible compared to repository size caused by large files. In most pipelines the cost of traversing commit history is far lower than the cost of transferring or checking out gigabytes of data, so small commits are not the primary culprit.
The remote server's network latency is the main factor, unrelated to the repository's size.
Explanation
This option is incorrect. Network latency certainly affects clone and fetch times, but the question specifically points to the repository's large size as the suspected issue. Even with a fast network, a repository that contains multi‑gigabyte binary assets will still be slow to checkout or fetch because Git must read and write that much data locally.
Correct answer
Large binary or dataset files were committed directly into the repository, inflating its history.
Explanation
This option is correct. Storing large binaries (e. g., CSV dumps, media files, compiled artifacts) directly in Git creates huge pack files and makes every operation—clone, fetch, diff—process unnecessary data. In real‑world data pipelines, such files should be stored outside Git or managed with Git LFS; otherwise they dramatically slow down CI/CD and data‑engineer workflows.
Frequent rebasing of long‑lived feature branches leads to large pack files that slow operations.
Explanation
This option is incorrect. While rebasing can increase the number of loose objects temporarily, Git automatically packs them and the size impact is minor compared to committing large files. Rebase‑related bloat does not normally cause the multi‑gigabyte repository sizes that hinder pipeline performance.
Using Git submodules incorrectly, causing duplicate clones and extra I/O overhead.
Explanation
This option is incorrect. Submodules can add a small amount of overhead, but they do not enlarge the main repository's . git directory. The primary performance hit in the scenario described is due to the main repo's own large files, not the presence or misuse of submodules.
Git's garbage collection is disabled, so dangling objects accumulate and bloat the repository.
Explanation
This option is incorrect. While disabled garbage collection can cause some growth, the amount is usually modest compared to the size of committed binaries. The most common cause of a massive repository is large files tracked in history, not merely uncollected dangling objects.
Overall explanation
The question tests knowledge of how repository size affects pipeline performance, focusing on the most common source of bloat: large binary or dataset files checked into Git history. Directly versioning such files forces every Git operation to handle megabytes or gigabytes of data, which slows clones, fetches, and CI jobs. Misconceptions include blaming commit count, network latency, or submodule usage, which are generally minor contributors compared to the actual data payload. While garbage collection and frequent rebasing can affect storage efficiency, they rarely produce the dramatic slowdowns seen when large binaries are stored in the repo. Best practice is to keep the repository lightweight by using Git LFS, external storage, or . gitignore for generated data, ensuring that Git operations remain fast for data‑engineer workflows.
Domain
Repository Size
Question 3
Skipped
As a product engineer, you're tasked with onboarding a new team member to the project, and you need to ensure they have access to the Git repository. Which TWO options should you choose to grant them access?
Add the new member's Git Hub username to the repository's Deploy Keys list.
Explanation
This option is incorrect. Deploy Keys are SSH keys attached to a repository for machine-to-repo authentication, not for associating individual user accounts. Adding a username to Deploy Keys has no effect and would not grant any permissions, potentially causing confusion when the user attempts to push changes.
Correct selection
Invite the new member as a collaborator on the repository.
Explanation
This option is correct. Inviting a user as a collaborator sends them an invitation that, once accepted, grants the permissions defined by the repository owner (read, write, or admin). In practice, this is the standard method for granting direct access to a personal or organization repository without involving team structures.
Send the new member the repository's HTTPS clone URL and ask them to clone it.
Explanation
This option is incorrect. While the clone URL allows anyone to fetch the repository if it is public, it does not provide authenticated write access to a private repo. Relying on the URL alone would leave the new member unable to push changes or open pull requests.
Create a personal access token on your account and share it with the new member.
Explanation
This option is incorrect. Personal access tokens are tied to the account that created them and give the holder the same permissions as that account, posing a severe security risk. Sharing your token violates best‑practice policies and could lead to accidental or malicious actions being recorded under your identity.
Correct selection
Add the new member to a team within the organization that already has write permission to the repository.
Explanation
This option is correct. Teams are the recommended way to manage permissions at scale in an organization; by placing the new member in a team with the appropriate level, they inherit the necessary access automatically. This approach also simplifies future permission changes as team memberships are adjusted.
Fork the repository into the new member's account and give them the fork URL.
Explanation
This option is incorrect. Forking creates a separate copy of the repository that the user can modify, but it does not grant any rights to the original repository. Relying on a fork for collaboration would require the user to submit pull requests, and they would still lack direct push access to the main project.
Overall explanation
The question tests understanding of Git Hub access control mechanisms. The two proper ways to grant a new team member repository access are inviting them as a collaborator (direct permission on a repo) or adding them to an organization team that already possesses the needed rights. Common misconceptions include thinking that providing a clone URL or a personal access token confers proper access; the former only allows read‑only operations on public repos, and the latter is a security liability. Deploy Keys are often confused with user permissions, yet they are intended for machines rather than individuals. Best practice dictates using team‑based permission management for scalable, auditable access and reserving collaborator invitations for ad‑hoc or small‑scale scenarios.
Domain
Access Management
Question 4
Skipped
You're a Dev Ops engineer tasked with troubleshooting a CI/CD pipeline issue, and you suspect that the problem is related to the Git repository configuration. What is the KEY difference between a Git fetch and a Git pull in this context?
Git fetch downloads changes from the remote repository and automatically merges them into the current branch.
Explanation
This statement is incorrect. A Git fetch operation only retrieves objects and updates the remote‑tracking references; it never performs a merge on its own. If you assumed a fetch merged changes, you might leave the local branch out‑of‑date, causing the CI/CD build to run against stale code.
Git pull only updates the remote tracking branches without altering the local working directory.
Explanation
This option is also incorrect. Git pull does more than just update remote‑tracking branches—it runs a fetch followed by a merge (or rebase) into the current checked‑out branch, which modifies the working tree. Relying on pull to be a non‑intrusive operation could unintentionally introduce merge conflicts into the pipeline environment.
Correct answer
Git fetch updates only the remote tracking branches, leaving the local branch untouched; Git pull does a fetch followed by an automatic merge (or rebase) into the current branch.
Explanation
This is the correct answer. Fetch solely synchronises your local copy of the remote references; it does not change any files in your working directory or the current branch tip. Pull builds on fetch by immediately merging (or rebasing) the fetched commits, which directly affects the code that the CI/CD job will compile or test.
Git fetch and Git pull are synonymous commands; both fetch and merge in one step.
Explanation
This option is incorrect. Although both commands contact the remote, they are not synonymous: fetch stops after updating remote refs, while pull adds an automatic merge step. Mistaking them as identical can lead to unexpected merges that break a production pipeline.
Git fetch rewrites the local commit history to match the remote, while Git pull creates a new branch.
Explanation
This statement is wrong. Fetch never rewrites local history; it merely records the state of the remote in tracking branches. Pull also does not create a new branch by default; it merges into the current branch, so this description misrepresents normal Git workflow and could cause confusion when troubleshooting pipelines.
Git fetch only works with tags, whereas Git pull works with branches.
Explanation
This is incorrect. Both fetch and pull operate on all refs, including branches and tags; fetch can retrieve tags, and pull can merge branch updates. Believing fetch is limited to tags would prevent you from correctly pulling necessary branch updates for a CI/CD run.
Overall explanation
The question tests the candidate's understanding of the fundamental distinction between Git fetch and Git pull, which is critical when diagnosing pipeline failures caused by repository state. A fetch updates only the remote‑tracking branches and leaves the local working tree untouched, allowing you to inspect changes before integrating them. A pull combines fetch with an automatic merge (or rebase) into the current branch, which immediately alters the code that the pipeline will use. Common misconceptions include thinking fetch merges automatically, assuming pull is non‑intrusive, or believing the commands are interchangeable; each of these leads to incorrect expectations about repository state during automated builds. In practice, developers often use fetch to preview incoming changes and resolve conflicts manually before a pull, which promotes safer CI/CD deployments.
Domain
Repository Operations
Question 5
Skipped
As a developer, you're working on a feature branch and you want to create a pull request to merge your changes into the main branch. What should you do FIRST?
Correct answer
Push the feature branch to the remote repository (origin).
Explanation
This is the correct first step. Git Hub can only create a pull request from a branch that exists on the remote server, so you must push your local commits to origin before opening a PR. If you skip this step, the PR interface will not list your branch, forcing you to push later and delaying the review process.
Directly open a pull request on Git Hub without pushing any commits.
Explanation
This is incorrect because Git Hub requires the source branch to be present on the remote before a PR can be created. Attempting to open a PR without the branch results in an error or the branch simply does not appear in the dropdown. In practice, you would be forced to push first, making this option ineffective.
Merge the main branch into your feature branch locally before creating the PR.
Explanation
While keeping your feature branch up‑to‑date with main is good practice, it is not the first action you need to take. You must first push your branch so that others can see the changes; only after the branch is remote can you safely merge or rebase main. Performing a local merge before pushing can lead to additional commits that need to be pushed later, but it does not enable PR creation on its own.
Delete the feature branch after committing locally.
Explanation
Deleting the branch before creating a pull request eliminates the source of the changes entirely, making it impossible to open a PR. This misconception arises from confusing branch cleanup after a merged PR with the pre‑PR workflow. The correct sequence is to keep the branch until after the PR is merged and then optionally delete it.
Create a new branch called “main‑feature” and start working there.
Explanation
Creating a new branch at this stage does not address the immediate goal of opening a PR for the existing work. It adds unnecessary complexity and can cause duplication of effort. The appropriate action is to use the already‑existing feature branch and push it, not to start a new one.
Tag the latest commit on the feature branch with a version number.
Explanation
Tagging is useful for releases, but it does not affect the ability to open a pull request. Adding a tag before the PR does not make the branch visible to the remote repository and can give a false sense of progress. Therefore, tagging is not the first step in the PR workflow.
Overall explanation
The question tests knowledge of the basic Git Hub pull‑request workflow. The first actionable step is to push the local feature branch to the remote repository so that Git Hub can reference it when creating a PR. Many learners mistakenly think they can open a PR directly from the local repo, or that they must merge main first; both are misconceptions because the remote branch must exist before any PR can be initiated. Additional steps like updating the branch with main, tagging, or cleaning up after merge are important but occur later in the process. Remember: push your branch, then open the PR, then optionally sync with main and clean up.
Domain
Pull Requests
Question 6
Skipped
As a tech lead, you want to allow a new contributor to work on your project without giving them push access to the main repository. Which option should you choose?
Add the contributor as a collaborator with write permission on the main repository.
Explanation
This option is incorrect because granting write permission allows the user to push changes directly to the main repository, which contradicts the requirement to restrict push access. Direct pushes can bypass code review and CI checks, increasing the risk of introducing bugs. In most teams, collaborators with write access are trusted members, not new contributors who are still learning the project workflow.
Grant the contributor a personal access token that includes the repo:push scope.
Explanation
This option is also incorrect. A personal access token with the push scope gives the holder the ability to push commits straight to any branch they have access to, effectively the same as giving push rights. Providing such a token to a new contributor defeats the purpose of controlling write permissions and can lead to accidental or malicious changes being merged without review.
Create a protected branch and give the contributor branch write access.
Explanation
This is incorrect because protected branches are designed to prevent force pushes and require pull request reviews, but granting branch‑level write access still allows the contributor to push directly to that branch. If the branch is not fully protected, the contributor could bypass the review process. Moreover, managing branch‑specific permissions is more complex than using the standard fork‑and‑pull‑request workflow for newcomers.
Correct answer
Ask the contributor to fork the repository and submit their changes via pull requests.
Explanation
This option is correct. Forking creates a personal copy of the repository where the contributor can push freely without affecting the main codebase. When they are ready, they open a pull request, which can be reviewed, tested, and merged by maintainers, preserving the integrity of the main repository while still allowing the contributor to work effectively.
Assign the contributor to a team that has the maintain role on the main repository.
Explanation
This option is incorrect. The maintain role includes push and merge permissions, effectively giving the contributor full write access to the repository. Granting this level of access to a newcomer bypasses the safety mechanisms that pull requests and code reviews provide, and could lead to unvetted changes being merged.
Install a Git Hub App that gives the contributor push rights to the main repository.
Explanation
This option is incorrect because installing an app that grants push rights still provides direct write access to the main repository. While apps can automate workflows, they do not replace the standard practice of using forks and pull requests for external contributors. Using an app in this scenario adds unnecessary complexity and potential security risks.
Overall explanation
The question tests knowledge of Git Hub's permission model and the recommended workflow for onboarding new contributors. The best practice is to have external contributors fork the repository and submit pull requests, which isolates their work and ensures all changes go through review and automated checks before merging. Options that grant direct write or push permissions (collaborator with write, personal access token, maintain role, protected branch write access, or a Git Hub App with push rights) all violate the constraint of not giving push access to the main repository. These alternatives are common misconceptions because new contributors sometimes think they need direct push rights to contribute, but that approach undermines code quality and security. By using forks and pull requests, teams maintain control, enforce policies, and still enable contributors to collaborate effectively.
Domain
Repository Permissions
Question 7
Skipped
You're a Dev Ops engineer tasked with setting up a CI/CD pipeline for a new project. The pipeline must run on a Linux environment with 2 v CPUs and 4 GB RAM. Which TWO approaches should you take?
Correct selection
Provision a self‑hosted Git Hub Actions runner on a Linux VM (e. g., an EC2 t3. medium) that provides exactly 2 v CPUs and 4 GB RAM.
Explanation
This option is correct. A self‑hosted runner gives you complete control over the underlying hardware, allowing you to match the required specifications precisely. By selecting an instance type with 2 v CPUs and 4 GB RAM, you guarantee that each workflow runs within the defined resource envelope, which helps control costs and ensures consistent performance across builds.
Use the default Git Hub‑hosted Ubuntu runner, which automatically provides the necessary Linux environment.
Explanation
This option is incorrect. Git Hub‑hosted runners are managed by Git Hub and you cannot dictate the exact CPU or memory allocation; they typically offer more resources than required, but the spec cannot be limited to 2 v CPUs and 4 GB RAM. Relying on them could lead to over‑provisioning, and you lose the ability to enforce strict resource caps, which may be a compliance or cost concern.
Correct selection
Run the build steps inside a Docker container and specify resource limits (e. g., --cpus 2 --memory 4g) in the workflow.
Explanation
This option is correct. By invoking a container with explicit CPU and memory constraints, you can enforce the 2‑v CPU, 4‑GB limit even when the underlying runner has more capacity. This technique works on any Linux runner and provides isolation, making it a flexible way to respect resource budgets while still using managed runners.
Switch to Git Lab CI and use its shared runners, which automatically match the required resources.
Explanation
This option is incorrect. Git Lab CI is a different CI/CD platform; its shared runners cannot be directly used in a Git Hub Actions pipeline. Migrating to Git Lab would require moving repositories, configuring new pipelines, and does not address the original requirement of building on a Linux environment within the specified resources.
Deploy a Jenkins pipeline onto a Kubernetes pod that is limited to 2 CPUs and 4 Gi of memory.
Explanation
This option is incorrect. While Kubernetes can enforce resource limits, introducing Jenkins adds an extra layer of tooling that is unnecessary for a straightforward Git Hub Actions pipeline. Managing a Jenkins server and a Kubernetes cluster also increases operational overhead and may exceed the simple resource constraints intended for the CI job itself.
Create a matrix job that splits the workload across two jobs, each using the default 1‑v CPU runner, to achieve a combined 2‑v CPU execution.
Explanation
This option is incorrect. Matrix jobs run in parallel on separate runners; they do not combine their CPU capacity for a single build step. As a result, the build time may increase, and you still cannot guarantee that any individual job adheres to the 2‑v CPU, 4‑GB requirement, which defeats the purpose of the constraint.
Overall explanation
The question tests knowledge of how to enforce specific resource limits in a CI/CD pipeline on a Linux platform. The correct approaches are to use a self‑hosted runner where you control the exact VM size, and to run steps inside a Docker container with explicit CPU and memory caps, both of which let you precisely meet the 2‑v CPU, 4‑GB requirement. Common misconceptions include assuming hosted runners can be sized, or that switching platforms or splitting jobs will automatically satisfy resource constraints. In practice, teams often choose self‑hosted runners for predictable costs and container limits for flexibility while keeping the overall workflow simple. Understanding the distinction between managed versus self‑managed resources, and the impact of toolchain choices, is essential for building efficient, cost‑effective pipelines.
Domain
CI/CD Runner Configuration
Question 8
Skipped
A developer on your team has created a new feature branch and wants to get the latest changes from the main branch. What is the MOST appropriate action?
Correct answer
Run `git fetch origin` followed by `git merge origin/main` while staying on the feature branch.
Explanation
This option is correct because it explicitly brings the latest commits from the remote main branch into the current feature branch without leaving the branch. `git fetch` updates the remote-tracking references, and `git merge origin/main` merges those changes, preserving any work already done on the feature branch. In practice, this lets the developer continue work on the feature while staying up‑to‑date and avoids unnecessary context switches.
Execute `git pull origin main` while on the feature branch.
Explanation
This option is incorrect because `git pull` combines fetch and merge in a single step, but specifying a branch argument can lead to confusion about which branch is being merged and may create an unexpected merge commit. It also does not update the local `main` reference, so the developer might think `main` is current when it is not. While it technically brings in changes, it is less explicit and can cause workflow misunderstandings.
Check out the main branch, run `git pull`, then switch back to the feature branch and run `git merge main`.
Explanation
This option is incorrect as it requires unnecessary context switching, which can disturb any in‑progress work on the feature branch. Switching branches may cause uncommitted changes to be stashed or lost, and the extra steps increase the chance of mistakes. Although the end result is similar, it is not the most efficient or recommended approach for simply updating a feature branch.
Run `git rebase main` while on the feature branch.
Explanation
This option is incorrect because rebasing rewrites the feature branch’s history, which can be problematic if the branch has already been shared with others. History rewrites may lead to force‑pushes and merge conflicts for teammates. While rebase can incorporate the latest main changes, it is not the safest default action for a collaborative team setting.
Push the feature branch to the remote with `git push origin feature`.
Explanation
This option is incorrect because pushing the feature branch does not retrieve any updates from the main branch; it only uploads the developer's current work. The developer would still be missing the latest changes from main, potentially leading to integration issues later. Pushing without first syncing can also cause merge conflicts when a pull request is opened.
Run `git reset --hard origin/main` on the feature branch.
Explanation
This option is incorrect because a hard reset discards all commits on the feature branch and makes it exactly match the remote main branch, wiping out any new work. Using `--hard` is destructive and would cause loss of the feature’s development history. It defeats the purpose of preserving the feature while integrating fresh main changes.
Overall explanation
The question tests the learner's understanding of how to synchronize a feature branch with updates from the main branch in a collaborative Git workflow. The correct approach is to fetch the latest remote changes and merge them into the current branch, which is explicit, safe, and keeps the developer on the same branch. Common misconceptions include using `git pull` with a branch argument, which can obscure what is being merged, or switching to the main branch first, which adds unnecessary steps and risks losing work. Rebasing, while useful in some contexts, rewrites history and is not the default safest method for shared branches. Push and hard‑reset commands address different goals entirely and do not incorporate main's changes without risking data loss.
Domain
Branch Management
Question 9
Skipped
You're an architect designing a new system that requires multiple teams to collaborate on different features. Which approach BEST satisfies these requirements?
Correct answer
Adopt a feature‑branch workflow where each team works in its own branch, submits pull requests, and the main branch is protected.
Explanation
This option is correct. A feature‑branch workflow isolates each team's work in separate branches, preventing unfinished code from reaching production. Pull requests provide a mandatory review step, and branch protection ensures that only vetted changes are merged, which aligns with the need for coordinated multi‑team development while maintaining code quality.
Use a forking workflow where each team forks the repository, works independently, and then opens pull requests against the upstream repository.
Explanation
This option is incorrect for internal multi‑team collaboration. Forking is intended for external contributors who do not have write access to the main repository, adding unnecessary complexity when all teams are part of the same organization. Managing many forks also makes it harder to enforce consistent policies such as branch protection or CI pipelines across all teams.
Implement trunk‑based development, allowing every team to commit directly to the main branch without using long‑lived branches.
Explanation
This option is incorrect. Direct commits to the main branch eliminate the safety net of code review and increase the risk of breaking the build, especially when multiple teams work simultaneously on unrelated features. While trunk‑based development can be effective with rigorous feature toggles, the scenario described calls for clear isolation of work streams, which this approach lacks.
Apply the Gitflow workflow, maintaining separate develop, release, and hotfix branches alongside feature branches.
Explanation
This option is incorrect for the given context. Gitflow introduces a high level of branching overhead and is better suited to release‑driven projects with long release cycles. The additional release and hotfix branches add coordination complexity for multiple teams that need to stay in sync, making it less efficient than a simple protected‑main with feature branches.
Adopt a centralized workflow where all developers push directly to a single shared branch without branching.
Explanation
This option is incorrect because it provides no isolation between concurrent feature development. Without branches, changes from different teams can clash, leading to frequent merge conflicts and reduced stability of the shared codebase. The lack of a review gate also makes it difficult to enforce quality and security standards.
Work in a single monolithic repository without creating any branches, committing all changes straight to the repository's head.
Explanation
This option is incorrect and essentially repeats the pitfalls of the centralized workflow. It offers no mechanism for separating work, making it impossible to test features in isolation and increasing the likelihood of integration bugs. Real‑world teams rely on branching to manage parallel development and to enable continuous integration pipelines.
Overall explanation
The question tests knowledge of optimal Git branching strategies for coordinating multiple internal teams. A feature‑branch workflow with protected main and pull‑request reviews provides isolation, accountability, and automated quality checks, which are essential when several groups develop distinct features simultaneously. Common misconceptions include thinking that forking is suitable for internal teams, or that trunk‑based or centralized workflows can scale without added risk. While Gitflow offers structure, its extra release and hotfix branches add unnecessary complexity for continuously evolving systems. Best practice is to keep the branching model simple yet robust: short‑lived feature branches, mandatory code review, and branch protection to ensure only vetted code reaches production.
Domain
Branching Strategies
Question 10
Skipped
A QA engineer is trying to debug a production incident and needs to get the latest changes from the remote repository. What should you do FIRST?
Run git pull to automatically fetch and merge the remote changes into the current branch.
Explanation
This option is incorrect. While git pull does retrieve the latest changes, it also merges them immediately, which can introduce merge conflicts or unwanted code changes before the engineer has a chance to review what has been fetched. In a production debugging scenario, you typically want to inspect the incoming commits first, so pulling is not the safest first step.
Create a new temporary branch and check it out before attempting to update the repository.
Explanation
This option is incorrect. Checking out a new branch is unnecessary when the goal is simply to sync the existing branch with the remote. Creating a branch adds extra steps and may confuse the debugging process, especially if the engineer later forgets which branch contains the production code.
Correct answer
Run git fetch to retrieve the latest commits from the remote repository without merging them.
Explanation
This option is correct. git fetch updates the remote-tracking branches, allowing you to see what has changed on the server while keeping your local working tree untouched. After fetching, you can review the diff, cherry‑pick needed commits, or safely merge after confirming that the changes are relevant to the incident.
Reset the local branch hard to match the remote state using git reset --hard origin/main.
Explanation
This option is incorrect. A hard reset discards any local changes and history, which can be destructive if the engineer has uncommitted work or needs to compare local modifications against the remote. It should only be used when you are certain you want to throw away local state, not as a first step for inspection.
Delete the local repository directory and re‑clone the entire project from the remote server.
Explanation
This option is incorrect. Re‑cloning is time‑consuming and unnecessary for simply obtaining the newest commits. It also discards local configuration, stashes, and any unpushed work, making the troubleshooting process slower and riskier.
Download the repository as a ZIP file from the Git Hub web interface and extract it locally.
Explanation
This option is incorrect. A ZIP download lacks Git metadata, so you cannot examine commit history, branch structure, or use Git commands to compare versions. Without the . git directory, you lose the ability to perform typical debugging tasks such as bisecting or checking out specific commits.
Overall explanation
The question tests understanding of remote synchronization best practices in Git. The first action when you need the latest changes is to run git fetch, which updates remote‑tracking branches without altering the current working tree, allowing safe inspection of incoming changes. Many users mistakenly reach for git pull, which combines fetch and merge and can introduce immediate conflicts, making it a less cautious first step. Other options like creating a new branch, hard resetting, re‑cloning, or downloading a ZIP either add unnecessary complexity, risk data loss, or strip away essential Git history. In real‑world incident response, fetching first preserves the stability of the local environment while giving you the information needed to diagnose the problem.
Domain
Remote Operations
Question 11
Skipped
As a product engineer, you're tasked with onboarding a new team member who needs to work on a feature branch. Which configuration achieves this?
Correct answer
Add a [branch "feature"] section to the repository's . git/config file with remote = origin and merge = refs/heads/feature.
Explanation
This is correct because defining a [branch] section tells Git which remote and which remote branch to track for the local feature branch. With this configuration, the new member can push and pull using simple git push and git pull without extra arguments. In practice, the team member can create the local feature branch and it will automatically know to synchronize with origin/feature, streamlining the workflow.
Set core. autocrlf to true in the global . gitconfig.
Explanation
This is incorrect; core. autocrlf controls line‑ending conversion between Windows and Unix systems and has no effect on branch tracking or onboarding. Misunderstanding this setting can lead to unnecessary merge conflicts over line endings, but it does not help a new developer start on a feature branch. Enabling it when not needed may even cause unwanted file changes in the repository.
Enable Git LFS globally to manage large binary files.
Explanation
This is incorrect because Git LFS is a mechanism for handling large files and does not influence branch creation or remote tracking. While useful in some projects, turning it on does not configure the new member's ability to work on a feature branch. Confusing Git LFS with branch configuration can waste time setting up storage pointers that are irrelevant to the task at hand.
Configure push. default to 'upstream' in the global Git settings.
Explanation
This option is partially related but does not fully achieve the onboarding goal. Setting push. default=upstream makes git push default to the upstream branch if one is set, yet it does not automatically set that upstream for a newly created feature branch. Without first creating the proper branch configuration, the new member would still need to manually set the upstream before benefiting from the push. default setting.
Set fetch. prune to true so that stale remote branches are automatically removed.
Explanation
This is incorrect; fetch. prune cleans up deleted remote branches during fetch operations but does not establish any tracking relationship for a new feature branch. While good hygiene, it does not help a newcomer start working on a feature branch. Relying on this setting could give a false sense of progress while the core onboarding step remains unmet.
Run git checkout -b feature/main to create the branch.
Explanation
This is incorrect because the command creates a branch named "feature/main" based off the current HEAD, but it does not configure any upstream tracking to the remote repository. The new member would still need to set the remote branch manually before pushing. Additionally, the naming convention deviates from typical "feature/<name>" patterns, potentially causing confusion in CI pipelines.
Overall explanation
The question tests the learner's understanding of how Git tracks remote branches through repository configuration. The correct answer adds a [branch "feature"] entry in . git/config, explicitly linking the local feature branch to its remote counterpart, which is the essential step for seamless push/pull operations for a new team member. Common misconceptions include confusing unrelated settings such as core. autocrlf, Git LFS, or fetch. prune with branch tracking—they address different concerns like line endings, large file handling, and stale references. Setting push. default to upstream is useful later, but without an upstream defined it cannot function. Best practice is to ensure each feature branch has a clear upstream definition in the config, enabling straightforward collaboration and reducing manual steps during onboarding.
Domain
Git & Git Hub
Question 12
Skipped
You're a data engineer tasked with setting up a data pipeline that requires collaboration with multiple teams. Which THREE tools or features are BEST suited here?
Correct selection
Pull Requests
Explanation
Pull Requests are the primary mechanism for proposing, reviewing, and merging code changes in Git Hub. They enable team members to provide line‑by‑line feedback, enforce standards, and ensure that changes are vetted before reaching production. In a multi‑team data pipeline, PRs prevent accidental breakages by requiring approvals from relevant owners, making them essential for collaborative development.
Correct selection
Git Hub Actions
Explanation
Git Hub Actions provides automated CI/CD pipelines directly within the repository. By defining workflows that test, lint, and deploy pipeline code, teams can get immediate feedback on integration issues and ensure consistent environments. This automation reduces manual hand‑offs between teams and accelerates delivery of reliable data pipelines.
Git Hub Discussions
Explanation
Git Hub Discussions is a forum‑style feature for open‑ended dialogue, ideas, and community support. While useful for brainstorming, it does not offer the structured review, version control, or automation needed for a production data pipeline. Relying on Discussions for core pipeline collaboration would leave the code untracked and untested, leading to integration risks.
Correct selection
Git Hub Projects
Explanation
Git Hub Projects (the Kanban‑style boards) let teams organize work items, track progress, and visualize dependencies across multiple repositories. For a data pipeline involving several squads, Projects can coordinate feature development, bug fixes, and data‑flow tasks in a single view. This high‑level planning tool complements code review and automation by keeping everyone aligned on priorities and timelines.
Git LFS (Large File Storage)
Explanation
Git LFS is designed to handle large binary assets such as media files, not to facilitate team collaboration on code or workflow logic. Using LFS for a data pipeline might help store large datasets, but it does not provide review, testing, or project‑tracking capabilities. Consequently, it is not a core tool for orchestrating multi‑team collaboration on pipeline development.
Code Owners
Explanation
Code Owners automatically request reviews from designated owners when files change, which can streamline reviewer assignment. However, it does not offer the broader planning, automation, or discussion features needed for end‑to‑end pipeline collaboration. While helpful as a supplementary policy, it is not sufficient on its own for coordinating work across multiple teams.
Overall explanation
The question tests understanding of the Git Hub features that enable end‑to‑end collaborative development of data pipelines. Pull Requests, Git Hub Actions, and Git Hub Projects together cover code review, automated testing/deployment, and cross‑team planning, which are the pillars of reliable pipeline delivery. Common misconceptions include treating Discussions as a substitute for structured review, assuming Git LFS solves collaboration problems, or believing Code Owners replaces broader project management. Effective pipeline workflows require a blend of version‑controlled changes, automated validation, and visual task tracking, which the three correct tools provide. Remember to layer these features: use Projects for roadmap visibility, PRs for granular code changes, and Actions to enforce quality before merges.
Domain
Git & Git Hub
Question 13
Skipped
A developer is trying to resolve a merge conflict and wants to know the difference between 'git fetch' and 'git pull'. What is the KEY difference between these two commands in this context?
git fetch automatically merges the remote changes into the current branch, while git pull only downloads the changes without merging.
Explanation
This statement is incorrect. git fetch never merges changes into your current working branch; it only updates the remote‑tracking branches. If a developer believed fetch merged automatically, they would be surprised to find their local files unchanged, potentially leading to missed conflict resolution steps.
git pull simply updates the remote‑tracking branches, whereas git fetch also updates your local branch with the fetched commits.
Explanation
This option is also incorrect. In reality, git pull performs a fetch followed by a merge (or rebase), affecting the current branch, while git fetch only updates the remote‑tracking references. Confusing the direction of updates could cause a developer to think their local branch has been modified when it has not, leading to unexpected merge conflicts later.
Both git fetch and git pull perform the same actions; the only difference is that git pull prints more detailed output.
Explanation
This is a common misconception but it is false. Although both commands contact the remote repository, git pull adds an automatic merge step that git fetch does not have, and the output difference is minimal. Assuming they are identical could cause a developer to miss the automatic merge that pull initiates, resulting in unexpected changes to the working tree.
Correct answer
git fetch only downloads objects and updates remote‑tracking branches, leaving your local working tree untouched; git pull does the same download and then immediately merges (or rebases) the changes into the current branch.
Explanation
This statement is correct. git fetch retrieves new commits from the remote and updates refs such as origin/main without altering the files you are currently editing. git pull builds on fetch by automatically creating a merge commit (or performing a rebase), which directly changes the working directory and can therefore introduce merge conflicts that need to be resolved.
git fetch deletes any local commits that are not present on the remote, while git pull preserves all local commits.
Explanation
This option is incorrect. git fetch never deletes local commits; it merely adds new remote data. Deleting local commits would be a destructive operation typically done with commands like git reset, not fetch. Believing fetch removes work could cause unnecessary panic and misuse of the command.
git pull is a deprecated alias for git fetch, and both commands are functionally identical in modern Git versions.
Explanation
This is false. git pull is not deprecated; it is a distinct command that combines fetch and a subsequent merge (or rebase). Treating pull as merely an alias for fetch would overlook its merging behavior, leading to confusion when conflicts appear after a pull operation.
Overall explanation
The question tests understanding of the fundamental operational difference between git fetch and git pull, especially in the context of merging conflicts. git fetch only retrieves data from the remote and updates remote‑tracking references, leaving the local working tree unchanged, whereas git pull performs a fetch followed by an automatic merge or rebase into the current branch. The correct answer (option 4) captures this distinction accurately. The other options reflect typical misconceptions: thinking fetch merges, believing pull only updates tracking branches, treating the commands as identical, or assuming destructive behavior. Recognizing this difference is essential for safely managing merges, avoiding unintended changes to the working directory, and handling conflicts deliberately.
Domain
Branch Management
Question 14
Skipped
You're a security engineer tasked with securing a Git Hub repository that contains sensitive data. Which statement is CORRECT?
Enabling Git Hub's default branch protection rules automatically encrypts all files in the repository.
Explanation
This statement is incorrect. Branch protection rules enforce workflow policies such as requiring pull‑request reviews or preventing force‑pushes, but they do not perform any encryption of repository contents. Assuming encryption would happen automatically can lead teams to store plaintext secrets, increasing the risk of accidental exposure.
Storing secrets in repository history is safe if the repository is set to private.
Explanation
This statement is incorrect. Even in a private repository, anyone with read access can retrieve the full commit history and thus view embedded secrets. Moreover, private repositories can be accidentally made public, forked, or cloned, so best practice is to never commit secrets and to purge them from history if they appear.
Correct answer
Git Hub's secret scanning and secret scanning push protection can detect and block accidental commits of known secret patterns.
Explanation
This statement is correct. Secret scanning continuously examines code, pull requests, and pushes for patterns that match known credentials, and push protection stops the commit before it enters the repository. In practice, this feature has prevented developers from exposing API keys by blocking the push and alerting the security team.
Granting write access to all organization members is the best way to ensure rapid response to security incidents.
Explanation
This statement is incorrect. Providing write access broadly violates the principle of least privilege and expands the attack surface, making it easier for malicious or accidental changes to occur. Effective incident response relies on well‑defined roles, code‑review processes, and limited permissions rather than universal write rights.
Encrypting files locally before committing and using Git Hub's encrypted secrets for CI/CD eliminates the need for any additional access controls.
Explanation
This statement is incorrect. While local encryption protects data at rest, the encrypted files still require key management, and access controls remain essential to restrict who can decrypt and use those files. Relying solely on encryption ignores other vital controls such as audit logging, branch protection, and secret scanning.
Enabling two‑factor authentication for all collaborators guarantees that the repository cannot be compromised.
Explanation
This statement is incorrect. Two‑factor authentication reduces the risk of credential theft but does not protect against compromised personal access tokens, insider threats, or misconfigurations. A comprehensive security posture requires multiple layers, including least‑privilege access, secret scanning, and regular credential rotation.
Overall explanation
The question tests knowledge of Git Hub's built‑in mechanisms for protecting sensitive data in code repositories. The correct answer highlights that secret scanning and push protection actively look for and block secret patterns, providing an automated safeguard against accidental leaks. Common misconceptions include believing that branch protection encrypts data, that private repos make embedded secrets safe, or that broad write permissions improve security. These misunderstandings can lead to insecure practices such as committing plaintext credentials or over‑granting access. Best practice is a defense‑in‑depth approach: never commit secrets, use secret scanning, enforce least‑privilege permissions, enable two‑factor authentication, and employ encryption where appropriate.
Domain
Secrets Management
Question 15
Skipped
As a developer, you're trying to troubleshoot an issue with your local repository and want to know why your changes are not being reflected in the remote repository. What is the MOST likely root cause?
Your local branch is tracking a different remote branch than you think.
Explanation
This option is incorrect. While tracking the wrong remote branch can cause confusion about where changes appear, it would still show up on the remote branch that is actually being pushed to. The symptom described—no changes appearing at all—more directly points to a missing push rather than a tracking mismatch.
You committed changes but forgot to stage them with `git add`.
Explanation
This option is incorrect. If a file is not staged, it will not be included in the commit, but the commit itself will still exist and can be pushed. However, the user would notice that the file never entered the history, which is different from changes simply not appearing on the remote after a push.
Correct answer
You never executed `git push` after committing, so the remote never received the updates.
Explanation
This option is correct. After committing locally, the only way to synchronize those changes with the remote repository is to run `git push`. If this step is omitted, the remote remains unchanged, which perfectly matches the described problem of changes not being reflected.
The remote repository rejected the push because of a protected branch policy.
Explanation
This option is incorrect. A rejected push due to branch protection would generate an explicit error message, and the developer would be aware that the push failed. The scenario presented does not mention any error notification, making a missing push more likely.
You are looking at the remote's default branch while you pushed to a feature branch.
Explanation
This option is incorrect. Viewing a different branch could make it seem like changes are missing, but the changes would still exist on the feature branch in the remote. The problem statement says changes are not reflected anywhere, suggesting they never reached the remote at all.
Your repository is in detached HEAD state, so commits aren't attached to any branch.
Explanation
This option is incorrect. While committing in a detached HEAD state creates commits that are not on a named branch, the developer would usually notice the HEAD pointer warning and still need to push those commits explicitly. The core issue described aligns more with failing to push rather than the state of the HEAD.
Overall explanation
The question tests the learner's understanding of the basic Git workflow for propagating local changes to a remote repository. The most common cause for changes not appearing remotely is simply that the developer never issued a `git push` after committing, which means the remote never receives the new commit objects. Other plausible-sounding issues—such as tracking the wrong branch, staging errors, protected branches, or branch visibility—are real problems but each produces distinct symptoms, like error messages or changes appearing on a different branch. Recognizing that a push is required is a fundamental best practice; always verify that `git status` shows a clean working tree and that `git log origin/` includes your new commit. In real-world workflows, developers often run `git push` as the final step of a feature implementation, and automated CI pipelines rely on those pushes to trigger builds and deployments.
Domain
Remote synchronization
Question 16
Skipped
As a tech lead, you're onboarding a new team member to a project hosted on Git Hub. The new team member wants to contribute to the project but doesn't have push access. Which option should you choose?
Grant the new member direct push access to the main repository.
Explanation
This option is incorrect because giving direct push rights bypasses the review process that protects code quality. In most teams, especially larger or open‑source projects, push access is limited to maintain the integrity of the main branch. Granting such permission too early can lead to accidental merges or conflicts, undermining the collaborative workflow.
Add the new member as a collaborator with write permission on the repository.
Explanation
While adding a collaborator with write permission does allow pushes, it is still more permission than a typical new contributor needs. The practice encourages a "push‑anywhere" mentality and can expose the repository to unintended changes. Best practice is to keep newcomers on a forked workflow until they have demonstrated reliability and understanding of the project's standards.
Correct answer
Instruct the new member to fork the repository, make changes on a feature branch, and open a pull request to the main repo.
Explanation
This is the correct choice. Forking creates an isolated copy where the contributor can freely commit and push without affecting the upstream repository. Opening a pull request then triggers the team's review process, CI checks, and discussion before any code enters the main branch, aligning with Git Hub's recommended collaboration model.
Create a new branch in the main repository and assign the new member as the branch owner, allowing them to push directly.
Explanation
Git Hub does not have a built‑in concept of a "branch owner" that grants push rights on a per‑branch basis. Permissions are repository‑wide, so this approach would still require giving the user write access to the whole repo, which defeats the purpose of limiting privileges for a new contributor.
Have the new member clone the repository via SSH and push to the upstream remote using a personal access token.
Explanation
Cloning via SSH is fine, but pushing to the upstream remote still requires write permission on the repository. Since the member lacks push access, this method will fail and encourages a misunderstanding that authentication alone suffices for permission granting.
Require the new member to submit changes via email patches attached to an issue.
Explanation
Email patches were historically used before modern code‑review tools, but they are cumbersome and rarely used on Git Hub. This method bypasses the platform's pull‑request features, making code review, CI integration, and traceability much harder. It is generally considered a legacy workflow, not appropriate for standard onboarding.
Overall explanation
The question tests understanding of the standard Git Hub collaboration workflow for contributors without direct push rights. The recommended practice is to have the contributor fork the repository, work on a feature branch in their fork, and submit a pull request for review. This preserves the integrity of the main repository, enables automated testing, and ensures that all changes are vetted before merging. Common misconceptions include assuming that adding a collaborator or granting write access is sufficient, when in fact those actions give broader permissions than necessary. Likewise, ideas like branch‑owner permissions or email patches ignore the platform's built‑in permission model and modern review processes. Following the fork‑and‑pull‑request pattern is a best‑practice that scales from small teams to large open‑source projects.
Domain
Pull Request Workflow
Question 17
Skipped
You're setting up a CI/CD pipeline for a new feature, and you need to ensure that changes are properly reviewed before merging into the main branch. You're using Git Hub as your version control platform. Which TWO approaches should you take?
Disable branch protection for the main branch to allow immediate merges.
Explanation
This option is incorrect because turning off branch protection removes any enforcement of review or CI checks. Without protection, developers can push directly to main, bypassing the pull‑request workflow entirely. In real projects this often leads to bugs reaching production and makes rollbacks more frequent.
Correct selection
Create a branch protection rule that requires an approving pull‑request review before merging.
Explanation
This option is correct. A branch protection rule can be configured to block merges to main until at least one reviewer has approved the pull request, guaranteeing that human eyes have examined the changes. Teams that enforce this see higher code quality and fewer regression incidents because every change is vetted before it hits the main branch.
Configure the repository to allow maintainers to bypass pull‑request reviews.
Explanation
This option is incorrect. Allowing maintainers to skip the review requirement defeats the purpose of a review process and creates a privileged path that can be abused or used accidentally. Organizations that rely on strict governance usually disable this bypass to keep the audit trail consistent.
Correct selection
Set up a required status check that the CI build must pass before the pull request can be merged.
Explanation
This option is correct. Required status checks make Git Hub reject a merge until the designated CI workflow finishes successfully, ensuring that tests, linting, and other automated validations have cleared. In practice, this prevents broken code from being merged and provides immediate feedback to developers when their changes fail the pipeline.
Enable required pull‑request reviewers (code owners) so that specific team members must approve changes.
Explanation
This option is incorrect as a standalone measure because code owners are optional and only apply if you have defined a CODEOWNERS file. Merely enabling the feature does not force a review unless the owners are explicitly required, and it does not guarantee that the CI checks have passed. Relying solely on code owners can give a false sense of security if the protection rules are not also set.
Enable automatic merging of pull requests after a single commit without any review.
Explanation
This option is incorrect because automatic merging without review contradicts the requirement to have changes examined before they reach main. While auto‑merge can be useful for trivial changes, using it for feature work removes the gate that catches bugs and design issues. Deployments that skip review often suffer from undetected defects that increase incident response time.
Overall explanation
The question tests knowledge of Git Hub branch protection mechanisms that enforce code review and CI validation before code reaches the main branch. Correct answers involve configuring a protection rule that mandates an approving pull‑request review and setting required status checks so that the CI pipeline must succeed. Common misconceptions include thinking that disabling protection or allowing maintainers to bypass reviews still maintains quality, or assuming that code‑owner settings alone are sufficient without explicit review requirements. In practice, organizations combine these controls to create a robust gating strategy that catches both human errors and automated test failures. Following these best practices helps maintain a stable main branch and reduces the risk of production incidents.
Domain
Branch Protection
Question 18
Skipped
As a Dev Ops engineer, you're responsible for managing a large codebase with multiple contributors. You notice that a recent commit has broken the build, and you need to diagnose the issue quickly. What is the PRIMARY reason for this behaviour?
Correct answer
The commit bypassed the continuous integration pipeline, so failing tests were not executed before merging.
Explanation
This option is correct. When a commit is merged without triggering the CI pipeline, any compile errors, failing unit tests, or lint violations remain undetected, directly leading to a broken build. In real‑world practice, teams enforce branch protection rules that require CI checks to pass before a merge, preventing this scenario.
The commit introduced a syntax error that prevents the code from compiling.
Explanation
This option is incorrect as a primary cause because syntax errors are usually caught by the CI build itself; the underlying issue is not the error itself but the lack of automated validation. While a syntax error does break a build, the root problem is that the change was not vetted by CI before integration. Relying solely on manual code review without CI can let such errors slip through.
The commit changed a shared configuration file, causing environment mismatches in the build server.
Explanation
This option is incorrect. Modifying configuration can indeed break builds, but it is a secondary symptom; the primary reason for the broken build is the process that allowed an unchecked change to be merged. Proper CI should validate configuration changes against a known good environment before acceptance.
The commit added a new dependency with an incompatible version, leading to a dependency conflict during build.
Explanation
This option is incorrect. Adding an incompatible dependency would cause a build failure, yet the core reason remains that the CI pipeline did not run or enforce version compatibility checks. Best practice is to lock dependency versions and have CI run dependency resolution tests on every push.
The commit removed a required build script step, causing the pipeline to skip compilation.
Explanation
This option is incorrect. Deleting a script step can break the build, but again the primary issue is the lack of automated verification that the build definition remains intact. CI pipelines should include sanity checks that essential steps are present before execution.
The commit introduced a race condition due to concurrent modifications, which only manifested during the build.
Explanation
This option is incorrect. Race conditions are difficult to detect and are rarely the immediate cause of a build break after a single commit. The more common and primary reason is that the change was merged without the safety net of CI, which would have caught such concurrency bugs earlier.
Overall explanation
The question tests understanding of why builds break after a commit and emphasizes the central role of continuous integration in catching errors before they reach the main branch. The correct answer points out that bypassing CI allows unchecked code—whether it contains syntax errors, misconfigurations, or dependency issues—to be merged, directly causing a broken build. The other options describe specific types of errors that could break a build, but they are symptoms rather than the root cause; without CI, those symptoms go unnoticed. Common misconceptions include thinking that any individual error type is the primary reason, when in fact the process flaw is what enables the error to impact the build. Best practice is to enforce CI checks on every push, protect branches, and require status checks to pass before merging, thereby eliminating the primary reason for such build failures.
Domain
Build Automation
Question 19
Skipped
You're working on a project with a team of developers, and you need to collaborate on a feature branch. You've created a fork of the main repository, but you're not sure how to keep your fork up to date with the latest changes from the main repository. What should you do FIRST?
Immediately push your local feature branch to the 'origin' remote of your fork.
Explanation
This is incorrect as a first step. Pushing your changes assumes your fork is already synchronized with the upstream code, which may not be true. If you push before pulling upstream updates, you risk creating merge conflicts later and diverging from the main project's history.
Create a pull request from your fork's feature branch to the main repository.
Explanation
This is incorrect because a pull request is meant to propose your changes after your fork is up to date. Submitting a PR before syncing can result in the PR showing outdated or conflicting code. The reviewer would likely ask you to rebase or merge the latest upstream changes first.
Delete your fork on Git Hub and re‑fork the main repository to get the latest code.
Explanation
This is an inefficient and unnecessary approach. Deleting and re‑forking discards any open pull requests, issues, or Git Hub Actions settings you may have configured. Keeping the same fork and simply pulling from upstream is the standard and safer method.
Correct answer
Add the original repository as a remote named 'upstream' and fetch its latest commits.
Explanation
This is the correct first action. By adding the upstream remote you establish a link to the authoritative source and can fetch the newest commits without affecting your fork's own branches. After fetching, you can merge or rebase those changes into your fork, ensuring you start work on the most recent codebase.
Rebase your local feature branch onto the main repository's 'main' branch without first updating your fork.
Explanation
This is incorrect because rebasing onto an outdated main branch will not incorporate the latest upstream changes. You must first synchronize your fork's copy of main with upstream, then rebase your feature branch onto that updated branch. Skipping the upstream fetch can lead to missed bug fixes or security updates.
Merge the main repository's 'main' branch into your fork's 'main' branch using the Git Hub web UI without adding an upstream remote.
Explanation
While Git Hub's UI allows merging via a pull request, you still need a reference to the upstream repository. Without an upstream remote, you cannot select the main repository as a source for the merge, making this approach impossible. Setting up the upstream remote is the prerequisite for any merge or sync operation.
Overall explanation
The question tests the learner's understanding of how to keep a fork synchronized with its upstream source. The first step in that process is to register the original repository as an 'upstream' remote and fetch its latest commits, which provides a clean reference point for later merges or rebases. Common misconceptions include assuming that pushing, creating a pull request, or even deleting and re‑forking are the initial actions; these either skip the essential sync step or waste effort. Proper workflow dictates adding the upstream remote, fetching, and then integrating changes into your fork's branches before proceeding with feature development or PR creation. Remembering this sequence helps avoid merge conflicts, ensures you work on the latest code, and maintains a tidy project history.
Domain
Fork Synchronization
Question 20
Skipped
You're designing a new feature that requires collaboration with multiple teams across different repositories. You're using Git as your version control system, and you need to ensure that changes are properly tracked and reviewed. Which THREE approaches should you take?
Push directly to the main branch after a quick sanity test to keep CI green.
Explanation
This option is incorrect. Merging directly into the main (or master) branch bypasses the review process and eliminates a clear audit trail of who made what change. In a multi‑team environment it can lead to accidental regressions being released, and the lack of review makes it hard to hold anyone accountable for defects.
Correct selection
Enable branch protection rules that require at least one approving review and successful status checks before allowing a merge to main.
Explanation
This option is correct. Branch protection enforces that every change is examined by at least one peer and passes automated tests, guaranteeing that the history of the main branch only contains vetted commits. Real‑world teams use this pattern to prevent unreviewed code from reaching production, which reduces bugs and improves traceability across repositories.
Rely on manual copying of files between repositories without any version control.
Explanation
This option is incorrect. Manually copying files defeats the purpose of Git; there is no commit history, no ability to revert, and no way to attribute changes to individuals. Such a workflow quickly becomes error‑prone and makes it impossible to audit which team introduced a modification, especially when many repositories are involved.
Correct selection
Create a separate feature branch in each repository and open a pull request for review before merging.
Explanation
This option is correct. Feature branches isolate work, making it easy to track which commits belong to a particular feature, and pull requests provide a built‑in venue for discussion, inline comments, and approvals. Companies like Netflix and Shopify rely on this pattern to coordinate cross‑team changes while preserving a clear, auditable history.
Correct selection
Use a shared repository for common components, include it via Git submodule, and submit pull requests against the submodule when changes are needed.
Explanation
This option is correct. Submodules allow multiple projects to reference a single source of truth for shared code, and changes to that shared code are still made through pull requests and reviewed like any other repository. When the submodule is updated, each consuming repo gets a new commit that records the exact version used, providing full traceability across team boundaries.
Use email patches sent to a team mailing list without any pull request or review system.
Explanation
This option is incorrect. While email patches were common in early open‑source workflows, they lack the integrated review tools, status checks, and visibility that modern platforms provide. Relying on email makes it difficult to enforce mandatory reviews, automatically run CI, or track the exact point at which a change entered the codebase.
Overall explanation
The question tests the learner's understanding of collaborative Git workflows that ensure both traceability and peer review across multiple repositories. Correct approaches involve mechanisms that embed review into the merge process—branch protection rules, feature‑branch pull requests, and a disciplined use of submodules for shared code—because they all generate immutable commit histories and require explicit approvals. The incorrect options represent outdated or risky practices: pushing directly to main eliminates review, manually copying files removes version history, and using raw email patches lacks the automation and enforcement modern teams need. In practice, organizations combine these best‑practice tools with CI pipelines to create a robust gate before code reaches production, guaranteeing accountability and reproducibility. Remember to configure repository settings to make reviews mandatory and to isolate work in branches, regardless of how many teams or repos are involved.
Domain
Collaboration Workflow
Question 21
Skipped
As a developer, you're working on a feature branch, and you've made some changes that you want to submit for review. You've created a pull request, but you're not sure what to do next. Which approach BEST satisfies these requirements?
Merge the pull request immediately since it already contains the changes you want.
Explanation
This option is incorrect because merging without review defeats the purpose of a pull request, which is to obtain peer feedback and catch defects early. Skipping review can lead to bugs being introduced into the main branch, causing regressions for other developers. In real projects, unreviewed merges often result in broken builds or the need for emergency hot‑fixes.
Close the pull request and delete the feature branch, then re‑create a new PR later.
Explanation
Closing the PR and deleting the branch discards the work you have already done and forces you to start over, which is inefficient. It also removes the history of discussion and review comments that could be valuable later. Teams typically keep the PR open to allow reviewers to see the current state and any incremental updates.
Add reviewers to the pull request, then push additional commits directly to the main branch.
Explanation
Assigning reviewers is a good first step, but pushing further commits straight to main bypasses the isolation that a PR provides. This practice can introduce unreviewed changes into the target branch, defeating the safety net that pull requests create. The correct workflow is to continue committing to the feature branch, letting the PR update automatically.
Correct answer
Assign appropriate reviewers, wait for automated CI checks to pass, address any review comments, and once you have the required approvals, merge the pull request into the target branch.
Explanation
This option is correct because it follows the standard pull‑request lifecycle: ensure the right people review the code, let continuous integration verify that tests pass, and act on any feedback before merging. Only after approvals and successful CI should the PR be merged, guaranteeing that the main branch remains stable. This approach minimizes defects and aligns with best‑practice code‑review processes used by most development teams.
Convert the pull request to a draft and leave it untouched until the next sprint.
Explanation
Marking the PR as a draft signals that the changes are not ready for review, but leaving it untouched delays feedback and integration. Valuable review time may be lost, and the branch could diverge from the target branch, creating more merge conflicts later. Drafts are useful for early work, but once the changes are ready, reviewers should be invited promptly.
Ignore the pull request and continue working on the feature branch without notifying anyone.
Explanation
Ignoring the PR defeats its purpose; the team will have no visibility into the work, and the changes will not be reviewed or tested before merging. This can lead to duplicated effort, integration surprises, and reduced code quality. Effective collaboration relies on communicating intent through the PR and engaging reviewers early.
Overall explanation
The question tests understanding of the typical pull‑request workflow in collaborative development. The best practice is to assign reviewers, let CI pipelines verify the changes, respond to any review comments, and only merge after receiving the required approvals. Options that suggest merging without review, deleting the PR, or bypassing the feature branch ignore essential quality‑gate steps and can cause defects or workflow disruption. Draft PRs are useful for work-in-progress but should be promoted to review when ready, not left idle. Remember that a pull request is a communication tool; actively involving reviewers and automation ensures a stable main branch and a smoother development cycle.
Domain
Pull Requests
Question 22
Skipped
You're responsible for managing a large codebase with multiple contributors, and you need to ensure that changes are properly reviewed before merging into the main branch. You're using Git Hub as your version control platform, and you've set up a pull request workflow. What is the KEY difference between a pull request and a merge request in this context?
A pull request is a Git Hub‑specific feature that automatically runs CI pipelines, whereas a merge request does not trigger any CI.
Explanation
This statement is incorrect. Both pull requests on Git Hub and merge requests on Git Lab can be configured to trigger continuous integration pipelines through webhooks or native integrations. The ability to run CI is not tied to the terminology but to the CI configuration of the repository. Assuming one triggers CI and the other does not can lead to missed tests and broken builds.
Pull requests are created by the target branch, while merge requests are created by the source branch.
Explanation
This is a misconception. In both Git Hub and Git Lab, the author creates the request from the source (feature) branch and selects the target (base) branch to merge into. The platform does not reverse the direction based on terminology. Believing otherwise could cause confusion when initiating reviews, especially in cross‑fork scenarios.
Correct answer
The terms refer to the same review workflow; the only distinction is that Git Hub calls it a pull request and Git Lab calls it a merge request.
Explanation
This answer is correct. Pull requests and merge requests are functionally equivalent mechanisms for proposing changes, discussing code, and obtaining approvals before merging. The difference lies solely in naming conventions used by different hosting services. Recognizing this helps teams collaborate across platforms without assuming hidden feature disparities.
A pull request can only be used for forks, whereas a merge request works only with branches within the same repository.
Explanation
This is false. Pull requests can be opened between any two branches, whether they are in the same repository or across forks, and merge requests have the same flexibility in Git Lab. Limiting pull requests to forks would prevent common workflows like feature development within a single repo, which is not the case.
Merge requests require at least two approvers by default, while pull requests require only one.
Explanation
This statement is inaccurate. Both platforms allow repository owners to configure the required number of approvals, but there is no default rule that mandates two approvers for merge requests and one for pull requests. Assuming a fixed approval count can cause teams to misconfigure branch protection rules and experience unexpected merge blocks.
Pull requests always use the 'rebase and merge' strategy, while merge requests default to 'squash and merge'.
Explanation
This is incorrect. Both Git Hub and Git Lab offer multiple merge strategies—including merge commit, squash, and rebase—configurable per repository or per request. No platform forces a single default strategy; administrators choose the preferred method. Believing a fixed strategy exists could lead to inconsistent commit histories across projects.
Overall explanation
The question tests knowledge of terminology differences between Git Hub and Git Lab rather than functional disparities. Pull requests and merge requests both serve the same purpose: to let contributors propose changes, discuss them, and obtain approvals before merging into a protected branch. The only real distinction is the name each platform uses; Git Hub calls the feature a Pull Request, while Git Lab calls it a Merge Request. Many learners mistakenly think the terms imply different capabilities, such as mandatory CI, differing approval counts, or exclusive merge strategies, but all those features are configurable on both platforms. Understanding that the distinction is purely semantic helps teams work seamlessly across hosting services and set appropriate branch protection and review policies.
Domain
Pull Requests
Question 23
Skipped
As a QA engineer, you're responsible for testing a new feature that's been implemented by a team of developers. You've received a pull request with the changes, but you're not sure what to do next. Which tool or feature is BEST suited here?
Correct answer
Git Hub Pull Request Review feature
Explanation
This is the correct choice. The Pull Request Review interface lets QA view the diff, add line‑level comments, run manual testing, and formally approve or request changes. Using this feature integrates QA feedback directly into the development workflow, ensuring the code cannot be merged until the review is resolved. In practice, a QA tester can mark the PR as "Approved" after successful testing or leave a "Request changes" comment if defects are found.
Git Hub Actions CI workflows
Explanation
While Git Hub Actions can automatically run test suites, they are typically configured by developers or Dev Ops engineers, not used directly by QA to conduct ad‑hoc testing. Actions provide automated feedback, but they do not replace the need for a human reviewer to validate UI/UX or exploratory scenarios. Relying solely on Actions might cause QA to miss nuanced defects that only manual testing can uncover.
Git Hub Projects board
Explanation
A Projects board is useful for tracking work items, but it does not give QA a mechanism to examine the code changes or provide formal feedback on a specific pull request. Using a Projects board for testing would require extra steps to cross‑reference cards with PRs, leading to confusion and potential gaps in review coverage. Consequently, it is not the optimal tool for the immediate task of testing a received PR.
Git Hub Issues for tracking bugs
Explanation
Issues are designed for reporting and discussing problems after they have been discovered, not for reviewing code before it lands in the main branch. Opening an issue after finding a bug in a PR adds friction, as the feedback is detached from the exact lines of code that need fixing. Although useful later for documentation, Issues are not the best initial tool for QA to evaluate a new feature.
Git Hub Wiki documentation
Explanation
The Wiki is a place to store project documentation, style guides, or architectural overviews. It does not provide any functionality for reviewing code diffs, adding comments, or approving changes. Using the Wiki for testing would be ineffective and could lead to misplaced effort and lack of traceability of QA decisions.
Git Hub Desktop client
Explanation
Git Hub Desktop is a graphical client for cloning repositories, committing, and pushing changes, but it does not offer a built‑in code review workflow like the web UI does. QA could fetch the branch locally, but without the structured review tools, comments would have to be communicated elsewhere, breaking the seamless review loop. Therefore, it is a less suitable option for the described scenario.
Overall explanation
The question tests knowledge of the appropriate Git Hub feature for a QA engineer to validate a new feature delivered via a pull request. The Pull Request Review feature is purpose‑built for this scenario: it displays the code changes, allows line‑specific comments, and lets the reviewer formally approve or request changes, keeping all feedback attached to the PR. Alternatives such as Actions, Projects, Issues, Wiki, or Desktop are common misconceptions because they are related Git Hub tools, yet they do not directly support the structured review and approval workflow needed for QA testing. Understanding the distinction helps teams maintain a clear, auditable process where quality checks are visible to developers and stakeholders. Best practice is for QA to use the PR Review interface, complement it with automated checks where appropriate, and avoid mixing unrelated tools that could obscure feedback or delay merges.
Domain
Code Review
Question 24
Skipped
You're working on a project with a team of developers, and you need to collaborate on a feature branch. You've created a fork of the main repository, but you're not sure how to manage the remotes. Which TWO options are correct?
Correct selection
Add a remote named "upstream" that points to the original repository using `git remote add upstream <original‑repo‑url>`.
Explanation
This option is correct. Adding an "upstream" remote lets you fetch new commits from the source repository without affecting your fork's own "origin" remote. In practice, you can regularly run `git fetch upstream` to stay up‑to‑date with the main project's changes before merging them into your feature branch.
Correct selection
Keep the existing "origin" remote pointing to your fork and push your feature branch to "origin".
Explanation
This option is also correct. The "origin" remote is automatically created when you clone or fork a repository and should continue to reference your personal fork, which is where you have write access. By pushing your feature work to "origin", you can later open a pull request against the upstream repository, following the standard fork‑and‑pull workflow.
Rename the upstream remote to "origin" so that all pushes go to the original repository.
Explanation
This option is incorrect. Renaming the upstream remote to "origin" would make "origin" point to the upstream repository, which you typically do not have permission to push to. Losing the reference to your own fork means you cannot push your changes or open pull requests without additional configuration.
Delete the "origin" remote and use only the "upstream" remote for both pulling and pushing.
Explanation
This option is incorrect. The "upstream" remote is intended for read‑only operations (fetching) from the source project, while "origin" is the remote you control for pushing. Removing "origin" eliminates the ability to push your feature branch to your fork, breaking the typical collaboration flow.
Use `git pull upstream main` directly from your feature branch to get the latest changes.
Explanation
This option is incorrect. Pulling upstream's main branch directly into a feature branch can create unwanted merge commits and complicate history. The recommended practice is to fetch upstream, update your local main branch, and then rebase or merge those changes into the feature branch, preserving a clean commit graph.
Push your feature branch straight to the original repository using `git push upstream feature‑branch`.
Explanation
This option is incorrect. Most contributors do not have write access to the upstream repository, so pushing directly will be denied and bypasses the review process. The standard approach is to push to your fork's "origin" and then open a pull request so maintainers can review and merge your changes.
Overall explanation
The question tests knowledge of remote management in a typical fork‑and‑pull workflow. When you fork a repository, Git automatically creates an "origin" remote that points to your personal copy, which is where you push your work. Adding an "upstream" remote that points to the original project allows you to fetch new upstream changes without modifying your fork. Correctly using both remotes—pushing to "origin" and pulling from "upstream"—ensures you stay synchronized with the main codebase while preserving your ability to contribute via pull requests. Common misconceptions include renaming or deleting these remotes, which either removes write access to your fork or tries to push to a repository you likely cannot modify, both of which break the collaborative process. Best practice is to keep "origin" for pushes, "upstream" for fetches, and regularly sync your local main branch with upstream before rebasing feature work.
Domain
Fork Workflow
Question 25
Skipped
As a data engineer, you're responsible for managing a large dataset that's stored in a Git repository. You need to ensure that changes to the dataset are properly tracked and reviewed. What is the MOST likely root cause of a conflict when merging changes from a feature branch into the main branch?
The feature branch added new files that do not exist in the main branch.
Explanation
This option is incorrect. Adding new files creates no overlap with existing content, so Git can simply incorporate the files without a conflict. In practice, the merge would fast‑forward or create a new commit that contains the additional files, and reviewers would see the new files as additions, not as conflicting changes.
The main branch was rebased onto a different upstream repository before the merge.
Explanation
This option is incorrect. Rebasing changes the commit history, but it does not by itself cause a merge conflict unless the same content was edited in both histories. A rebase may require a separate conflict resolution step, but the root cause of a conflict is still overlapping edits, not the act of rebasing onto another upstream.
Correct answer
The same lines of the same dataset file were edited in both the feature and main branches.
Explanation
This option is correct. A merge conflict occurs when Git cannot automatically reconcile divergent changes to the same region of a file, which is precisely what happens when both branches modify the same lines. In a real‑world data‑engineer scenario, two analysts might edit overlapping rows in a CSV, forcing a manual review to decide which version to keep.
The dataset includes binary files larger than 100 MB, which Git cannot auto‑merge.
Explanation
This option is incorrect. While large binary files cannot be merged automatically and may need Git LFS, they do not generate a traditional merge conflict; Git will simply keep one version and mark the other as needing manual resolution. The root cause of a conflict is still overlapping textual changes, not file size limits.
The feature branch was created from an older commit that does not share history with the current main branch.
Explanation
This option is incorrect. If the histories do not share a common ancestor, Git will refuse to merge and suggest using the --allow-unrelated-histories flag, but this situation is not classified as a merge conflict. The underlying problem is a lack of a common base, not competing edits to the same lines.
The repository uses different line‑ending configurations (CRLF vs LF) on the two branches.
Explanation
This option is incorrect. Different line endings can produce noisy diffs, but Git can be configured with autocrlf or . gitattributes to normalize them, preventing true merge conflicts. Conflicts still arise only when content differs beyond whitespace or line‑ending differences.
Overall explanation
The question tests understanding of the primary cause of a Git merge conflict: simultaneous edits to the same portion of a file. When two branches change identical lines, Git cannot automatically decide which version to keep, so it flags a conflict for the user to resolve. Options that describe adding new files, rebasing, large binaries, unrelated histories, or line‑ending differences represent common misconceptions about conflict origins, but they either do not produce conflicts or are handled by configuration rather than requiring manual resolution. Recognizing overlapping edits helps data engineers anticipate and avoid painful merges by using feature‑branch reviews, communication, and possibly file locking for large datasets. Best practice is to keep changes small, communicate about hot‑spot files, and resolve conflicts promptly to maintain dataset integrity.
Domain
Git & Git Hub
Question 26
Skipped
As a Dev Ops engineer, you are tasked with integrating a new feature branch into the main branch of a Git Hub repository, but you notice that the feature branch is several commits behind the main branch. What is the MOST appropriate action?
Merge the main branch into the feature branch, resolve any conflicts, and then merge the feature branch back into main.
Explanation
This approach does bring the feature branch up to date, but it introduces an extra merge commit on the feature branch and another when merging to main. Many teams prefer a cleaner linear history, especially for long‑living feature branches. While technically correct, it is not the most appropriate action when a rebase would achieve the same result without additional merge commits.
Correct answer
Rebase the feature branch onto the latest main branch, then fast‑forward merge it into main.
Explanation
Rebasing rewrites the feature branch so that its commits appear on top of the current main tip, producing a linear history. After a successful rebase, the feature branch can be fast‑forward merged, avoiding unnecessary merge commits and simplifying future bisecting. This is the most appropriate action when the goal is to keep history clean and the feature branch is behind main.
Reset the feature branch to the tip of main, discarding its commits, and then delete the feature branch.
Explanation
Resetting the feature branch to main would permanently discard the work done on the feature branch, which defeats the purpose of integrating the new feature. Deleting the branch afterward would lose any unique changes that were supposed to be delivered. This option is incorrect because it destroys valuable code.
Force‑push the feature branch onto main, overwriting main’s history with the feature branch’s commits.
Explanation
Force‑pushing to main rewrites the repository’s shared history, potentially breaking every collaborator’s local clones and CI pipelines. It is considered a dangerous operation that should be avoided except in emergency scenarios. This option is incorrect and could cause serious disruption to the project.
Create a new branch from main, cherry‑pick the feature branch’s commits onto it, and open a pull request.
Explanation
Cherry‑picking can move individual commits, but it is labor‑intensive and may lose commit metadata such as original authorship or context. It is useful for isolated fixes, not for synchronizing an entire feature branch that is merely behind. Therefore, this is a less efficient and less appropriate method for the situation described.
Delete the feature branch and reopen the pull request after pulling the latest main into it.
Explanation
Deleting the branch and reopening a PR adds unnecessary steps and may confuse reviewers. Pulling the latest main into the branch can be done without deleting it, simply by merging or rebasing. This option is redundant and not the most appropriate action.
Overall explanation
The question tests the candidate's understanding of how to synchronize a feature branch with an updated main branch before integration. Rebasing the feature branch onto the latest main creates a linear commit history and allows a fast‑forward merge, which is generally preferred for readability and easier debugging. Options that rely on merging main into the feature branch add extra merge commits, which some teams avoid for a cleaner history. Resetting or force‑pushing compromises code integrity and collaboration, while cherry‑picking and unnecessary branch deletion introduce extra work and risk. Best practice is to keep feature branches up to date via rebase (or merge when policy requires) before merging to main, ensuring a stable and understandable project history.
Domain
Branch Management
Question 27
Skipped
As a developer, you have forked a popular open-source repository on Git Hub and cloned it to your local machine to contribute to the project. You notice that the original repository has received several new commits since you forked it. Which TWO options should you take to ensure your local repository is up-to-date?
Run `git pull origin main`.
Explanation
This option is incorrect because `git pull origin main` pulls changes from your own fork (the origin remote), not from the upstream repository where the new commits reside. Updating only from origin will not bring in the latest work that the original project maintainers have added. Consequently, your local branch would still be out of sync with the upstream source, potentially causing merge conflicts later when you try to submit a pull request.
Correct selection
Add the original repository as a remote named `upstream` using `git remote add upstream <url>`.
Explanation
This option is correct. By adding the original repository as a remote called `upstream`, you create a reference that lets you fetch and integrate changes from the source project directly. This step is essential before you can fetch or pull upstream commits, and it is a standard part of the fork‑and‑sync workflow used by contributors on Git Hub.
Delete the local repository and re‑clone your fork.
Explanation
This option is incorrect. While re‑cloning would give you a fresh copy of your fork, it would still lack the new commits from the original repository unless you first sync the fork on Git Hub. Deleting and recloning is unnecessary overhead and can cause loss of uncommitted work, making it a poor practice for keeping up to date with upstream changes.
Push directly to the original repository using `git push upstream main`.
Explanation
This option is incorrect because most contributors do not have write permission to the upstream repository, so a push will be denied. Even if you had permission, pushing would bypass the review process that open‑source projects typically require. The correct approach is to fetch upstream changes and merge or rebase them locally, then push to your fork and open a pull request.
Correct selection
Fetch the upstream commits and merge them with `git fetch upstream` then `git merge upstream/main`.
Explanation
This option is correct. After adding the upstream remote, fetching retrieves the new commits without altering your working files, and merging incorporates those changes into your current branch. This sequence ensures your local repository reflects the latest state of the original project, allowing you to build on top of the most recent code.
Use `git rebase upstream/main` without first fetching.
Explanation
This option is incorrect because rebasing onto `upstream/main` requires that the upstream ref be up‑to‑date locally. Without a prior `git fetch upstream`, the rebase would operate on stale information, potentially missing new commits or causing unexpected conflicts. Proper workflow dictates fetching first, then rebasing if you prefer a linear history.
Overall explanation
The question tests the learner's understanding of how to synchronize a forked repository with its upstream source. The essential steps are to add the original repository as a remote (commonly named `upstream`) and then retrieve and integrate its new commits, typically via `git fetch upstream` followed by a merge or rebase. Options 2 and 5 correctly describe these actions, making them the right choices. The other options reflect common misunderstandings: pulling from `origin` only updates from your fork, deleting and recloning is unnecessary work, pushing directly to upstream is usually prohibited, and rebasing without fetching uses outdated references. Best practice is to set up the upstream remote once, fetch regularly, and then merge or rebase, ensuring a clean and up‑to‑date local development environment before contributing changes.
Domain
Fork Workflow
Question 28
Skipped
You're a Dev Ops engineer working on a project with a tight deadline. The team is using Git for version control. During a code review, you notice a merge conflict in a critical file. The conflict is caused by two developers working on the same feature. Which TWO options are correct?
Run `git merge --abort`, then push your local branch without the merge.
Explanation
This option is incorrect because aborting the merge discards the attempted integration entirely, leaving the conflict unaddressed. The other developer's changes remain only on their branch, so the critical file will still diverge when the branches are eventually merged. In practice, aborting without further coordination can cause the same conflict to reappear later, delaying the deadline.
Correct selection
Open the conflicted file, manually combine the necessary changes from both developers, stage the file with `git add`, and complete the merge with `git commit`.
Explanation
This option is correct. Manually editing the file lets you preserve the intent of both sets of changes, ensuring the feature works as expected. After staging and committing, the merge is recorded in history with a clear resolution, which is the standard Git workflow for handling conflicts. Real‑world teams rely on this approach to maintain code integrity while meeting tight schedules.
Force push the branch with `git push --force`, overwriting the other developer’s work.
Explanation
This option is incorrect. A forced push rewrites remote history and can permanently discard the other developer’s contributions, leading to loss of valuable code and broken builds. It also violates collaboration norms and can erode trust within the team. In production environments, force pushes are discouraged except in very controlled scenarios.
Use `git checkout --theirs` to automatically keep only the other developer’s version of the file.
Explanation
This option is incorrect because it unilaterally discards your changes in favor of the other developer’s version, which may remove required logic or bug fixes you introduced. While `--theirs` can be useful in some edge cases, blindly applying it to a critical file risks regressions. Proper conflict resolution requires evaluating both sides before deciding what to keep.
Correct selection
Coordinate with the other developer, discuss the intended behavior, and then resolve the conflict together, committing the agreed‑upon version.
Explanation
This option is correct. Communication ensures that both developers understand the purpose of each change and can agree on a combined implementation. Resolving the conflict collaboratively reduces the chance of missing subtle requirements and builds team ownership of the code. Many organizations embed this practice into their code‑review policies to avoid hidden defects.
Delete the conflicted file from the repository and restore it later from a backup.
Explanation
This option is incorrect. Deleting the file removes it from version control, causing downstream builds to fail and creating unnecessary extra steps to restore it later. It also obscures the history of why the file was removed and re‑added, making future debugging harder. Proper conflict resolution should retain the file and integrate the needed changes.
Overall explanation
The question tests the learner's ability to handle Git merge conflicts in a collaborative, time‑sensitive environment. The correct approaches involve either manually merging the conflicting sections and committing (Option 2) or communicating with the co‑author to reach a consensus before committing (Option 5). Both practices preserve all necessary logic and maintain a clean history, which is essential for stable releases. Common misconceptions include aborting merges, force‑pushing, or automatically favoring one side of the conflict without review; these actions can discard critical code, cause regressions, or damage team trust. Best practice is to always examine each conflict, discuss with stakeholders when the intent is unclear, and use Git's standard conflict‑resolution workflow to produce a deliberate, well‑documented commit.
Domain
Merge Conflicts
Question 29
Skipped
As a tech lead, you're tasked with resolving a Git conflict that occurred during a pull request. The conflict is caused by a deleted file that was modified by another developer. What is the MOST appropriate action?
Correct answer
Restore the deleted file, incorporate the other developer's modifications, and commit the resolution.
Explanation
This is the correct action. When a file is deleted in the target branch but modified in the feature branch, the safest approach is to manually bring the file back and merge the intended changes, ensuring no work is unintentionally lost. After confirming with the team that the deletion was not intentional, you commit the resolved version, preserving both history and functionality.
Accept the deletion and discard the other developer's changes, then push the merge.
Explanation
This option is incorrect because it silently throws away the other developer's work, which may be critical to the application. Deleting a file without verifying intent can introduce bugs or missing features, and it also creates friction within the team. Proper conflict resolution requires evaluating both sides, not arbitrarily choosing one.
Rebase the pull request onto the latest target branch and force‑push, ignoring the conflict.
Explanation
Rebasing does not automatically resolve a delete‑modify conflict; it will surface the same conflict again during the rebase process. Force‑pushing without resolving the underlying issue can corrupt the commit history and hide the problem from reviewers. The correct step is to resolve the conflict manually, not to bypass it with a rebase.
Delete the file again in the PR to match the target branch, then close the pull request.
Explanation
Simply matching the target branch by deleting the file does not address the fact that the feature branch introduced legitimate changes. Closing the PR wastes the effort already invested and may require the work to be recreated later. Conflict resolution should aim to preserve useful code, not discard it preemptively.
Use `git checkout --theirs` to keep the version from the target branch, then merge without the file.
Explanation
Choosing `--theirs` would keep the deletion and discard the modifications, which is the same mistake as option 2. While the command technically resolves the conflict, it does so by ignoring valuable changes, which is rarely the desired outcome. A mindful review of both versions is required before deciding which side to keep.
Open a new issue asking the other developer to rewrite their changes on a different file.
Explanation
Creating a new issue adds unnecessary overhead and delays the integration of already completed work. The conflict can be resolved directly in the PR by restoring the file and merging the changes, which is more efficient. This option reflects a misunderstanding of how Git conflict resolution works.
Overall explanation
The question tests understanding of delete‑modify merge conflicts and the appropriate manual resolution strategy. When a file is deleted in one branch but edited in another, the tech lead should verify whether the deletion was intentional, then restore the file and merge the edits, committing the resolved state. Common misconceptions include assuming the deletion is always correct, using force‑push or rebase to bypass conflicts, or discarding work without discussion. Proper practice involves clear communication with the team, careful review of both changes, and a deliberate commit that reflects the agreed‑upon outcome. This ensures code integrity, maintains history, and avoids unnecessary rework.
Domain
Merge Conflicts
Question 30
Skipped
A developer on your team has accidentally pushed a commit with sensitive information to a public Git Hub repository. The commit is several commits behind the current HEAD. Which approach BEST satisfies these requirements?
Delete the entire repository and recreate it without the sensitive file.
Explanation
This option is incorrect because deleting and recreating the repository does not guarantee that the original commit has been removed from all clones and caches. Even if you delete the repo on Git Hub, anyone who previously cloned it still has the secret in their local history. Moreover, recreating a repo loses all existing history, issues, pull requests, and collaborators, which is disruptive and unnecessary.
Add the file to . gitignore, delete it in a new commit, and push the change.
Explanation
Adding the file to . gitignore only prevents future commits; it does not erase the already‑pushed commit from the repository's history. The sensitive data remains accessible in the earlier commit and can be retrieved by anyone who clones or views the repo's history. Therefore this approach does not satisfy the requirement to completely remove the secret.
Correct answer
Rewrite the repository history with BFG Repo‑Cleaner or git filter‑branch to purge the secret, force‑push the cleaned history, and rotate the compromised credentials.
Explanation
This is the correct approach. Rewriting history removes the sensitive data from all commits, ensuring it is no longer present in the public repository or any future clones. After the rewrite, a forced push updates the remote, and rotating the exposed secret mitigates any potential damage from the brief exposure.
Use git revert on the offending commit and push a new commit that removes the secret.
Explanation
Reverting creates a new commit that undoes the changes, but the original commit with the secret remains in the repository's history. Attackers can still access the sensitive information by inspecting past commits. Hence, revert alone does not satisfy the requirement to fully eliminate the secret.
Open a support ticket with Git Hub and ask them to delete the specific commit containing the secret.
Explanation
Git Hub support cannot delete an individual commit from a repository's history without you rewriting it yourself. The standard process requires the repository owner to rewrite history locally and force‑push the changes. Relying on support alone therefore does not achieve the needed removal.
Leave the commit as is, add a disclaimer in the README that the secret is no longer valid, and continue development.
Explanation
Leaving the commit intact means the secret remains retrievable from the repository's history, regardless of the disclaimer. Even if the secret is revoked, the exposure could have already been harvested by malicious actors. This approach fails to protect the organization from potential compromise.
Overall explanation
The question tests knowledge of how to remediate accidentally exposed secrets in a public Git Hub repository. Once sensitive data is pushed, it becomes part of the repository's immutable history, so simply adding . gitignore, reverting, or posting a disclaimer does not remove it. The proper solution is to rewrite history with tools like BFG Repo-Cleaner or git filter-branch, force‑push the cleaned repository, and rotate the compromised credentials to eliminate any risk. Common misconceptions include thinking that a revert or a . gitignore entry erases the data, or that Git Hub support can delete a single commit. Best practice dictates that teams should treat any exposure as a security incident, promptly purge the secret from history, rotate the secret, and audit logs for potential misuse.
Domain
Secrets Management
Question 31
Skipped
You're a QA engineer testing a new feature that involves Git hooks. The hooks are used to enforce coding standards and validate commit messages. Which THREE approaches should you take to troubleshoot a failing hook?
Correct selection
Execute the hook script directly from the command line with a debugging flag (e. g., `sh -x . git/hooks/commit-msg`) to view detailed error output.
Explanation
This is correct. Running the hook manually and enabling shell tracing shows exactly where the script crashes or returns a non‑zero status. The detailed output helps you pinpoint syntax errors, missing commands, or unexpected input, which you can then fix before committing again.
Disable all Git hooks globally by setting `core. hooks Path` to an empty directory and assume the problem is solved.
Explanation
This is incorrect. Changing `core. hooks Path` merely bypasses the hook instead of identifying why it failed, and it can hide legitimate enforcement logic. Relying on this approach prevents you from fixing the underlying issue, leading to unmanaged code quality in the future.
Correct selection
Confirm that the hook file is located in the `. git/hooks` directory and has the executable permission bit set (e. g., `chmod +x`).
Explanation
This is correct. Git only runs scripts that are executable and placed in the correct hooks folder; a missing or non‑executable file will silently abort the commit. Verifying location and permissions is a fundamental first step in any hook troubleshooting workflow.
Push the commit with `--no-verify` to skip the hook and treat the failure as a non‑issue.
Explanation
This is incorrect. Using `--no-verify` skips the hook entirely, which does not provide any insight into the cause of the failure. While it can be useful to bypass a hook temporarily, it should not be considered a troubleshooting technique because it does not address or resolve the underlying problem.
Correct selection
Inspect the hook's runtime environment, ensuring that necessary tools are on the PATH and that any external dependencies are installed and reachable.
Explanation
This is correct. Hooks run in a limited environment; missing PATH entries or unavailable binaries often cause silent failures. By printing the environment or using absolute paths, you can discover why a command inside the hook cannot be found, allowing you to correct the configuration.
Delete the repository and re‑clone it to obtain a fresh copy of the hooks, assuming the original copy was corrupted.
Explanation
This is incorrect. Re‑cloning may give you a clean set of hooks, but it does not reveal the reason the current hook failed and can waste time. Proper troubleshooting should focus on the script itself rather than discarding the work area, which could also lose local testing configurations.
Overall explanation
The question tests a candidate's ability to systematically debug failing Git hooks, which are small scripts that run at specific points in the Git workflow. Effective troubleshooting includes running the hook manually with tracing to see exact error messages, verifying that the hook file is in the correct directory and is executable, and ensuring the runtime environment (PATH, dependencies) is properly set up. Common misconceptions include thinking that bypassing the hook with `--no-verify` or disabling it globally solves the problem, when in fact those actions only mask the issue. Re‑cloning the repo is also a red herring; it does not address script-level bugs and can introduce new variables. Best practice is to isolate the hook, add verbose logging, and check permissions and environment variables before resorting to workarounds.
Domain
Git Hooks
Question 32
Skipped
As an architect, you're designing a new CI/CD pipeline that uses Git and Git Hub. The pipeline must be able to handle multiple branches and merge requests. What is the KEY difference between using git reset and git revert in this context?
git reset only moves the HEAD pointer locally and automatically updates the corresponding remote branch, whereas git revert modifies the remote branch without affecting the local history.
Explanation
This statement is incorrect. git reset changes only the local repository; it does not push changes to the remote automatically. In a CI/CD pipeline, using reset on a shared branch would require a forced push, which is risky, and revert never alters the remote without an explicit push.
git reset changes the working directory and staging area but never creates new commits, while git revert always creates a merge commit that integrates the reversed changes.
Explanation
This option is wrong. git reset can be used with the --hard flag to change the working tree, but it also alters the commit history without creating a new commit. git revert creates a regular commit (not a merge commit) that undoes the changes, preserving history, which is the safe approach for shared branches.
Correct answer
git reset rewrites history by moving the branch pointer and potentially discarding commits, whereas git revert adds a new commit that undoes the changes while keeping the original commit history intact.
Explanation
This is the correct answer. Reset changes the branch reference and can erase commits, which is unsafe for branches that other developers or CI pipelines have already pulled. Revert records an inverse change as a new commit, so the pipeline can continue to run on a consistent history without forced pushes.
git reset can be used on already merged pull requests to safely delete them, while git revert can only be applied to unmerged feature branches.
Explanation
This claim is inaccurate. Once a pull request is merged, both reset and revert affect the target branch, but reset would rewrite history and require a forced push, which is not safe. Revert can be applied to any commit, merged or not, and creates a new commit that undoes the changes.
git reset and git revert are interchangeable commands; both achieve the same result, but git revert is simply a shortcut for git reset --hard.
Explanation
This is a misconception. The two commands have fundamentally different behaviors: reset moves pointers and can discard history, while revert creates a new commit that reverses changes. Treating them as interchangeable would lead to broken CI pipelines and collaboration issues.
git reset only works on the default branch (main/master), whereas git revert can be used on any branch, including feature and release branches.
Explanation
This statement is false. git reset can be executed on any local branch, not just the default branch. Likewise, git revert works on any branch; the difference lies in history rewriting versus creating a new revert commit, not branch restrictions.
Overall explanation
The question tests understanding of how git reset and git revert differ in terms of history manipulation, which is critical when designing CI/CD pipelines that involve shared branches and merge requests. Reset moves the branch pointer and can discard commits, effectively rewriting history, which requires force‑pushing and can break other developers' work or automated builds. Revert, on the other hand, creates a new commit that undoes the changes while preserving the original commit history, making it safe for public branches and continuous integration. Common misconceptions include believing reset automatically updates the remote, that revert always creates merge commits, or that the two commands are interchangeable. Best practice is to use git revert for undoing changes on branches that are already shared or deployed, reserving git reset for local, private cleanup before any push.
Domain
Git & Git Hub
Question 33
Skipped
A developer on your team has used git cherry-pick to apply a commit from one branch to another. However, the commit has introduced a bug that was previously fixed in the original branch. What should you do FIRST?
Amend the cherry‑picked commit with the fix using git commit --amend.
Explanation
This option is incorrect. git commit --amend only changes the most recent commit on the current branch; it does not remove the buggy change that was already introduced by the cherry‑pick. Moreover, amending after the fact can rewrite history that may already have been shared, causing confusion for teammates.
Push the buggy commit to the remote and let the CI pipeline detect the failure.
Explanation
This option is incorrect. While CI can alert you to the failure, pushing a known buggy commit to the shared repository violates the principle of keeping the main branches stable. The appropriate response is to stop the faulty change from propagating before CI even runs.
Correct answer
Revert the cherry‑picked commit (e. g., git revert <sha>) to remove the buggy change.
Explanation
This option is correct. git revert creates a new commit that undoes the effects of the problematic cherry‑pick without rewriting history, which is safe for already‑published branches. Reverting first restores the target branch to a clean state, after which you can re‑apply the change with the necessary fix or bring over the prior bug‑fix commit.
Create a new branch from the target branch, re‑apply the cherry‑pick, and resolve conflicts manually.
Explanation
This option is incorrect. While creating a new branch can be useful for experimentation, the immediate priority is to eliminate the bug from the current branch. Re‑applying the same cherry‑pick without first addressing the bug will likely re‑introduce the issue.
Run git rebase -i to edit the cherry‑picked commit and fix the bug directly.
Explanation
This option is incorrect. An interactive rebase rewrites commit history, which can be dangerous if the branch has already been pushed and shared. Additionally, editing the commit does not address the fact that the original branch already contains a fix for that bug; a revert is a cleaner first step.
Ignore the bug for now and continue development, planning to fix it later.
Explanation
This option is incorrect. Ignoring a known regression undermines code quality and can cause downstream failures for other developers or production. Best practice dictates that you remediate the bug promptly, starting with a revert to keep the branch stable.
Overall explanation
The question tests understanding of how to safely handle a regression introduced by a cherry‑pick. The safest immediate action is to revert the cherry‑picked commit, which creates a new commit that undoes the change without rewriting history, preserving the integrity of shared branches. Options such as amending, rebasing, or creating a new branch either rewrite history or fail to address the regression promptly, which are common misconceptions among developers new to Git. Pushing the buggy commit or ignoring it conflicts with the best practice of keeping the mainline codebase stable and passing CI. Therefore, reverting the commit is the recommended first step before re‑introducing the change with the proper fix or bringing over the earlier bug‑fix commit.
Domain
Branch Management
Question 34
Skipped
You're a data engineer working on a project that involves data migration from an old repository to a new one. The old repository is using Git, and the new repository is using a different version control system. What is the PRIMARY reason for this behaviour?
Correct answer
The new repository needs to store and version large binary assets efficiently, which Git handles poorly, so a different VCS is chosen.
Explanation
This option is correct. Git's storage model and delta compression work best for text files; large binaries cause repository bloat and slow operations. Organizations often switch to systems like Perforce or Subversion that are optimized for big files, making migration the most sensible choice.
The team prefers a cloud‑based UI, and Git cannot be hosted in the cloud.
Explanation
This option is incorrect. Git can be hosted on many cloud platforms (Git Hub, Git Lab, Bitbucket) and the lack of a cloud UI is not a limitation of Git itself. Choosing a different VCS for UI reasons alone would be a secondary, not primary, driver for migration.
Licensing costs force the switch; Git is proprietary software that requires payment for usage.
Explanation
This option is incorrect. Git is an open‑source project released under the GPL-compatible GPL‑2.0 license, so there are no licensing fees. Cost considerations typically involve hosting or support, not the core VCS software, making this a common misconception.
The new VCS provides built‑in issue tracking, which Git lacks.
Explanation
This option is incorrect. While plain Git does not include issue tracking, many Git hosting services (Git Hub, Git Lab) add this feature. Therefore, the absence of built‑in issue tracking is not a primary reason to abandon Git itself.
The old repository's commit history is too large, and moving to another VCS will automatically reduce storage size.
Explanation
This option is incorrect. Switching VCS does not magically shrink a repository; history size is preserved unless explicitly pruned or filtered. Misunderstanding this leads teams to think a new system will solve storage issues without additional cleanup steps.
The organization wants to enforce a centralized workflow, which Git cannot enforce.
Explanation
This option is incorrect. Git can be used in centralized workflows through server‑side hooks, branch protection rules, and pull‑request policies. The inability to enforce centralization is a myth; it is the workflow design, not the VCS, that dictates control mechanisms.
Overall explanation
The question tests the learner's understanding of why an organization might replace Git with another version control system during a migration. The primary driver is usually functional: certain VCSs handle large binary files, massive repositories, or specific compliance requirements better than Git. Options that cite cloud hosting, licensing, or missing features like issue tracking are common misconceptions because they confuse the capabilities of Git hosting services with the core VCS itself. Misbeliefs about automatic repository size reduction or inherent centralization limits also stem from superficial knowledge of Git's flexibility. In practice, teams should evaluate concrete technical needs—such as binary asset management—before deciding to switch VCSs, and they should remember that many perceived limitations can be mitigated through tooling and process design.
Domain
Version Control Strategy
Question 35
Skipped
You're a product engineer working on a project that involves integrating multiple Git repositories into a single monorepo. The repositories have different commit histories and branch structures. Which TWO options are correct?
Use `git submodule add` for each repository, keeping them as independent sub‑modules within the new repository.
Explanation
This option is incorrect. A submodule records a separate Git repository at a specific commit; it does not merge the histories into the monorepo. In a true monorepo you want all files and their histories in one repository, so submodules defeat the purpose and add complexity in CI pipelines.
Correct selection
Add each external repository as a remote, rewrite its root with `git filter-repo --to-subdirectory-filter` (or `git filter-branch --tree-filter`), then merge using `git merge --allow-unrelated-histories`.
Explanation
This option is correct. Adding the repo as a remote preserves its original commits, and rewriting the paths places its files under a dedicated subdirectory, preventing name collisions. Merging with `--allow-unrelated-histories` combines the two separate histories into the monorepo while keeping full provenance, which is essential for traceability and future audits.
Perform a `git rebase` of each repository onto the monorepo's main branch to combine histories.
Explanation
This option is incorrect. Rebasing rewrites the original commits, changing their SHA‑1s and discarding the original branch structure, which makes it difficult to trace back to the source repositories. Moreover, rebasing across unrelated histories will usually fail unless you first rewrite the tree, making the approach unreliable for monorepo consolidation.
Copy the source files from each repository into the monorepo’s directories and commit, discarding the original commit history.
Explanation
This option is incorrect. While it technically creates a monorepo, it loses all historical information about when and why each change was made in the original repos. Losing that history hurts debugging, compliance, and the ability to bisect issues across the original projects.
Correct selection
Run `git subtree add --prefix=repo A <repo A-url> master` for each repository, which imports the full history into a dedicated subdirectory without squashing.
Explanation
This option is correct. `git subtree add` pulls in another repository as a subdirectory while preserving every commit, and because it does not use the `--squash` flag, the history remains intact. The result is a single repository where each original project's timeline is visible, which aligns with monorepo best practices for history continuity.
Use `git merge` with `--no-ff` after adding the repositories as remotes, but omit `--allow-unrelated-histories`.
Explanation
This option is incorrect. Without `--allow-unrelated-histories`, Git will refuse to merge two repositories that do not share a common ancestor, resulting in an error. Even if you forced the merge, the histories would be tangled incorrectly, leading to a confusing commit graph and potential data loss.
Overall explanation
The question tests knowledge of proven techniques for consolidating independent Git repositories into a single monorepo while preserving their commit histories. The two correct approaches—using `git subtree add` without squashing and importing each repo via a remote combined with path‑filtering and `--allow-unrelated-histories`—both keep full provenance and avoid name clashes by placing each repo in its own subdirectory. Common misconceptions include treating submodules as a monorepo solution, which merely links external repos rather than merging them, and using simple copy‑and‑commit or rebase strategies that discard original histories. Incorrect options also illustrate pitfalls such as missing the crucial `--allow-unrelated-histories` flag, which blocks merges of unrelated histories, and using `--squash` which would collapse all past commits into one. Best practice is to choose a method that retains every original commit, rewrites paths safely, and results in a clean, navigable history for future development and auditing.
Domain
Monorepo Integration
Question 36
Skipped
As a developer, you're tasked with troubleshooting a Git issue that involves a corrupted reflog. The reflog is used to track changes to the repository's references. Which tool or feature is BEST suited here?
Correct answer
git fsck
Explanation
Correct. git fsck (file system check) scans the . git directory for integrity problems, including corrupted reflog entries. It can identify dangling commits and orphaned objects that may be recovered, allowing you to reconstruct a missing or damaged reflog. In practice, running git fsck after a reflog corruption often reveals the exact objects that need to be re‑referenced, enabling you to rebuild the history safely.
git reflog verify
Explanation
Incorrect. There is no git reflog verify command; this option is a common misconception that Git provides a dedicated verification sub‑command for reflogs. Users sometimes think such a command exists because other Git objects have verify‑style commands (e. g., git commit --verify). Attempting to run this will result in an error, leaving the corrupted reflog untouched.
git gc --prune=now
Explanation
Incorrect. git gc (garbage collection) cleans up unreachable objects, but it does not repair a corrupted reflog; in fact, it may permanently discard objects that the broken reflog was pointing to. Running this on a repository with a damaged reflog can make recovery harder because the necessary commits could be pruned.
git reset --hard HEAD
Explanation
Incorrect. git reset --hard simply moves the current branch pointer to a specified commit and overwrites the working tree; it does not address corruption in the reflog files. Using this command on a repository with a bad reflog will not fix the underlying log files and may even obscure the problem by discarding uncommitted changes.
git reflog expire --expire-unreachable=now
Explanation
Incorrect. git reflog expire is used to prune old reflog entries according to expiry policies; it does not restore or repair corrupted entries. While it can clean up a bloated reflog, applying it to a corrupted reflog may delete valuable data needed for recovery, worsening the situation.
git commit --amend
Explanation
Incorrect. git commit --amend creates a new commit that replaces the tip of the current branch, but it does not interact with reflog integrity. Users sometimes think amending a commit will rewrite reflog entries, yet the underlying reflog corruption remains unchanged, and no recovery is performed.
Overall explanation
The question tests knowledge of how to handle a corrupted reflog, which is a log of reference updates stored in . git/logs. The appropriate Git utility for detecting and helping recover from such corruption is git fsck, which scans the repository for integrity issues and reports dangling or malformed objects that can be re‑linked. Options like git reflog verify, git reflog expire, and git commit --amend are either nonexistent or serve unrelated purposes, leading to common misconceptions that Git provides a direct “repair” command for reflogs. Garbage collection and hard resets affect object reachability but do not fix log corruption and can even remove needed data. Best practice is to run git fsck first, then manually rebuild the reflog using the information it provides before performing any pruning operations.
Domain
Reflog
Question 37
Skipped
You're a Dev Ops engineer working on a project that involves optimizing Git performance. The repository is large, and the team is experiencing slow commit and push times. What is the MOST likely root cause?
The network connection between the local machine and the remote server has insufficient bandwidth, causing data to be transferred slowly.
Explanation
This option is incorrect. While limited network bandwidth can affect push speed, it does not impact the time taken to create a commit, which is a local operation. Moreover, if bandwidth were the main issue, any repository (large or small) would exhibit similar latency, which is not described in the scenario. In practice, teams often notice push delays only when the data payload is unusually large, pointing to repository content rather than the network as the primary cause.
The local Git configuration has compression disabled, forcing Git to send uncompressed objects during pushes.
Explanation
This option is incorrect. Disabling compression may slightly increase the amount of data sent, but Git's default compression settings are already optimized for speed versus size, and the impact on commit time is minimal. The slowdown described affects both commit and push phases, suggesting a deeper issue than a configuration flag. Real‑world experience shows that toggling compression rarely turns a minute‑long commit into a few seconds.
Correct answer
Large binary files are being tracked directly in the repository instead of using Git LFS or other external storage.
Explanation
This option is correct. Git handles text files efficiently by storing deltas, but binary files cannot be diffed effectively, so each change adds a full copy to the object database, inflating packfile size dramatically. The larger packfiles increase CPU, memory, and I/O requirements during both commit creation and push upload, leading to the observed slowness. Teams that move large assets to Git LFS typically see commit times drop from minutes to seconds.
The repository contains a very high number of small text files that are frequently modified, creating many objects.
Explanation
This option is incorrect. Although a huge number of objects does add overhead, Git's delta compression works well for small text files, keeping packfiles relatively compact. The performance impact of many small files is usually far less severe than that of large binary assets. In practice, developers often work with thousands of configuration files without experiencing the severe slowdowns described here.
The . gitignore file is misconfigured, causing unnecessary files to be staged and committed each time.
Explanation
This option is incorrect. A mis‑configured . gitignore might cause unwanted files to be added, but those files would need to be large or numerous to affect performance noticeably, and the problem would be episodic rather than systemic. Commit operations only process tracked files, so ignored files do not contribute to the slowdown. Real‑world cases show that fixing . gitignore eliminates accidental commits, but does not resolve chronic performance degradation in a large repository.
The remote repository is accessed via HTTP instead of SSH, adding extra protocol overhead during pushes.
Explanation
This option is incorrect. The protocol choice (HTTP vs SSH) adds only a small handshake overhead and does not significantly affect the time required to upload large packfiles. The core bottleneck remains the amount of data being transferred, not the transport protocol. Organizations commonly use HTTPS for pushes without experiencing the level of slowness described in the scenario.
Overall explanation
The question tests understanding of the primary factor that degrades Git performance in large repositories: the presence of sizable binary assets tracked directly in Git. Binary files cannot be delta‑compressed, so each change adds a full copy to the repository, bloating the object database and making both commit creation and push operations CPU‑ and I/O‑intensive. Options related to network bandwidth, compression settings, file count, . gitignore, or transport protocol are common misconceptions because they can affect performance in specific contexts, yet they do not explain the simultaneous slowdown of both commits and pushes in a large repo. Best practice dictates storing large binaries with Git LFS, using git gc to prune unreachable objects, and periodically rewriting history to remove unnecessary large files. Remembering these strategies helps maintain a healthy, fast‑moving repository even as project size grows.
Domain
Repository Performance
Question 38
Skipped
A team lead is tasked with resolving a merge conflict that occurred when two developers pushed changes to the same branch. The changes are in different files but one of the files has a conflicting change in the same line of code. Which option should you choose?
Accept the changes from the developer who pushed first and discard the later changes.
Explanation
This option is incorrect because it simply throws away the work contributed by the second developer. Merge conflicts exist precisely to prevent accidental loss of code; arbitrarily discarding one side violates the principle of collaborative development. In a real project, this could introduce bugs or regressions that were fixed by the later changes, leading to wasted effort and reduced trust among the team.
Use `git merge --strategy=ours` to automatically keep the version from the current branch.
Explanation
While the `ours` strategy can be useful in special cases, it is not appropriate here because it would silently overwrite the other developer's line of code. The strategy treats all conflicting hunks as if the current branch's version is correct, which may discard valuable logic added by the teammate. Employing it without careful justification can cause functional discrepancies and makes it harder to track why certain changes were omitted.
Correct answer
Open the conflicted file, edit the conflict markers to keep the desired code, then add and commit the merge.
Explanation
This is the correct approach. Git marks conflicts with `<<<<<<<`, `=======`, and `>>>>>>>` lines, allowing the team lead to manually choose, combine, or rewrite the conflicting code. After editing, staging the file and completing the commit resolves the conflict while preserving the intended behavior from both developers, which is the standard best practice for line‑level conflicts.
Abort the merge with `git merge --abort` and ask the developers to rebase their work.
Explanation
Aborting the merge stops the current merge process but does not resolve the underlying conflict. Requiring developers to rebase adds unnecessary steps when the conflict is limited to a single line that can be manually reconciled. This approach wastes time and may create additional merge or rebase conflicts later on.
Create a new branch, cherry‑pick the non‑conflicting commits, and delete the original branch.
Explanation
Cherry‑picking can be used to isolate specific changes, but it is overly complex for a simple line conflict and can disrupt the commit history. It also chances the loss of context provided by the original merge commit, making future debugging harder. This method is a poor fit compared to directly editing the conflict markers in the affected file.
Run `git pull --rebase` to rewrite history and avoid the conflict.
Explanation
Running `git pull --rebase` after the merge conflict has already been introduced does not magically resolve the existing conflict. The rebase would reapply the commits and likely encounter the same line conflict again, requiring manual resolution anyway. Therefore, this command is not a direct solution to the problem at hand.
Overall explanation
The question tests the learner's understanding of how to resolve a line‑level merge conflict in Git. When two developers edit the same line, Git cannot decide which version to keep, so it inserts conflict markers that must be manually edited to produce the correct final code. The correct choice is to open the conflicted file, reconcile the differences by editing the markers, and then stage and commit the resolution. Common misconceptions include thinking that discarding one side's changes, using aggressive merge strategies like `ours`, aborting the merge, or resorting to rebasing or cherry‑picking will automatically fix the problem; these either lose work or add unnecessary complexity. Best practice is to resolve conflicts locally, test the merged result, and commit, ensuring that both developers' intended functionality is retained and the repository history stays clean.
Domain
Merge Conflicts
Question 39
Skipped
A developer accidentally commits a large binary file to the repository, causing the repository size to increase significantly. The commit has not been pushed yet. What is the MOST appropriate action?
Immediately push the commit to the remote repository, then rely on Git Hub's file size limits to reject it.
Explanation
This option is incorrect. Pushing the commit makes the large binary part of the remote history, and if the file is below the hard limit Git Hub will accept it, permanently inflating the repository size. Waiting for a rejection after the fact defeats the purpose of correcting the mistake locally before it propagates.
Add the binary file to . gitignore and commit again, leaving the previous commit untouched.
Explanation
This option is incorrect. . gitignore only affects untracked files; once a file is committed, it is already tracked and will remain in the repository history. Keeping the original commit means the large binary will still occupy space and affect clones and fetches for all collaborators.
Correct answer
Reset the commit locally (e. g., git reset --soft HEAD~1), remove the binary file from the index, and recommit without it.
Explanation
This option is correct. Because the commit has not been pushed, you can safely rewrite the local history to exclude the unwanted binary, preventing it from ever reaching the remote. Using git reset or an interactive rebase lets you amend the commit, keep other changes, and maintain a clean repository size.
Run git filter-branch to purge the file from the repository's history, then force‑push the rewritten history.
Explanation
This option is incorrect. filter-branch is a heavyweight tool intended for cleaning already‑published history; it is unnecessary when the problematic commit hasn't been pushed. Moreover, force‑pushing rewritten history can disrupt collaborators and should be avoided if a simpler local reset suffices.
Convert the repository to use Git LFS, track the binary file, and push the existing commit as is.
Explanation
This option is incorrect. Adding Git LFS after the fact does not retroactively move the already‑committed binary out of history; the large file remains in the previous commit. Proper use of Git LFS requires tracking the file before committing, or an history rewrite to replace the existing blob.
Leave the commit as is; large binary files are acceptable in Git and will not cause issues.
Explanation
This option is incorrect. Storing large binaries directly in Git degrades performance, bloats clone times, and can exceed hosting limits. Best practice is to avoid committing such files altogether or to use Git LFS, making the repository lean and efficient for all users.
Overall explanation
The question tests knowledge of how to handle unwanted large binary files before they become part of the shared repository history. Since the commit has not been pushed, the safest and most efficient remedy is to rewrite the local commit using git reset (or an interactive rebase) to remove the binary, ensuring the remote never receives the bloated data. Common misconceptions include thinking . gitignore retroactively removes files, believing Git LFS can automatically fix past commits, or assuming filter-branch is needed for every cleanup. Those misunderstandings can lead to unnecessary complexity or permanent repository bloat. The best‑practice workflow is to catch such errors early, amend or reset the commit locally, and only push after the repository remains clean and lightweight.
Domain
Repository Management
Question 40
Skipped
A developer is tasked with reverting a commit that was pushed to the remote repository. The commit introduced a critical bug that needs to be fixed immediately. Which TWO options are correct?
Correct selection
Run `git revert <commit SHA>` locally, then push the new revert commit to the remote.
Explanation
This option is correct. `git revert` creates a new commit that undoes the changes introduced by the specified commit while preserving the existing history, which is safe for shared branches. After the revert commit is created, pushing it updates the remote with the fix without rewriting any published history.
Use `git reset --hard <previous SHA>` locally and then push the branch without any force flag.
Explanation
This option is incorrect. A hard reset rewrites the commit history, and pushing without a force flag will be rejected by the remote because it would discard commits that other collaborators may have based work on. To update the remote after a reset, a force push is required, which makes this approach risky in collaborative environments.
Delete the remote branch entirely and recreate it from the good commit locally.
Explanation
This option is incorrect. Deleting a remote branch and recreating it discards the branch’s history and can disrupt other developers who have the branch checked out, leading to confusion and potential loss of work. Proper revert strategies keep the branch history intact and communicate changes clearly to the team.
Create a new commit that manually fixes the bug and push it to the remote.
Explanation
This option is incorrect for the specific task of reverting the offending commit. While adding a corrective commit resolves the bug, it does not remove the problematic commit from history, which may be required for compliance or clarity. The question asks for reverting the original commit, not merely adding a fix on top of it.
Correct selection
Run `git reset --hard <good SHA>` locally, then push with `git push --force-with-lease` to overwrite the remote history.
Explanation
This option is correct, though it should be used with caution. A hard reset moves the branch pointer to a prior commit, effectively discarding the bad commit, and a force‑with‑lease push safely overwrites the remote as long as no new commits have been added by others. This method is appropriate in emergency situations when the team agrees to rewrite history, but it must be communicated clearly to avoid disrupting collaborators.
Use `git cherry-pick` to copy the good commits onto a new branch and push that branch instead of the original.
Explanation
This option is incorrect because cherry‑picking does not revert the bad commit; it merely reproduces selected commits on a new branch. The original problematic commit would still exist in the original branch, and pushing a new branch does not fix the issue in the current main line of development. This approach adds unnecessary complexity and does not address the requirement to revert the specific commit.
Overall explanation
The question tests knowledge of how to undo a problematic commit that has already been shared on a remote repository. The safest, history‑preserving method is `git revert`, which creates a new commit that negates the changes and can be pushed normally. A more aggressive method is to reset the branch to a prior state and force‑push, which rewrites history and should only be used when the team agrees to this risk. Common misconceptions include thinking that a normal push after a reset will succeed, or that fixing the bug with a new commit satisfies a revert requirement. Best practice is to prefer `git revert` for shared branches and reserve history rewriting for short‑lived or emergency scenarios, always communicating the chosen approach to all collaborators.
Domain
Reverting Changes
Question 41
Skipped
A developer is trying to cherry-pick a commit from a feature branch into the main branch, but the commit is not being applied due to a conflict. What is the PRIMARY reason for this behaviour?
Correct answer
The commit changes lines that have been altered differently in the main branch, causing overlapping edits.
Explanation
This option is correct. Cherry‑pick re‑applies the diff of the selected commit onto the current HEAD. If the same lines were modified in both the feature branch and the main branch in incompatible ways, Git cannot reconcile them automatically, so it raises a conflict. In practice you would see the conflict markers and need to resolve the differing implementations manually.
The commit's parent commit is not an ancestor of the main branch, so Git cannot locate the necessary base for the operation.
Explanation
This option is incorrect. Cherry‑pick does not require the commit's parent to be reachable from the target branch; it simply extracts the patch and applies it. The operation can succeed even when the commit is completely unrelated to the target history, provided there are no overlapping changes. Misunderstanding this leads developers to think ancestry is the blocker, which it isn’t.
The feature branch was rebased onto main after the commit, so the changes are already present in main.
Explanation
This option is incorrect. If the changes were already present, Git would report that the cherry‑pick is empty, not that there is a conflict. A conflict specifically indicates divergent edits, not duplicate content. Assuming rebasing eliminated the conflict is a common misconception that can waste debugging time.
The developer has not pushed the latest main branch to the remote, so Git cannot compare the commit against the up‑to‑date code.
Explanation
This option is incorrect. Cherry‑pick operates entirely on the local repository; it does not require a remote push to detect conflicts. The conflict arises from local file content, not from remote synchronization status. Believing a missing push causes the conflict confuses network operations with local merge mechanics.
The commit includes binary files, and Git cannot automatically merge binary changes.
Explanation
This option is incorrect. While binary files can cause merge difficulties, the primary reason for a conflict is overlapping textual changes. Git will still flag a conflict for binary files, but the question asks for the primary reason, which is overlapping edits, not the file type. Confusing binary‑file handling with general conflict logic is a frequent misunderstanding.
A repository pre‑receive hook blocks cherry‑pick operations, preventing the commit from being applied.
Explanation
This option is incorrect. Pre‑receive hooks run on the server during push, not during local cherry‑pick. Conflicts are detected by the Git client before any server interaction. Assuming server‑side hooks interfere with local conflict resolution mixes up different stages of the workflow.
Overall explanation
The question tests understanding of why a cherry‑pick can result in a conflict. Git attempts to reapply the exact changes introduced by the selected commit onto the current HEAD; when those lines have been edited differently in the target branch, Git cannot automatically merge them and therefore stops with a conflict. This is the primary and most common cause, not ancestry relationships, remote state, or server hooks. Many learners mistakenly blame missing pushes or commit ancestry, but those factors do not affect the conflict detection algorithm. In real projects, recognizing overlapping edits helps developers quickly resolve conflicts by choosing the appropriate implementation or by communicating with the team about the intended change. Best practice is to review the diff before cherry‑picking and, if possible, re‑base or merge first to minimize overlapping changes.
Domain
Branch Management
Question 42
Skipped
A developer is tasked with resetting a branch to a previous commit. The branch has multiple commits ahead of the desired reset point. Which approach BEST satisfies these requirements?
Run `git revert <commit>.. HEAD` to create revert commits for each unwanted change.
Explanation
This option is incorrect. `git revert` generates new commits that undo the effects of the specified range, preserving the original commit history rather than moving the branch pointer. In a shared repository this would leave the unwanted commits still present, which may confuse downstream developers and inflate the log unnecessarily.
Use an interactive rebase (`git rebase -i <commit>`) and drop the later commits manually.
Explanation
This option is partially correct but not the best choice. Interactive rebasing can indeed remove commits, but it requires careful editing of the rebase todo list and is prone to mistakes, especially for less‑experienced users. Moreover, after the rebase the branch’s history is rewritten, so a force‑push is still required, adding operational risk compared to a straightforward reset.
Correct answer
Execute `git reset --hard <commit>` followed by `git push --force` to rewrite the branch to the desired state.
Explanation
This option is correct. `git reset --hard` moves the branch pointer to the specified commit and discards all later commits from the working tree and index, exactly matching the requirement to reset the branch. Because the history is rewritten, a forced push is necessary to update the remote branch, which is the standard and most direct method for this scenario.
Check out the old commit (`git checkout <commit>`) and create a new branch from that point, leaving the original branch unchanged.
Explanation
This option is incorrect. While checking out a commit and branching from it gives you a clean line of development, it does not reset the original branch; the unwanted commits remain on the original branch, defeating the task’s goal. Teams would then have two parallel branches, potentially causing confusion about which one should be used going forward.
Run `git reset --soft <commit>` and then force‑push the branch.
Explanation
This option is incorrect. `git reset --soft` moves the branch pointer but leaves all changes from the discarded commits staged in the index, which means they are not truly removed. Pushing this state would still expose the unwanted changes to collaborators and would require an additional commit to finalize the reset, making it less efficient than a hard reset.
Merge the desired commit using the "ours" strategy (`git merge -s ours <commit>`).
Explanation
This option is incorrect. The `ours` merge strategy records a merge commit that pretends to have taken the changes from the given commit, but it does not actually move the branch pointer or discard the later commits. The original commits remain in the history, so the branch is not truly reset to the earlier state.
Overall explanation
The question tests knowledge of how to move a branch pointer backward and discard subsequent commits in Git. The optimal technique is a hard reset (`git reset --hard `) combined with a forced push to rewrite the remote branch, because it directly updates the branch reference and removes the unwanted commits from both local and remote histories. Common misconceptions include using `git revert`, which only adds undo commits, or interactive rebase, which is more complex and still requires a force‑push. Creating a new branch from the old commit or using merge strategies does not modify the original branch, leaving stale history behind. Best practice dictates that after a hard reset on a shared branch, a clear communication to the team and a forced push are essential to avoid divergent histories.
Domain
Branch Management
Question 43
Skipped
A team is experiencing issues with their Git repository due to a corrupted reflog. The reflog is not being updated correctly, causing issues with the repository's history. What is the MOST likely root cause?
The . git/HEAD file has been manually edited, breaking the reference chain.
Explanation
This option is incorrect. Manually editing . git/HEAD can cause reference problems, but it does not directly corrupt or stop reflog updates. The reflog records changes to refs, and a bad HEAD would cause checkout failures rather than a silently stale reflog.
The repository is stored on a network share that does not support atomic file locking, leading to race conditions in reflog writes.
Explanation
This option is a plausible distractor but is incorrect for the described symptom. While network filesystems can cause occasional reflog inconsistencies, they rarely prevent updates altogether; Git would still write entries, albeit with occasional corruption. The scenario mentions the reflog is not being updated at all, which points to a configuration issue rather than filesystem race conditions.
The user performed a git filter-branch without preserving reflog entries, causing loss of history.
Explanation
This answer is incorrect. Using git filter-branch can rewrite history and optionally discard reflog data, but it does so intentionally and the reflog would be cleared rather than silently failing to update. The problem described is ongoing failure to record new entries, not a one‑time loss.
Correct answer
The repository configuration has core. log All Ref Updates set to false, which disables reflog updates.
Explanation
This option is correct. When core. log All Ref Updates is false, Git does not write to the reflog for reference updates, so the reflog appears stale or corrupted from the team's perspective. This configuration is often disabled in bare repositories or deliberately turned off for performance, leading to the exact symptom of the reflog not being updated correctly.
The Git version in use is older than 1.7, which lacked proper reflog support.
Explanation
This answer is incorrect. Reflog support was introduced in Git 1.5 and has been stable for many releases; an older version would still maintain reflogs, though perhaps with limited features. The issue described is more characteristic of a misconfiguration than an obsolete Git version.
A sudden power loss corrupted the local . git directory, including the reflog files.
Explanation
This option is incorrect. A power loss could indeed corrupt files, but it would typically affect many parts of the repository, not just stop new reflog entries from being written while the rest of Git operates normally. The symptom of the reflog never updating points to a settings problem rather than random disk corruption.
Overall explanation
The question tests knowledge of how Git manages reflog updates and the configuration that controls this behavior. The core setting `core. log All Ref Updates` determines whether Git records reference changes in the reflog; when it is set to false, reflogs are effectively disabled, leading to a seemingly corrupted or empty reflog. Many users mistakenly think reflog corruption is always due to disk errors or manual file edits, but the most common root cause for a non‑updating reflog is an intentional or accidental configuration change. Other options, such as network filesystem issues, filter-branch misuse, or outdated Git versions, are plausible but address different failure modes. Best practice is to ensure `core. log All Ref Updates` is true for repositories where history tracing via reflog is needed, especially in non‑bare clones, and to verify the setting with `git config --get core. log All Ref Updates`.
Domain
Reflog
Question 44
Skipped
A developer is tasked with resolving a conflict that occurred when merging a branch. The conflict is due to a change in a file that was deleted in the main branch. Which tool or feature is BEST suited here?
Use git mergetool to launch a visual merge editor.
Explanation
git mergetool opens an external diff/merge program so the user can manually decide how to combine changes. While it can certainly be used for a delete/modify conflict, mergetool does not automatically resolve the specific case of choosing between deletion and retention. Therefore it is a plausible option but not the most efficient tool for this precise scenario.
Correct answer
Run git checkout --theirs <file> to take the version from the branch that modified the file.
Explanation
git checkout --theirs replaces the conflicted file with the version from the incoming branch, effectively keeping the file that was changed. This directly addresses a modify/delete conflict by allowing the developer to accept the modification instead of the deletion. Because it resolves the conflict with a single command, it is the best‑suited feature for the described situation.
Perform the merge with the -s ours strategy (git merge -s ours).
Explanation
The –s ours strategy tells Git to ignore all changes from the other branch and keep the current branch's contents entirely. While this would preserve the deletion, it discards any useful modifications, which is rarely desirable. Hence it is a common misconception that this strategy resolves delete/modify conflicts, but it is too blunt for the task.
Create a new commit that reverts the deletion using git revert.
Explanation
git revert creates a new commit that undoes the effect of a previous commit. It is intended for undoing already‑applied changes, not for resolving a merge conflict that is occurring right now. Using revert after the merge would add extra history and does not directly address the conflicted file during the merge process.
Rewrite the branch history with git rebase -i and then merge again.
Explanation
Interactive rebase can be used to edit, reorder, or squash commits, but it does not automatically solve a delete/modify conflict that arises during a merge. Moreover, rebasing a public branch may rewrite history that other collaborators rely on, making it a risky choice. Therefore it is an unsuitable tool for this immediate conflict resolution.
Reset the repository to the last commit with git reset --hard.
Explanation
git reset --hard discards all uncommitted changes and moves the HEAD pointer, effectively throwing away work. It does not provide a mechanism to resolve a specific merge conflict and would erase the developer's modifications on the feature branch. Consequently, this option is incorrect and could cause data loss if used in this context.
Overall explanation
The question tests knowledge of Git's conflict‑resolution mechanisms, specifically a modify/delete conflict that occurs when a file is deleted on one side and edited on the other. The most direct way to resolve such a conflict is to explicitly choose which version of the file to keep; git checkout --theirs (or --ours) does exactly that with a single command, making it the best‑suited feature. Many learners mistakenly think broader tools like mergetool, merge strategies, or history‑rewriting commands are appropriate, but these either require extra manual steps or alter unrelated history. Understanding that delete/modify conflicts can be resolved by selecting the desired side prevents unnecessary commits or data loss. In practice, developers should first assess whether the file should be retained or removed, then use checkout --theirs/--ours or a mergetool if a manual visual inspection is needed.
Domain
Conflict Resolution
Question 45
Skipped
A developer is trying to revert a commit that was pushed to the remote repository. The commit introduced a critical bug that needs to be fixed immediately. However, the commit is not the most recent commit in the branch. What should you do FIRST?
Correct answer
Run `git revert <commit SHA>` to create a new commit that undoes the changes, then push the revert to the remote.
Explanation
This is the correct first step. `git revert` generates a new commit that inverses the changes introduced by the specified commit without rewriting history, which is safe for shared branches. After the revert commit is created locally, pushing it immediately fixes the bug for everyone while preserving the commit graph.
Use `git reset --hard HEAD~1` to remove the bad commit and then force‑push the branch.
Explanation
This option is incorrect because `git reset --hard` rewrites commit history, deleting the bad commit and any later commits. Force‑pushing a rewritten branch can disrupt teammates who have based work on the original history, leading to merge conflicts and lost work. It should only be used on private branches, not on a shared remote branch.
Perform an interactive rebase to edit out the problematic commit and then push with `--force`.
Explanation
While interactive rebase can also remove the bad commit, it changes the existing commit IDs, which rewrites history. Like a forced reset, force‑pushing after a rebase can cause collaborators to experience diverging histories and require them to manually reconcile. This approach is risky for a public branch and is not the first recommended action.
Checkout a new temporary branch from the remote and cherry‑pick all good commits except the bad one.
Explanation
Creating a new branch and cherry‑picking avoids history rewriting, but it is an unnecessary extra step when a simple revert exists. It also introduces duplicate commits and can confuse the project’s linear history. This method is more complex and slower than using `git revert` directly.
Delete the remote branch and recreate it without the bad commit.
Explanation
Removing the remote branch entirely discards all history, which is drastic and can affect other developers who depend on that branch. Recreating it would require coordination and may lead to lost work or lost references in CI pipelines. This is not an appropriate first action for fixing a single buggy commit.
Open a pull request that uses Git Hub’s “Revert” button to create a revert commit.
Explanation
Git Hub’s UI can indeed create a revert commit, but the question asks for the first action a developer should take. The most direct, command‑line approach is to run `git revert` locally; using the web UI adds an extra step of creating a PR and waiting for review. While not wrong, it is not the immediate first step most exam contexts expect.
Overall explanation
The scenario tests knowledge of safe ways to undo a specific commit that has already been shared. The safest method is to use `git revert`, which creates a new commit that neutralizes the bad changes without altering existing history, making it suitable for collaborative environments. Alternatives such as `git reset --hard` or interactive rebase rewrite history and require force‑pushing, which can break teammates' work and are discouraged on shared branches. Cherry‑picking onto a new branch or deleting the remote branch are unnecessarily complex or disruptive solutions. Even though Git Hub offers a UI revert, the exam focuses on the fundamental Git command that should be executed first.
Domain
Reverting Commits
Question 46
Skipped
A team is experiencing issues with their Git repository due to a corrupted commit history. The commit history is not being updated correctly, causing issues with the repository's integrity. Which configuration achieves this?
Correct answer
Set `receive. deny Non Fast Forwards true` in the repository's server configuration.
Explanation
This option is correct. Enabling `receive. deny Non Fast Forwards` on the server rejects any push that would delete or rewrite history without a fast‑forward, protecting the commit log from accidental corruption. In practice, teams that enforce this setting prevent force‑pushes that could otherwise remove commits and break downstream clones.
Enable `core. autocrlf true` in the global Git configuration.
Explanation
This option is incorrect. `core. autocrlf` controls line‑ending conversion between Windows and Unix systems and has no effect on how commit history is stored or updated. Misunderstanding this setting can lead to unnecessary merge conflicts, but it will not fix a corrupted history problem.
Disable automatic garbage collection by setting `gc. auto 0`.
Explanation
This option is incorrect. Setting `gc. auto` to zero stops Git from automatically cleaning up unreachable objects, but it does not repair or prevent corruption of the commit graph. In fact, disabling GC can cause the repository to bloat, making recovery even harder if history is already broken.
Set `core. ignorecase false` to enforce case‑sensitive filenames.
Explanation
This option is incorrect. `core. ignorecase` only influences how Git treats filename case differences on case‑insensitive file systems; it does not impact the integrity or updating of commit history. A common misconception is that case‑sensitivity fixes merge problems, but it does not address corrupted commits.
Configure `fetch. prune true` to automatically prune obsolete remote‑tracking branches.
Explanation
This option is incorrect. `fetch. prune` removes stale references to remote branches during a fetch, which helps keep the local view tidy, but it does not prevent or fix commit history corruption. Relying on this setting to solve history integrity issues is a misunderstanding of its purpose.
Set `push. default simple` to use simple push behavior.
Explanation
This option is incorrect. `push. default simple` changes the default push semantics to match the current branch with its upstream, but it does not restrict non‑fast‑forward pushes or protect the commit history. Teams may configure this for convenience, yet it does not address corrupted history scenarios.
Overall explanation
The question tests knowledge of repository‑level safety settings that safeguard commit history integrity. The correct configuration, `receive. deny Non Fast Forwards true`, tells the server to reject any push that attempts to rewrite history without a fast‑forward, thereby preventing accidental deletion or alteration of commits. The other options target unrelated aspects of Git such as line‑ending conversion, automatic garbage collection, filename case handling, pruning of remote branches, and push default behavior; they are common misconceptions because they are frequently adjusted by developers but do not protect the commit graph. Understanding which settings affect history integrity is essential for maintaining a stable shared repository, especially in environments where multiple collaborators push changes. Best practice is to enforce non‑fast‑forward denial on central repositories and combine it with branch protection rules to further guard against history rewriting.
Domain
Repository Configuration
Question 47
Skipped
A developer is tasked with comparing the differences between two branches. The branches have multiple commits ahead of the common ancestor. What is the KEY difference between using git diff and git cherry-pick in this context?
git diff computes a patch between the two branch tips, and applying that patch will automatically create new commits on the target branch.
Explanation
This statement is incorrect. git diff only generates a textual representation of the changes; it does not automatically create commits. To turn a diff into a commit you would need to apply the patch manually and then run git commit, which is a separate step.
git cherry-pick displays a line‑by‑line comparison of the changes introduced by each commit without modifying any branches.
Explanation
This option is wrong. git cherry-pick does not merely display differences; it re‑applies the selected commit(s) onto the current HEAD, thereby altering history. Its purpose is to copy code changes, not to provide a read‑only diff view.
git diff shows the differences between the branches but does not change any history, while git cherry-pick copies the selected commits onto the current branch, preserving the original commit IDs.
Explanation
This answer is inaccurate. While it correctly notes that git diff is non‑destructive, it falsely claims that cherry‑pick preserves the original commit IDs. In reality cherry‑pick creates new commit objects with new SHA‑1 hashes, even though the content is the same.
Correct answer
git diff only reports differences; git cherry-pick actually replays the selected commits onto the current branch, producing new commits that replicate the original changes.
Explanation
This statement is correct. git diff is a read‑only operation that shows what changed between two points, whereas git cherry‑pick takes specific commits from another branch and applies them as new commits on the current branch. The new commits get their own identifiers, which is why cherry‑pick is used for selective integration of work.
git cherry-pick merges the entire source branch into the destination, preserving the original commit IDs.
Explanation
This option is false. cherry‑pick works on individual commits, not on the whole branch, and it does not preserve the original IDs. To merge an entire branch you would use git merge or git rebase, not cherry‑pick.
git diff can be used to permanently rewrite the target branch to match the source branch.
Explanation
This claim is incorrect. git diff only shows differences; it never alters any branch. To rewrite a branch you would use commands like git reset, git revert, or git merge, but not git diff.
Overall explanation
The question tests understanding of the functional distinction between a comparison tool (git diff) and a commit‑replaying tool (git cherry-pick). git diff provides a read‑only view of changes between two commits or branches and never modifies the repository, making it suitable for code review or generating patches. git cherry-pick, on the other hand, actively applies chosen commits onto the current HEAD, creating new commit objects with new SHA‑1 hashes, which is useful for selective back‑porting or feature integration. Common misconceptions include believing that diff can create commits automatically or that cherry-pick merely shows changes without affecting history; both are inaccurate. Best practice is to use git diff when you need to inspect or generate patches, and use git cherry-pick when you want to incorporate specific changes without merging the whole branch.
Domain
Branch Management
Question 48
Skipped
As a Dev Ops engineer, you are tasked with debugging a production incident where two developers have conflicting changes to the same file. The team is using Git for version control. Which TWO options are correct?
Correct selection
Perform a git merge of the developers' branches, resolve the conflict locally, and commit the merged result.
Explanation
This option is correct. Merging the two branches brings the divergent histories together, and Git will mark the file as conflicted. The engineer can edit the file to reconcile both sets of changes, then add and commit the resolution, producing a stable state for the next deployment.
Use git rebase to replay one developer's changes onto the other's branch, automatically discarding any conflicts.
Explanation
This option is incorrect. A rebase will stop at each conflict just like a merge; it does not automatically discard conflicting changes. Moreover, rebasing shared branches in production can rewrite public history, risking further instability.
Delete the conflicting file from the repository, commit the deletion, and let the deployment script recreate it.
Explanation
This option is incorrect. Deleting the file removes both developers' work, which may cause runtime errors or loss of critical functionality. Production issues should be resolved by reconciling the changes, not by removing the artifact entirely.
Correct selection
Create a new branch from the last stable commit, cherry-pick the non‑conflicting changes from each developer, test, and then merge the branch back.
Explanation
This option is correct. Starting from a known good baseline isolates the problem, and cherry‑picking lets the engineer select only the desirable edits while avoiding the conflict. After thorough testing, merging the clean branch restores the intended behavior without contaminating history with broken code.
Force‑push (git push -f) the version from the developer whose code you prefer, overwriting the other developer's commits.
Explanation
This option is incorrect. Force‑pushing rewrites the shared repository history, discarding the other developer's contributions and potentially breaking teammates' local clones. It is considered an anti‑pattern in collaborative environments, especially during incident response.
Resolve the conflict by always accepting “theirs” (git checkout --theirs) without reviewing the changes.
Explanation
This option is incorrect. Blindly accepting one side ignores the possibility that the other side contains necessary fixes or features, leading to regressions. Proper conflict resolution requires a manual review to ensure that the final file combines the correct logic from both developers.
Overall explanation
The question tests a candidate's ability to handle Git merge conflicts in a production debugging scenario. The correct strategies are to merge the branches and resolve the conflict manually (Option 1) or to create a clean branch from a known good commit and cherry‑pick needed changes (Option 4), both of which preserve history and allow safe verification before deployment. Common misconceptions include assuming rebase automatically drops conflicts (Option 2), believing that deleting the file resolves the issue (Option 3), or using force‑push to override teammates (Option 5), each of which can introduce new problems or data loss. Accepting one side of a conflict without inspection (Option 6) also risks missing critical changes. Best practice is to resolve conflicts deliberately, test the merged result, and avoid history‑rewriting commands on shared branches.
Domain
Merge Conflicts
Question 49
Skipped
You are a developer working on a new feature branch, and you want to revert a specific commit that was made by another developer. What is the MOST appropriate action?
Run git reset --hard <commit> and force‑push the branch to origin.
Explanation
This option is incorrect because git reset --hard rewrites the branch history by moving the branch pointer to an older commit. Force‑pushing a rewritten history can disrupt teammates who have already based work on the existing commits. It also discards any later commits, which is far more destructive than simply undoing a single change.
Use git checkout <commit> to detach HEAD, make changes, and push the detached state.
Explanation
This is incorrect; checking out a specific commit creates a detached HEAD state that is not attached to any branch. Pushing from a detached HEAD is not supported and would create a new anonymous branch, leaving the original feature branch unchanged. Therefore it does not revert the unwanted commit on the intended branch.
Correct answer
Run git revert <commit SHA> on the feature branch and commit the resulting revert.
Explanation
This is the correct approach. git revert creates a new commit that inverses the changes introduced by the specified commit, preserving the existing commit history. It is safe for shared branches because it does not rewrite history, and collaborators can pull the revert without conflict.
Amend the original commit with git commit --amend to remove the unwanted changes.
Explanation
Amending only works on the most recent commit and only if it has not been pushed to a shared repository. Since the commit was made by another developer and is likely not the tip of the branch, git commit --amend cannot modify it. Attempting this would either fail or create a new history that conflicts with collaborators.
Rebase interactively (git rebase -i) and drop the specific commit from the branch history.
Explanation
While interactive rebase can remove a commit, it rewrites the branch history, which is dangerous on a branch that others may have pulled. Dropping the commit would require force‑pushing and could cause merge conflicts for anyone who has based work on the original history. Therefore it is not the most appropriate method for a simple revert.
Delete the feature branch, recreate it from the main branch, and cherry‑pick the desired commits.
Explanation
Deleting and recreating the branch is an extreme measure that discards all work on the branch, not just the unwanted commit. Cherry‑picking each needed commit is time‑consuming and error‑prone, and the original branch context is lost. This approach is unnecessary when a single revert commit can achieve the goal.
Overall explanation
The question tests knowledge of how to safely undo a specific change in a collaborative Git environment. The correct action is to use git revert, which adds a new commit that undoes the effects of the targeted commit while preserving the linear history, making it safe for shared branches. Common misconceptions include thinking that resetting or force‑pushing is acceptable, even though those actions rewrite history and can disrupt teammates. Amend and interactive rebase are also often suggested, but they only work for recent or unshared commits and otherwise require history rewriting. Best practice is to choose the least disruptive method—git revert—for reverting public commits, and to avoid any operation that alters existing published history.
Domain
Branch Management
Question 50
Skipped
As a tech lead, you are reviewing a code change that was made by a junior developer, and you notice that the commit history is not linear due to a rebase. What is the PRIMARY reason for this behaviour?
Rebase creates merge commits to preserve the original history.
Explanation
This statement is incorrect. A rebase does not generate merge commits; instead it rewrites commits onto a new base. Merge commits are produced by the git merge command, not by git rebase, so this cannot be the primary cause of a non‑linear view.
Rebase updates only the remote tracking branch while leaving the local branch unchanged.
Explanation
This option is also incorrect. Rebase operates on the current branch in the local repository and rewrites the local commit history; it does not directly modify the remote tracking branch until you push. Therefore, the non‑linear history is not caused by a remote‑only update.
Correct answer
Rebase rewrites commit hashes, generating new commits that replace the originals and change parent relationships.
Explanation
This statement is correct. During a rebase Git creates brand‑new commit objects with new SHA‑1 IDs, applying the same changes onto a different base. Because the parents of these new commits differ from the original ones, the overall graph appears non‑linear when viewed alongside other branches.
Rebase adds tags to each commit, causing Git to display them out of order.
Explanation
This option is incorrect. Tags are independent references and are not automatically added to every commit during a rebase. The ordering of commits in the log is determined by parent links, not by tags, so tags do not create non‑linear history.
Rebase enforces a fast‑forward‑only policy, which breaks linearity when branches diverge.
Explanation
This is incorrect. Fast‑forward is a merge strategy that simply moves a branch pointer forward; rebase does not enforce fast‑forward behavior. In fact, rebase deliberately rewrites history, and the concept of fast‑forward does not explain why the history looks non‑linear.
Rebase disables the reflog, leading to lost commit references and a jagged timeline.
Explanation
This statement is incorrect. The reflog remains active after a rebase, recording the previous positions of HEAD and branch references. Disabling the reflog would not cause the visual non‑linearity observed in the commit graph.
Overall explanation
The question tests understanding of what a rebase actually does to a repository's commit graph. A rebase works by copying each commit onto a new base, creating entirely new commit objects with new SHA‑1 identifiers; this rewrite changes the parent pointers and makes the history appear non‑linear when compared to the original branch. Many learners mistakenly think rebase creates merge commits or only affects remote branches, but those are behaviors of merge or push operations, not rebase. Recognizing that rebase rewrites history is crucial because it informs best practices: avoid rebasing branches that have already been shared publicly to prevent confusing collaborators with divergent histories. Understanding the distinction also helps developers decide when to use rebase for a clean linear history versus merge for preserving the true chronological development of a feature.
Domain
Rebasing
Question 51
Skipped
A developer on your team has made a series of commits to a feature branch, but now they want to squash all the commits into a single commit before merging it into the main branch. Which option should you choose?
Merge the pull request using the default "Create a merge commit" option.
Explanation
This option is incorrect because the default merge creates a separate merge commit that preserves the original series of commits on the feature branch. While it retains full history, it does not combine the multiple commits into a single one, which is what the developer explicitly wants. In real scenarios this can lead to a cluttered main branch history with many small or work‑in‑progress commits.
Rebase the feature branch onto main and then merge with a fast‑forward.
Explanation
Rebasing rewrites the commit history but does not automatically squash multiple commits into one; it merely re‑applies each commit on top of the target branch. After a rebase you could still have many separate commits, defeating the goal of a single combined commit. Using this approach without an explicit squash can produce a linear history that still contains the granular commit noise.
Correct answer
Select the "Squash and merge" option when completing the pull request.
Explanation
This is the correct choice. The "Squash and merge" button on Git Hub consolidates all commits from the pull request into a single new commit on the target branch, exactly matching the developer's requirement. It results in a clean main branch history while still preserving the feature development in the PR for review and audit.
Run `git commit --amend` on each individual commit to combine them.
Explanation
Running `git commit --amend` only modifies the most recent commit; it cannot merge multiple earlier commits into one. Attempting to amend each commit sequentially would either lose earlier work or create confusing history. In practice this method would not achieve the desired single‑commit result and could corrupt the branch if not used carefully.
Use `git merge --squash` locally and then push the result.
Explanation
While `git merge --squash` does create a single combined commit, it must be performed locally and requires an extra push step, which is more complex than the built‑in Git Hub UI option. It also does not automatically update the pull‑request state, so collaborators may be confused about the PR's status. This method works but is not the simplest or most transparent choice for a team using Git Hub pull requests.
Cherry‑pick each commit onto a new branch and delete the original branch.
Explanation
Cherry‑picking copies commits individually; it does not combine them into one commit unless you later squash them manually. This process is time‑consuming and error‑prone, especially for many commits, and leaves duplicate histories that can confuse reviewers. Therefore it is not the recommended way to achieve a single‑commit merge.
Overall explanation
The question tests knowledge of Git Hub's merge strategies, specifically how to produce a single commit from a series of feature‑branch commits before integrating into the main branch. The correct approach is to use the "Squash and merge" option, which automatically collapses all PR commits into one new commit on the target branch, keeping the main line clean and readable. Common misconceptions include believing that a regular merge, a simple rebase, or manual amend commands will achieve the same result, but each of those either preserves the original commits or does not correctly combine them. While `git merge --squash` can technically do the job, the Git Hub UI provides a more straightforward, team‑friendly workflow. Best practice is to choose the squash option when the feature branch contains many small or experimental commits that do not need individual visibility in the main history.
Domain
Merge Strategies
Question 52
Skipped
You are a data engineer, and you are working on a project that requires you to cherry-pick a specific commit from a feature branch into the main branch. What is the KEY difference between using git cherry-pick and git merge in this context?
Correct answer
git cherry-pick copies the selected commit’s changes onto the target branch as a new commit, while git merge brings in all commits from the source branch, preserving the full history.
Explanation
This statement is correct. Cherry‑pick isolates a single commit, applies its changes to the current branch, and creates a new commit with a new hash. Merge, by contrast, integrates the entire branch, preserving every commit and their original hashes, which results in a merge commit that records the full history. In practice, you would use cherry‑pick when you only need a bug‑fix from a feature branch without pulling in unrelated work.
git cherry-pick automatically resolves any merge conflicts, whereas git merge always requires manual conflict resolution.
Explanation
This statement is incorrect. Both cherry‑pick and merge can encounter conflicts, and Git will stop and ask the user to resolve them manually in either case. Automatic resolution does not happen; the developer must edit the conflicted files, stage them, and continue the operation. Assuming cherry‑pick never needs conflict handling can lead to broken builds when a selected commit touches overlapping code.
git cherry-pick rewrites the original commit’s hash, creating a duplicate commit, while git merge keeps the original commit hashes intact.
Explanation
This statement is partially true but misleading as the key difference. Cherry‑pick does create a new commit with a new hash because it re‑applies changes, but merge also creates a new merge commit (with its own hash) while retaining the original commits unchanged. The essential distinction is not about hash rewriting but about the scope of changes being brought in; therefore this option does not capture the primary difference being asked.
git cherry-pick updates the remote repository immediately, but git merge only changes the local branch until you push.
Explanation
This statement is incorrect. Neither cherry‑pick nor merge push changes to a remote automatically; both operate only on the local repository until you explicitly run git push. Believing that cherry‑pick updates the remote can cause confusion and unintended divergence between local and remote branches.
git cherry-pick can only be used for fast‑forward merges, while git merge can combine divergent histories.
Explanation
This statement is incorrect. Cherry‑pick does not perform a merge at all; it applies a single commit regardless of whether the branches can fast‑forward. Merge is the operation that deals with divergent histories and can create a merge commit when a fast‑forward is not possible. Confusing cherry‑pick with fast‑forward requirements may lead to misuse of the command.
git cherry-pick preserves the original author information, whereas git merge attributes the merged changes to the person performing the merge.
Explanation
This statement is misleading. Cherry‑pick indeed retains the original author by default, but merge also preserves the authors of the individual commits being merged; only the merge commit itself records the committer who performed the merge. Stating that merge attributes all changes to the merger ignores the fact that each underlying commit keeps its author metadata, so this option is not the correct key difference.
Overall explanation
The question tests understanding of how cherry‑pick and merge differ in scope and history handling. The correct answer highlights that cherry‑pick brings over only a single, selected commit as a new change, while merge incorporates the whole branch, preserving the complete series of commits. Common misconceptions include believing cherry‑pick auto‑resolves conflicts, updates remotes, or only works with fast‑forward, none of which are true. Learners should remember that cherry‑pick is useful for isolated fixes, whereas merge is the appropriate tool for integrating full feature development. Best practice is to use cherry‑pick sparingly to avoid duplicate histories and to prefer merge (or rebase) for regular branch integration.
Domain
Branch Integration
Question 53
Skipped
As a QA engineer, you are testing a new feature, and you notice that the code changes are not reflected in the production environment. You suspect that the issue is due to a Git conflict that was not resolved properly. What should you do FIRST?
Redeploy the application immediately to force the new code into production.
Explanation
This is incorrect because redeploying without first confirming the state of the repository can push the same unresolved conflict to production, causing the same issue to persist. Deployments should be based on a clean, merged commit history. Skipping the verification step may also overwrite other developers' work and lead to downtime.
Delete the remote feature branch and recreate it from the main branch.
Explanation
Deleting and recreating a branch does not address the underlying conflict that exists in the merge commit. The conflict is a symptom of an incomplete merge, not a problem with the branch itself. This action could also cause loss of work that was already committed on the feature branch.
Correct answer
Run `git status` to identify any unmerged files, resolve the conflict markers, and commit the resolution.
Explanation
This is the correct first step. `git status` will show files that are in an unmerged state, indicating that the conflict has not been fully resolved. By examining and fixing the conflict markers, you ensure a clean merge, after which the changes can be pushed and subsequently deployed to production.
Edit the files directly on the production server to apply the missing changes.
Explanation
Directly modifying production files bypasses the version‑control workflow and creates a drift between the repository and the deployed code. This practice makes future troubleshooting difficult and can introduce new bugs. Proper resolution should happen in the source repository before any deployment.
Merge the feature branch into the main branch without reviewing the conflict markers.
Explanation
Merging without reviewing conflict markers can result in broken code being introduced into the main line, which is exactly the situation you are observing. Ignoring the markers defeats the purpose of a conflict resolution and can cause runtime errors in production. A careful review is essential to ensure the code behaves as expected.
Contact the development team and ask them to push a new commit with the missing changes.
Explanation
While collaboration is important, the QA engineer should first verify the local repository state before involving others. Asking the team to push without checking the conflict may lead to redundant work and delays. Confirming the conflict status yourself provides concrete information that can guide the team's next steps.
Overall explanation
The scenario tests knowledge of proper Git conflict resolution workflow. When a conflict is suspected, the very first action is to inspect the repository using `git status`, which clearly lists unmerged files and the current state of the index. This allows the engineer to locate conflict markers, resolve them locally, and create a clean commit before pushing or triggering a deployment pipeline. Common misconceptions include assuming that redeploying or editing production directly will fix the issue, but these bypass version control and can exacerbate problems. Best practice dictates verifying and resolving conflicts in the source code repository first, then coordinating with the team for a controlled merge and deployment.
Domain
Merge Conflict Resolution
Question 54
Skipped
As a product engineer, you are working on a project that requires you to manage multiple feature branches with conflicting changes. Which THREE approaches should you take to resolve the conflicts?
Correct selection
Perform an interactive rebase of each feature branch onto the main branch, resolving conflicts as they arise.
Explanation
This option is correct. An interactive rebase rewrites the feature branch history so that its commits are applied on top of the current main branch, giving you the opportunity to resolve conflicts commit‑by‑commit. By handling each conflict during the rebase, you maintain a clean linear history, which simplifies future merges and makes the Git log easier to understand.
Merge the feature branches directly into the main branch and let Git resolve the conflicts automatically.
Explanation
This option is incorrect. Merging without first inspecting the changes can produce large, ambiguous merge commits where Git may choose one side arbitrarily, potentially discarding important logic. In real projects this often leads to subtle bugs that are hard to trace back to the original conflicting change.
Correct selection
Create a dedicated integration branch, merge all feature branches into it, resolve the conflicts there, and then merge the integration branch back to main.
Explanation
This option is correct. An integration branch acts as a sandbox where you can combine multiple feature branches, address all conflicts in one place, and run integration tests before affecting the main line. Once the integration branch is clean, merging it back into main introduces a single, well‑tested commit that represents the resolved state.
Correct selection
Use `git cherry-pick` to selectively apply commits from one branch to another, handling conflicts individually.
Explanation
This option is correct. Cherry‑picking lets you pick specific changes that you know are safe while leaving problematic commits out, giving fine‑grained control over conflict resolution. After resolving each cherry‑picked conflict, you can commit the changes, ensuring that only the desired functionality makes its way into the target branch.
Delete the conflicting branches and recreate them from the main branch to avoid the conflicts entirely.
Explanation
This option is incorrect. Deleting and recreating branches discards the work that caused the conflict, which may include valuable features or bug fixes. Rather than solving the conflict, it forces you to re‑implement the changes, increasing technical debt and risking loss of context.
Force‑push the resolved state to the remote repository without notifying teammates, bypassing any review process.
Explanation
This option is incorrect. Force‑pushing overwrites shared history, which can disrupt collaborators' work and lead to lost commits or merge errors on their local clones. Proper conflict resolution should be communicated and, ideally, reviewed through pull requests to maintain team alignment and code quality.
Overall explanation
The question tests a candidate's understanding of reliable strategies for reconciling divergent feature branches in a collaborative environment. Interactive rebasing, using an integration branch, and cherry‑picking are all proven techniques that give developers explicit control over conflicts while preserving useful history and enabling thorough testing. Merging without inspection, deleting branches, or force‑pushing bypass essential review and integration steps, often resulting in hidden bugs, lost work, or coordination breakdowns. In practice, teams should choose the method that best fits their workflow—rebasing for linear history, integration branches for large feature sets, and cherry‑picking for selective changes—while always communicating resolutions to teammates. Following these best practices ensures a stable codebase and smooth collaboration across multiple feature streams.
Domain
Branch Management
Question 55
Skipped
You are a developer, and you want to reset your local branch to match the remote branch. What is the MOST likely root cause of the issue if you are getting a 'non-fast-forward' error?
Your local branch is missing the remote's latest commits, so you need to pull first.
Explanation
This statement is incorrect. A non‑fast‑forward error occurs when the local branch has commits that are not on the remote, not when it is simply missing remote commits. If you were only missing remote changes, a normal fast‑forward merge or pull would succeed without error.
You attempted to push after using git reset --hard to a previous commit, discarding remote history.
Explanation
While resetting to an older commit can lead to a non‑fast‑forward situation, the root cause of the error is still the presence of divergent commits. The reset itself is not the cause; it is the fact that the local branch now lacks commits that exist on the remote. The error alerts you that pushing would overwrite remote history.
Your remote repository is configured as a mirror, which rejects non‑fast‑forward updates.
Explanation
This is a misunderstanding. Mirror repositories do reject non‑fast‑forward pushes, but they are a special server‑side configuration and not the typical reason developers see this error in day‑to‑day work. Most developers encounter the error because of divergent commit histories, not because the remote is a mirror.
Correct answer
Your local branch contains commits that are not present on the remote, causing the histories to diverge.
Explanation
This is the correct answer. A non‑fast‑forward error is raised when the local branch has commits that the remote does not, meaning Git cannot simply move the remote tip forward. In practice, you must either pull and merge/rebase the remote changes or force‑push if you truly intend to overwrite the remote history.
Git is preventing you because the branch you are working on is protected by branch protection rules.
Explanation
Branch protection rules can block force pushes, but they do not generate a non‑fast‑forward error; instead, Git Hub returns a permission‑denied message. The error described is specifically about history divergence, not about permission settings. Therefore this option is not the root cause of the non‑fast‑forward situation.
The remote's HEAD points to a different branch, so Git cannot fast‑forward.
Explanation
This is inaccurate. The remote's HEAD reference simply indicates the default branch and does not affect push operations on a specific branch. A non‑fast‑forward error is unrelated to which branch HEAD points to; it strictly concerns divergent commit histories on the same branch.
Overall explanation
The question tests understanding of why Git reports a non‑fast‑forward error when attempting to synchronize a local branch with its remote counterpart. The core concept is that Git can only fast‑forward a branch when the remote tip is a direct descendant of the local tip; otherwise, the histories have diverged. The correct answer points out that the local branch has unique commits not present on the remote, which is the most common scenario causing this error. Common misconceptions include believing the error stems from missing remote commits, protected branches, or server configurations, but those either produce different messages or are less frequent. Best practice is to examine the commit graph with commands like git log --oneline --graph and then either pull/rebase to integrate remote changes or, if appropriate, use a forced push with caution.
Domain
Branch Management
Question 56
Skipped
As an architect, you are designing a new system that requires you to use Git for version control. Which configuration achieves this: ensuring that all commits are signed with a GPG key to verify the authenticity of the commits?
Correct answer
git config --global commit. gpgsign true
Explanation
This option is correct. Setting `commit. gpgsign` to true in the global Git configuration tells Git to automatically sign every commit using the GPG key associated with the user. In practice, after configuring a valid `user. signingkey`, every developer’s commit will carry a cryptographic signature that can be verified on servers or during code reviews.
git config --global user. signingkey <key-id>
Explanation
While this command registers the GPG key that Git should use, it does not enable automatic signing of commits. Without also setting `commit. gpgsign` to true, developers must add the `-S` flag manually for each commit, which defeats the requirement for all commits to be signed automatically. Many newcomers mistakenly think specifying the key alone enforces signing, leading to unsigned commits in production.
git config --global core. autocrlf true
Explanation
This configuration controls line‑ending conversion on Windows systems; it has nothing to do with commit signing. Enabling `core. autocrlf` helps avoid whitespace diffs but does not affect GPG or authenticity verification. Users sometimes confuse general Git hygiene settings with security‑related ones, which can lead to misplaced confidence in repository integrity.
git config --global pull. rebase true
Explanation
Setting `pull. rebase` changes the default behavior of `git pull` to rebase instead of merge. It improves linear history but does not influence whether commits are signed. Treating rebase configuration as a security measure is a common misunderstanding among developers focused on workflow efficiency.
git config --global commit. template ~/. gitmessage. txt
Explanation
A commit template provides a pre‑filled commit message body; it does not impact GPG signing at all. While useful for enforcing commit message standards, it does not add any cryptographic verification to the commit objects. Confusing message templating with authenticity control can cause teams to overlook the need for proper signing configuration.
git config --global gpg. program gpg
Explanation
Specifying the GPG program tells Git which binary to invoke when signing, but it does not turn signing on. If `commit. gpgsign` remains false, Git will never call the program, leaving commits unsigned. This option is often added alongside the correct setting, but alone it does not satisfy the requirement to sign all commits.
Overall explanation
The question tests knowledge of how to enforce automatic GPG signing of every Git commit. The essential setting is `git config --global commit. gpgsign true`, which instructs Git to sign each commit using the user’s configured GPG key. Other related settings, such as `user. signingkey`, `gpg. program`, or message templates, are complementary but insufficient on their own to guarantee signing. Common misconceptions stem from conflating key registration or auxiliary options with the actual activation flag, leading to partially configured environments where unsigned commits still appear. Best practice is to enable `commit. gpgsign` globally and ensure the correct `user. signingkey` is set, optionally verifying signatures in CI pipelines for added security.
Domain
Commit Signing
Question 57
Skipped
You are a developer, and you want to use git reflog to recover a deleted branch. What is the CORRECT statement about the git reflog command?
git reflog only records the history of the HEAD pointer, not individual branch references.
Explanation
This statement is incorrect. While HEAD has its own reflog, git reflog also records updates for each local branch, tag, and other references. Assuming it only tracks HEAD leads users to miss valuable information stored in the branch-specific logs, causing failed recovery attempts.
Deleted branch reflog entries are kept indefinitely, so you can always recover a branch even after months.
Explanation
This is false. Reflog entries are subject to expiration policies (default 90 days for reachable and 30 days for unreachable entries) and can be pruned by garbage collection. Believing they are permanent may give a false sense of security and result in lost work when the entries disappear.
Correct answer
git reflog can be used to restore a deleted branch by locating its last commit SHA and creating a new branch at that SHA.
Explanation
This statement is correct. When a branch is deleted, its reflog remains for the configured retention period, allowing you to view the sequence of commits it pointed to. By running `git reflog show <branch>` (or looking at . git/logs/refs/heads/<branch>) you can copy the appropriate SHA and run `git checkout -b <branch> <sha>` to resurrect the branch exactly where it was deleted.
Running `git reflog delete <branch>` permanently removes the branch’s reflog entries, preventing any recovery.
Explanation
This is inaccurate. There is no `git reflog delete` subcommand; reflog entries are usually cleaned up with `git reflog expire` or by garbage collection. Suggesting such a command misleads users into thinking they have a simple way to manually erase reflog data, which is not the case.
git reflog entries are automatically pushed to remote repositories, so you can recover a deleted branch on another clone using the remote reflog.
Explanation
This claim is wrong. Reflog data is stored only in the local . git directory and is never transferred by `git push` or `git fetch`. Trying to rely on a remote's reflog for recovery will fail, and the correct approach is to perform recovery locally and then push the restored branch.
The default reflog expiration is 7 days for all entries, after which they are permanently removed.
Explanation
This is a misconception. Git's default settings keep reachable reflog entries for 90 days and unreachable ones for 30 days, not just 7 days. Misunderstanding the expiration period can cause users to think they have more or less time to recover a branch than they actually do.
Overall explanation
The question tests the learner's understanding of how git reflog records reference updates and its role in branch recovery. The correct answer explains that reflog stores the sequence of commits a branch pointed to, allowing a user to locate the last SHA before deletion and recreate the branch with `git checkout -b`. Common wrong answers confuse the scope of reflog (thinking it only tracks HEAD), its retention policy (believing it is indefinite or only 7 days), or its distribution model (assuming it is pushed to remotes). Additionally, some options mention non‑existent commands, which can mislead users about how reflog cleanup works. Best practice is to check the reflog immediately after a deletion, note the needed SHA, recreate the branch, and optionally push it to a remote to avoid future loss.
Domain
Reflog
Question 58
Skipped
As a Dev Ops engineer, you're tasked with resolving a Git conflict that occurred during a merge. The conflict is in a file with a complex merge history, and you need to preserve the changes from both branches. Which option should you choose?
Run 'git merge --ours' to keep only the current branch's changes.
Explanation
This option is incorrect. The '--ours' strategy tells Git to automatically favor the current branch's version for all conflicted files, discarding the incoming changes. Using it would lose the modifications made on the other branch, which violates the requirement to preserve both sets of changes.
Run 'git merge --theirs' to keep only the incoming branch's changes.
Explanation
This option is also incorrect. The '--theirs' flag forces Git to accept the other branch's version for every conflict, effectively overwriting the current branch's edits. Selecting this would result in the loss of work that existed on the current branch, contrary to the goal of preserving both contributions.
Correct answer
Manually edit the conflicted file to combine both sets of changes, remove the conflict markers, then stage the file with 'git add' and complete the merge.
Explanation
This option is correct. Manually editing the file allows the engineer to thoughtfully integrate logic from both branches, ensuring no functionality is lost. After editing, running 'git add' marks the conflict as resolved, and the merge can be finished, preserving the intent of both development streams.
Abort the merge using 'git merge --abort' and then cherry-pick the desired commits.
Explanation
This option is incorrect for the given scenario. While aborting removes the conflicted state, it also discards the attempt to merge, requiring additional steps to reapply changes via cherry-pick, which can be error‑prone and time‑consuming. Moreover, it does not directly address the need to keep both sets of modifications together in the same file.
Use 'git checkout --theirs <file>' to automatically accept the incoming branch's version.
Explanation
This option is incorrect. 'git checkout --theirs' resolves the conflict for that specific file by taking only the incoming branch's content, discarding the current branch's edits. It therefore fails to satisfy the requirement to preserve changes from both sides.
Resolve the conflict by resetting the file to the common ancestor with 'git checkout <branch> -- <file>'.
Explanation
This option is incorrect. Resetting to the common ancestor removes the changes from both branches, effectively reverting the file to an older state and losing recent work. It does not combine the divergent modifications and would likely introduce regression bugs.
Overall explanation
The question tests understanding of proper Git conflict resolution when both branches contain valuable changes. The correct approach is to manually edit the conflicted file, merge the relevant code sections, remove the conflict markers, and then stage the file to signal resolution. Common misconceptions include using '--ours' or '--theirs' strategies, which automatically discard one side's changes and are only appropriate when one version is definitively preferred. Aborting the merge or resetting to the ancestor also fails to combine the changes and can lead to lost work or regression. Best practice is to review each conflict carefully, integrate the logic from both sides, and verify the resulting code works as intended before completing the merge.
Domain
Merge Conflicts
Question 59
Skipped
You're a developer who has made changes to a feature branch, but you've realized that you need to revert one of the commits. You've already pushed the changes to the remote repository. Which TWO options are correct?
Correct selection
Run `git revert <commit-hash>` and then push the new revert commit to the remote.
Explanation
This option is correct. `git revert` creates a new commit that undoes the changes introduced by the specified commit without altering existing history. Because it adds a commit, the push proceeds normally and collaborators' histories remain intact, making it the safest choice for public branches.
Correct selection
Use `git reset --hard <commit-hash>` to move the branch pointer back and then force‑push (`git push --force`) to overwrite the remote history.
Explanation
This option is also correct, though it rewrites history. `git reset --hard` discards commits after the chosen one, and a forced push replaces the remote branch with the rewritten local branch. It should only be used when you have agreement from the team and the branch is not shared with unmerged work, because other developers will have to reconcile the rewritten history.
Execute `git commit --amend` to modify the unwanted commit and then push.
Explanation
This option is incorrect. `git commit --amend` only changes the most recent commit, and after a push it still requires a forced push to replace the remote commit. It cannot be used to amend an older commit without an interactive rebase, and using it on a shared branch can cause history divergence.
Checkout the unwanted commit into a new branch and delete the original branch on the remote.
Explanation
This option is incorrect. Checking out a previous commit creates a detached HEAD or a new branch, but it does not modify the existing remote branch. Deleting the original remote branch would also delete any other commits that were valid, potentially causing loss of work for the team.
Use `git rebase -i` to drop the unwanted commit, then push normally.
Explanation
This option is incorrect. An interactive rebase that removes a commit rewrites the branch's history, so a normal `git push` will be rejected by the remote because it is non‑fast‑forward. To apply the rebased branch you would need to force‑push, which the answer does not mention, making the statement incomplete and misleading.
Run `git reset --soft <commit-hash>` and then create a new commit that omits the changes.
Explanation
This option is incorrect. A soft reset leaves the changes from the discarded commits staged, requiring additional manual editing and a new commit. Moreover, the branch history has still been rewritten, so you would need to force‑push to update the remote. It is more complex and error‑prone than the recommended revert or hard‑reset approaches.
Overall explanation
The question tests understanding of how to undo a commit that has already been shared on a remote branch. The safest, non‑destructive method is `git revert`, which adds a new commit that neutralizes the unwanted changes while preserving the existing commit history, so a regular push suffices. When a team agrees to rewrite history, `git reset --hard` followed by a forced push can also be used, but it overwrites the remote and requires careful coordination to avoid disrupting collaborators. Common misconceptions include thinking `git commit --amend` works for any past commit, believing a regular push will succeed after a rebase without force, or assuming checking out an old commit automatically fixes the remote branch. Best practice is to prefer `git revert` for public branches and reserve history‑rewriting techniques for private or tightly controlled branches, always communicating with teammates before forcing changes.
Domain
Branch Management
Question 60
Skipped
A data engineer is experiencing issues with a Git repository that has been corrupted due to a disk failure. The engineer needs to recover the repository, but the last backup is several days old. What is the PRIMARY reason for this behaviour?
Git automatically creates local snapshots of the entire repository that can be regenerated after a disk failure.
Explanation
This statement is incorrect. Git does not generate automatic snapshots that can be restored without an explicit backup or remote copy. When the . git directory is corrupted, there is no hidden recovery mechanism, so any data not saved elsewhere is lost.
Git’s built‑in reflog automatically purges entries older than a few days, leaving no record of recent changes.
Explanation
This is a misconception. The reflog records reference updates for a default of 90 days and is stored inside the same . git directory that has been corrupted. Even if it were intact, the reflog does not replace missing objects or commits, so it cannot restore a damaged repository.
Git LFS stores large files on an external server, and those files were not backed up, causing the repository to be unrecoverable.
Explanation
While Git LFS does keep large file pointers in the repository, the actual objects are fetched from a remote LFS server when needed. The corruption described affects the core Git object database, not the LFS storage, so missing LFS files are not the primary cause of the failure.
Correct answer
The repository’s most recent commits were never pushed to a remote or included in a recent backup, so they are lost when the local . git directory is corrupted.
Explanation
This is the correct reason. Git relies on the local . git directory for all history, and without a recent push or backup, any commits made after the last backup are only on the damaged disk. Consequently, the engineer cannot recover those recent changes because no other copy exists.
Git uses a central server model that requires a dedicated backup service; without it, local corruption cannot be fixed.
Explanation
Git is a distributed version control system, not a centralised one. Individual clones contain full history, and recovery can be performed from any other clone or remote, provided those copies are up‑to‑date. The lack of a central backup service alone does not explain the loss of recent work.
The repository’s packfiles were encrypted, and without the encryption key the repository cannot be restored.
Explanation
By default, Git does not encrypt packfiles; they are plain binary objects. Even if encryption were used, the primary issue here is the absence of recent data, not the inability to decrypt existing objects. Therefore this option does not address the root cause of the behaviour.
Overall explanation
The question tests understanding of Git’s data durability model and the importance of regular pushes or backups. Git stores all commits, trees, and blobs locally, and if the . git directory is corrupted, recovery is only possible from another clone or a recent backup that contains the missing objects. Because the engineer’s last backup is several days old, any commits made after that point exist only on the failed disk, making them unrecoverable. Common misconceptions include believing Git auto‑generates recoverable snapshots, that reflog cleanup eliminates data, or that Git LFS or encryption are responsible for core repository loss. Best practice is to push changes to a remote repository frequently and to schedule automated backups, ensuring that recent work is always recoverable from an independent copy.
Domain
Git & Git Hub
Question 61
Skipped
As a QA engineer, you're tasked with testing a new feature that has been developed in a separate branch. You need to switch to the new branch, but you don't want to lose your current changes. What should you do FIRST?
Commit the changes to the current branch before switching.
Explanation
This option is not the best first step. While committing preserves your work, it creates a permanent history entry for potentially incomplete or experimental changes, which may not be desired. In a real QA workflow, you might want to keep the work transient until you have verified the feature, and committing could clutter the branch with noisy commits.
Discard the changes with git reset --hard.
Explanation
Discarding changes outright is incorrect because it permanently deletes any modifications you have made, causing loss of effort. This command is useful when you intentionally want to revert to the last committed state, but not when you need to preserve work. Using it here would force you to recreate the changes from scratch, wasting time and potentially introducing errors.
Correct answer
Stash the changes using git stash.
Explanation
Stashing is the correct first action. The git stash command saves your uncommitted changes on a stack, allowing you to switch branches safely without losing work. Later you can reapply the stash with git stash pop, preserving the original context and keeping the commit history clean.
Force the branch switch with git checkout -f.
Explanation
Forcing a checkout bypasses safety checks and discards any local modifications, which defeats the purpose of preserving your work. The -f flag tells Git to throw away changes, leading to potential data loss. It is only appropriate when you deliberately want to ignore and delete those changes, not in this scenario.
Create a new temporary branch and commit the changes there before switching.
Explanation
Creating a new temporary branch adds unnecessary complexity as a first step. While committing on a new branch would retain the changes, it requires additional Git operations (branch creation, checkout, commit) that are not needed just to safeguard current edits. The simpler stash approach achieves the same protection with fewer steps.
Pull the latest changes from the remote repository before switching branches.
Explanation
Pulling updates has no relevance to protecting your local uncommitted changes. It synchronizes the current branch with its remote counterpart but does not address the risk of losing work when changing branches. Executing a pull first would waste time and might even introduce merge conflicts that are unrelated to the original problem.
Overall explanation
The question tests the learner's understanding of how to safely move between branches when there are uncommitted modifications. Git stash is the canonical solution because it temporarily saves those changes without committing them, enabling a clean branch checkout. Common misconceptions include thinking that committing first is always safest, or that forcing a checkout will preserve work, both of which either pollute history or discard changes. Creating extra branches or pulling remote updates are extra steps that do not directly protect local edits. Best practice is to stash (or optionally commit) any work-in-progress before switching branches, then apply or pop the stash when you return, ensuring no loss of effort and a tidy repository history.
Domain
Branch Management
Question 62
Skipped
A developer has made changes to a file, but they've realized that the changes are not needed. They want to reset the file to its previous state, but they don't want to lose the changes they've made to other files. Which approach BEST satisfies these requirements?
Correct answer
Run `git restore <file>`
Explanation
This is correct. `git restore <file>` (or the older `git checkout -- <file>`) removes all unstaged modifications from the specified file, returning it to the state recorded in HEAD while leaving every other file untouched. It is the safest way to discard changes to a single file without affecting the rest of the working directory.
Run `git reset HEAD <file>`
Explanation
This is incorrect. `git reset HEAD <file>` only unmarks the file from the staging area; it does not revert the working‑tree content, so any edits you made remain present. Using it would not reset the file to its previous committed version, and the developer would still see the unwanted changes.
Run `git checkout <commit> -- <file>`
Explanation
This is partially correct but not the best answer. While specifying a commit (or omitting it to default to HEAD) can restore a file, it requires remembering the correct syntax and may confuse users who only need to reset to the latest commit. For everyday workflows, `git restore` is clearer and less error‑prone.
Run `git stash -p` and then apply the stash
Explanation
This is incorrect. Interactive stashing (`git stash -p`) lets you selectively stash changes, but it adds unnecessary complexity when you only want to discard changes in one file. After stashing, you would still need to apply the stash, risking re‑introducing the unwanted edits if done incorrectly.
Run `git revert <commit>`
Explanation
This is incorrect. `git revert` creates a new commit that undoes the effects of an entire previous commit across the whole repository, not just the edits in a single file in the working tree. Using it would affect other files and alter project history, which is far more disruptive than needed.
Run `git commit --amend` and edit the file
Explanation
This is incorrect. `git commit --amend` rewrites the most recent commit, allowing you to modify its contents, but it requires the changes to have already been committed. The scenario describes unstaged changes that have not been committed, so amending is not applicable and could unintentionally rewrite history.
Overall explanation
The question tests knowledge of how to discard changes to a single file without impacting other modifications in the working directory. The appropriate command is `git restore ` (or the older `git checkout -- `), which directly resets the file to the version stored in HEAD while leaving all other files untouched. Common misconceptions include using `git reset HEAD `, which only unstages changes, or `git revert`, which creates a new commit and affects the entire repository. Selecting a more complex workflow like interactive stashing adds unnecessary steps and risk. Best practice is to use the simplest, purpose‑built command for file‑level restoration to keep the repository state clean and predictable.
Domain
File Restoration
Question 63
Skipped
A tech lead is designing a new feature that requires changes to multiple files. They want to create a new branch for the feature, but they also want to make sure that the changes are not lost if the branch is deleted. Which configuration achieves this?
Correct answer
Create the branch locally and immediately push it to a remote repository, setting the upstream with `git push -u origin <branch-name>`.
Explanation
This is correct because pushing the branch to a remote stores the commits outside the local repository. As long as the remote reference exists, deleting the local branch does not remove the work; it can be recovered by fetching the remote branch. In practice, teams use this pattern to back up feature work and enable collaborative development.
Enable the `branch. autosetuprebase=always` configuration so that the new branch automatically rebases onto the main branch.
Explanation
This is incorrect. The `branch. autosetuprebase` setting only influences how new branches are created with respect to rebasing, not how they are persisted or protected. It does not create any backup on a remote and therefore does not prevent loss if the branch is deleted. Misunderstanding this option can lead developers to think rebasing safeguards their work, which it does not.
Configure `git gc. prune Expire` to "now" so that unreachable commits are retained indefinitely.
Explanation
This is incorrect. Setting `gc. prune Expire` to "now" actually makes Git prune unreachable objects immediately, which increases the risk of losing commits, not protecting them. The option deals with garbage collection, not with ensuring branch existence. Relying on this would be disastrous for preserving work.
Use `git stash` to save the changes before deleting the branch, and configure `stash. save` to persist the stash across deletions.
Explanation
This is incorrect. While `git stash` can temporarily store uncommitted changes, it is not a configuration that guarantees persistence after a branch is deleted, especially if the stash is not pushed to a remote. Stashing is meant for short‑term context switching, not long‑term backup of a feature branch.
Set the repository to be a bare repository by configuring `core. bare=true`.
Explanation
This is incorrect. A bare repository does not have a working directory and is typically used as a central remote, but simply making a repository bare does not automatically protect a specific branch from deletion. Without explicitly pushing the branch to a remote bare repo, the work could still be lost. This misconception confuses repository type with branch safety mechanisms.
Configure `branch.<branch-name>. merge` to point to `refs/heads/main` so the feature branch always merges into main automatically.
Explanation
This is incorrect. The `branch.<name>. merge` setting only tells Git which upstream branch to merge with, it does not create a backup or prevent deletion of the feature branch. Developers might think that linking to main preserves the work, but the branch can still be removed and its commits would be lost if not pushed elsewhere.
Overall explanation
The question tests understanding of how to preserve feature work beyond the lifetime of a local branch. The reliable way to avoid losing changes when a branch is deleted is to push the branch to a remote repository and set an upstream reference, which creates a durable copy that can be fetched later. Many learners mistakenly believe that local configuration options like rebasing, garbage‑collection settings, or stashing can provide the same safety, but those options either affect commit history handling or only offer temporary storage. Branch protection rules on the remote can further prevent accidental deletion, reinforcing best practice of always pushing feature branches. Remember to regularly push and verify remote branches to keep work safe and enable collaboration.
Domain
Branch Management
Question 64
Skipped
As an architect, you're tasked with reviewing a codebase that has been migrated from SVN to Git. You need to identify the differences between the two version control systems. What is the KEY difference between SVN and Git in this context?
Git stores only the latest version of each file locally and must contact a remote server to access older revisions, whereas SVN keeps the full history on the client.
Explanation
This statement is incorrect. Git actually stores the entire commit history in the local repository, allowing developers to view and revert to any past revision without network access. Claiming that Git requires a server for older revisions confuses it with a purely centralized system, which would hinder offline work and is not how Git operates.
Both Git and SVN are centralized systems; the main distinction is that Git uses binary files for storage while SVN uses plain text.
Explanation
This option is false. While both systems can store binary data, the fundamental architectural difference lies in distribution, not file format. Describing Git as centralized misrepresents its distributed nature, and the binary versus text storage claim is irrelevant to the core version‑control model.
Correct answer
Git uses a distributed model where every clone contains the complete repository history, while SVN follows a centralized model with a single authoritative server.
Explanation
This statement is correct. Git clones are full replicas, each holding the entire commit graph, which enables offline commits, branching, and history inspection. SVN, on the other hand, relies on a central repository; most operations require network communication, making the workflow fundamentally different.
Git automatically resolves all merge conflicts without user intervention, unlike SVN which requires manual conflict resolution.
Explanation
This option is incorrect. Git does not automatically resolve merge conflicts; it flags conflicts and requires the developer to intervene, similar to SVN. Assuming Git eliminates manual conflict resolution misleads users about the need for careful merging practices in any VCS.
Git’s branching mechanism creates separate physical copies of the project directory, whereas SVN’s branches are merely logical pointers.
Explanation
This description is inaccurate. Git branches are lightweight references to commits, not separate physical copies, which makes branching cheap and fast. In SVN, branches are indeed created as copies of directories, but the statement reverses the nature of Git's branching, leading to a misconception about storage overhead.
Git enforces a mandatory code review workflow before any commit is accepted, while SVN allows direct commits without review.
Explanation
This claim is false. Git does not enforce code review at the VCS level; review policies are typically implemented via external tools like pull‑request platforms. SVN also lacks built‑in mandatory review enforcement, so the distinction presented here does not reflect a core difference between the systems.
Overall explanation
The question tests understanding of the fundamental architectural distinction between Git and Subversion: Git is a distributed version control system, whereas Subversion is centralized. The correct answer highlights that every Git clone contains the full history, enabling offline work and independent development, while SVN relies on a single server for most operations. Common misconceptions include believing Git stores only the latest snapshot, that both systems share the same central model, or that Git automatically resolves conflicts. Misunderstanding these points can lead to poor migration planning, such as assuming network availability will always be required after moving to Git. In practice, architects should remember that the distributed nature of Git changes workflows around branching, merging, and backup strategies, and that tooling for code review is independent of the VCS itself.
Domain
Version Control Systems
Question 65
Skipped
A developer is experiencing issues with a Git repository that has been corrupted due to a network failure. They need to recover the repository, but they're not sure which tool to use. Which tool or feature is BEST suited here?
Correct answer
git fsck
Explanation
Correct. git fsck (file system check) scans the repository for integrity problems, reporting missing or corrupted objects. It can also write dangling objects to a . git/lost-found directory, giving a chance to recover data that is otherwise unreachable. In a real-world scenario, running git fsck after a network outage can reveal which commits or blobs need to be restored.
git gc
Explanation
Incorrect. git gc (garbage collection) cleans up unreachable objects to reduce repository size, but it does not detect corruption. Running gc on a corrupted repository may actually discard objects that could be salvaged, worsening data loss. Users sometimes confuse gc with recovery because both touch the object database, yet their purposes differ.
git clone
Explanation
Incorrect. Cloning creates a fresh copy of a repository from a remote source, which is useful when the local copy is irreparably damaged, but it does not repair the existing repository. If the remote itself is healthy, cloning bypasses the problem rather than fixing the corrupted local history. Learners often pick clone as a shortcut, overlooking the need to attempt recovery first.
git reflog
Explanation
Incorrect. git reflog records updates to references like HEAD, helping you locate lost commits after resets or rebases. However, reflog relies on a functional repository database; if the underlying objects are corrupted, reflog cannot retrieve them. It is a valuable recovery tool for accidental detachments, not for repository integrity failures.
git prune
Explanation
Incorrect. git prune permanently removes objects that are not reachable from any reference, which is the opposite of what you want when trying to salvage data. Using prune on a corrupted repo can unintentionally delete objects that you might later attempt to recover. The command is intended for cleanup after you are certain the repository is sound.
git remote add
Explanation
Incorrect. git remote add simply registers a new remote name and URL; it does not interact with the object database or address corruption. While adding a remote may be a step before cloning, it does not help in diagnosing or fixing a damaged repository. Confusion often arises because remote configuration is part of many workflows, but it is unrelated to recovery.
Overall explanation
This question tests the candidate's understanding of Git's built‑in integrity tools. The correct answer, git fsck, is specifically designed to detect and help recover from repository corruption by enumerating missing, dangling, or malformed objects. Many learners mistakenly choose commands like git gc or git clone, conflating cleanup or recreation with recovery; however, gc discards data and clone simply creates a new copy without fixing the broken one. Reflog and prune are also commonly mis‑identified as recovery tools, but they assume a healthy object store and can even exacerbate loss if used on a corrupted repository. The best practice is to first run git fsck to assess damage, then use the lost‑found results or a fresh clone from a trusted remote as a secondary step if necessary.
Domain
Repository Recovery
Question 66
Skipped
A product engineer is tasked with creating a new feature that requires changes to multiple files. They want to create a new branch for the feature, but they also want to make sure that the changes are not lost if the branch is deleted. Which statement is CORRECT?
Merge the feature branch into the main branch before deleting the feature branch.
Explanation
This option is incorrect because merging the branch into main permanently integrates the changes, which may not be desired if the feature is still under development or needs further review. Merging too early can introduce unfinished code into the production line, potentially causing regressions. The engineer's goal is to preserve the work without necessarily merging it, so this does not address the safety of the isolated changes.
Create a lightweight tag on the branch's tip and push the tag to the remote repository.
Explanation
While tagging does create a permanent reference to a commit, this option is not the most straightforward way to ensure a feature branch is safe from deletion. Tags are typically used for releases or specific milestones, not for ongoing development work. Moreover, the engineer would still need to remember to push the tag and manage it separately, making this a less common practice for protecting a feature branch.
Stash the changes before deleting the branch, assuming the stash will keep them safe.
Explanation
Stashing is a temporary storage mechanism for uncommitted changes; it does not protect committed work on a branch. If the engineer has already committed the changes, stashing adds no benefit, and even for uncommitted work, a stash can be lost if mishandled or if the repository is cloned elsewhere. Therefore, relying on stash does not guarantee the changes will survive branch deletion.
Correct answer
Push the new feature branch to a remote repository before deleting the local branch.
Explanation
This statement is correct because pushing the branch to a remote creates a durable reference that survives local deletions. The remote repository retains all commits, and the branch can be fetched or recreated at any time, ensuring no loss of work. This is the standard best practice for safeguarding feature work when cleaning up local branches.
Delete the local branch and rely on Git's reflog to recover the commits later if needed.
Explanation
Although reflog can sometimes help locate dangling commits, it is not a reliable safety net; reflog entries can expire, and they are not shared with the remote. Relying on reflog assumes the user will remember the exact commit hashes and that the reflog has not been pruned, which is risky for important feature work. Hence, this approach does not guarantee the changes will be preserved.
Use git revert to undo the changes before deleting the branch, thinking this will keep a record of the work.
Explanation
Git revert creates new commits that reverse the changes, effectively discarding the original work rather than preserving it. This approach loses the original development history and does not protect the branch itself. Therefore, it does not meet the requirement of keeping the feature changes safe should the branch be deleted.
Overall explanation
The question tests understanding of how Git references protect work. Branches are merely pointers to commits; deleting a branch removes the pointer but not the commits themselves as long as another reference (e. g., another branch, tag, or remote) points to them. Pushing a branch to a remote creates such a persistent reference, making the work recoverable even after local deletion. Common misconceptions include thinking that merging, stashing, tagging, reflog, or revert provide the same safety, but each either alters the commit history, offers only temporary storage, or is unreliable for long‑term preservation. Best practice is to push feature branches to a remote early and often, ensuring a backup exists before any local cleanup.
Domain
Branch Management
Question 67
Skipped
A Dev Ops engineer is tasked with troubleshooting a Git repository that has been corrupted due to a disk failure. They need to identify the root cause of the issue and recover the repository. Which THREE approaches should you take?
Correct selection
Examine system I/O logs (e. g., dmesg, /var/log/kern. log) for evidence of hardware errors.
Explanation
This option is correct. System logs often contain entries about read/write errors, SMART failures, or I/O timeouts that point to a failing disk, giving the engineer the root‑cause evidence needed before attempting recovery. Without confirming the hardware problem, any repository‑level fix may be short‑lived because the underlying issue would continue to corrupt data.
Correct selection
Run `git fsck --full` to locate corrupted objects and missing references.
Explanation
This option is correct. `git fsck` inspects the integrity of the object database, reporting dangling commits, missing blobs, or corrupted packfiles, which is essential for diagnosing the extent of repository damage. Knowing which objects are broken guides the next steps, such as selective restoration or re‑cloning.
Immediately delete the . git directory and reinitialize the repository with `git init`.
Explanation
This option is incorrect. Deleting the . git folder erases all history, branches, and metadata, making recovery impossible unless there is an external backup. Re‑initializing creates a fresh, empty repository but does not address the corrupted data that already exists on disk.
Correct selection
Restore the repository from a recent backup or clone from a healthy remote source.
Explanation
This option is correct. A known‑good backup or a remote that contains the full history allows the engineer to replace the damaged local copy with a pristine version, effectively recovering the repository. After restoration, the engineer can still run `git fsck` to ensure the new copy is intact.
Use `git commit --amend` on the latest commit to repair corrupted objects.
Explanation
This option is incorrect. `git commit --amend` merely creates a new commit on top of the existing history and does not fix underlying object corruption; the corrupted objects will still be present in the database. Attempting this can further confuse the repository state and make troubleshooting harder.
Run `git gc --aggressive` to automatically fix the corruption.
Explanation
This option is incorrect. `git gc` performs garbage collection and repacks objects, but it does not repair corrupted objects; in fact, it may discard dangling objects that could be needed for recovery. Using it on a damaged repository can permanently remove recoverable data.
Overall explanation
The question tests a professional’s ability to both diagnose the cause of repository corruption and apply a reliable recovery strategy. Identifying hardware failures through system logs (Option 1) is the first step because without fixing the disk issue the repository will continue to become corrupted. Running `git fsck --full` (Option 2) provides a detailed view of which Git objects are damaged, informing the recovery plan. Restoring from a recent backup or a healthy remote clone (Option 4) is the safest way to bring the repository back to a known good state. The incorrect options reflect common misconceptions: deleting . git (Option 3) destroys the history, amending a commit (Option 5) does not address low‑level corruption, and garbage collection (Option 6) cannot heal broken objects and may discard needed data. Best practice is to first verify hardware health, then assess repository integrity, and finally recover from a trusted source while ensuring the hardware issue is resolved before resuming normal operations.
Domain
Repository Recovery
Question 68
Skipped
As a Dev Ops engineer, you are tasked with resolving a Git conflict that occurred during a pull request. The conflict is in a critical file that affects the entire application. Which TWO options are correct?
Use `git merge --abort` to cancel the merge and then rebase the feature branch onto the updated main branch.
Explanation
This approach aborts the current merge, which can be useful if you want to start over, but it does not directly resolve the conflict presented in the pull request. Re‑rebasing after abort may still surface the same conflict, and you would need to resolve it again. Therefore, while aborting can be a part of a broader strategy, it is not itself a conflict‑resolution step in the PR workflow.
Correct selection
Manually edit the conflicting file, resolve the differences, then stage the file with `git add` and complete the merge by committing.
Explanation
Manually editing the file gives you full control to decide which code should stay, which is essential for a critical file. After editing, staging with `git add` marks the conflict as resolved, and committing finalizes the merge. This is the standard, recommended method for resolving merge conflicts in a PR.
Accept the incoming changes automatically using `git checkout --theirs <file>` without reviewing the code.
Explanation
Using `--theirs` automatically picks the changes from the branch being merged, but skipping a review is risky, especially for a critical file that impacts the entire application. Blindly accepting changes can introduce bugs or security issues. Hence, this is not a best practice for conflict resolution.
Correct selection
Use Git Hub's web editor to resolve the conflict directly in the pull request interface, then click "Commit merge".
Explanation
Git Hub provides an in‑browser conflict‑resolution UI that lets you edit the file, choose which changes to keep, and commit the resolution without leaving the platform. This method is fully supported and often used for quick fixes, especially when the conflicted sections are small. It satisfies the requirement of resolving the conflict in a critical file safely.
Delete the critical file from the repository and recreate it from scratch to avoid the conflict.
Explanation
Removing the file eliminates the conflict superficially, but it also discards the file's history and any legitimate changes made by other contributors. Recreating the file from scratch can lead to loss of functionality and introduces new risks. This is a destructive approach and should never be used for conflict resolution.
Run `git revert` on the pull request commit before merging to eliminate the conflict.
Explanation
`git revert` creates a new commit that undoes the changes of a previous commit; it does not resolve a merge conflict. Applying it before the merge would add an extra commit that may still conflict with the target branch. Consequently, this does not address the conflict directly and is not an appropriate solution.
Overall explanation
The question tests the candidate's knowledge of proper merge‑conflict resolution techniques within a pull request workflow. The correct methods are manual editing and staging (option 2) and using Git Hub's web editor (option 4), both of which allow the engineer to carefully inspect and combine changes in a critical file. Options that abort the merge, automatically choose one side, delete the file, or use revert are common misconceptions because they either avoid the necessary code review, discard valuable history, or do not actually resolve the conflict. In practice, engineers should always review conflicting sections, resolve them deliberately, and then commit the resolution to preserve application stability. Following these best practices ensures that critical files remain functional and that the repository history stays clean and understandable.
Domain
Merge Conflicts
Question 69
Skipped
A developer on your team accidentally pushed a commit that deleted a crucial file, and now the file is missing from the remote repository. What is the MOST appropriate action?
Correct answer
Revert the commit that deleted the file using `git revert` (or checkout the file from a prior commit) and push the new commit to the remote.
Explanation
This option is correct. `git revert` creates a new commit that undoes the changes introduced by the faulty commit without rewriting history, which is safe for shared branches. In practice, the file is restored and the project history remains linear, avoiding disruption for teammates who may have already pulled the bad commit.
Perform a hard reset to the commit before the deletion, then force‑push the branch to overwrite the remote history.
Explanation
This option is incorrect because it rewrites public history. A hard reset followed by a force‑push can cause serious problems for anyone who has already based work on the bad commit, leading to merge conflicts and lost work. While it would remove the deletion, it violates best‑practice guidelines for collaborative repositories.
Delete the remote branch entirely and push a new branch that starts from an older commit containing the file.
Explanation
This option is incorrect and overly disruptive. Deleting the remote branch removes all work that may have been added after the problematic commit, not just the single file deletion. Recreating a branch from an older point discards valid contributions and requires teammates to re‑track the new branch, which is unnecessary for this simple fix.
Ask the developer to manually recreate the missing file locally and commit it, without referencing the previous version.
Explanation
This option is incorrect because it loses the file's history and any metadata such as author information or previous edits. Manually re‑creating the file treats the fix as a brand‑new addition rather than a restoration, making it harder to track when and why the file was removed. Maintaining the original history is important for audits, debugging, and future maintenance.
Use the Git Hub web interface to restore the file from the commit history via the "Restore" button.
Explanation
While technically possible, this option is considered less appropriate for a professional workflow because it relies on UI shortcuts and may not be as transparent as a `git revert` performed locally. It can also be confusing for team members who expect command‑line operations to be reflected in the repository history. The exam favors the explicit, reproducible `git revert` method as the most reliable approach.
Open a new pull request that adds the missing file back, leaving the erroneous commit in the history.
Explanation
This option is not the best choice because it does not directly undo the harmful commit; it merely adds the file again in a separate change. Keeping the deletion commit in history can mislead future readers and tools that analyze the repo, suggesting the file was intentionally removed. Reverting the original commit provides a clearer, single‑step correction.
Overall explanation
The question tests the candidate's understanding of safe ways to undo changes that have already been pushed to a shared remote repository. The recommended practice is to use `git revert`, which creates a new commit that reverses the undesired changes while preserving the commit graph and avoiding history rewrites. Common misconceptions include using `git reset` + force‑push or deleting branches, both of which rewrite public history and can break collaborators' work. Restoring a file manually loses valuable history, and relying on UI shortcuts may bypass important review steps. Best practice is to revert the offending commit, communicate the fix to the team, and ensure the repository remains in a consistent, well‑documented state.
Domain
Reverting Commits
Question 70
Skipped
You are working on a feature branch and realize that you need to apply a commit from the main branch to your current branch. Which approach BEST satisfies these requirements?
Merge the main branch into the feature branch with `git merge main`.
Explanation
This option is incorrect for the stated need. A merge brings the entire history of the main branch into the feature branch, not just a single commit. Using merge would introduce unrelated changes and potentially create a larger integration effort than necessary, which contradicts the requirement to apply only one specific commit.
Rebase the feature branch onto main using `git rebase main`.
Explanation
Rebasing rewrites the feature branch so that its base becomes the tip of main, effectively moving all its commits after every commit on main. This operation would incorporate all commits from main, not just the one desired, and can rewrite public history, causing coordination problems with teammates. Therefore it does not satisfy the need to apply only a single commit.
Correct answer
Cherry-pick the specific commit from main onto the feature branch using `git cherry-pick <commit‑sha>`.
Explanation
This option is correct. Cherry-picking copies the changes introduced by the specified commit and creates a new commit on the current branch, leaving the rest of the main branch untouched. It lets you apply exactly one commit without pulling in unrelated history, which matches the requirement perfectly.
Reset the feature branch to the commit from main with `git reset --hard <commit‑sha>`.
Explanation
Resetting the branch to a commit from main discards all commits that were on the feature branch after that point, effectively losing work. It also moves the branch pointer, not copying the commit, which is not what is wanted when you simply need to bring one change over while preserving existing work. Hence this approach is incorrect.
Pull the latest changes from main into the feature branch using `git pull origin main`.
Explanation
A pull combines a fetch and a merge, bringing all new commits from main into the feature branch. Like a plain merge, it adds the entire set of changes, not just the single commit of interest. This over‑includes changes and therefore does not meet the requirement.
Create a new branch from the main commit and then merge it back into the feature branch.
Explanation
While this could eventually bring the desired commit into the feature branch, it introduces an extra temporary branch and still requires a merge, which brings in all commits reachable from that new branch. The added complexity and over‑inclusion of history make it a suboptimal solution compared to cherry‑pick.
Overall explanation
The question tests knowledge of how to bring an individual commit from one branch into another without merging full branch histories. The appropriate Git command for this scenario is `git cherry-pick`, which copies the changes introduced by a specific commit onto the current branch, preserving existing work and avoiding unrelated changes. Common misconceptions include using merge or rebase, which both propagate the entire commit series from the source branch, leading to unnecessary integration work. Reset and pull also misapply the concept: reset discards work, and pull merges all changes. Best practice is to use cherry-pick for isolated changes, and to ensure the commit is clean (no conflicts) before applying it to avoid later merge complications.
Domain
Branch Management
Question 71
Skipped
As a tech lead, you are tasked with designing a Git workflow for a new project. The project requires that all changes be reviewed by at least two team members before they are merged into the main branch. What is the PRIMARY reason for this behaviour?
To automatically trigger CI builds after each review.
Explanation
This option is incorrect. While CI pipelines are often started by pull‑request events, the purpose of requiring two reviewers is not to control CI execution. Automating builds is a side‑effect of the pull‑request workflow, not the primary motivation for multiple approvals. Relying on reviewers to start CI would lead to inconsistent testing and potential integration gaps.
To limit the number of merges per day for operational stability.
Explanation
This option is incorrect. Restricting merge frequency is a capacity‑planning concern, not a reason to demand two reviewers. Even with many merges per day, a project can maintain stability if each change is thoroughly reviewed. Using reviewer count to throttle merges would unnecessarily slow delivery without improving quality.
Correct answer
To increase code quality by having multiple eyes catch bugs and design issues.
Explanation
This option is correct. Requiring two reviewers provides a peer‑review checkpoint where defects, security flaws, or architectural inconsistencies can be identified before they reach the main branch. Studies show that multiple reviews reduce the likelihood of bugs making it to production, leading to higher reliability and maintainability. In practice, a two‑review policy often surfaces issues that a single author or reviewer might overlook.
To ensure that every pull request follows a predefined naming convention.
Explanation
This option is incorrect. Naming conventions are typically enforced by automated linters or repository policies, not by the number of reviewers. While reviewers might notice a poorly named branch, their primary role is to assess code, not enforce naming rules. Relying on multiple approvals for naming compliance would be inefficient and error‑prone.
To reduce the size of the main branch by limiting changes.
Explanation
This option is incorrect. The size of the main branch is controlled by what is merged, not by how many people approve it. Two reviewers do not inherently limit the amount of added code; they simply provide additional scrutiny. If the goal were to keep the main branch small, strategies like feature toggles or frequent rebasing would be used instead.
To enforce that only senior engineers can approve changes.
Explanation
This option is incorrect. Requiring two reviewers does not imply seniority; it encourages collaborative review regardless of experience level. In many teams, junior members can participate in reviews, fostering knowledge sharing. Making the rule about senior approval would defeat the purpose of peer learning and could create bottlenecks.
Overall explanation
The question tests understanding of why a Git workflow might mandate multiple code reviewers before merging. The primary reason is to improve code quality and catch defects early, leveraging diverse perspectives to identify bugs, security issues, and design problems. Common misconceptions include believing the rule exists to drive CI execution, control merge frequency, enforce naming conventions, or restrict contributions to senior staff, each of which addresses a different aspect of workflow but not the core purpose of peer review. Effective practices encourage inclusive reviews, automated testing, and clear policies separate from reviewer count. Remember that a two‑review requirement is a quality gate, not a mechanism for naming, branch size, or seniority enforcement.
Domain
Code Review Practices
Question 72
Skipped
You are trying to revert a commit that was pushed to the remote repository, but you want to keep the changes in your local branch. Which configuration achieves this?
Correct answer
Run `git revert <commit>` locally and then push the new revert commit to the remote.
Explanation
This option is correct. `git revert` creates a new commit that undoes the changes introduced by the specified commit while preserving the original commit in history. After pushing the revert commit, the remote repository reflects the undone state, but your local branch still contains the original commit and its changes, allowing you to continue work from there.
Run `git reset --hard <commit>` and push the branch with `--force`.
Explanation
This option is incorrect. `git reset --hard` discards the commits after the specified point both locally and, after a forced push, on the remote. The changes are lost from your local workspace, which contradicts the requirement to keep them locally. Additionally, force‑pushing rewrites shared history and is discouraged in collaborative environments.
Create a new branch from the unwanted commit with `git checkout -b new-branch <commit>` and push that branch.
Explanation
This option is incorrect. While creating a new branch preserves the commit, pushing the new branch does not revert the change on the original remote branch. The original branch would still contain the unwanted commit, so the remote repository would not reflect the desired revert.
Use `git cherry-pick -n <commit>` to apply the changes without committing, then push.
Explanation
This option is incorrect. `git cherry-pick -n` applies the changes of a commit to the working tree without creating a commit, which does not undo the original commit on the remote. Pushing without a new commit will have no effect on the remote repository's history.
Run `git revert --no-commit <commit>` and commit the changes locally without pushing them.
Explanation
This option is incorrect. `git revert --no-commit` stages the inverse changes but does not create a commit until you finish it; if you never push the revert commit, the remote repository remains unchanged, leaving the unwanted changes intact on the remote side.
Perform an interactive rebase (`git rebase -i`) to drop the commit and then force‑push the rewritten branch.
Explanation
This option is incorrect. Dropping the commit via interactive rebase rewrites history, and a force‑push would remove the commit from the remote, but it also eliminates the changes locally. The requirement was to keep the changes locally, which this method does not satisfy, and force‑pushing is risky on shared branches.
Overall explanation
The question tests understanding of how to undo a change on a shared remote while retaining the original work locally. `git revert` is the safe, non‑destructive way to generate a new commit that reverses a prior commit, keeping the original commit in the local history. Options involving `git reset --hard` or interactive rebase rewrite history and would remove the changes from the local branch, violating the requirement and potentially disrupting teammates. Misconceptions arise because `reset` and `rebase` are often used for local clean‑ups, but they are unsuitable when you need to preserve local modifications and avoid force pushes. Best practice is to prefer `git revert` for public branches, as it maintains a clear audit trail and avoids the hazards of history rewriting.
Domain
Git & Git Hub
Question 73
Skipped
As a QA engineer, you are tasked with testing a new feature that was developed by another team. The feature requires a specific version of a library to be installed. Which THREE approaches should you take to ensure that the correct version is installed?
Correct selection
Inspect the project's dependency file (e. g., package. json, requirements. txt, pom. xml) and install the version that is explicitly listed.
Explanation
This option is correct. The dependency manifest is the definitive source of truth for which version the code expects, and installing that exact version guarantees compatibility. If you ignore the manifest and install a different version, you may encounter runtime errors such as missing methods or changed APIs, which can cause false test failures.
Rely on the version of the library already installed system‑wide, assuming it matches the feature’s needs.
Explanation
This option is incorrect. System‑wide installations are shared across many projects and may be older or newer than the version required, leading to version conflicts. Using an uncontrolled global version can cause flaky tests, for example when another team upgrades the library and your tests suddenly break.
Correct selection
Create an isolated virtual environment or Docker container, then install the required version inside that environment.
Explanation
This option is correct. Isolation prevents other projects or system packages from influencing the library version you test against, ensuring reproducible results. In real‑world CI pipelines, teams often spin up containers with the exact dependency set to avoid "works on my machine" issues.
Delete the library and reinstall the newest version available from the official repository.
Explanation
This option is incorrect. Installing the newest version disregards the specific version the feature was built and tested with, which can introduce breaking changes. A common pitfall is assuming newer is always better, leading to unexpected failures in regression tests.
Correct selection
After installation, run a command such as `library --version` or `pip show library` to verify the exact version that is present.
Explanation
This option is correct. Verifying the installed version provides a safety net that the previous steps succeeded and that no accidental upgrade occurred. In practice, teams add such checks to build scripts so failures are caught early, before test execution begins.
Copy the library’s source files manually from a teammate’s machine into your project directory without using a package manager.
Explanation
This option is incorrect. Manually copying files bypasses dependency resolution, can miss transitive dependencies, and makes it hard to track the exact version. It also violates reproducibility best practices, leading to environment drift and difficult debugging later on.
Overall explanation
The question tests knowledge of reliable dependency management techniques when a specific library version is required for testing. The correct approaches—reading the project's manifest, using an isolated environment, and confirming the installed version—ensure that the exact version is reproduced, avoiding conflicts and non‑deterministic test results. Common misconceptions include assuming a globally installed library will be correct, always upgrading to the latest version, or manually copying files, all of which can introduce version mismatches, hidden bugs, and maintenance headaches. Best practice is to treat the dependency manifest as the source of truth, isolate the runtime environment, and add explicit version verification steps. Following these practices leads to reproducible test environments, smoother collaboration between teams, and fewer surprises in CI pipelines.
Domain
Dependency Management
Question 74
Skipped
You are working on a feature branch and realize that you need to reset your branch to a previous commit. However, you want to keep the changes in your local files. What is the KEY difference between using git reset --soft and git reset --hard in this context?
Correct answer
--soft moves HEAD only, leaving the index and working directory unchanged, while --hard moves HEAD and also resets the index and working directory, discarding any uncommitted changes.
Explanation
This option is correct. --soft updates only the HEAD pointer, so the staged snapshot (index) and the files on disk remain exactly as they were, preserving all local modifications. In contrast, --hard updates HEAD, the index, and the working tree, overwriting any uncommitted changes, which is why it would lose the local work you want to keep.
--soft discards all local changes but updates the HEAD pointer, whereas --hard only updates the HEAD pointer and preserves changes in the working directory.
Explanation
This option is incorrect. It reverses the actual behavior: --soft does **not** discard local changes; it keeps them intact. --hard is the one that discards changes by resetting the index and working tree, so the description here is misleading and could cause loss of work if followed.
--soft and --hard both reset the HEAD pointer, but --soft also resets the remote tracking branch, while --hard does not.
Explanation
This option is incorrect. Neither --soft nor --hard modify remote‑tracking branches; they operate only on local references. Resetting the remote tracking branch requires explicit commands like git branch -f or git push --force, so this statement confuses local reset semantics with remote updates.
--soft resets the working directory to match the target commit but keeps the index unchanged, whereas --hard resets only the HEAD pointer.
Explanation
This option is incorrect. It inverts the true effects: --soft does **not** touch the working directory at all, while --hard resets both the index and the working directory. Resetting only the HEAD pointer would be akin to --mixed, not --hard.
--soft performs a fast‑forward merge to the selected commit, while --hard performs a hard reset that also removes the commit from the repository history.
Explanation
This option is incorrect. --soft is not a merge operation; it simply moves HEAD without changing any files. Additionally, a hard reset does not delete the commit from history—it merely moves HEAD and updates the index and working tree; the commit remains reachable via other refs or the reflog.
--soft only affects the staging area (index) leaving the working files unchanged, whereas --hard affects only the working files leaving the index untouched.
Explanation
This option is incorrect. While --soft does keep the index unchanged, it also leaves the working tree untouched; however, --hard changes **both** the index and the working tree, not just one of them. The statement that --hard leaves the index untouched is false and could lead to misunderstanding of how resets work.
Overall explanation
The question tests understanding of the two primary reset modes in Git. The key difference is that --soft moves only the HEAD pointer, preserving both the staging area and the working directory, which means all local edits remain available. In contrast, --hard moves HEAD **and** forces the index and working tree to match the target commit, discarding any uncommitted changes. Many learners confuse the direction of this effect, thinking that --soft discards changes or that --hard only moves HEAD. Remember that if you need to roll back a commit but keep your work for further editing, --soft is the safe choice; use --hard only when you are sure you want to wipe those changes. Best practice is to inspect the outcome with git status or git diff before applying a hard reset, or to create a backup branch first.
Domain
Reset Operations
Question 75
Skipped
As a data engineer, you are tasked with migrating a large dataset from one repository to another. The dataset is stored in a Git repository, and you need to preserve the commit history. Which tool or feature is BEST suited here?
Use `git rebase` to rewrite history and then push to the new repository.
Explanation
This option is incorrect. `git rebase` rewrites commit history by reapplying commits onto a new base, which can alter metadata such as timestamps and author information. Using it for migration would destroy the original linear history and could cause conflicts, making it unsuitable for preserving an exact historical record.
Use `git cherry-pick` to manually copy each commit onto the new repository.
Explanation
This option is incorrect. `git cherry-pick` applies individual commits one at a time, creating new commit objects rather than copying the original ones. While it could technically replicate changes, the resulting history would differ (new SHA‑1 hashes, different parent relationships), defeating the goal of preserving the exact original commit history.
Perform a shallow clone with `git clone --depth 1` and push the result.
Explanation
This option is incorrect. A shallow clone intentionally truncates history to a single recent snapshot, discarding earlier commits. Pushing such a repository would transfer only the most recent state, not the full commit log, which contradicts the requirement to keep the complete history.
Correct answer
Use `git clone --mirror` to create a full mirror and then push it to the target remote.
Explanation
This option is correct. `git clone --mirror` creates a bare repository that includes all refs, branches, tags, and the full commit graph exactly as it exists in the source. After cloning, pushing with `git push --mirror` to the destination remote replicates the entire history without modification, making it the most reliable method for a faithful migration of large datasets.
Create a `git bundle` file and import it into the new repository.
Explanation
This option is partially plausible but not the best choice for regular migrations. A bundle can encapsulate a repository’s objects and history for transport, yet it requires an extra export and import step and is typically used for offline transfers. For a straightforward server‑to‑server migration, `git clone --mirror` is simpler and avoids the extra bundle management overhead.
Add the new remote with `git remote add` and run `git push --force` for the main branch only.
Explanation
This option is incorrect. Adding a remote and force‑pushing only the main branch will copy just that branch's tip, leaving other branches, tags, and the complete commit graph behind. It fails to preserve the full history across all refs, which is essential when migrating a large dataset with many branches and releases.
Overall explanation
The question tests knowledge of how to migrate a Git repository while keeping every commit, branch, and tag intact. The proper tool is `git clone --mirror`, which creates a complete bare copy of the source repository, including all refs, and can be pushed to a new remote to reproduce the exact history. Common misconceptions include using rebasing or cherry‑picking, which rewrite history, or shallow clones, which deliberately drop older commits. Bundles can move history but add unnecessary complexity for a direct server‑to‑server transfer. Adding a remote and force‑pushing only a single branch omits much of the repository’s information. In practice, teams should prefer the mirror approach for large‑scale migrations to ensure integrity, auditability, and reproducibility of the data.
Domain
Repository Migration
Question 76
Skipped
A developer on your team is experiencing issues with their Git configuration, and you need to troubleshoot the problem. You suspect that the issue is related to a recent change in the Git configuration. What is the MOST likely root cause?
Correct answer
A syntax error (such as a missing quote or stray character) introduced into the . gitconfig file, causing Git to ignore or misinterpret configuration values.
Explanation
This option is correct. Git reads configuration files line‑by‑line, and any malformed entry (e. g., an unclosed quote, missing equals sign, or stray UTF‑8 character) will cause the parser to stop processing that section. As a result, settings you think you changed may be ignored, leading to unexpected behavior such as incorrect author information, failed pushes, or editor launch failures. In practice, developers often see warnings like "error: could not lock config file" or notice that their recent changes have no effect until the syntax issue is fixed.
Changing the remote URL to use an unsupported protocol, such as switching from SSH to an incorrect HTTPS format.
Explanation
This option is incorrect. While an incorrect remote URL can cause push or fetch failures, it is not typically classified as a "Git configuration" issue but rather a repository‑specific setting. The error messages would explicitly mention the remote URL or authentication failure, rather than vague configuration problems. Moreover, the scenario describes a recent change in configuration, and a malformed . gitconfig is more likely to affect many commands globally.
Disabling the credential helper by setting credential. helper to an empty string, which stops Git from storing authentication tokens.
Explanation
This option is incorrect. Turning off the credential helper can lead to repeated password prompts, but it does not cause the broad range of symptoms associated with a generic configuration issue. The problem described would manifest as authentication prompts rather than erratic Git behavior across unrelated commands. Learners often confuse credential storage problems with overall configuration corruption, but the most common root cause is a parsing error in the config file itself.
Setting core. autocrlf to true on a Linux workstation, causing line‑ending conversions that break build scripts.
Explanation
This option is incorrect. While enabling core. autocrlf on a non‑Windows platform can introduce unwanted CRLF line endings, it typically results in specific file‑content differences rather than a universal configuration failure. The issue would be observable in diff output or build failures, not in general Git command misbehavior. Many users mistakenly think line‑ending settings are the primary cause of configuration issues, but syntax errors are far more disruptive.
Changing push. default to "nothing", which prevents any branch from being pushed without explicitly specifying a refspec.
Explanation
This option is incorrect. Altering push. default can make pushes require additional arguments, but it does not cause Git to behave unpredictably in unrelated operations such as committing or merging. The symptom would be a clear error message about missing refspecs, not a vague configuration problem. Learners sometimes over‑estimate the impact of push. default, forgetting that it only affects push behavior.
Updating the user. email to an incorrectly formatted address, leading to commit rejections from the server.
Explanation
This option is incorrect. An improperly formatted email address may cause server‑side hooks to reject pushes, but Git will still function locally and will not produce generic configuration errors. The failure would be isolated to server validation, not a broad configuration malfunction. This misconception arises because email fields are common in config, yet they rarely cause the type of issue described.
Overall explanation
The question tests knowledge of how Git parses its configuration files and the impact of malformed entries. The most likely root cause of mysterious, widespread Git issues after a recent change is a syntax error in the . gitconfig file, which causes Git to ignore or misinterpret settings. Common misconceptions include blaming remote URL formats, credential helpers, line‑ending settings, push defaults, or email formats, each of which can cause specific problems but not the generic configuration breakdown described. Understanding that Git stops processing a config file at the first parsing error helps troubleshoot quickly by inspecting the file with git config --list --show-origin. Best practice is to edit . gitconfig with a reliable editor that validates syntax and to verify changes using git config --list after each edit.
Domain
Git Configuration
Question 77
Skipped
As a product engineer, you are tasked with designing a CI/CD pipeline for a new project. The pipeline requires that all commits be verified before they are deployed to production. Which statement is CORRECT?
Require that every pull request be merged with the “merge commit” option disabled, forcing a fast‑forward only workflow.
Explanation
This option describes a merge strategy that controls how history looks, but it does not enforce any verification of the commit contents. Fast‑forward merges simply move the branch pointer; they do not run tests, check signatures, or guarantee that code has been approved. Consequently, relying on this setting would leave the production branch vulnerable to unverified changes.
Configure a pre‑receive hook on the central repository that automatically signs each incoming commit, ensuring they are verified.
Explanation
Pre‑receive hooks can reject commits that do not meet criteria, but they cannot retroactively sign commits; signatures must be created by the author before the push. Attempting to add a signature in a server‑side hook would break the commit hash, invalidating the object. Therefore, this statement is technically inaccurate and would not achieve the intended verification.
Correct answer
Enable branch protection rules on the main branch that require signed commits and that a CI job (e. g., a verification workflow) passes before the branch can be merged or pushed.
Explanation
Branch protection with required signed commits and required status checks is the recommended way to guarantee that only verified code reaches production. Git Hub will block pushes or merges that lack a valid GPG/SSH signature and will also enforce that a configured CI workflow completes successfully. This ensures that every change has both developer accountability and automated verification before it can be deployed.
Set up a scheduled Git Hub Action that scans the repository nightly and retroactively adds a ‘verified’ label to any commit that passed tests.
Explanation
Adding a label after the fact does not prevent unverified commits from being merged or deployed earlier in the day. The pipeline would still have to process potentially unsafe code before the nightly scan runs. Hence, this approach does not satisfy the requirement that verification happen before deployment.
Allow direct pushes to the production branch and rely on the deployment pipeline’s runtime checks to block unverified code.
Explanation
Direct pushes bypass any pre‑merge checks such as required status checks or signed‑commit enforcement, placing the burden on runtime checks that occur after code has already entered the production branch. This defeats the purpose of verifying commits before they are deployed and can lead to race conditions or missed failures. Best practice is to prevent the push itself rather than trying to catch problems later.
Use Git tags marked as ‘verified’ and configure the pipeline to deploy only tagged commits, assuming tags guarantee verification.
Explanation
Tags are simply pointers to commits and carry no intrinsic verification data; anyone can create a tag named ‘verified’ without running tests or signing. Deploying based solely on tag names provides a false sense of security and can allow unverified code to be released if a tag is applied incorrectly. Proper verification must be enforced at the commit or branch level, not through tag naming conventions.
Overall explanation
The question tests knowledge of how to enforce commit verification in a CI/CD workflow, specifically using Git Hub's branch protection features. Requiring signed commits and mandatory status checks ensures that code cannot be merged or pushed to the protected branch unless it passes automated tests and bears a valid developer signature. Options 1, 2, 4, 5, and 6 each reflect common misunderstandings: they either address unrelated Git mechanics, describe technically impossible actions, rely on retroactive labeling, or trust inadequate mechanisms like tags. In real‑world pipelines, the safest practice is to block unverified changes at the point of integration, not after they have reached production. By configuring branch protection with required checks, teams achieve both accountability and automated quality assurance before deployment.
Domain
Branch Protection
Question 78
Skipped
As a Dev Ops engineer, you are tasked with resolving a merge conflict in a critical production branch. The conflict arises from two developers working on the same feature, and you need to decide the best approach to resolve the conflict. Which option should you choose?
Automatically accept the incoming changes using the 'theirs' strategy (git merge -X theirs) and discard the current production version of the conflicting files.
Explanation
This option is incorrect. While the 'theirs' strategy forces acceptance of the incoming changes, it does so without reviewing the impact on production code, which can introduce bugs or regressions. Blindly overwriting production files bypasses essential code review and testing, potentially breaking the live system.
Abort the merge, reset the production branch to the previous commit, and force‑push the other developer’s branch, effectively overwriting the production history.
Explanation
This option is incorrect. Force‑pushing rewrites history on a critical production branch, which can confuse other collaborators and break CI/CD pipelines that rely on stable commit hashes. Overwriting production history also discards any unrelated changes that may have been safely deployed, increasing risk.
Manually edit the conflicted files, resolve the differences, commit the merge, and then run the test suite before pushing the result to production.
Explanation
This option is partially correct but incomplete. Manually resolving conflicts is necessary, but doing it directly on the production branch without isolation can expose the live environment to partially resolved code if tests fail. Best practice is to resolve conflicts in a separate branch where testing can be performed safely before merging back.
Use the 'ours' merge strategy to keep the production branch’s version unchanged and ignore the conflicting changes from the feature branches.
Explanation
This option is incorrect. The 'ours' strategy discards the incoming changes entirely, meaning the new feature work would be lost. Ignoring valid contributions defeats collaborative development and can cause duplicated effort or missed functionality.
Delete the production branch, recreate it from the other developer’s branch, and push it as the new production line.
Explanation
This option is incorrect. Deleting and recreating a production branch eliminates the audit trail and can unintentionally drop other critical changes. Such a drastic action should never be taken to resolve a simple merge conflict.
Correct answer
Create a new integration branch off the current production commit, merge both developers’ feature branches into it, resolve the conflicts manually, run the full test suite, and then merge the integration branch back into production.
Explanation
This option is correct. By isolating conflict resolution in an integration branch, you protect the stable production branch from partial or faulty changes. After manual resolution, running the complete test suite ensures that the merged code works as expected before it is promoted to production, aligning with industry best practices for safe deployments.
Overall explanation
The question tests understanding of safe merge‑conflict resolution on a critical production branch. The optimal approach is to isolate the conflict in a temporary integration branch, manually resolve the differences, and thoroughly test before merging back, as described in option 6. Common misconceptions include using aggressive merge strategies like 'theirs' or 'ours' without review, force‑pushing, or directly committing fixes on production, all of which risk stability and auditability. Effective Dev Ops practice emphasizes preserving production integrity, maintaining clear history, and validating changes through testing. Remember to always resolve conflicts in a separate branch, involve relevant developers if needed, and run automated tests before promoting to production.
Domain
Branch Management
Question 79
Skipped
You are a developer working on a feature branch, and you realize that you need to incorporate changes from the main branch into your feature branch. You have already made significant changes to your feature branch. Which TWO options are correct?
Correct selection
Merge the main branch into your feature branch using `git merge main` while on the feature branch.
Explanation
This is correct. Merging creates a new merge commit that combines the histories of main and the feature branch, preserving all work already done on the feature branch. After the merge, the feature branch contains both its own changes and the latest changes from main, which is ideal when you have already committed significant work.
Correct selection
Rebase the feature branch onto the latest main branch using `git rebase main` while on the feature branch.
Explanation
This is also correct. Rebasing rewrites the feature branch’s history so that its commits appear on top of the current tip of main, effectively incorporating the latest main changes. It results in a linear history, which many teams prefer, and is safe when the feature branch has not yet been shared with others.
Reset the feature branch to point to main with `git reset --hard main`, discarding all of your feature work.
Explanation
This is incorrect. A hard reset would move the feature branch pointer to main and delete any unpushed commits, causing loss of the significant changes you have already made. This approach defeats the purpose of preserving your feature work while incorporating main’s updates.
Cherry‑pick each commit from the main branch onto your feature branch one by one.
Explanation
This is incorrect. While cherry‑picking can copy individual commits, it is tedious and error‑prone for incorporating an entire set of changes, and it creates duplicate commits that can cause merge conflicts later. It is not a recommended strategy when you need to sync the whole branch.
Delete the feature branch, create a new branch from main, and manually reapply your changes.
Explanation
This is incorrect. Deleting the branch loses the commit history and makes it difficult to track what was done; manually reapplying changes is time‑consuming and increases the risk of errors. Proper Git workflows provide mechanisms (merge or rebase) that preserve history automatically.
Pull the feature branch with `git pull --no-ff` to incorporate main’s changes.
Explanation
This is incorrect. `git pull --no-ff` merges the remote tracking branch into the current branch, but it does not specifically bring in changes from the main branch unless you have set the upstream to main, which is atypical. Using pull in this context does not address the need to integrate main's commits into the feature branch correctly.
Overall explanation
The question tests knowledge of how to bring upstream changes into a feature branch after substantial work has been done. The two standard, safe methods are merging and rebasing: merging preserves existing commits and adds a merge commit, while rebasing rewrites the feature branch’s history onto the tip of main, yielding a linear history. Common misconceptions include using reset (which discards work), cherry‑picking (which is labor‑intensive and creates duplicate commits), recreating the branch from scratch (which loses history), and misusing pull options that do not target the main branch. Understanding the trade‑offs—merge for safety and clear history, rebase for a clean linear history when the branch is not yet shared—helps teams maintain a healthy repository. Best practice is to choose the strategy that aligns with the team’s workflow policy and to ensure that any rebasing is done before the branch is pushed publicly.
Domain
Git & Git Hub
Question 80
Skipped
A tech lead has asked you to review a pull request and provide feedback on the code quality. You notice that the code has been committed with a wrong author name due to a misconfigured Git setup. What is the MOST appropriate action?
Leave the author name as is because it does not affect the code functionality.
Explanation
This option is incorrect. While the code may run correctly, commit metadata is important for accountability, traceability, and compliance. Ignoring an inaccurate author attribution can cause confusion in audit trails and make it harder to credit the true contributor.
Revert the commit and ask the author to recommit with the correct author information.
Explanation
This option is not the best choice. Reverting creates an extra commit that clutters history and does not directly fix the metadata of the original change. A more precise approach is to rewrite the existing commit so that the history remains linear and clear.
Correct answer
Amend the commit to correct the author metadata (using git commit --amend --author or an interactive rebase) and force‑push the updated commit, after notifying the author.
Explanation
This option is correct. Amending rewrites the commit with the proper author information, preserving a clean history while ensuring accurate attribution. Notifying the author before force‑pushing respects collaboration policies and avoids surprise conflicts for teammates.
Change the author name in your local Git config and push a new commit that updates the author field.
Explanation
This option is incorrect. Updating the local config only affects future commits; it does not retroactively change the author of an already‑pushed commit. Adding a new commit with a different author would not correct the original metadata and would add unnecessary noise to the history.
Add a comment on the PR pointing out the wrong author but take no further action on the commit history.
Explanation
This option is incorrect. While documenting the issue is helpful, it leaves the repository with inaccurate metadata, which can cause long‑term traceability problems. Proper remediation should adjust the commit itself rather than just noting the mistake.
Fix the Git configuration globally for future commits but leave the existing commit unchanged.
Explanation
This option is partially correct for preventing future errors but does not address the current inaccurate commit. Best practice is to correct both the configuration and the existing commit to maintain a reliable audit trail. Leaving the wrong author in history defeats the purpose of accurate attribution.
Overall explanation
The question tests knowledge of proper Git commit attribution remediation. The most appropriate action is to amend the existing commit with the correct author information and force‑push it, after communicating with the author, because this fixes the metadata while keeping history clean. Common misconceptions include thinking that a wrong author does not matter, that a simple revert or comment is enough, or that only future configuration changes are needed. Those approaches either clutter history, leave incorrect data, or fail to correct the root cause. In real‑world workflows, teams should promptly correct inaccurate author data, use rebasing or amend commands responsibly, and coordinate force‑pushes to avoid disrupting collaborators.
Domain
Commit Attribution
Question 81
Skipped
As an SRE engineer, you are tasked with troubleshooting a Git repository issue where a developer has accidentally pushed a wrong commit to the main branch. The commit is already public, and you need to decide the best approach to revert the changes without affecting the downstream dependencies. What is the PRIMARY reason for this behaviour?
Perform a hard reset to the previous commit and force‑push the main branch.
Explanation
This approach rewrites the branch history. Because the commit is already public, force‑pushing will diverge the histories of every downstream clone, causing fetch/pull failures and merge conflicts. In real‑world SRE practice, rewriting shared history is avoided to keep CI pipelines and dependent services stable.
Use git rebase -i to edit the erroneous commit and then force‑push the updated branch.
Explanation
Interactive rebase also rewrites history, which has the same problems as a hard reset when the branch is shared. Downstream developers who have already pulled the bad commit will need to reconcile divergent histories, often resulting in lost work or complex conflict resolution. Therefore, this method is not suitable for a public main branch.
Correct answer
Run git revert on the bad commit and push the new revert commit.
Explanation
git revert creates a new commit that undoes the changes introduced by the bad commit while preserving the original history. Because no history is rewritten, all downstream clones remain compatible and CI systems continue to function without disruption. This is the recommended primary solution for correcting public commits in production branches.
Delete the main branch locally and recreate it from the remote before the bad commit.
Explanation
Deleting and recreating the branch would discard the entire commit history after the point of recreation, potentially removing legitimate changes and tags. It also forces every downstream consumer to reset their references, which is highly disruptive. This is not a standard practice for fixing a single erroneous commit.
Use git filter‑branch to rewrite history and remove the commit, then push the cleaned branch.
Explanation
filter‑branch rewrites the commit history across the entire branch, which, like reset or rebase, requires a force‑push. The operation is heavy, error‑prone, and will break all downstream repositories that referenced the original commits. Consequently it is unsuitable for a public main branch where only one commit needs to be undone.
Open a new pull request that reverts the changes using the Git Hub UI.
Explanation
While opening a PR that adds a revert commit is a safe workflow, the question asks for the primary reason behind the chosen approach, not the UI mechanism. The underlying principle remains the same: you must avoid rewriting history. Therefore this option describes a method, not the core rationale, making it an incorrect answer to the asked question.
Overall explanation
The scenario tests the understanding that public branches must never have their history rewritten because downstream clones, CI pipelines, and dependent services rely on a stable commit graph. The correct response is to use git revert, which adds a new commit that neutralises the bad changes while keeping the original history intact. Options involving reset, rebase, filter‑branch, or branch deletion all require a forced push and will cause divergent histories, leading to broken builds and developer friction. Using a pull request to revert is a valid workflow but does not address the primary reason for choosing revert, which is preserving history. Best practice for SREs and teams is to always prefer non‑destructive history‑preserving commands for public branches.
Domain
Version Control
Question 82
Skipped
A product engineer has asked you to review a Git repository setup for a new project. The project requires a specific Git configuration to achieve a zero-downtime deployment. Which configuration achieves this?
Correct answer
Set `core. bare = true` in the repository configuration.
Explanation
This is the correct configuration. A bare repository has no working tree, so the server can host a central repo that receives pushes while a separate working copy is checked out by a post‑receive hook. By updating the working copy in a different directory and then atomically switching a symlink to point to the new release, the service can continue serving traffic without interruption, achieving zero‑downtime deployment.
Set `receive. deny Non Fast Forwards = true` in the repository configuration.
Explanation
This option is incorrect for zero‑downtime deployment. The `receive. deny Non Fast Forwards` setting simply rejects pushes that would rewrite history, protecting against accidental forced updates. While valuable for repository integrity, it does not affect how the application files are served or updated, so it does not enable zero‑downtime releases.
Set `push. default = simple` in the global Git configuration.
Explanation
This option is incorrect. `push. default = simple` controls the default upstream branch when pushing, ensuring the push goes to the branch of the same name on the remote. It influences developer workflow but has no impact on deployment mechanics or the ability to switch traffic without downtime.
Set `pull. rebase = true` in the repository configuration.
Explanation
This option is incorrect. Enabling `pull. rebase` makes `git pull` reapply local commits on top of fetched changes, which can simplify local history but does not affect how the deployed code is checked out or served. Zero‑downtime deployment requires a strategy that isolates the live working tree from the push destination, which this setting does not provide.
Set `checkout. recreate Missing = true` in the repository configuration.
Explanation
This option is incorrect. `checkout. recreate Missing` tells Git to recreate missing files during a checkout, a safety feature for developers. It does not control where or how the working tree is located, nor does it support the atomic switch needed for zero‑downtime deployments.
Set `fetch. prune = true` in the global Git configuration.
Explanation
This option is incorrect. `fetch. prune` automatically removes remote-tracking references that no longer exist on the remote, keeping the local view tidy. While useful for repository hygiene, it has no bearing on deployment strategies or on providing uninterrupted service during releases.
Overall explanation
The question tests knowledge of how Git repository layout can be leveraged for zero‑downtime deployments. The key is using a bare repository (`core. bare = true`) on the server, which accepts pushes without a working tree, allowing a separate deployment directory to be updated and swapped atomically via a hook. Other settings like `receive. deny Non Fast Forwards`, `push. default`, `pull. rebase`, `checkout. recreate Missing`, and `fetch. prune` are useful for protecting history, simplifying push behavior, or cleaning up references, but they do not provide the isolation needed to serve new code without interrupting existing traffic. Learners should remember that zero‑downtime often follows a blue‑green or symlink‑swap pattern, and configuring the repository as bare is the foundational step. Misconceptions arise when developers assume any Git safety or convenience setting will affect deployment uptime, but deployment mechanics are distinct from version‑control policies.
Domain
Repository Layout
Question 83
Skipped
As a Dev Ops engineer, you're tasked with setting up a CI/CD pipeline for a new project on Git Hub. The project requires automated testing, code coverage, and deployment to a staging environment. Which TWO options are correct?
Correct selection
Use a Git Hub Actions workflow that runs tests on every push, uploads a code coverage report using the `actions/upload-artifact` action, and deploys the build to a staging environment defined in the repository's Environments feature.
Explanation
This option is correct. A single Git Hub Actions workflow can orchestrate testing, coverage collection, and deployment, and the Environments feature provides built‑in protection rules such as required reviewers. In practice, this yields an end‑to‑end pipeline that automatically validates code before it ever reaches staging, reducing manual hand‑offs.
Define a Git Hub Environment named "staging", add required reviewers for deployments, and configure the workflow to use the `environment` keyword so that the deployment job only runs after manual approval.
Explanation
This option is partially correct but not sufficient on its own. While defining an environment and requiring reviewers adds an important gate, it does not itself execute automated tests or capture code coverage. Without a preceding test job, code could be approved for deployment without any quality checks, which defeats the purpose of the pipeline.
Enable Git Hub Pages on the main branch and configure it to automatically deploy the latest build to the staging URL whenever code is merged.
Explanation
This option is incorrect. Git Hub Pages is intended for static site hosting, not for deploying application code to a staging environment that may require containers, databases, or runtime configuration. Using Pages would give a false sense of deployment and would not run tests or collect coverage, leading to potential broken releases reaching stakeholders.
Add a Dependabot configuration that opens pull requests for dependency updates and runs the same test suite, treating those PRs as staging releases.
Explanation
This option is incorrect. Dependabot is valuable for keeping dependencies up‑to‑date, but it does not provide the core CI steps of testing, coverage reporting, or deployment to a staging environment. Treating Dependabot PRs as staging releases would bypass the intended pipeline and could introduce untested changes into staging.
Correct selection
Protect the `staging` branch and require that the CI workflow passes all status checks (including coverage) before allowing merges, ensuring only code that passes tests reaches the staging environment.
Explanation
This option is correct. Branch protection rules enforce that the CI pipeline completes successfully, which includes test execution and coverage verification, before code can be merged into the staging branch. This guarantees that only validated code is ever deployed to staging, aligning with best‑practice CI/CD governance.
Create a webhook that points to an external Jenkins server, but do not add any Git Hub Actions; let Jenkins handle testing, coverage, and deployment independently.
Explanation
This option is incorrect for the given scenario. While an external Jenkins server can perform CI/CD, omitting Git Hub Actions forfeits Git Hub's native integration features such as Environments, status checks, and seamless secret management. Relying solely on a webhook makes the pipeline harder to observe from the Git Hub UI and can lead to synchronization issues between Git Hub and Jenkins.
Overall explanation
The question tests the learner's understanding of how to build a complete CI/CD pipeline using Git Hub's native features. Correct answers tie together automated testing, code coverage collection, and a controlled deployment to a staging environment, leveraging Git Hub Actions and branch protection rules. Options that only add approval gates without testing, or that misuse Git Hub Pages or Dependabot, are common misconceptions because they focus on a single feature while ignoring the end‑to‑end quality checks. Additionally, relying exclusively on external tools without Git Hub integration sacrifices visibility and built‑in safeguards. Best practice is to combine a well‑structured Actions workflow with branch protection and environment rules to ensure every change is verified before reaching staging.
Domain
Git & Git Hub
Question 84
Skipped
You're a developer working on an open-source project hosted on Git Hub, and you need to create a centralized location for project documentation. What is the MOST appropriate action?
Correct answer
Enable and use the repository's Wiki feature for documentation.
Explanation
This option is correct. Git Hub Wikis provide a built-in, version‑controlled space that is linked directly from the repository page, making it the most natural central hub for project docs. Using a Wiki keeps documentation close to the code, allows contributors to edit it via pull requests, and is discoverable by anyone browsing the repository.
Add a large README. md file to the repository root and keep all documentation there.
Explanation
This option is incorrect. While a README is valuable for an overview, it is not intended to hold extensive documentation such as API references, tutorials, or architecture diagrams. Overloading the README makes it difficult to navigate and can lead to a cluttered landing page, reducing readability for newcomers.
Create a separate repository named project-docs and link to it from the main repo.
Explanation
This option is incorrect. A separate repository isolates documentation from the codebase, breaking the close coupling that allows versioned changes alongside code updates. Maintaining two repositories also increases overhead for contributors who must remember to sync changes across both locations.
Use Git Hub Issues to write documentation in issue bodies.
Explanation
This option is incorrect. Issues are designed for tracking bugs, feature requests, and discussions, not for structured documentation. Storing docs in issues makes them hard to discover, does not provide a hierarchy, and mixes documentation with transient conversation threads, leading to confusion.
Store documentation in a private Gist and reference it in the README.
Explanation
This option is incorrect. Private Gists are not visible to the public, which defeats the purpose of open‑source documentation, and they are detached from the repository lifecycle. Linking to a Gist also means the docs won't be versioned together with the code, risking drift between code and documentation.
Upload PDF files directly to the repository's releases section for documentation.
Explanation
This option is incorrect. Releases are meant for binary assets tied to specific version tags, not for living documentation. PDFs are not easily searchable or updatable, and placing docs in releases forces users to download files rather than view them online, reducing accessibility.
Overall explanation
The question tests knowledge of best practices for centralizing documentation on Git Hub. The repository Wiki is the purpose‑built feature that offers version control, easy editing, and direct navigation from the repo home, making it the most appropriate choice. Common misconceptions include overusing README files, scattering docs across separate repos, or misusing issues, gists, and releases, each of which separates documentation from the code lifecycle or reduces discoverability. Maintaining documentation where it lives with the source code ensures contributors can update docs in the same pull request, keeping information accurate. In real-world open‑source projects, a well‑structured Wiki improves onboarding, reduces support requests, and promotes community contributions.
Domain
Documentation Management
Question 85
Skipped
A product engineer is tasked with creating a new feature for a web application, and they need to track progress and collaborate with the development team. Which Git Hub feature BEST satisfies these requirements?
Issues
Explanation
Issues are useful for reporting bugs, feature requests, and individual tasks, and they allow comments and assignees. However, they do not provide a visual board or roadmap to see the overall progress of a multi‑step feature across many tasks. Relying solely on Issues would make it hard to get a high‑level view of what has been completed versus what remains.
Pull Requests
Explanation
Pull Requests are designed for code review, merging changes, and integrating contributions, not for project‑wide progress tracking. While they include status checks and reviewers, they represent a single code change rather than an entire feature's workflow. Using Pull Requests as the primary tracking tool would leave out important planning elements such as task prioritization and backlog grooming.
Correct answer
Git Hub Projects
Explanation
Git Hub Projects provides customizable Kanban or table boards that let teams organize issues, pull requests, and notes into columns representing workflow stages. This feature is explicitly built for tracking progress, assigning work, and visualizing the status of a feature from inception to completion. In practice, a product engineer can create a Project board, add related issues, move them across columns, and the whole development team can collaborate in real time, satisfying both tracking and collaboration needs.
Git Hub Wiki
Explanation
The Wiki is intended for documenting project information, such as architecture diagrams or user guides, and does not include task management capabilities. While team members can edit pages collaboratively, the Wiki lacks features like status columns, assignees, or automated progress metrics. Consequently, using a Wiki to monitor feature development would provide documentation only, not actionable tracking.
Git Hub Discussions
Explanation
Discussions foster community conversation and brainstorming, allowing threaded discussions and polls, but they are not structured for tracking individual tasks or progress milestones. They are great for gathering ideas or feedback, yet they do not integrate with issues or provide a board view of work items. Therefore, Discussions would not meet the requirement of systematic progress tracking for a feature.
Git Hub Actions
Explanation
Git Hub Actions automates workflows such as testing, building, and deploying code, and while it can trigger on issue or pull‑request events, it does not provide a UI for tracking feature progress. Its focus is on CI/CD pipelines, not on visualizing task status or facilitating collaboration on planning. Relying on Actions alone would leave the team without a central place to see what work remains or who is responsible for each piece.
Overall explanation
The question tests knowledge of Git Hub's built‑in project management capabilities. Git Hub Projects is the dedicated tool for creating boards that combine issues, pull requests, and notes, allowing teams to track the lifecycle of a feature and collaborate by moving items across columns. Common misconceptions arise because Issues and Pull Requests also support collaboration, leading some to think they alone can manage progress, but they lack the holistic overview that Projects provides. Wikis, Discussions, and Actions serve other important functions—documentation, community dialogue, and automation—but are not meant for tracking work items across a development pipeline. Best practice is to use Projects for feature planning and progress tracking while linking related Issues and Pull Requests to maintain traceability.
Domain
Project Management
Question 86
Skipped
As a tech lead, you're responsible for ensuring that your team's codebase is well-organized and maintainable. You want to establish a clear workflow for managing issues, projects, and wiki documentation. Which THREE approaches should you take?
Correct selection
Implement issue templates and mandatory labels for new issues.
Explanation
This is correct. Issue templates provide a consistent structure for reporting bugs, feature requests, or tasks, while mandatory labels allow the team to categorize and prioritize work automatically. Consistent templates reduce back‑and‑forth clarification, and labeling enables powerful filtering and reporting in dashboards. In practice, teams that enforce templates see faster triage and fewer duplicated issues.
Rely solely on ad‑hoc issue titles without any labeling or templates.
Explanation
This is incorrect. Allowing free‑form issue creation leads to inconsistent information, making it harder to filter, assign, or prioritize work. Without labels or templates, the team spends extra time interpreting each issue, which can cause duplicated effort and missed deadlines. Real‑world teams that skip structured issue creation often experience a chaotic backlog and slower delivery.
Correct selection
Use Git Hub Projects (or Projects Boards) to organize issues into columns that match your workflow (e. g., To Do, In Progress, Done).
Explanation
This is correct. Projects Boards give a visual Kanban‑style view of work, allowing the tech lead to track progress across multiple milestones and sprints. By moving issues between columns, the team gets immediate insight into bottlenecks and capacity. Companies that adopt this practice report higher transparency and more accurate sprint forecasting.
Maintain the project's documentation exclusively in the repository's README, ignoring the Wiki feature.
Explanation
This is incorrect. While a README is useful for an overview, it is not intended for extensive, versioned documentation. The Wiki provides a separate space that supports multiple pages, history, and easier navigation for detailed guides, architecture diagrams, and onboarding material. Relying only on a README often results in a single, unwieldy file that quickly becomes difficult to maintain.
Correct selection
Enable the repository Wiki, create a documentation style guide, and link wiki pages to related issues or pull requests.
Explanation
This is correct. A Wiki gives a dedicated space for living documentation, and a style guide ensures consistency in formatting, terminology, and versioning. Linking wiki pages to issues or PRs creates traceability, so reviewers can see the rationale behind changes. Teams that integrate Wiki documentation in this way experience smoother onboarding and fewer knowledge gaps.
Configure a Git Hub Action that automatically closes every new issue after 24 hours to keep the issue tracker clean.
Explanation
This is incorrect. Automatically closing issues removes valuable work items before they can be evaluated, leading to lost bugs and feature ideas. Automation should assist triage, not replace human judgment; premature closure can damage trust with contributors. A better practice is to use automation for reminders or labeling, not for outright deletion of issues.
Overall explanation
The question tests knowledge of best practices for structuring a Git Hub repository's issue tracking, project planning, and documentation workflow. Correct approaches include using issue templates with mandatory labels, leveraging Projects Boards for visual workflow management, and employing the Wiki with a style guide and cross‑linking to ensure documentation stays current and discoverable. Common misconceptions include assuming ad‑hoc issue creation or auto‑closing issues will keep the backlog tidy, which actually leads to inconsistency and lost information. Ignoring the Wiki in favor of a bloated README limits the team's ability to maintain detailed, versioned docs. By applying the three correct strategies, a tech lead can foster clarity, traceability, and efficient collaboration across the team.
Domain
Issue and Project Workflow
Question 87
Skipped
A QA engineer is tasked with identifying and reporting bugs in a new feature, and they need to create a clear and concise report for the development team. What is the PRIMARY reason for using Git Hub issues in this context?
To store and version control the automated test scripts for the new feature.
Explanation
This option is incorrect. Git Hub Issues are designed for tracking tasks, bugs, and feature requests, not for storing large code files such as test scripts. Test scripts belong in the repository itself, where they can be versioned and reviewed through normal pull‑request workflows; putting them in issues would make them hard to manage and version.
To serve as a real‑time chat channel where developers and QA can instantly discuss bugs.
Explanation
This option is incorrect. While Issues support threaded comments, they are not a real‑time chat tool; discussions are asynchronous and meant to be persisted as part of the bug record. Real‑time conversations are better handled by chat platforms like Slack or Microsoft Teams, which integrate with Issues for notifications if needed.
Correct answer
To create a centralized, searchable record of each bug that can be linked to commits, pull requests, and the project's roadmap.
Explanation
This option is correct. Git Hub Issues provide a single source of truth for bugs, allowing each issue to be labeled, assigned, and linked directly to code changes via commit messages or pull requests. The searchable nature and integration with the project's workflow make it easy for the development team to prioritize, track progress, and reference the exact changes that resolve each bug.
To automatically trigger deployment pipelines whenever a new issue is opened.
Explanation
This option is incorrect. Opening an Issue does not by itself start a deployment; CI/CD pipelines are typically triggered by pushes, tags, or pull‑request events. Although webhooks can be set up to react to Issues, this is an advanced integration and not the primary purpose of using Issues for bug reporting.
To replace any existing bug‑tracking system entirely without any need for integration.
Explanation
This option is incorrect. While Git Hub Issues can serve as a lightweight tracker, many organizations retain dedicated bug‑tracking tools for advanced features like custom fields, SLA reporting, or complex workflows. Simply discarding an established system may cause loss of required data and disrupt processes that rely on specialized tracking capabilities.
To document only high‑level design decisions, keeping bug details separate in another tool.
Explanation
This option is incorrect. Issues are intended for actionable items such as bugs, tasks, or enhancements, not solely for high‑level design documentation. Design decisions are better captured in wikis, markdown files, or dedicated design docs, while bugs need the lifecycle management that Issues provide.
Overall explanation
The question tests the learner's understanding of why Git Hub Issues are the preferred tool for reporting bugs in a collaborative development environment. The primary advantage is that Issues give a centralized, searchable record that can be directly linked to commits and pull requests, enabling clear traceability and efficient workflow management. Common misconceptions include treating Issues as a storage location for code, a real‑time chat platform, or a trigger for deployment pipelines, each of which misuses the feature and can lead to workflow inefficiencies. Additionally, organizations may over‑estimate Issues as a complete replacement for specialized bug‑tracking systems without considering needed integrations or advanced capabilities. Best practice is to use Issues for tracking bugs and tasks while leveraging other Git Hub features (like Wiki or project boards) for design documentation and to integrate with CI/CD tools when appropriate.
Domain
Issue Tracking
Question 88
Skipped
A data engineer is working on a project that requires hosting a static website for data visualization, and they need to choose a suitable platform. Which configuration achieves this?
Host the site on an Amazon EC2 instance running Nginx and open port 80.
Explanation
This option is incorrect. While an EC2 instance with Nginx can technically serve static files, it requires provisioning, patching, and ongoing management of a virtual server, which is unnecessary for a purely static site. Using compute resources for static content inflates cost and operational overhead compared with purpose‑built static hosting services.
Create a private Git Hub repository and push the static files without any additional configuration.
Explanation
This option is incorrect. A private repository does not expose its contents to the public internet, and Git Hub Pages only renders sites from public repositories (or from a specific gh‑pages branch). Consequently, the visualization dashboard would remain inaccessible to end users.
Upload the HTML and Java Script files to an Amazon RDS instance and serve them via SQL queries.
Explanation
This option is incorrect. Amazon RDS is a managed relational database service; it stores structured data, not static web assets. Retrieving HTML or Java Script through SQL queries would be highly inefficient, add latency, and is not a supported pattern for website delivery.
Correct answer
Enable static website hosting on an Amazon S3 bucket, set the bucket policy for public read access, and optionally use Cloud Front for CDN.
Explanation
This option is correct. Amazon S3 provides a built‑in static website hosting feature that serves HTML, CSS, and Java Script directly from the bucket, while a bucket policy makes the content publicly readable. Adding Cloud Front supplies a global content‑delivery network, HTTPS, and caching, which are best practices for performant, secure static sites.
Deploy the static files to a Google Cloud Big Query dataset and query them for rendering.
Explanation
This option is incorrect. Big Query is an analytical data warehouse designed for large‑scale SQL queries, not for serving static web files. Attempting to use it as a file store would be both costly and impractical, as it lacks an HTTP endpoint for direct file delivery.
Configure an Azure Functions HTTP trigger to return the HTML content on each request.
Explanation
This option is incorrect. Although Azure Functions can return HTML, each request invokes serverless compute, incurring cold‑start latency and unnecessary execution costs for static assets. Static site hosting services avoid this overhead by delivering files directly from storage.
Overall explanation
The question tests the learner's understanding of purpose‑built static website hosting services versus generic compute or data platforms. Amazon S3 static website hosting (option 4) is expressly designed for serving immutable assets like HTML, CSS, and Java Script, and it integrates seamlessly with Cloud Front for global acceleration and TLS support. Options that rely on EC2, private Git Hub repos, RDS, Big Query, or serverless functions misapply resources that either require additional management, restrict public access, or introduce unnecessary latency and cost. Common misconceptions include assuming any cloud storage or compute service can double‑serve as a web host, or that a private code repository automatically becomes a public site. Best practice is to select the managed static‑site offering that matches the workload: S3, Azure Storage static sites, Google Cloud Storage, Netlify, or similar, which provide low‑cost, highly available, and secure delivery out‑of‑the‑box.
Domain
Static Site Hosting
Question 89
Skipped
As an architect, you're designing a new system that requires integrating multiple services and workflows. What is the KEY difference between Git Hub Actions and Git Hub Projects in this context?
Git Hub Actions provides a visual Kanban board for tracking issues, whereas Git Hub Projects runs CI pipelines.
Explanation
This statement reverses the actual purposes of the two features. Git Hub Actions does not provide a Kanban board; it executes automated workflows such as CI/CD pipelines. Confusing the two could lead an architect to try to track work items with Actions, which would never surface a board or issue list.
Both Git Hub Actions and Git Hub Projects are used to execute build scripts, but Projects adds built-in secret management.
Explanation
While Git Hub Actions does run build scripts and can use secrets, Git Hub Projects does not execute code at all and therefore does not need secret management for scripts. Projects is a planning tool, not an execution environment. Believing that Projects can run builds would result in failed automation attempts.
Git Hub Actions automates repository workflows, while Git Hub Projects stores compiled binaries for release distribution.
Explanation
Git Hub Actions indeed automates workflows, but Git Hub Projects does not serve as a binary storage location; releases or the Packages service handle artifacts. Projects is intended for organizing tasks, not for artifact management. Using Projects to host binaries would provide no storage capability and could cause confusion around release processes.
Correct answer
Git Hub Actions runs automated jobs (e. g., CI/CD pipelines) triggered by events, while Git Hub Projects is a flexible planning tool that organizes issues, pull requests, and notes on a board.
Explanation
This option correctly captures the core distinction: Actions executes code in response to repository events, and Projects provides a visual board for planning and tracking work. In practice, an architect would use Actions to build, test, and deploy services, and use Projects to map out feature milestones and assign tasks. Recognizing this split enables proper separation of automation and project management concerns.
Git Hub Projects is a deprecated feature that has been replaced by Actions for all automation needs.
Explanation
Git Hub Projects is not deprecated; it remains an active feature for project planning. Although Actions has grown in capability, it does not replace the board‑style view and hierarchical organization that Projects offers. Assuming Projects is obsolete could cause teams to lose valuable planning functionality.
Git Hub Actions and Git Hub Projects are interchangeable; you can choose either to manage your deployment pipelines.
Explanation
The two services serve distinct purposes and are not interchangeable. Actions handles the execution of deployment pipelines, whereas Projects manages the tracking of work items related to those pipelines. Selecting the wrong tool could result in missing automation (if you pick Projects) or lacking visibility into work progress (if you pick Actions).
Overall explanation
The question tests the learner's understanding of the fundamental separation between automation (Git Hub Actions) and planning/trackability (Git Hub Projects). Git Hub Actions is an event‑driven CI/CD engine that runs scripts, containers, or reusable workflows; Git Hub Projects is a board‑based system for organizing issues, pull requests, and notes. The correct answer highlights this contrast, while each distractor mixes up functionalities, assumes deprecation, or suggests interchangeability—common misconceptions among new users. In real‑world architecture, you would define your pipelines with Actions and use Projects to visualize milestones, assign responsibilities, and track progress. Remember to align each feature with its intended purpose to avoid gaps in automation or project visibility.
Domain
Workflow Management
Question 90
Skipped
A developer is experiencing issues with their code and needs to troubleshoot the problem. They've identified a potential issue with their Git Hub Pages configuration. What is the MOST likely root cause?
The repository name does not follow the required naming convention for a user or organization site (e. g., missing the "username. github. io" pattern).
Explanation
This option is incorrect. The naming convention only matters for user or organization pages, not for project pages that are served from any repository. A mismatched repository name would not prevent a project site from building if the Pages source is correctly configured, so the developer would not see the typical 404 or build failure caused by this issue.
The CNAME file contains an invalid domain name, causing DNS resolution errors for the custom domain.
Explanation
This option is incorrect. While an incorrect CNAME can break a custom domain, it does not stop Git Hub Pages from building the site itself; the site would still be accessible via the default *. github. io URL. The problem described is a configuration issue that prevents the site from being generated, not a DNS problem.
Correct answer
The Git Hub Pages source is set to a branch or folder that does not contain the site’s HTML files, such as pointing to the "master" branch when the site lives in the "gh-pages" branch.
Explanation
This option is correct. Git Hub Pages builds the site only from the branch or folder specified in the repository settings; if the selected source lacks the required index. html or other assets, the build will fail or result in a blank page. In real-world scenarios, developers often forget to switch the source after creating a separate deployment branch, leading to the exact symptoms described.
The project contains an index. html file, but it is named "Index. html" with a capital "I", causing case‑sensitivity issues on the server.
Explanation
This option is incorrect. Git Hub Pages runs on a case‑insensitive file system for HTML files, so "Index. html" would still be served correctly. While case mismatches can cause problems in some environments, they are not the most common cause of a Pages build failure.
Git Hub Pages is disabled for private repositories, so the site cannot be built from a private repo.
Explanation
This option is incorrect. Git Hub Pages can be enabled on private repositories for users with a paid plan, and the feature is not globally disabled for private repos. The issue described would manifest as a configuration error rather than an outright prohibition, making this a misconception.
The repository is missing a . nojekyll file, causing Jekyll to process files that should be served as static assets.
Explanation
This option is incorrect. The . nojekyll file is only required when you need to bypass Jekyll processing for files that begin with an underscore; its absence does not prevent the site from building. Most simple static sites build fine without it, so the lack of a . nojekyll file is not the most likely cause of the failure.
Overall explanation
The question tests knowledge of how Git Hub Pages determines which content to build and serve. The most common root cause of a broken Pages site is selecting the wrong source branch or folder in the repository settings, which means the build process cannot find the required files. Options 1, 2, 4, 5, and 6 each represent plausible but incorrect misconceptions: naming conventions only affect user/organization sites, DNS issues arise only after a successful build, case sensitivity is not a problem on Git Hub's servers, Pages can be enabled on private repos with the right plan, and the . nojekyll file is optional for most projects. Understanding that the Pages source must point to the actual content branch eliminates these other distractors. Best practice is to verify the Pages source setting after creating or moving the site files, and to confirm that the chosen branch contains a valid index. html at its root.
Domain
Git Hub Pages
Question 91
Skipped
As a developer, you're working on a new feature that requires collaboration with multiple stakeholders. You need to create a clear and concise project plan and track progress. Which TWO options are correct?
Write the entire project plan in the repository’s README file and rely on collaborators to read it.
Explanation
This option is incorrect. While a README can provide high‑level context, it lacks the structured fields needed for task breakdown, assignees, and status tracking. Without linking to individual issues or milestones, collaborators cannot easily see what work is in progress or completed, leading to missed deadlines and ambiguous ownership.
Correct selection
Define a Milestone for the feature and associate related issues and pull requests with that milestone.
Explanation
This option is correct. Milestones act as a timeline container that groups related issues and pull requests, giving the team a single target date and a clear progress indicator. When issues are closed, the milestone automatically updates its completion percentage, helping stakeholders see how close the feature is to delivery. In practice, teams use milestones to reflect release versions or sprint goals, providing predictable delivery forecasts.
Use a single large Git Hub Issue to hold the plan, checklist, and all tasks, without linking individual issues.
Explanation
This option is incorrect. A monolithic issue can become unwieldy, making it difficult to assign specific tasks, set due dates, or track individual progress. Git Hub’s interface does not surface sub‑tasks in a way that enables filtering or reporting, which hampers visibility for multiple stakeholders. Real‑world teams usually break work into many small, assignable issues to maintain clarity and accountability.
Correct selection
Create a Git Hub Project board and add issues as cards to visualize workflow and status.
Explanation
This option is correct. Projects (now called Projects) provide a Kanban‑style board where issues and pull requests can be moved across columns such as To‑Do, In‑Progress, and Done. This visual representation makes it easy for all stakeholders to see the current state of work, identify bottlenecks, and prioritize tasks. Companies often pair Projects with automation (e. g., Git Hub Actions) to automatically advance cards when PRs are merged, ensuring the board stays up‑to‑date.
Track progress only by the number of commits pushed to the main branch.
Explanation
This option is incorrect. Commit counts do not reflect whether individual features or tasks are complete, nor do they show who is responsible for each change. Relying solely on commits can mask problems such as large, unrelated changes or unfinished work that has been committed but not yet integrated. Effective tracking requires linking work items (issues, milestones) to commits, not just counting them.
Create a separate private repository to store the project plan and share it via email with stakeholders.
Explanation
This option is incorrect. Storing the plan in a separate repository disconnects it from the actual codebase, making it hard to trace which issues or pull requests relate to which part of the plan. Email distribution further reduces visibility, as updates are not automatically surfaced to the development workflow. Integrated tools like Projects and Milestones keep planning and tracking co‑located with the code, ensuring alignment and traceability.
Overall explanation
The question tests knowledge of Git Hub's built‑in project management features that enable clear planning and progress tracking. Milestones and Projects are the two primary mechanisms that integrate directly with issues and pull requests, providing timeline grouping and visual workflow status respectively. Common misconceptions include using static documents like READMEs or external repositories, which lack real‑time linkage to code changes, and relying on commit counts or monolithic issues, which do not provide granular visibility or accountability. Best practice is to break work into discrete, assignable issues, group them under a milestone for deadline alignment, and use a Project board to visualize the flow from backlog to completion. This approach ensures all stakeholders have a single source of truth and can monitor progress without hunting through unrelated artifacts.
Domain
Project Management
Question 92
Skipped
A security engineer is tasked with ensuring that a company's Git Hub repositories are compliant with industry regulations. What is the MOST appropriate action?
Require each developer to manually review the repository for compliance before each push.
Explanation
This option is incorrect because manual reviews for every push are impractical and error‑prone. Compliance is better achieved through automated, enforceable policies that operate at the platform level. Relying on human checks can result in missed violations and delays, which could cause audit failures.
Turn off public exposure by making all repositories private without further controls.
Explanation
Making repositories private improves confidentiality but does not address many regulatory requirements such as code scanning, secret detection, or signed commits. Regulations often demand evidence of secure development practices, not merely access restrictions. Without additional safeguards, secrets could still be committed and go undetected, leading to data breaches.
Use Git Hub Actions to run custom compliance scripts once a month.
Explanation
Running compliance checks on a monthly schedule is insufficient for continuous security posture. Regulations typically require ongoing monitoring, and monthly runs leave long windows where non‑compliant code could be merged. Moreover, custom scripts may miss the depth of analysis provided by native Git Hub security features.
Correct answer
Enable Git Hub Advanced Security (code scanning and secret scanning) for all repositories.
Explanation
This is the correct action because Git Hub Advanced Security provides built‑in, continuously running code scanning and secret scanning that align with many industry standards. These features automatically flag vulnerabilities and exposed credentials at commit time, ensuring compliance is enforced in real time. Organizations that enable these controls can demonstrate to auditors that they have proactive, automated processes for secure code development.
Rely on external third‑party audit tools only, leaving Git Hub settings unchanged.
Explanation
While third‑party tools can supplement security, ignoring native Git Hub controls creates gaps in protection. Built‑in features such as branch protection and secret scanning are tightly integrated with the platform and provide real‑time enforcement that external scans cannot match. Sole reliance on external audits may lead to non‑compliance findings because the repository itself lacks enforced safeguards.
Only enforce commit signing on the main branch.
Explanation
Enforcing commit signing solely on the main branch is a partial measure and does not satisfy the breadth of regulatory requirements. Regulations often require integrity checks across all branches, as well as vulnerability detection, which commit signing alone does not provide. Without broader policies, insecure code could still be merged into feature branches and later promoted, exposing the organization to risk.
Overall explanation
The core concept tested is the use of automated, platform‑native security controls to achieve continuous compliance in Git Hub repositories. Enabling Git Hub Advanced Security, which includes code scanning and secret scanning, provides real‑time detection of vulnerabilities and exposed credentials, directly satisfying many regulatory mandates. Options that rely on manual reviews, simple privacy settings, infrequent custom scripts, or external tools alone miss the need for continuous, enforceable safeguards. Common misconceptions include believing that making repos private or using occasional scans is enough, or that commit signing alone guarantees compliance. Best practice is to adopt Git Hub's built‑in security features across all repositories and combine them with appropriate branch protection rules to demonstrate a robust, auditable security posture.
Domain
Repository Security