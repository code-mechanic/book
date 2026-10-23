Git & GitHub Interview Questions with Answers Practice Test 5 - Results
Attempt 1





Question 1
Skipped
As a Dev Ops engineer, you are tasked with setting up a CI/CD pipeline for a new project on Git Hub. The project requires automated testing and deployment to a staging environment.
Correct selection
Git Hub Actions
Explanation
This is a correct choice. Git Hub Actions lets you define workflow files that run on events such as pushes or pull‑request merges. Within those workflows you can execute unit, integration, or end‑to‑end tests and then trigger deployment steps, making it the primary tool for implementing CI/CD on Git Hub.
Git Hub Packages
Explanation
This is an incorrect choice. Git Hub Packages is a package registry for storing and sharing container images, npm packages, Maven artifacts, and more. While it can be a destination for build artefacts, it does not itself run tests or orchestrate deployments, so it cannot replace a CI/CD engine.
Git Hub Pages
Explanation
This is an incorrect choice. Git Hub Pages provides static site hosting directly from a repository, primarily for documentation or personal webpages. It does not offer the testing pipelines or deployment‑to‑staging capabilities needed for a general application CI/CD workflow.
Correct selection
Git Hub Environments
Explanation
This is a correct choice. Environments let you define target deployment contexts such as "staging" or "production" and can be linked to specific secrets, reviewers, and protection rules. When combined with Actions, you can automatically promote builds to the staging environment after successful tests, ensuring controlled and auditable deployments.
Git Hub Pull Request Templates
Explanation
This is an incorrect choice. Pull request templates help standardise the information contributors provide when opening a PR, but they do not automate any testing or deployment steps. Relying on templates alone would leave the CI/CD process unimplemented.
Git Hub Security Alerts
Explanation
This is an incorrect choice. Security alerts notify repository owners of vulnerable dependencies, which is valuable for security hygiene but unrelated to orchestrating test suites or deploying code to a staging environment. Using them alone would not achieve CI/CD automation.
Overall explanation
The question tests knowledge of the native Git Hub features that enable end‑to‑end continuous integration and continuous delivery. Git Hub Actions provides the workflow engine to run automated tests and execute deployment scripts, while Git Hub Environments defines the specific target (e. g., staging) and adds controls such as required reviewers or secrets. The other options—Packages, Pages, Pull Request Templates, and Security Alerts—serve useful but orthogonal purposes and cannot by themselves orchestrate a full CI/CD pipeline. A common misconception is to assume that any Git Hub service related to code delivery can act as a CI/CD tool, but only Actions and Environments directly manage the run‑time execution and environment gating needed for automated testing and staged releases. Best practice is to combine Actions workflows with Environments to enforce quality gates, protect credentials, and provide audit trails before code reaches production.
Domain
CI/CD
Question 2
Skipped
As a developer, you are working on a new feature and need to collaborate with your team on the implementation. You have created a new branch and pushed it to Git Hub. What is the MOST appropriate action to request feedback from your team?
Send an email to the team with the branch URL asking for a review.
Explanation
This option is incorrect. While email can convey the link, it bypasses Git Hub's built‑in review tools such as line‑by‑line comments, status checks, and reviewer assignment. Relying on email often leads to missed comments, untracked feedback, and reduces the auditability of the review process.
Add a comment on the latest commit and tag teammates in that comment.
Explanation
This option is also incorrect. Tagging teammates in a commit comment notifies them, but it does not provide a structured review environment, cannot enforce required approvals, and does not show the diff in a consolidated view. Commit comments are intended for brief notes, not for a formal code‑review workflow.
Correct answer
Open a Pull Request on Git Hub and assign reviewers.
Explanation
This option is correct. A Pull Request (PR) creates a dedicated space for discussion, inline commenting, and automated checks, making it the standard mechanism for requesting team feedback. Assigning reviewers ensures that the right people are notified and that their approvals can be required before merging, which supports a controlled and auditable workflow.
Create a new Git Hub Issue describing the feature and link to the branch.
Explanation
This option is incorrect. Issues are meant for tracking work items, bugs, or enhancements, not for detailed code reviews. While linking the branch in an issue can provide context, it lacks the review features of a PR such as diff view, required reviewers, and merge gating, so feedback may be fragmented.
Directly merge the branch into the main branch and notify the team afterwards.
Explanation
This option is incorrect and risky. Merging before a review bypasses the safety net of peer review, potentially introducing bugs or breaking changes into the main line. Notifying the team after the fact defeats the purpose of collaborative quality checks and can cause rework if issues are discovered later.
Use the 'git push --force-with-lease' command to update the remote branch before feedback.
Explanation
This option is incorrect. The '--force-with-lease' flag is a low‑level Git operation used to rewrite history safely, but it does not request feedback from teammates. Misusing force pushes can overwrite teammates' work and create confusion, especially when the goal is to solicit a review.
Overall explanation
The question tests knowledge of the standard collaboration workflow on Git Hub, specifically how developers request formal feedback on new code. Opening a Pull Request and assigning reviewers is the recommended practice because it provides a dedicated review interface, integrates with CI checks, and allows required approvals before merging. Common misconceptions include using email, commit comments, or issues for reviews, which lack the structured review features and may lead to missed or undocumented feedback. Directly merging without review or using force pushes bypasses quality controls and can introduce defects into the main branch. Following the Pull Request workflow ensures traceability, accountability, and a smoother collaboration experience for the whole team.
Domain
Pull Requests
Question 3
Skipped
As a tech lead, you are responsible for managing the documentation for your team's project on Git Hub. You need to create a knowledge base that is easily accessible to the team and stakeholders. Which THREE Git Hub features should you use to create this knowledge base?
Correct selection
Git Hub Wiki
Explanation
This is correct. Git Hub Wiki provides a built‑in, version‑controlled space for project documentation that can be organized into pages and subpages. It is separate from the code but lives in the same repository, making it easy for contributors to edit and keep up to date. Teams often use the Wiki as the primary internal knowledge base because it is searchable and automatically linked from the repository view.
Correct selection
Git Hub Pages
Explanation
This is correct. Git Hub Pages allows you to publish a static website directly from a repository, which is ideal for creating polished, externally facing documentation portals. By using a static site generator like Jekyll or Mk Docs, you can turn Markdown files into a full‑featured docs site that stakeholders can browse without needing a Git Hub account. Many organizations use Pages as the public face of their knowledge base while keeping the source files versioned alongside the code.
Correct selection
README file in the repository's default branch
Explanation
This is correct. The README. md displayed on the repository home page serves as an immediate entry point for anyone visiting the project, summarizing purpose, setup, and key concepts. Because it is rendered automatically by Git Hub, no extra configuration is required, and contributors can edit it with the same pull‑request workflow used for code. Maintaining a comprehensive README is a best‑practice for ensuring that the most critical information is always visible.
Git Hub Issues
Explanation
This is incorrect. Issues are designed for tracking bugs, feature requests, and task discussions, not for structured documentation. While you can attach labels and search issues, the format is not suited for hierarchical or navigable knowledge bases. Relying on Issues for documentation often leads to fragmented information and makes it hard for stakeholders to locate the content they need.
Git Hub Projects
Explanation
This is incorrect. Projects provides Kanban‑style boards for planning and workflow management, not for authoring or presenting documentation. Using Projects as a knowledge base would mix task tracking with content, resulting in poor discoverability and version control. Many learners mistakenly think a board can double as a doc hub, but it lacks the Markdown rendering and version history needed for reliable documentation.
Git Hub Actions
Explanation
This is incorrect. Git Hub Actions automates CI/CD pipelines and other workflows; it does not display or organize documentation for users. Although you can trigger documentation builds with Actions, the feature itself is not a repository for knowledge base content. Confusing automation tools with documentation platforms is a common mistake that can lead to misplaced effort and missing documentation for end users.
Overall explanation
The question tests knowledge of the Git Hub features that are purpose‑built for creating and publishing documentation. Git Hub Wiki, Git Hub Pages, and the repository README are the three primary mechanisms that provide versioned, searchable, and easily accessible documentation for both team members and external stakeholders. Common misconceptions arise because other Git Hub tools—such as Issues, Projects, and Actions—are visible in the UI and often interacted with, leading learners to think they can serve as documentation repositories. However, Issues are for tracking work items, Projects for workflow visualization, and Actions for automation, none of which provide the structured, navigable format required for a knowledge base. Best practice is to combine a README for quick start information, a Wiki for detailed internal docs, and a Pages site for polished external documentation, keeping all sources under version control for consistency.
Domain
Documentation
Question 4
Skipped
As a QA engineer, you are tasked with testing a new feature on a Git Hub project. You have identified a bug and need to report it to the development team. Which Git Hub feature should you use to report the bug?
Pull Request
Explanation
A Pull Request is intended for proposing code changes that can be reviewed and merged into the main branch. It is not designed to serve as a bug‑reporting mechanism, so using it for that purpose would mix concerns and make it harder for developers to track actual defects. In practice, a bug reported via a PR might be ignored or lose traceability because it lacks the metadata and workflow that Issues provide.
Wiki page
Explanation
The Wiki feature is meant for documentation, tutorials, and reference material related to the repository. While you could write a description of a bug on a Wiki page, it would not be searchable, assignable, or linkable to code changes, which defeats the purpose of systematic bug tracking. Teams that rely on wikis for bug reports often struggle to prioritize fixes because the information is scattered and lacks proper workflow integration.
Correct answer
Issue
Explanation
Git Hub Issues are the dedicated feature for reporting bugs, enhancements, and tasks. They provide fields for titles, descriptions, labels, assignees, and milestones, enabling the development team to triage, prioritize, and reference the bug throughout its lifecycle. For example, a QA engineer can open an Issue, tag it with a "bug" label, assign it to a developer, and link it to failing test results, ensuring clear communication and traceability.
Project board
Explanation
Project boards help visualise and organize existing Issues and Pull Requests into columns such as "To Do" or "In Progress." They do not create new items; they merely display items that already exist elsewhere. Using a Project board to report a bug would require first creating an Issue or PR, making the board a secondary step rather than the primary reporting mechanism.
Discussion thread
Explanation
Discussions are designed for open‑ended conversations, brainstorming, or community Q&A, not for formal bug tracking. While a discussion could surface a bug, it lacks the structured metadata, assignment capabilities, and integration with CI/CD pipelines that Issues provide. Consequently, bugs reported via Discussions often go unnoticed or cannot be linked to code changes efficiently.
Commit comment
Explanation
A commit comment is attached to a specific commit and is useful for giving feedback on that exact change. It is not a place to open a new bug report, especially when the bug may relate to multiple files or future work. Relying on commit comments for bug reporting can lead to fragmented information and makes it difficult to track the bug's progress across different branches and releases.
Overall explanation
Git Hub provides several collaborative features, but Issue tracking is the primary tool for reporting and managing bugs. Issues allow QA engineers to create a structured record that can be labeled, assigned, linked to code, and integrated into project workflows, ensuring the defect is visible and actionable. Common misconceptions include using Pull Requests, Wikis, or Discussions for bug reports, which either serve different purposes or lack the necessary tracking capabilities. Project boards and commit comments are auxiliary tools that rely on Issues as the source of truth. Best practice is to open an Issue for every bug, provide reproducible steps, and leverage labels and milestones to prioritize and monitor resolution.
Domain
Issue Tracking
Question 5
Skipped
As a product engineer, you are responsible for managing the project's Git Hub pages. You need to create a new page that showcases the project's features and benefits. What is the PRIMARY reason for using Git Hub pages for this purpose?
Git Hub Pages offers built‑in support for server‑side scripting languages like PHP, allowing dynamic content generation.
Explanation
This option is incorrect. Git Hub Pages only serves static files; it does not execute server‑side code such as PHP, Ruby, or Node. js. Attempting to use dynamic scripting would result in the code being delivered as plain text, breaking the page and confusing visitors.
It provides an unlimited free storage quota for binary assets, making it ideal for hosting large files.
Explanation
This statement is false. Git Hub Pages enforces size limits on repositories (typically 1 GB) and is intended for HTML, CSS, and Java Script, not for large binary distributions. Hosting large binaries there would quickly exceed quotas and could lead to repository throttling or bans.
Git Hub Pages automatically integrates with issue tracking, turning pages into interactive issue boards.
Explanation
This is a misconception. While Git Hub issues are part of the same repository, Git Hub Pages does not provide any built‑in UI to display or interact with issues on a static site. To show issues you would need to embed external widgets or use the API, which is not an automatic feature of Pages.
Correct answer
It delivers free static‑site hosting directly from a repository, so any commit to the source updates the live site instantly.
Explanation
This option is correct. Git Hub Pages hosts static sites at no cost and ties the site to a specific branch or folder in the repository, so each push triggers an automatic rebuild and deployment. This tight integration allows the product engineer to keep the feature showcase up‑to‑date simply by committing changes, ensuring the live page always reflects the latest code.
Git Hub Pages includes a built‑in continuous‑integration runner that can execute tests on every page view.
Explanation
This is inaccurate. Continuous‑integration (CI) workflows run via Git Hub Actions, which are separate from Pages and are not triggered by page views. Pages only serves the compiled static assets; any testing must be configured independently and does not affect page delivery.
Using Git Hub Pages guarantees higher search‑engine rankings because the service automatically adds SEO metadata.
Explanation
This claim is incorrect. While a well‑structured static site can be SEO‑friendly, Git Hub Pages does not automatically insert SEO tags or guarantee better rankings. Optimizing for search engines still requires the author to add appropriate meta tags, structured data, and content relevance.
Overall explanation
The question tests the learner's understanding of why Git Hub Pages is the go‑to solution for publishing a project showcase. The primary advantage is that it provides free, integrated static‑site hosting that updates automatically on each commit, eliminating the need for separate servers or deployment pipelines. Common misconceptions include believing Pages can run server‑side code, store unlimited binaries, or automatically manage issues and SEO, all of which are not features of the service. Recognizing the static nature of Pages helps engineers design their site accordingly, using build tools to generate HTML, CSS, and Java Script before pushing. Best practice is to keep the site in a dedicated branch (e. g., gh‑pages or docs) and leverage Git Hub Actions only when additional build steps are required, while relying on the native Pages deployment for simplicity and cost efficiency.
Domain
Git Hub Pages
Question 6
Skipped
As a data engineer, you are working on a project that requires data visualization. You have created a new repository on Git Hub and need to create a wiki page that documents the data visualization process. Which Git Hub feature should you use to create this wiki page?
Repository README
Explanation
This option is incorrect. The README file is displayed on the main repository page and is intended for a brief overview or quick start guide, not for multi‑page, structured documentation. Using a README for a full data‑visualization process would quickly become unwieldy and difficult to navigate.
Git Hub Pages
Explanation
This option is incorrect. Git Hub Pages hosts static websites and is suitable for publishing documentation or demos, but it requires setting up a separate branch or folder with HTML/CSS assets. While you could create a site for your visualization process, it does not provide the built‑in wiki editing interface that Git Hub wikis offer.
Issues
Explanation
This option is incorrect. Issues are designed for tracking bugs, feature requests, or discussion topics, not for authoring structured documentation. Creating a wiki page as an issue would mix documentation with project management and make it harder for collaborators to locate the information later.
Projects
Explanation
This option is incorrect. Projects provide Kanban‑style boards for organizing tasks and workflows, not for storing narrative or instructional content. Attempting to use a Project board as a documentation venue would result in a fragmented view of the visualization steps and would not support rich text formatting.
Correct answer
Wiki
Explanation
This option is correct. Git Hub's Wiki feature creates a separate area attached to the repository where you can build multi‑page, markdown‑based documentation with its own navigation sidebar. It is the recommended tool for detailed process guides, such as documenting a data‑visualization pipeline, allowing team members to edit, version, and browse the content easily.
Pull Requests
Explanation
This option is incorrect. Pull requests are used to propose, review, and merge code changes; they are not a venue for standalone documentation. While you can discuss documentation changes within a PR, the final documentation should reside in a README or a Wiki, not as a PR itself.
Overall explanation
The question tests knowledge of Git Hub's built‑in documentation tools. The correct feature for creating structured, multi‑page documentation is the Wiki, which offers a dedicated editing interface, version control, and a navigation sidebar. Common misconceptions include confusing the README (a single file) with a full wiki, mistaking Git Hub Pages for internal documentation (it is for static sites), and assuming Issues or Projects can serve as documentation repositories (they serve different collaboration purposes). In practice, teams use wikis for detailed technical guides, design decisions, and process documentation, keeping the main codebase clean while providing searchable, versioned references. Selecting the appropriate feature ensures that documentation remains accessible, maintainable, and aligned with Git Hub's collaboration workflow.
Domain
Wikis
Question 7
Skipped
As an architect, you are responsible for designing a new system that integrates with Git Hub. You need to automate the deployment of the system to a production environment. Which TWO Git Hub features should you use to achieve this?
Correct selection
Git Hub Actions
Explanation
This is correct. Git Hub Actions enables you to define CI/CD workflows that can build, test, and deploy code automatically whenever events such as pushes or pull‑request merges occur. By creating a workflow that runs on the main branch and uses deployment jobs, you can push your application directly to production servers or cloud services without manual intervention.
Correct selection
Git Hub Environments
Explanation
This is correct. Environments let you model target deployment destinations like "staging" or "production" and attach protection rules, required reviewers, and secrets that are scoped to that environment. When a workflow in Git Hub Actions deploys to a protected environment, it can enforce approvals and securely inject production credentials, ensuring safe automated releases.
Git Hub Webhooks
Explanation
This is incorrect. Webhooks simply send HTTP POST payloads to external services when certain events happen on the repository; they do not themselves execute build or deployment steps. While a webhook could trigger an external CI system, it does not provide the native, end‑to‑end automation and secret management that Actions and Environments supply, making it a sub‑optimal choice for direct production deployment.
Git Hub Packages
Explanation
This is incorrect. Packages is a registry for container images, npm packages, Maven artifacts, etc., allowing you to store and share build artifacts. It does not orchestrate the act of deploying those artifacts to a production environment, so using it alone would not automate the deployment pipeline.
Git Hub Pages
Explanation
This is incorrect. Git Hub Pages is a static site hosting service intended for documentation, blogs, or simple websites directly from a repository. It cannot be used to deploy arbitrary applications or services to a production environment, and it lacks the workflow capabilities needed for automated releases of non‑static code.
Git Hub Codespaces
Explanation
This is incorrect. Codespaces provides cloud‑based development environments that developers can spin up on demand; it is not a deployment tool. Though useful for development and testing, it does not orchestrate production deployments or manage environment-specific secrets, so it does not meet the automation requirement described.
Overall explanation
The question tests knowledge of Git Hub's native CI/CD and deployment controls. Git Hub Actions is the core automation engine that runs workflows to build, test, and push code, while Git Hub Environments adds a layer of protection, secret scoping, and approval gating for production releases. Many learners mistakenly think that webhooks, packages, pages, or codespaces can replace these features, but each serves a different purpose: webhooks only notify external services, packages store artifacts, pages host static content, and codespaces are development sandboxes. Understanding when to combine Actions with Environments is essential for creating reliable, secure, and auditable deployment pipelines. In practice, an architect would define an Action workflow that assembles the application, then uses the Environments feature to require a manual review before the final deployment step runs, ensuring both automation and governance.
Domain
CI/CD
Question 8
Skipped
As a developer, you are working on a new feature and need to create a new issue on Git Hub to track the progress. What is the MOST likely root cause of a Git Hub issue not being assigned to a team member?
Correct answer
The assignee does not have write permission on the repository.
Explanation
This is the correct answer. Git Hub only allows users with at least Write access to be assigned to issues in a repository. If a team member is only a reader or has not been added as a collaborator, the assignment dropdown will not list them, and any attempt to assign will be ignored. In practice, this leads to confusion when a task appears unassigned despite the developer's effort to select a teammate.
The issue label conflicts with the repository's required labels.
Explanation
This is incorrect. Labels are metadata used for categorization and filtering; they do not affect the ability to assign an issue to a user. Even if a label is missing or incorrect, the assignee field operates independently. Confusing label requirements with assignment permissions is a common misconception among new Git Hub users.
The repository is archived, preventing new assignments.
Explanation
This is partially plausible but not the most likely cause. While archived repositories are read‑only and you cannot modify issues, most teams do not archive active repositories, and the UI will usually hide the assignment controls altogether. New issues are rarely created in archived repos, so this scenario is less common than permission issues.
The issue is created in a forked repository rather than the upstream repo.
Explanation
This is incorrect. Issues can be created and assigned in any repository where the user has appropriate permissions, including forks. The fork being separate from the upstream does not inherently block assignment, though the assignee must have access to that fork. Mistaking fork contexts for assignment failures is a frequent misunderstanding for developers working with contribution workflows.
Automatic assignment rules are disabled in the repo settings.
Explanation
This is incorrect. Automatic assignment (via bots or Git Hub Actions) is optional, but manual assignment is always possible for users with the right permissions. Disabling automation merely means issues won't be auto‑assigned; it does not stop a developer from manually assigning a teammate. Some learners mistakenly think that enabling auto‑assign is required for any assignment to occur.
The issue already has an assignee, and Git Hub prevents multiple assignees.
Explanation
This is incorrect. Git Hub allows multiple assignees on a single issue (up to 10) provided the users have sufficient permissions. The presence of an existing assignee does not block adding another. New users sometimes believe only one person can be assigned, which can lead to unnecessary reassignments.
Overall explanation
The question tests knowledge of Git Hub permission models as they relate to issue assignment. The most frequent reason an issue cannot be assigned is that the intended assignee lacks the necessary Write (or higher) permission in the repository, making option 1 correct. Options 2, 4, and 5 confound unrelated features—labels, forks, and automation—with assignment mechanics, which is a common source of confusion for newcomers. Option 3 describes a scenario that would outright block any changes, but archiving is rarely the cause of a single assignment failure. Option 6 misrepresents Git Hub's support for multiple assignees, another typical misunderstanding. Best practice: always verify that team members are added as collaborators with appropriate access levels before expecting them to be assignable to issues.
Domain
Issues Management
Question 9
Skipped
As a Dev Ops/SRE engineer, you are responsible for managing the Git Hub actions for a project. You need to create a new action that automates the deployment of the project to a staging environment. Which Git Hub feature should you use to create this action?
Git Hub Apps
Explanation
Git Hub Apps are external integrations that can respond to webhook events and call the Git Hub API, but they do not provide a built‑in way to define step‑by‑step deployment pipelines. Creating a deployment workflow with a Git Hub App would require additional code to handle the CI/CD logic, making it far more complex than necessary. Therefore, using a Git Hub App for this purpose is a common misconception and is not the appropriate feature for straightforward automated deployments.
Git Hub Pages
Explanation
Git Hub Pages is a static site hosting service that publishes content directly from a repository branch, typically used for documentation or portfolio sites. It does not have the capability to run arbitrary commands, build containers, or interact with external staging environments. Relying on Git Hub Pages for deployment automation would therefore fail to meet the requirements of a staged deployment pipeline.
Correct answer
Git Hub Actions workflow
Explanation
A Git Hub Actions workflow is defined in a YAML file placed in the . github/workflows directory and can orchestrate a series of jobs such as building, testing, and deploying code. Workflows can be triggered on pushes, pull‑request events, or on a schedule, and they support environments, secrets, and protection rules that are ideal for staging deployments. This is the precise feature designed for automating deployment to a staging environment, making it the correct answer.
Git Hub Packages
Explanation
Git Hub Packages is a package registry that stores container images, npm packages, Maven artifacts, and other build outputs. While it can host the artifacts you might deploy, it does not execute deployment steps or manage environments. Confusing a package registry with a deployment automation tool is a frequent error, so it is not the feature you need here.
Git Hub Releases
Explanation
Git Hub Releases allow you to tag a specific commit and attach compiled binaries or other assets for end users to download. They do not provide a mechanism to run scripts, configure environments, or push code to a staging server. Using Releases for automated deployment would leave you with a manual step to extract and deploy the assets, which defeats the purpose of automation.
Git Hub Issues
Explanation
Git Hub Issues is a tracking system for bugs, feature requests, and tasks; it is not an execution engine for code. While you could link an issue to a workflow via triggers, Issues themselves cannot perform deployment actions. Hence, selecting Issues for automated staging deployment reflects a misunderstanding of its purpose.
Overall explanation
The question tests knowledge of which Git Hub feature is specifically designed for defining automated CI/CD pipelines, such as deploying to a staging environment. Git Hub Actions workflows are the native solution, allowing you to script build, test, and deploy steps in a YAML file with fine‑grained control over triggers and environments. The other options—Git Hub Apps, Pages, Packages, Releases, and Issues—are often confused with deployment tools but each serves a distinct purpose: integration, static hosting, artifact storage, versioned distribution, and task tracking, respectively. Recognizing the proper use case for each prevents over‑engineering or misusing Git Hub services. Best practice is to keep deployment logic inside a workflow, leverage environments and protected branches, and store any required artifacts in Packages if needed.
Domain
Git Hub Actions
Question 10
Skipped
As a developer, you are working on a new feature and need to create a new Git Hub project to manage the tasks and issues related to the feature. What is the KEY difference between a Git Hub project and a Git Hub issue in this context?
A Git Hub project is a single issue that contains a to‑do list, whereas a Git Hub issue is a collection of multiple tasks.
Explanation
This statement is incorrect. A Git Hub project is not a single issue; it is a container that can hold many issues, pull requests, and notes. Confusing the two would lead a developer to treat a project like a single task, losing the ability to track broader work streams.
Git Hub projects are used only for organizing pull requests, while issues are exclusively for tracking bugs.
Explanation
This option is also incorrect. Projects can organize issues, pull requests, and arbitrary notes, not just pull requests. Believing projects are limited to PRs would prevent a team from using the board to visualize a full feature backlog.
A project lives at the organization level and cannot be tied to a specific repository, but an issue is always repository‑specific.
Explanation
This is false. Projects can be created at the organization, repository, or even user level, and they often reference issues from a particular repository. Assuming projects are only organization‑wide would restrict their practical use for repository‑focused work.
Correct answer
A project is a board that can hold many issues, pull requests, and notes, providing a high‑level view, while an issue represents a single, discrete work item.
Explanation
This statement is correct. Projects provide a kanban‑style board that aggregates multiple issues and PRs, giving teams a macro view of progress, whereas an issue records one specific bug, feature request, or task. Using the board for overall planning while keeping detailed work in individual issues is the recommended workflow.
Projects automatically generate a markdown file in the repository, whereas issues are stored only in the web UI.
Explanation
This answer is incorrect. Projects do not create markdown files; they exist as metadata on Git Hub and are visualized through the UI or API. Issues also live as metadata, not as files, so the premise misrepresents how both features are stored and accessed.
Creating a project also creates a default branch for development, while creating an issue does not.
Explanation
This is incorrect. Projects do not create any Git branches; they are purely organizational tools. Branches are created through Git operations, and conflating projects with branch creation could cause confusion about version control workflow.
Overall explanation
The question tests understanding of the structural role each Git Hub feature plays in a development workflow. A Git Hub project is a high‑level board that aggregates many issues, pull requests, and notes, enabling teams to visualize and manage a collection of work items, whereas an issue records a single, specific piece of work such as a bug or feature request. Many learners mistakenly think projects are single issues, only for PRs, or tied to organization‑wide scope, which are common misconceptions. Recognizing that projects are containers and issues are atomic items helps teams apply the right tool for planning versus execution. Best practice is to create a project for a feature or milestone, then create individual issues for each task and link them to the project for traceability.
Domain
Project Management
Question 11
Skipped
As a Dev Ops engineer, you're tasked with creating a custom Git Hub workflow to automate code reviews. Which configuration achieves this?
Configure the workflow with `on: push` and include a step that runs `actions/github-script` to call `github. rest. pulls. create Review` for every push to the repository.
Explanation
This option is incorrect. The `push` event fires for any commit pushed to any branch, not specifically for pull requests, so it would attempt to create reviews on branches that are not under review. Automating code reviews should be tied to the lifecycle of a pull request, otherwise reviewers could be assigned to irrelevant commits, causing noise and confusion in the review process.
Set `on: schedule` with a nightly cron job that runs a linter and uploads the results as an artifact, but does not interact with the pull‑request API.
Explanation
This option is incorrect. A scheduled workflow runs on a fixed timetable and is unaware of new or updated pull requests, meaning reviews would not be triggered when code changes are introduced. While linting is valuable, automating reviewer assignment requires reacting to pull‑request events, not to a time‑based schedule.
Correct answer
Use `on: pull_request` (triggered on opened, synchronize, reopened) and add a job that employs `actions/github-script` to call `github. rest. pulls. create Review` and specify the desired reviewers or team.
Explanation
This option is correct. The `pull_request` event fires precisely when a pull request is created or updated, providing the context needed to request a review. By using `actions/github-script` to invoke the Git Hub REST API's `create Review` endpoint, the workflow can automatically assign reviewers, ensuring that every change receives the appropriate human oversight without manual intervention.
Configure `on: pull_request_review` and include a step that posts a comment on the PR, but does not request any reviewers.
Explanation
This option is incorrect. The `pull_request_review` event only occurs after a review has already been submitted, so it cannot be used to initiate a review. Posting a comment without assigning reviewers does not fulfill the automation goal of ensuring a review is requested when a PR is opened or updated.
Define `on: pull_request` and have the workflow run `actions/upload-artifact` to store build logs, without any step that creates a review or assigns reviewers.
Explanation
This option is incorrect. Although the trigger is appropriate, the workflow does not contain any logic to request a review, meaning no automation of the code‑review process occurs. Uploading artifacts is useful for debugging but does not address the requirement to automatically involve reviewers.
Set `on: workflow_dispatch` so that a user must manually trigger the workflow each time a review is needed.
Explanation
This option is incorrect. Manual triggering defeats the purpose of automation, as it requires a developer to remember to start the workflow for every pull request. Automated code reviews rely on event‑driven triggers so that reviewers are consistently and promptly assigned without human action.
Overall explanation
The question tests knowledge of how to design a Git Hub Actions workflow that automatically initiates code reviews. The correct configuration uses the `pull_request` event, which is fired whenever a PR is opened, updated, or reopened, providing the exact moment to request reviewers. By employing `actions/github-script` (or a similar action) to call the `create Review` API, the workflow can programmatically assign reviewers or teams, ensuring consistent review practices. Common misconceptions include using the `push` event, which lacks PR context, scheduling workflows that ignore PR timing, or relying on manual triggers that break automation. Best practice is to tie automation to the PR lifecycle, keep the workflow minimal yet explicit, and handle errors (e. g., reviewer not found) to maintain a smooth review pipeline.
Domain
Git Hub Actions
Question 12
Skipped
You're a developer working on an open-source project hosted on Git Hub. You need to document project decisions and meeting notes. Which TWO Git Hub features should you use?
Correct selection
Git Hub Wiki
Explanation
This is correct. Git Hub Wiki provides a built‑in, version‑controlled space for project documentation, allowing you to create and edit pages in Markdown. It is ideal for storing decisions, design rationales, and meeting minutes because each edit is tracked in the repository's history. Teams can link directly to wiki pages from issues or pull requests, ensuring the context is always available.
Correct selection
Git Hub Discussions
Explanation
This is also correct. Discussions offers a threaded conversation area where contributors can start topics, vote, and comment, making it suitable for capturing meeting notes or decision logs in a searchable format. Unlike issues, discussions are not tied to a specific bug or feature, so they stay organized under a separate tab. In practice, many open‑source projects create a "Meeting Notes" category within Discussions to keep records accessible to all collaborators.
Git Hub Issues
Explanation
This is incorrect. Issues are designed for tracking bugs, feature requests, and tasks rather than free‑form documentation. While you could technically store decisions in an issue, the lack of hierarchical organization makes it cumbersome for long‑term reference. Using issues for meeting notes can clutter the backlog and obscure critical work items.
Git Hub Projects (Beta)
Explanation
This is incorrect. Projects provides Kanban‑style boards for planning and workflow management, not a place for narrative documentation. It helps teams visualize work items but does not offer rich text formatting or version history for meeting minutes. Relying on Projects for decisions would mix planning with documentation, reducing clarity for future readers.
Pull request templates
Explanation
This is incorrect. Pull request templates are predefined markdown files that appear when creating a PR, guiding contributors on the information to include. They are useful for standardizing PR content, but they are not intended for ongoing documentation such as decisions or meeting notes. Misusing templates for this purpose would lead to duplicated and scattered information across many PRs.
Git Hub Pages
Explanation
This is incorrect. Git Hub Pages hosts static websites generated from a repository, which is excellent for publishing project documentation to the public web. However, creating and maintaining a site solely for internal meeting notes adds unnecessary overhead, and the content is not as directly editable by all contributors as a Wiki or Discussion. It is better suited for final, polished documentation rather than evolving meeting records.
Overall explanation
The question tests knowledge of Git Hub's built‑in documentation features. Git Hub Wiki and Git Hub Discussions are the two primary tools designed for capturing project decisions and meeting notes: the Wiki offers a version‑controlled, page‑based format, while Discussions provides a threaded, searchable conversation space. Common misconceptions include treating Issues or Projects as documentation containers; although they can hold comments, they are optimized for tracking work and planning, not for structured narrative records. Pull request templates and Git Hub Pages also serve specific purposes—standardizing PR information and publishing static sites—but they are not practical for ongoing decision logs. Best practice is to keep formal documentation in the Wiki and use Discussions for collaborative, informal notes, ensuring both are easily discoverable and maintainable.
Domain
Documentation
Question 13
Skipped
A tech lead is designing a new feature that requires collaboration with multiple teams. What is the MOST appropriate action to take when creating a Git Hub issue?
Correct answer
Add relevant team labels, assign owners from each team, and mention stakeholder leads in the description.
Explanation
This option is correct. Adding team‑specific labels makes the issue searchable and signals its cross‑team nature, while assigning owners from each team gives clear responsibility. Mentioning stakeholder leads ensures that decision‑makers are notified immediately, reducing the back‑and‑forth that often stalls large features. In practice, this practice leads to faster triage, transparent ownership, and a single source of truth for all parties involved.
Assign the issue to yourself only and plan to add collaborators later after discussions.
Explanation
This option is incorrect. Assigning the issue to a single person obscures ownership and can cause other teams to overlook the work that concerns them. Delaying the addition of collaborators often leads to duplicated effort and misaligned expectations because teams are not aware of the work until it is already in progress. Real‑world teams that wait to add assignees frequently experience missed deadlines and unclear accountability.
Create a new repository for the feature and open the issue there, leaving the main repository untouched.
Explanation
This option is incorrect. Forking the work into a separate repository fragments the codebase and makes it harder for existing contributors to locate related discussions and code. It also defeats the purpose of using a single source of truth for the project, leading to duplicated configuration, inconsistent CI pipelines, and extra overhead in synchronising changes. Teams that split issues across repositories often struggle with integration and increased maintenance burden.
Use only the default “enhancement” label and set the milestone to the upcoming release without providing a detailed description.
Explanation
This option is incorrect. While the “enhancement” label indicates a feature request, it does not convey which teams are involved or the scope of the work. Omitting details forces collaborators to ask clarifying questions in comments, slowing down planning and increasing the risk of misunderstood requirements. In many projects, insufficiently described issues cause rework when assumptions made by different teams diverge.
Write a brief title like “New Feature” and expect team members to ask for clarification in the comments.
Explanation
This option is incorrect. A vague title provides little context, making it difficult for busy team members to prioritize or even notice the issue among many others. Relying on comments for clarification adds unnecessary delay and creates fragmented information that can be missed later. Effective issue tracking starts with a clear, descriptive title that immediately signals relevance and urgency.
Mark the issue as private and grant access to a single representative from each team.
Explanation
This option is incorrect. Git Hub does not support private issues within a public repository; visibility is controlled at the repository level, not per issue. Attempting to restrict an issue to a few people creates silos, hampers transparency, and can lead to important information being hidden from teammates who need it. Proper practice is to keep the issue open to the repository’s collaborators while using mentions and assignees to direct attention.
Overall explanation
The question tests the learner's understanding of best practices for creating Git Hub issues that involve multiple teams. The correct approach is to add appropriate labels, assign owners from each relevant team, and mention stakeholder leads so that everyone receives immediate notification and ownership is explicit. Common misconceptions include assuming a single assignee is sufficient, believing that a vague title or minimal labeling will be clarified later, or attempting to isolate the issue in a separate repository or private context. Each of those misconceptions leads to reduced visibility, duplicated effort, and slower delivery. In real‑world agile environments, clear, well‑labeled, and properly assigned issues serve as the communication hub that keeps cross‑functional teams aligned and projects on schedule.
Domain
Issue Management
Question 14
Skipped
A QA engineer is troubleshooting a production incident and needs to identify the root cause of a bug. What is the PRIMARY reason for this behaviour?
Review the latest merge request to see which files were changed.
Explanation
This option is incorrect. While reviewing recent merge requests can give context about recent changes, it does not systematically isolate the exact commit that introduced the bug. Relying solely on visual inspection may miss subtle regressions and can lead to wasted time chasing unrelated changes.
Check the CI/CD pipeline logs for any failed steps.
Explanation
This option is incorrect. CI/CD logs are valuable for detecting build or deployment failures, but they rarely reveal the logical cause of a functional bug that made it into production. A bug may pass all pipeline checks if the tests are insufficient, so logs alone won't pinpoint the offending code change.
Correct answer
Run git bisect to automatically locate the commit that introduced the defect.
Explanation
This option is correct. git bisect performs a binary search over the commit history, allowing the engineer to quickly find the exact commit that caused the regression. By marking good and bad builds, the tool narrows down the culprit, providing a clear root cause and enabling a targeted fix rather than a blind rollback.
Reproduce the bug locally using the same environment configuration as production.
Explanation
This option is incorrect. Reproducing the bug locally is a useful step for debugging, but it does not identify which code change caused the issue. Without knowing the offending commit, the engineer may still spend time debugging the wrong parts of the codebase.
Search the issue tracker for similar bug reports.
Explanation
This option is incorrect. While similar reports can offer clues, they rarely pinpoint the exact change that introduced the new bug. The incident may be a unique regression that hasn't been reported before, making reliance on the tracker insufficient for root‑cause analysis.
Roll back the entire production release to the previous version.
Explanation
This option is incorrect. Rolling back eliminates the symptom but does not reveal why the bug occurred, which is essential for preventing future regressions. Without identifying the specific commit, the team may reintroduce the same defect in subsequent releases.
Overall explanation
The question tests the learner's understanding of systematic root‑cause analysis using version control tools. The primary reason for the QA engineer's behavior is to employ git bisect, which efficiently narrows down the exact commit that introduced the regression through a binary search algorithm. Options such as reviewing merge requests, checking CI logs, reproducing locally, searching the issue tracker, or rolling back are common troubleshooting steps but do not directly isolate the defective change. These alternatives are frequent misconceptions because they address symptoms or context rather than the precise source of the bug. Best practice dictates using git bisect early in the investigation to obtain a definitive commit reference, then fixing the code and adding tests to prevent recurrence.
Domain
Debugging
Question 15
Skipped
A data engineer is tasked with creating a data-driven dashboard using Git Hub Pages. Which tool or feature is BEST suited here?
Jekyll, the default static site generator for Git Hub Pages.
Explanation
This option is not correct for a continually updating dashboard. Jekyll can consume YAML or JSON data files, but those files must be regenerated and the site rebuilt each time the underlying data changes. Relying solely on Jekyll would require manual commits or an external process to trigger rebuilds, which defeats the purpose of an automated, data‑driven view.
Git Hub Pages' built‑in client‑side Java Script to fetch data directly from APIs.
Explanation
While client‑side Java Script can pull data at runtime, it is not the best choice for a Git Hub Pages dashboard. Many APIs require authentication tokens that should not be exposed in public Java Script, and browsers enforce CORS policies that may block the request. Consequently, using plain client‑side fetch leads to security and reliability problems for a production dashboard.
Correct answer
Git Hub Actions to fetch data, generate the dashboard, and push updates to the Pages branch.
Explanation
This is the correct answer because Git Hub Actions provides a fully managed CI/CD pipeline that can run on a schedule or in response to data changes. An Action can retrieve data from databases, APIs, or storage, transform it into static assets (e. g., HTML, JSON), and commit the results to the branch that Git Hub Pages serves. The outcome is an automatically refreshed, secure, and version‑controlled dashboard without exposing secrets to the browser.
Git Hub API calls embedded in the HTML to retrieve repository statistics at runtime.
Explanation
Embedding Git Hub API calls directly in HTML suffers from the same problems as client‑side Java Script: authentication tokens would need to be public, and rate‑limiting could throttle the dashboard. Moreover, the Git Hub API is intended for programmatic access, not for frequent on‑page polling in a public site. Therefore, this approach is insecure and unreliable for a production dashboard.
Git Hub Desktop to manually edit and commit dashboard files.
Explanation
Git Hub Desktop is a graphical client for managing repositories, but it does not provide automation. Using it would require the data engineer to manually pull new data, edit files, and push changes each time the dashboard should update, which is impractical for a data‑driven environment. Manual workflows also increase the risk of human error and delay the availability of fresh data.
Git Hub Pages' built‑in site themes with automatic data binding.
Explanation
Git Hub Pages themes are primarily focused on visual styling and layout; they do not include mechanisms for automatically pulling or processing external data sources. Without an external process to feed the theme with fresh data, the dashboard would remain static and quickly become outdated. Thus, relying on themes alone does not satisfy the requirement for a data‑driven, regularly refreshed dashboard.
Overall explanation
The question tests knowledge of how to keep a Git Hub Pages site up‑to‑date with external data. Git Hub Actions is the preferred tool because it can run on a schedule or webhook, safely handle secrets, and automatically rebuild and deploy the static site after processing the latest data. Common misconceptions include assuming Jekyll or client‑side Java Script can handle dynamic updates without a build step, or that themes provide data integration out of the box. Security‑sensitive API calls must never be exposed in public Java Script, and manual processes such as Git Hub Desktop are not scalable for continuous dashboards. Best practice is to combine Git Hub Actions with a static site generator (often Jekyll or another tool) to produce a secure, automated, and version‑controlled data dashboard on Git Hub Pages.
Domain
CI/CD
Question 16
Skipped
A product engineer is designing a new system that requires zero-downtime deployment. What is the KEY difference between blue‑green deployment and canary deployment in this context?
Blue‑green deployment routes a small percentage of users to the new version while keeping the majority on the old version.
Explanation
This statement describes the behavior of a canary deployment, not a blue‑green deployment. In blue‑green, traffic is switched wholesale from the old (blue) environment to the new (green) environment. Consequently, this option is incorrect because it mixes up the core traffic‑shifting mechanism.
Canary deployment requires two completely separate production environments that are switched instantly.
Explanation
Canary deployments usually operate within a single environment where a subset of instances receives the new version. They do not require two isolated production stacks that are swapped in one instant; that is characteristic of blue‑green. Therefore, this option is inaccurate and misleading.
Correct answer
Blue‑green deployment swaps all incoming traffic to the new environment in a single step, whereas canary deployment shifts traffic gradually to the new version.
Explanation
This statement correctly captures the fundamental distinction between the two strategies. Blue‑green performs an instant cutover, guaranteeing zero‑downtime by routing all requests to the green stack once it passes health checks, while canary rolls out the change incrementally to monitor impact. Hence, this is the correct answer.
Both blue‑green and canary deployments rely on feature flags to control code paths per request.
Explanation
Feature flags are a technique for toggling functionality within a running application, but they are not required for either blue‑green or canary deployments. These strategies focus on how traffic is directed at the infrastructure level, not on in‑code conditional toggles. Consequently, this option conflates two separate concepts and is wrong.
In a blue‑green setup, the old version is kept running alongside the new version indefinitely.
Explanation
While the old (blue) environment does remain operational during the cutover, the purpose of blue‑green is to retire the blue stack after a successful switchover. Keeping both versions indefinitely defeats the resource‑efficiency goal of the pattern. Therefore, this answer misstates the lifecycle of the environments and is incorrect.
Canary deployment cannot be used with container orchestration platforms like Kubernetes.
Explanation
On the contrary, canary deployments are widely supported by Kubernetes through mechanisms such as rolling updates, service mesh traffic splitting, and tools like Argo Rollouts. Stating that it cannot be used with Kubernetes is factually false and reflects a common misunderstanding. Thus, this option is incorrect.
Overall explanation
The question tests knowledge of the primary operational difference between blue‑green and canary deployment patterns, both of which aim for zero‑downtime releases but achieve it differently. Blue‑green creates a parallel production environment and switches all traffic to it in one atomic action, while canary introduces the new version to a small fraction of traffic and ramps it up based on observed behavior. Options 1, 2, 4, 5, and 6 each contain elements of truth about deployment concepts but misattribute those elements to the wrong pattern or outright state falsehoods, reflecting typical misconceptions such as confusing traffic‑splitting with full cutover, assuming feature flags are mandatory, or believing platform incompatibility. Understanding this distinction matters in real‑world scenarios: a blue‑green approach provides a quick rollback by simply reverting the router, whereas a canary approach offers early detection of regressions with minimal exposure. Best practice advises choosing the strategy that aligns with the team’s monitoring maturity and risk tolerance, and recognizing that both can be combined with modern CI/CD pipelines and orchestration tools.
Domain
Deployment Strategies
Question 17
Skipped
A developer is working on a feature branch and needs to request feedback from colleagues. What should you do FIRST?
Create a pull request on Git Hub targeting the main branch.
Explanation
This option is incorrect because a pull request cannot be opened until the feature branch exists on the remote repository. Attempting to create a PR with only a local branch will result in an error or a prompt to push the branch first. In real projects, developers who skip pushing first often waste time re‑creating the PR after realizing it is missing.
Merge the feature branch into the main branch locally and push the result.
Explanation
Merging into main before receiving feedback is a bad practice and defeats the purpose of a review. It can introduce untested code into the protected branch, breaking CI pipelines or production. Organizations typically protect the main branch and require PR reviews, so this approach would be rejected by branch protection rules.
Correct answer
Push the feature branch to the remote repository (e. g., Git Hub).
Explanation
This is the correct first step. Pushing the branch makes the commits visible to others and enables the creation of a pull request for review. Without the remote branch, colleagues cannot fetch or comment on the changes, and Git Hub will not allow opening a PR.
Tag the latest commit on the feature branch and share the tag with teammates.
Explanation
Tagging is used for releases or marking specific points, not for code review. While sharing a tag could give colleagues a reference, they would still need the branch to see the full context of the changes. This method adds unnecessary complexity compared to simply pushing the branch and opening a PR.
Send the diff output via email to the team.
Explanation
Emailing a diff is an outdated workflow and bypasses modern review tools that integrate comments, status checks, and CI results. Recipients would have to manually apply the diff, which is error‑prone and discourages collaboration. Modern best practice is to use the platform’s PR mechanism.
Add reviewers directly to the repository’s default branch settings.
Explanation
Adding reviewers at the repository level only applies to future pull requests; it does not trigger a review for the current work. This step does not make the feature branch’s changes visible to anyone. Reviewers need a PR or at least access to the branch to provide feedback.
Overall explanation
The question tests knowledge of the proper workflow for requesting peer review of work on a feature branch in Git Hub. The first actionable step is to push the local feature branch to the remote repository so that it becomes accessible to others and can be referenced in a pull request. Many learners mistakenly think the pull request itself is the first action, but Git Hub requires the branch to exist remotely before a PR can be created. Other options such as merging directly, tagging, emailing diffs, or configuring reviewers without a PR are common misconceptions that stem from legacy workflows or misunderstandings of Git Hub’s review process. Following the correct sequence—push, then open a pull request—ensures that CI checks run, reviewers can comment inline, and the protected branch policies are respected.
Domain
Pull Requests
Question 18
Skipped
A security engineer is tasked with ensuring GDPR compliance for a Git Hub repository. Which option should you choose?
Enable Git Hub Pages to publicly expose the repository's documentation.
Explanation
This option is incorrect because publishing documentation via Git Hub Pages makes the repository content publicly accessible on the internet. GDPR requires that personal data be protected and only shared with authorized individuals; a public site can inadvertently expose sensitive information. In a real-world scenario, a publicly hosted page could leak employee email addresses or customer identifiers, leading to regulatory penalties.
Add a LICENSE file that cites GDPR compliance.
Explanation
Adding a license that mentions GDPR does not provide any technical controls or data protection mechanisms, so this answer is incorrect. A license governs the terms under which code can be used, but it does not restrict who can view or modify the repository. Consequently, an organization could still be non‑compliant if personal data remains exposed despite the license text.
Correct answer
Set the repository to Private and limit collaborator access to only necessary personnel.
Explanation
This is the correct answer because making the repository private ensures that only authorized users can view its contents, aligning with GDPR's principle of data minimisation and access restriction. Restricting collaborators to those who truly need access reduces the risk of accidental data exposure and enables easier handling of data‑subject deletion requests. In practice, a private repository allows a security engineer to enforce role‑based permissions and quickly purge personal data when required.
Turn on the repository's Archive mode, making it read‑only but still publicly accessible.
Explanation
Archiving a repository does not hide its contents; it only prevents further changes. Because the repository remains publicly visible, any personal data stored inside would still be exposed, violating GDPR's confidentiality requirements. Organizations that rely solely on archiving may think they are protecting data, but regulators would view the continued public access as non‑compliant.
Enable automatic deletion of workflow logs after 30 days via Git Hub Actions settings.
Explanation
While automatic log deletion can help reduce retained metadata, it does not address the core issue of who can access the repository's source code. GDPR compliance requires control over the data itself, not just ancillary logs, so this measure alone is insufficient. Moreover, if personal data is embedded in the code, deleting logs will not remove that data from the repository.
Activate the Git Hub Data Export feature so users can download the entire repository.
Explanation
Providing an export capability satisfies only one aspect of GDPR (the right of access) but does not ensure the data is stored securely or can be deleted on request. Exporting the entire repository could inadvertently distribute personal data to unauthorized parties if proper safeguards are not in place. Therefore, relying on the export feature alone does not achieve full GDPR compliance.
Overall explanation
The question tests understanding of how repository visibility and access controls relate to GDPR's requirements for data protection and minimisation. GDPR mandates that personal data be kept confidential, accessed only by those who need it, and be removable upon request. Making a repository private and restricting collaborators directly satisfies these principles, whereas public exposure, licensing statements, archiving, log deletion, or merely offering data export do not provide adequate protection. Common misconceptions include assuming that a license or an export feature alone fulfills legal obligations, or that archiving makes data private. Best practice is to combine private repositories with strict permission management, regular audits for personal data, and clear processes for data subject requests.
Domain
Repository Privacy
Question 19
Skipped
A developer is working on a feature that requires a custom Git Hub Action to automate testing. Which approach BEST satisfies these requirements?
Correct answer
Create a Docker container action that bundles all test dependencies, version it, and reference it in the workflow file.
Explanation
This option is correct because a Docker‑based action provides an isolated, reproducible environment that includes exactly the tools and libraries required for the test suite. By packaging the dependencies in a container, the action runs consistently across all runners regardless of the underlying OS. In practice, teams can tag the Docker image with semantic versions, ensuring that future workflow runs are not broken by accidental changes.
Write the test commands directly in the workflow YAML using inline run steps.
Explanation
This option is incorrect because while inline run steps work for simple scripts, they do not encapsulate the testing environment as a reusable component. Without a self‑contained action, every workflow must duplicate the same setup commands, leading to maintenance overhead and potential drift between jobs. Moreover, complex dependency installation can make the workflow file unwieldy and error‑prone.
Use an existing third‑party action from the Git Hub Marketplace that runs generic tests.
Explanation
This option is incorrect because generic marketplace actions may not match the specific language versions, custom configurations, or proprietary tools required by the feature. Relying on an external action can introduce hidden bugs if the action's maintenance schedule diverges from the project's needs. It also reduces visibility into the exact steps performed, making debugging more difficult.
Trigger an external CI service such as Jenkins from the workflow using a repository_dispatch event.
Explanation
This option is incorrect because it defeats the purpose of using Git Hub Actions for native automation and adds extra network latency and complexity. Managing two CI systems creates duplicated effort for credentials, logging, and failure reporting. In real deployments, teams that mix Git Hub Actions with external CI often encounter synchronization issues and increased operational cost.
Create a composite action that simply calls a shell script stored in the repository without using containerization.
Explanation
This option is partially plausible but not the best choice for a complex test suite that requires specific runtime libraries. Composite actions run in the same runner environment as the workflow, so any missing dependency will cause failures unless the runner is pre‑configured. For projects that need precise, version‑locked toolchains, a Docker action offers stronger guarantees of consistency.
Reference a reusable workflow template stored in another repository via workflow_call.
Explanation
This option is incorrect because reusable workflow templates are designed for sharing entire workflow structures, not for encapsulating custom logic like a test runner. While they improve DRY principles for workflow definitions, they still rely on the underlying runner environment, and they cannot package the required test dependencies in a portable way. Consequently, they do not meet the requirement for a self‑contained custom action.
Overall explanation
The question tests the learner's understanding of how to build a maintainable, portable custom Git Hub Action for automated testing. A Docker container action is the optimal solution because it isolates the environment, bundles all required dependencies, and can be versioned independently of the workflow file. Common misconceptions include assuming inline run steps are sufficient, believing a generic marketplace action will fit custom needs, or using external CI systems, all of which lead to maintenance overhead or inconsistency. Composite actions and reusable workflows are useful for sharing code but lack the environment encapsulation that testing often requires. Best practice is to choose the action type (Docker, Java Script, or composite) that aligns with the complexity of the toolchain, with Docker being preferred for complex, language‑specific testing setups.
Domain
Custom Actions
Question 20
Skipped
You're an architect designing a new system that requires collaboration with multiple teams. Which THREE Git Hub features should you use to manage project workflows?
Git Hub Wiki
Explanation
This option is incorrect. The Wiki feature allows teams to create documentation and knowledge bases, but it does not provide any built‑in mechanisms for tracking work items, automating pipelines, or enforcing ownership rules. Relying on a Wiki for workflow management would leave the actual process coordination unmanaged, leading to missed deadlines and unclear responsibilities.
Correct selection
Git Hub Projects
Explanation
This option is correct. Git Hub Projects (especially the flexible, board‑style version) lets you organize issues, pull requests, and notes into customizable columns that reflect your team's stages, such as backlog, in‑progress, and done. Using Projects across multiple teams creates a single source of truth for work status, making it easier to coordinate efforts and surface bottlenecks early.
Git Hub Pages
Explanation
This option is incorrect. Pages is a static‑site hosting service mainly used for documentation, blogs, or project websites; it does not include features for assigning work, automating builds, or governing code reviews. Deploying a workflow on Pages would be a misuse and would not help teams track or enforce process steps.
Correct selection
Git Hub Actions
Explanation
This option is correct. Actions provides CI/CD pipelines, automation of repetitive tasks, and can be triggered by events such as pull‑request creation or label changes, ensuring consistent build, test, and deployment processes across teams. Automating these steps reduces manual errors and speeds up feedback loops, which is essential in a multi‑team environment.
Correct selection
CODEOWNERS
Explanation
This option is correct. The CODEOWNERS file automatically assigns reviewers based on file paths, ensuring the right experts review changes and that ownership responsibilities are clear. When many teams contribute to a large codebase, CODEOWNERS helps enforce review policies and prevents overlooked approvals that could introduce defects.
Git Hub Sponsors
Explanation
This option is incorrect. Sponsors is a financial support platform that enables individuals or organizations to fund open‑source maintainers; it does not influence task tracking, automation, or code ownership. Using Sponsors for workflow management would have no impact on how work is coordinated or delivered.
Overall explanation
The question tests knowledge of which Git Hub features directly support collaborative workflow management across multiple teams. Git Hub Projects provides a visual board for planning and tracking work items, Git Hub Actions automates testing and deployment pipelines, and CODEOWNERS enforces ownership and review responsibilities—each addressing a distinct aspect of a robust workflow. Distractors such as Wiki, Pages, and Sponsors are commonly misunderstood as collaboration tools, but they serve documentation, static site hosting, and funding purposes respectively, and do not help coordinate development tasks. Recognizing the proper tools prevents teams from building ineffective processes that rely on the wrong feature set. Best practice is to combine Projects for planning, Actions for automation, and CODEOWNERS for review governance to achieve end‑to‑end workflow visibility and consistency.
Domain
Project Management
Question 21
Skipped
As a Dev Ops engineer, you are tasked with automating the deployment of a new web application on Git Hub Pages. The application requires a custom domain and SSL certificate. Which configuration achieves this?
Add a DNS A record pointing the domain to Git Hub Pages IP addresses, upload your own SSL certificate files to the repository, and enable the "Enforce HTTPS" toggle in the Pages settings.
Explanation
This option is incorrect. Git Hub Pages does not allow you to upload private SSL certificates; the service provides TLS certificates automatically. Attempting to manage certificates manually will result in the site being served over HTTP or producing certificate errors, defeating the purpose of a secure deployment.
Configure a Git Hub Actions workflow that builds the site, pushes the output to the gh-pages branch, and then runs a Let's Encrypt client to place a certificate in a . cert folder of the repository.
Explanation
This option is incorrect. While a workflow can automate the build and push steps, Git Hub Pages does not read certificate files from the repository to serve HTTPS traffic. Relying on a third‑party Let’s Encrypt client inside the repo will not make the certificate available to Git Hub's edge servers, leading to broken HTTPS connections for visitors.
Set the repository's default branch to gh-pages, add a . github/ssl directory containing key and certificate files, and expect Git Hub to serve the site over HTTPS automatically.
Explanation
This option is incorrect. The presence of a . github/ssl directory has no effect on Git Hub Pages' TLS handling; Git Hub does not serve custom certificates from the repo. Consequently, the site would either be served over plain HTTP or use a default Git Hub domain without the desired custom domain protection.
Add a CNAME file with the custom domain, create a DNS CNAME record to username. github. io, and leave the "Enforce HTTPS" toggle off; the site will still be served over HTTPS by Git Hub.
Explanation
This option is incorrect. The "Enforce HTTPS" setting must be turned on for Git Hub to provision and serve a valid TLS certificate for a custom domain. If the toggle remains off, browsers will display mixed‑content warnings or block the site entirely, breaking the security requirement.
Add an A record for the apex domain pointing to Git Hub Pages IPs, configure the custom domain in the repository's Pages settings, and enable the built‑in "Enforce HTTPS" option; Git Hub will automatically provision a TLS certificate.
Explanation
This option is partially correct but misleading. While using A records for apex domains is supported, the answer omits the critical step of adding a CNAME (or appropriate DNS) file in the repository to signal the custom domain, which Git Hub relies on for certificate provisioning. Without that file, Git Hub may not associate the domain correctly, resulting in failed HTTPS activation.
Correct answer
Create a CNAME file containing the custom domain, add a DNS CNAME record pointing the domain to username. github. io, configure the domain in the repository's Pages settings, and enable the built‑in "Enforce HTTPS" option; Git Hub will automatically provision a valid TLS certificate.
Explanation
This option is correct. The CNAME file informs Git Hub of the intended custom domain, the DNS CNAME record directs traffic to Git Hub's servers, and the Pages settings allow you to select the domain and turn on "Enforce HTTPS". Once enabled, Git Hub issues and renews a free TLS certificate, guaranteeing that the site is served securely over HTTPS.
Overall explanation
The question tests knowledge of the exact steps required to serve a Git Hub Pages site on a custom domain with HTTPS. Git Hub handles TLS automatically, but only after the repository contains a CNAME file, the DNS is correctly pointed, and the "Enforce HTTPS" setting is enabled in the Pages configuration. Common misconceptions include trying to upload personal SSL certificates, relying on workflow‑generated certificates, or assuming that turning on HTTPS is optional for custom domains. In practice, forgetting any of the required steps—especially the CNAME file or the HTTPS toggle—will lead to browsers flagging the site as insecure or failing to resolve the domain. Following the official workflow ensures a smooth, secure deployment that scales without manual certificate management.
Domain
Git & Git Hub
Question 22
Skipped
A developer on your team has reported an issue with a Git Hub repository where the Wiki pages are not being updated correctly. What is the PRIMARY reason for this behaviour?
Correct answer
The Wiki is a separate Git repository, and changes must be pushed to that repository, not the main code repository.
Explanation
This statement is correct. Git Hub stores each repository's Wiki in its own hidden Git repository; edits made via the UI are committed there, while pushes to the main repository have no effect on the Wiki. If a team member commits to the code repo expecting the Wiki to change, the pages will appear unchanged, which is a common source of confusion.
The repository's default branch is protected, preventing any changes to the Wiki pages.
Explanation
This statement is incorrect. Branch protection rules apply only to branches within the code repository and do not affect the separate Wiki repository. Consequently, a protected default branch would not stop Wiki edits, and users would still see their changes reflected after saving.
The user lacks Write permission on the Wiki, so their edits are silently ignored.
Explanation
This statement is incorrect. If a user does not have write access to a Wiki, Git Hub will display an explicit permission error when they attempt to edit, rather than silently discarding the changes. Therefore, the issue would be evident immediately rather than causing seemingly missed updates.
Git Hub caches Wiki pages for up to 30 minutes, so updates appear delayed.
Explanation
This statement is incorrect. While browsers may cache pages, Git Hub does not impose a long server‑side delay for Wiki updates; changes are usually visible within seconds. A perceived delay is more likely due to not committing to the correct repository rather than caching.
The repository has disabled the Wiki feature, so edits are not saved.
Explanation
This statement is incorrect. When a Wiki is disabled, the Wiki tab disappears from the UI, and users cannot even attempt to edit pages. If the Wiki is visible, it is enabled, and edits will be saved provided they are made to the correct Wiki repo.
The Wiki pages are stored in Git LFS, and large files need to be tracked separately causing update failures.
Explanation
This statement is incorrect. Git Hub Wikis do not automatically use Git LFS, and most Wiki content consists of plain Markdown, not large binary files. Issues with LFS would surface as errors during push, not as silent non‑updates of regular Wiki pages.
Overall explanation
Git Hub treats each repository's Wiki as an independent Git repository. The most common reason Wiki edits appear to fail is that contributors are pushing changes to the main code repository instead of the hidden Wiki repo, so the pages never receive the new commits. Branch protection, permission errors, caching, or disabling the Wiki are either unrelated or would generate explicit warnings, making them unlikely primary causes. Understanding that the Wiki has its own Git history helps teams coordinate edits correctly, for example by cloning the Wiki repo with the "git clone https://github. com/owner/repo. wiki. git" URL. Best practice is to verify that you are working in the correct repository and that you push or save changes directly to the Wiki repository.
Domain
Wikis
Question 23
Skipped
As a tech lead, you are designing a new feature for a Git Hub repository that requires collaboration between multiple teams. The feature must be tracked and managed using Git Hub issues and projects. Which TWO options are correct?
Create a separate repository for the feature and manage it with its own issue tracker, ignoring the main repository’s issues.
Explanation
This option is incorrect. While isolating work in its own repository can be useful for some large features, it does not facilitate collaboration across multiple existing teams that already use the main repository’s issue workflow. By ignoring the main issue tracker, you lose the ability to see cross‑repo dependencies, shared labels, and centralized reporting, which defeats the purpose of using Git Hub issues and projects for coordinated work.
Correct selection
Create a single organization‑wide Git Hub Project (beta) and add issues from all involved repositories to it, using columns to reflect the feature’s stages.
Explanation
This option is correct. An organization‑level Project can contain issues from any repository within the org, providing a unified view of work across teams. By organizing cards into columns such as "Backlog", "In Progress", and "Done", the tech lead can track progress, prioritize work, and ensure that every team sees the same roadmap, which is essential for multi‑team coordination.
Assign each issue to an individual developer instead of a team, and rely on personal task lists for coordination.
Explanation
This option is incorrect. Assigning issues to individuals fragments accountability and makes it difficult for team leads to gauge overall progress. Personal task lists do not surface cross‑team dependencies and can lead to silos, whereas assigning to a @team tag or using project boards provides the visibility needed for coordinated delivery.
Use Git Hub Actions to automatically close issues when a pull request is merged, but do not link the issues to the project board.
Explanation
This option is incorrect. Automating issue closure can be helpful, but without linking those issues to a project board you lose the visual tracking of work stages. The project board is the central place where teams monitor status, so closing issues silently removes important context and can cause confusion about what has been completed versus what is still in review.
Correct selection
Use the "linked issues" feature (e. g., "blocks", "is blocked by") to show dependencies between issues owned by different teams, providing visibility across the feature.
Explanation
This option is correct. Linking issues makes dependencies explicit, allowing teams to see which work must be finished before another can start. This visibility prevents blocked work from being scheduled prematurely and helps the tech lead orchestrate a smooth flow of tasks across the multiple teams involved.
Rely solely on milestone dates to coordinate work, without using issues or projects, assuming milestone progress is enough.
Explanation
This option is incorrect. Milestones provide a high‑level deadline but do not give the granular tracking, assignment, or dependency information that issues and projects supply. Without issues and a project board, teams lack the tools to manage day‑to‑day tasks, leading to missed deadlines and unclear ownership.
Overall explanation
The question tests the learner’s ability to use Git Hub Issues and Projects for coordinated, multi‑team feature development. The two correct practices are (1) using an organization‑wide Project to aggregate issues from all relevant repositories, which gives a single, visual roadmap, and (2) linking issues to indicate dependencies, which clarifies the order of work across teams. Common misconceptions include thinking that separate repositories or personal task lists are sufficient, that closing issues automatically via Actions eliminates the need for board visibility, or that milestones alone can replace detailed issue tracking. Each of those wrong approaches reduces transparency and hampers effective collaboration. Best practice is to maintain a centralized project board, use team assignments, leverage issue linking for dependencies, and supplement with automation only when it supports, not replaces, visible tracking.
Domain
Projects and Issues
Question 24
Skipped
As a QA engineer, you are tasked with testing a new Git Hub repository that uses Git Hub Actions for continuous integration and continuous deployment. What is the MOST likely root cause of a failed deployment?
The workflow file contains a syntax error that prevents the job from starting.
Explanation
This option is incorrect. While a syntax error will stop the workflow from running at all, it is typically caught during the initial validation phase and reported as a workflow failure rather than a deployment-specific failure. In practice, a QA engineer would see the job never start, which is a different symptom than a deployment that starts and then fails.
The self‑hosted runner ran out of disk space during the build process.
Explanation
This option is incorrect. Insufficient disk space can cause a build step to fail, but it is a relatively rare occurrence compared to credential problems and usually manifests as a specific "no space left on device" error. Moreover, most Git Hub‑hosted runners provide ample temporary storage, making this scenario less common in typical CI/CD pipelines.
Correct answer
A required secret (e. g., deployment token) is missing or incorrectly configured in the repository settings.
Explanation
This option is correct. Deployment steps almost always need authentication credentials such as AWS keys, Docker registry tokens, or Git Hub Personal Access Tokens, which are stored as encrypted secrets. If the secret is absent or has a typo, the deployment command will be rejected, leading to a clear failure in the deployment stage, which is the most frequent cause of deployment failures in Git Hub Actions.
The pull‑request branch was not protected, causing the workflow to be skipped.
Explanation
This option is incorrect. Branch protection rules affect whether certain actions (like required reviews) are enforced, but they do not cause a workflow to be skipped automatically. A workflow will still run on unprotected branches unless explicitly configured otherwise, so this is not a typical root cause of deployment failure.
The action's version tag was not pinned, leading to unpredictable behavior.
Explanation
This option is incorrect. While using floating tags can introduce breaking changes over time, such issues usually surface as compile or test errors rather than immediate deployment authentication failures. In most cases, version drift is discovered during testing phases, not as the most common cause of a deployment step failing outright.
The repository lacks branch protection rules, causing the CI pipeline to be ignored entirely.
Explanation
This option is incorrect. Absence of branch protection does not prevent Git Hub Actions from executing; the CI pipeline runs on any push or pull request unless the workflow file restricts it. Therefore, missing protection rules are unrelated to deployment failures and represent a misunderstanding of how workflows are triggered.
Overall explanation
The question tests the learner's understanding of the most common reason a deployment fails in a Git Hub Actions CI/CD pipeline. Deployment steps almost always rely on secrets to authenticate with external services, and an absent or malformed secret will cause the deployment command to error out, making it the most frequent root cause. Options that focus on workflow syntax, runner resources, or branch protection misunderstand where the failure occurs; they either affect earlier stages or are unrelated to deployment authentication. Misconceptions about version tags and branch protection stem from legitimate concerns but are less likely to be the primary cause of a deployment failure. Best practice dictates always verifying that required secrets are defined, correctly named, and contain valid values before promoting code to production.
Domain
Secrets Management
Question 25
Skipped
A product engineer is creating a new Git Hub repository for a product roadmap and wants to use Git Hub Projects to track progress. Which approach BEST satisfies these requirements?
Correct answer
Create a repository‑level Git Hub Project (the new Projects) within the new repository and add issue cards for each roadmap item.
Explanation
This option is correct because a repository‑level Project lives inside the same repository that contains the roadmap content, keeping all tracking artifacts together. The new Projects experience allows you to add issues, pull requests, and custom fields directly to the board, providing granular visibility for the team. In practice, team members can navigate from the board to the underlying issue or PR with a single click, streamlining collaboration on roadmap items.
Create an organization‑wide Project and add the new repository as a linked repository, then track roadmap items there.
Explanation
This option is incorrect because an organization‑wide Project introduces a broader scope than necessary for a single product roadmap. While it can link to the repository, it dilutes ownership and makes it harder for newcomers to locate the board specific to that product. Using an organization‑level board for a single repo often leads to clutter and confusion, especially in large orgs with many projects.
Use the classic Projects (beta) at the organization level, and manually copy issue URLs from the repository into the board.
Explanation
This option is incorrect because classic Projects are being phased out in favor of the newer Projects feature, which offers richer automation and custom fields. Additionally, managing the board at the organization level adds unnecessary complexity for a single repository's roadmap. Manually copying URLs also defeats the purpose of integrated issue cards that automatically stay in sync with their source.
Track roadmap progress using only Git Hub Issues with Milestones, without creating a Project board.
Explanation
While Issues with Milestones can represent phases of a roadmap, the question explicitly calls for using Git Hub Projects. Without a Project board you lose visual work‑flow panels, custom fields, and the ability to group items by status or priority. Relying solely on Issues would make it harder for stakeholders to get a high‑level view of progress.
Create a separate ‘roadmap’ repository and use its Project board to track progress for the product, linking issues via cross‑repo references.
Explanation
Creating an extra repository adds unnecessary overhead and separates the roadmap from the code or documentation it governs. Cross‑repo references work, but they increase friction for contributors who must switch contexts. Best practice is to keep the roadmap and its tracking board in the same repository whenever the scope is limited to a single product.
Enable Git Hub Projects in the user’s personal account and create a personal project board that references the repo’s issues.
Explanation
A personal project board is private to the individual and does not provide team visibility or access control, which defeats the purpose of a collaborative roadmap. Team members would be unable to view or edit the board unless it is shared at the organization or repository level. Therefore this approach does not satisfy the requirement for a shared, team‑wide tracking mechanism.
Overall explanation
The question tests knowledge of where to place a Git Hub Project to best support a product roadmap that lives in a single repository. The optimal solution is to create a repository‑level Project using the new Projects feature, because it keeps the board co‑located with the roadmap content and gives the whole team immediate access. Common misconceptions include using organization‑wide boards for single‑repo work, relying on deprecated classic Projects, or attempting to manage roadmap items solely with Issues and Milestones. Each of those alternatives either adds unnecessary complexity, reduces visibility, or misses out on the visual workflow benefits of Projects. Best practice is to use repository‑level Projects for product‑specific tracking, ensuring clear ownership, easy navigation, and straightforward collaboration across the team.
Domain
Projects
Question 26
Skipped
As a data engineer, you are tasked with migrating a large dataset to a new Git Hub repository. The dataset must be stored in a secure and compliant manner. Which tool or feature is BEST suited here?
Git Hub Actions
Explanation
Git Hub Actions is an automation platform for CI/CD workflows. While powerful for building, testing, and deploying code, it does not provide a mechanism for storing large binary datasets. Using Actions to push raw data would still rely on regular Git storage, which quickly exceeds size limits and lacks the dedicated security controls needed for compliance.
Git Hub Packages
Explanation
Git Hub Packages is a package registry for languages and container images. It is designed to store versioned artifacts like npm packages or Docker images, not arbitrary large datasets. Although it offers access control, using it for raw data would be a misuse and could lead to performance bottlenecks and compliance gaps.
Git submodules
Explanation
Git submodules let you embed one Git repository inside another, providing a way to reference external code. They do not address the problem of large file storage; each submodule still follows normal Git size constraints. Deploying a massive dataset via submodules would cause clone performance issues and offers no additional security beyond standard repository permissions.
Correct answer
Git Large File Storage (Git LFS)
Explanation
Git LFS is specifically built to handle large binary files by storing pointers in the repository while the actual data resides on a dedicated LFS server. It integrates with Git Hub's authentication and permission model, ensuring that only authorized users can download the files, which satisfies both security and compliance requirements. In practice, data engineers use LFS to version datasets of several gigabytes without inflating repository size or exposing the data unintentionally.
Git Hub Releases
Explanation
Git Hub Releases are a way to attach compiled binaries or other artifacts to a specific tag. While they can host large files, they are intended for distribution rather than ongoing version control of datasets, and they lack fine-grained access controls that are required for compliance. Storing a dataset as a release asset would make updates cumbersome and could expose the data to anyone with read access to the repository.
Git Hub Pages
Explanation
Git Hub Pages is a static site hosting service that serves HTML, CSS, and Java Script directly from a repository. It is not designed for storing large binary data, and the underlying storage limits and public nature of Pages make it unsuitable for secure, compliant data handling. Attempting to use Pages for a dataset would risk accidental public exposure and would quickly run into size constraints.
Overall explanation
The question tests knowledge of Git Hub's specialized storage mechanisms for large, sensitive datasets. Git Large File Storage (Git LFS) is the only feature explicitly designed to handle large binary files while integrating with Git Hub's authentication and permission system, making it the best choice for secure and compliant migration. Options like Git Hub Actions, Packages, Submodules, Releases, and Pages each serve different purposes—automation, package registries, repository nesting, distribution, and static site hosting—but none provide the combination of size handling and security required. Common misconceptions arise from assuming any Git Hub service can store large data, but only LFS separates large files from the repository core and enforces access controls. In real-world practice, data engineers use LFS to version datasets, track changes efficiently, and stay within Git Hub's storage policies while meeting regulatory compliance.
Domain
Large File Storage
Question 27
Skipped
As an architect, you are designing a new system that requires integration with Git Hub APIs. The system must be able to create, read, and update Git Hub issues and projects. Which THREE approaches should you take?
Configure a Git Hub webhook to create, read, and update issues and projects directly from incoming HTTP requests.
Explanation
This option is incorrect. Webhooks are designed to deliver events from Git Hub to your application; they do not provide an interface for creating or updating resources. Attempting to use a webhook to issue modifications would result in no effect because the webhook payload is read‑only, and you would still need to call the API from your service to perform those actions.
Correct selection
Authenticate with a personal access token that has the `repo` scope and call the Git Hub REST API directly to manage issues and projects.
Explanation
This option is correct. A personal access token (PAT) with the appropriate scopes grants the caller permission to perform CRUD operations on issues and projects via the REST endpoints. In many real‑world integrations, services use a PAT to script issue creation during CI pipelines or to synchronize external ticketing systems with Git Hub.
Use the public unauthenticated Git Hub API endpoints to modify issues and projects without providing any credentials.
Explanation
This option is incorrect. Unauthenticated requests are limited to read‑only operations and are subject to very low rate limits; they cannot create, edit, or delete issues or projects. If a service attempted this, Git Hub would return a 401 Unauthorized response, preventing any state‑changing actions.
Correct selection
Register a Git Hub App (or fine‑grained app) with `issues` and `projects` permissions and use its JWT/installation token to call the API for creating, reading, and updating resources.
Explanation
This option is correct. Git Hub Apps provide scoped, revocable tokens that are ideal for automated integrations, allowing precise permission control over issues and projects. A common practice is to generate a short‑lived JWT, exchange it for an installation access token, and use that token to perform mutations, ensuring security and auditability.
Correct selection
Leverage the Git Hub Graph QL API with an authentication token that includes the necessary `repo` and `project` scopes to run mutations for issues and projects.
Explanation
This option is correct. The Graph QL API supports fine‑grained mutations such as `add Labels To Labelable` or `update Project V2Item Field Value`, enabling efficient creation and updates in a single request. Organizations often choose Graph QL for complex synchronizations because it reduces round‑trips compared to the REST API.
Invoke the Git Hub CLI (`gh`) from your service code to run `gh issue create` and related commands for managing issues and projects.
Explanation
This option is incorrect. While the `gh` CLI can perform these actions interactively, it is not intended for programmatic use within backend services; it requires a user context, can spawn subprocesses, and lacks robust error handling for automated workflows. Production‑grade integrations typically avoid CLI wrappers in favor of direct API calls for reliability and scalability.
Overall explanation
The question tests knowledge of proper, authenticated methods for programmatic interaction with Git Hub's issue and project features. Correct approaches involve using a personal access token with the right scopes, a Git Hub App (or fine‑grained app) that supplies scoped installation tokens, or the Graph QL API paired with an authenticated token—each of which provides the necessary permissions to create, read, and update resources securely. Common misconceptions include believing that webhooks can perform write operations, that unauthenticated API calls allow modifications, or that the Git Hub CLI is suitable for service‑level automation; all of these overlook the authentication and intent requirements of the Git Hub platform. Best practice dictates selecting the most secure and maintainable method: Git Hub Apps for automated services, PATs for simple scripts, and Graph QL for complex data needs, always ensuring the token carries the minimum required scopes. Understanding these distinctions helps architects design resilient integrations that respect rate limits, audit trails, and security policies.
Domain
API Integration
Question 28
Skipped
A developer on your team has reported an issue with a Git Hub repository where the Git Hub Pages site is not being updated correctly. What should you do FIRST?
Clear your local browser cache and reload the Git Hub Pages URL.
Explanation
This option is incorrect. While a stale browser cache can sometimes show outdated pages, Git Hub Pages updates are generated on the server side, not in the client cache. Even after clearing the cache, if the source configuration is wrong, the site will continue to display the old content, so this is not the appropriate first troubleshooting step.
Push a new empty commit to the repository to force Git Hub Pages to rebuild.
Explanation
This option is incorrect. Pushing a commit does trigger a rebuild, but if the Pages source branch or folder is misconfigured, the rebuild will still produce the same outdated output. The first step should be to verify that the Pages settings point to the correct branch, making a push unnecessary until the configuration is confirmed.
Correct answer
Check the repository Settings → Pages configuration to confirm the correct source branch and folder are selected.
Explanation
This option is correct. The most common reason a Git Hub Pages site does not update is that the Pages source (branch or /docs folder) is set to a location that is not receiving the new commits. Verifying and correcting this setting ensures that future pushes will rebuild the site with the intended content. In practice, adjusting the source to the branch where changes are being made resolves the update problem immediately.
Delete the existing gh-pages branch and recreate it from main.
Explanation
This option is incorrect. Deleting and recreating the branch is a drastic action that does not address the underlying configuration issue. It also risks losing history and is unnecessary when the problem can be solved by simply confirming the Pages source settings. Best practice is to adjust the settings before taking such irreversible steps.
Disable and re‑enable Git Hub Actions for the repository.
Explanation
This option is incorrect. Git Hub Actions are only relevant if you have a workflow that builds and deploys the site; many Pages sites are built directly by Git Hub without Actions. Disabling Actions will not change the Pages source configuration and therefore will not fix the update problem. It is a common misconception that rebuilding pipelines is the first move, but configuration checks come first.
Verify that the custom domain’s DNS A and CNAME records are correctly pointing to Git Hub's servers.
Explanation
This option is incorrect. DNS settings affect whether a custom domain resolves to the site, not whether the content of the site updates. A misconfigured DNS would cause a "site not found" error, not stale content. Therefore, checking DNS is not the appropriate first step for a Pages content update issue.
Overall explanation
The question tests the learner's understanding of the most common cause of Git Hub Pages not updating: a misconfigured source branch or folder. The first troubleshooting action should always be to inspect the Pages settings in the repository to ensure the site is being built from the branch that receives commits. Many novices jump to actions like clearing caches, pushing dummy commits, or fiddling with DNS, which are either irrelevant or premature. Recognizing that Git Hub Pages builds automatically from the configured source helps avoid unnecessary steps and reduces downtime. In real projects, confirming this setting often resolves the issue in minutes, allowing the team to focus on content changes rather than infrastructure tweaks.
Domain
Git Hub Pages
Question 29
Skipped
As a security engineer, you are tasked with securing a Git Hub repository that contains sensitive data. The repository must be configured to require two-factor authentication and have a restricted access policy. Which option should you choose?
Correct answer
Set the repository to Private and enable the organization’s “Require two-factor authentication for all members” policy.
Explanation
This option is correct because a Private repository limits visibility to only explicitly granted collaborators, and the organization‑level 2FA enforcement ensures every user who accesses the repo must have two‑factor authentication enabled. Combining these controls satisfies both requirements of restricted access and mandatory 2FA. In practice, an organization that enforces 2FA will block pushes from accounts without 2FA, protecting sensitive code from compromised credentials.
Keep the repository Public but enable Git Hub’s “Require signed commits” setting.
Explanation
This option is incorrect. While requiring signed commits adds integrity verification, a Public repository is still visible to anyone on the internet, violating the restricted access policy. Moreover, signed commits do not enforce two‑factor authentication for users, so the security requirements are not met.
Use a Public repository with a CODEOWNERS file that restricts push access to a small team.
Explanation
This option is incorrect. CODEOWNERS can control who can approve changes, but it does not hide the repository contents from the public, nor does it enforce two‑factor authentication. Sensitive data would remain exposed, leading to potential data leakage.
Mark the repository as Internal and enable Git Hub Actions permissions.
Explanation
This option is incorrect. The Internal visibility level is only available to Git Hub Enterprise Cloud organizations and still allows any internal employee to view the repository, which may not meet a strict restricted‑access policy. Additionally, Internal does not automatically require two‑factor authentication for users.
Enable branch protection rules that require status checks and pull‑request reviews before merging.
Explanation
This option is incorrect. Branch protection improves code quality and prevents unwanted changes, but it does not limit who can view the repository or enforce two‑factor authentication. Sensitive data would still be accessible to any user with read access.
Create a fork of the repository and grant access only via pull‑request submissions.
Explanation
This option is incorrect. Forking does not hide the original repository, and contributors can still clone the upstream repository if they have read access. It also does not enforce two‑factor authentication, leaving the security controls incomplete.
Overall explanation
The question tests knowledge of how to combine visibility settings with authentication enforcement on Git Hub. The correct approach is to make the repository Private, which restricts read and write access to explicitly added collaborators, and to enable the organization‑level policy that requires two‑factor authentication for all members, guaranteeing that every user who accesses the repo has stronger credentials. Common misconceptions include believing that signed commits, CODEOWNERS, branch protection, or internal visibility alone provide the needed security, but those controls either do not hide the repository or do not enforce 2FA. In real‑world scenarios, organizations handling secrets (API keys, credentials) typically combine private repositories with mandatory 2FA to meet compliance standards such as SOC 2 or ISO 27001. Best practice is to also audit collaborator permissions regularly and enable additional measures like secret scanning to further protect sensitive data.
Domain
Repository Security
Question 30
Skipped
As a SRE engineer, you are tasked with optimizing the performance of a Git Hub repository that uses Git Hub Actions for continuous integration and continuous deployment. The repository must be optimized for a zero‑downtime requirement. What is the KEY difference between Blue/Green deployment and Canary deployment in this context?
Blue/Green deployment creates a full duplicate production environment and switches traffic only after the new version passes all tests, whereas Canary deployment updates the existing environment in place and gradually routes traffic to the new version.
Explanation
This statement mixes two concepts but is not the core key difference. Both strategies can involve testing before traffic shift, but the essential contrast lies in the way traffic is switched. The description is partially correct yet does not emphasize the instantaneous cut‑over that defines Blue/Green for zero‑downtime.
Blue/Green deployment reinvents the entire CI pipeline for each release, while Canary deployment reuses the same workflow file for all releases.
Explanation
This is incorrect. Deployment strategies do not dictate how CI pipelines are written; they operate after the pipeline produces an artifact. Changing the pipeline per release is not a characteristic of Blue/Green, making this a common misunderstanding about the scope of deployment techniques.
Correct answer
The primary distinction is that Blue/Green performs an instantaneous cut‑over to a completely separate, fully provisioned environment, guaranteeing zero‑downtime, whereas Canary rolls out changes incrementally to a fraction of users, accepting brief periods of mixed versions.
Explanation
This option correctly captures the key difference. Blue/Green swaps traffic to a brand‑new environment only after it is fully ready, eliminating user impact, while Canary gradually introduces the new version, which can lead to a short window where both versions run simultaneously. This distinction directly affects zero‑downtime guarantees and is the focus of the question.
Blue/Green deployment mandates the use of self‑hosted runners, while Canary deployment can only run on Git Hub‑hosted runners.
Explanation
This is false. The choice of runner type is independent of the deployment strategy; both Blue/Green and Canary can be executed on any runner configuration. Confusing runner requirements with deployment patterns is a typical misconception among newcomers.
Blue/Green deployment always requires manual approval before traffic is switched, whereas Canary deployment is entirely automated without any need for monitoring.
Explanation
This statement is misleading. While many teams add manual approval to Blue/Green for safety, it is not a mandatory requirement, and Canary deployments often include automated gates and continuous monitoring. Assuming strict manual vs. automated dichotomy oversimplifies real‑world practice.
Blue/Green deployment stores build artifacts in Git Hub Packages, while Canary deployment stores them in Docker Hub.
Explanation
This is incorrect. Artifact storage locations are orthogonal to the deployment strategy; both approaches can use any registry or storage service. Mixing artifact hosting with deployment methodology reflects a common confusion about where the differences actually lie.
Overall explanation
The question tests understanding of the fundamental contrast between Blue/Green and Canary deployment strategies in the context of achieving zero‑downtime releases. Blue/Green creates a parallel production environment and switches all traffic in a single, atomic operation, ensuring users never encounter a partially updated system. Canary, on the other hand, introduces the new version to a small subset of traffic and ramps it up gradually, which can cause a brief overlap of versions. The other options confuse unrelated aspects such as CI pipeline design, runner selection, approval requirements, or artifact storage, which are not intrinsic to the deployment model itself. Remember that zero‑downtime is most reliably achieved with an instantaneous cut‑over, a hallmark of Blue/Green, while Canary trades that guarantee for the ability to observe behavior under real load before full rollout.
Domain
Deployment Strategies
Question 31
Skipped
As a Dev Ops engineer, you're tasked with automating the build and deployment process for a web application on Git Hub. You need to trigger the deployment whenever a new commit is pushed to the main branch. Which Git Hub feature should you use to achieve this?
Git Hub Pages
Explanation
Git Hub Pages is a service for hosting static websites directly from a repository. It does not provide a way to run arbitrary build scripts or trigger deployments based on code pushes. Using Pages for this purpose would only serve static content and would not execute your CI/CD pipeline.
Git Hub Webhooks
Explanation
Webhooks allow Git Hub to send HTTP POST payloads to an external service when events occur. While a webhook could be configured to notify a CI server, it does not itself execute build or deployment steps. Relying solely on webhooks would require you to maintain another system to handle the actual automation, which defeats the purpose of an integrated solution.
Correct answer
Git Hub Actions
Explanation
Git Hub Actions is Git Hub's native CI/CD platform that runs workflows defined in YAML files. You can configure a workflow to trigger on a push event to the main branch, automatically executing build, test, and deployment steps. This provides an all‑in‑one, version‑controlled automation solution directly within the repository.
Git Hub Releases
Explanation
Git Hub Releases is a mechanism for creating versioned snapshots of the repository source code and attaching binary assets. It does not automatically run build scripts or respond to every commit; releases are typically created manually or via a separate automation step. Therefore it cannot be used as the primary trigger for continuous deployment.
Git Hub Packages
Explanation
Git Hub Packages is a package registry for storing Docker images, npm packages, and other artifacts. It is useful for publishing built artifacts but does not itself monitor branch activity or initiate builds. Using Packages alone would require an external CI system to produce the packages first.
Git Hub Projects
Explanation
Git Hub Projects provides Kanban‑style boards for tracking work items, issues, and pull requests. It is a planning and visualization tool, not an execution engine for builds or deployments. Selecting Projects would not result in any automated actions when code is pushed.
Overall explanation
The question tests knowledge of Git Hub's built‑in automation capabilities for continuous integration and deployment. Git Hub Actions is the only feature that lets you define a workflow that automatically runs on a push to a specific branch, handling compilation, testing, and deployment steps without external services. Common misconceptions arise because other Git Hub services—Pages, Webhooks, Releases, Packages, and Projects—deal with hosting, notifications, artifact storage, or planning, but they do not execute pipelines. Understanding the distinction helps you choose the right tool: Actions for CI/CD, Pages for static site hosting, Webhooks for custom integrations, Releases for versioned snapshots, Packages for artifact registries, and Projects for project management. Best practice is to store the workflow definition in the repository (e. g., . github/workflows/deploy. yml) and use the `on: push` trigger limited to the `main` branch to ensure reliable, automated deployments.
Domain
CI/CD
Question 32
Skipped
You're a developer working on an open-source project hosted on Git Hub. You've received multiple issues and pull requests from the community. Which TWO approaches should you take to manage these contributions effectively?
Correct selection
Add detailed issue and pull request templates to the repository to guide contributors.
Explanation
This option is correct. Issue and PR templates provide a consistent structure for contributors, ensuring that necessary information (such as reproduc steps or test results) is supplied up front. When contributors follow a template, maintainers spend less time asking for clarification, which speeds up triage and review.
Correct selection
Publish a CONTRIBUTING. md file that explains coding style, test requirements, and the review workflow.
Explanation
This option is correct. A CONTRIBUTING. md file serves as a central reference for community members, outlining expectations for code quality, testing, and the pull‑request process. Clear guidelines reduce friction, help new contributors follow project standards, and lead to higher‑quality contributions.
Assign every new issue automatically to the repository owner without any triage.
Explanation
This option is incorrect. Automatically assigning all issues to a single owner creates a bottleneck and ignores the need to prioritize or route issues to the most appropriate maintainer. Without triage, low‑impact or duplicate issues may overwhelm the owner and delay response times for critical bugs.
Merge pull requests as soon as they appear, without running CI tests or code review.
Explanation
This option is incorrect. Skipping automated testing and peer review introduces a high risk of bugs, security regressions, or style violations entering the codebase. In real projects, CI pipelines and reviews catch issues early, protecting the stability of the main branch.
Disable the issue tracker and only accept contributions via email to keep the repository clean.
Explanation
This option is incorrect. Disabling the built‑in issue tracker removes a core collaborative feature of Git Hub, making it harder for the community to report bugs or suggest enhancements publicly. Email submissions are opaque, hard to search, and do not integrate with the project's workflow tools.
Require every contributor to sign a formal Contributor License Agreement before any contribution, regardless of contribution size.
Explanation
This option is incorrect. While a CLA can be useful for some projects, mandating it for every tiny change creates unnecessary friction and discourages casual contributors. Many successful open‑source projects rely on simple contributor guidelines instead of a formal CLA, especially when contributions are small or non‑code.
Overall explanation
The question tests knowledge of best practices for handling community contributions on Git Hub. Effective projects provide structured guidance through issue/PR templates and a CONTRIBUTING. md file, which standardize the information supplied and set clear expectations. Common misconceptions include assuming that rapid, unchecked merges or automatic assignment to a single owner will speed up development, but these practices usually lead to bottlenecks, lower quality, and contributor frustration. Disabling native Git Hub tools or imposing heavyweight legal requirements also harms the open‑source workflow. Remember to combine clear documentation with automation (templates) and lightweight governance to keep contributions flowing smoothly while maintaining code quality.
Domain
Contribution Management
Question 33
Skipped
A product engineer is creating a new Git Hub repository for a project. The project requires a centralized knowledge base for documentation and project information. What is the MOST appropriate tool to use in this scenario?
Git Hub Pages
Explanation
Incorrect. Git Hub Pages is a service for publishing static websites from a repository, which is useful for marketing sites or documentation sites but requires you to manage the site structure, navigation, and markdown-to-HTML conversion yourself. While you could host a knowledge base on Pages, it lacks the built‑in edit‑in‑place experience and versioning granularity that a wiki provides. Consequently, teams often encounter extra maintenance overhead and slower collaboration when using Pages for internal documentation.
README. md file in the root of the repository
Explanation
Incorrect. A single README file is great for an overview or quick start guide, but it is not designed for a comprehensive, multi‑page knowledge base. Adding extensive content quickly makes the file unwieldy, and navigating between sections is cumbersome compared to a structured wiki. In real projects, relying solely on a README can lead to fragmented information and difficulty locating specific guidance.
Correct answer
Git Hub Wiki
Explanation
Correct. Git Hub Wiki offers a built‑in, multi‑page documentation system that lives alongside the repository, supporting markdown editing, version history, and per‑page permissions. It allows contributors to create, edit, and organize pages without leaving the Git Hub interface, making it ideal for a centralized knowledge base. Teams that adopt the wiki can quickly locate project policies, architecture diagrams, and onboarding material, leading to higher documentation quality and easier knowledge transfer.
Git Hub Discussions
Explanation
Incorrect. Discussions is designed for open‑ended conversations, Q&A, and community brainstorming rather than structured documentation. While it can capture useful insights, the content is threaded and not organized into hierarchical pages, making it hard to maintain as a definitive reference. Using Discussions as a primary knowledge base often results in duplicate information and difficulty finding authoritative answers.
Git Hub Projects board
Explanation
Incorrect. Projects provides Kanban‑style boards for tracking tasks, milestones, and work items, which is excellent for workflow management but not for storing detailed documentation. It lacks rich text formatting, versioning per page, and hierarchical organization needed for a knowledge base. Attempting to store project information here would mix planning artifacts with documentation, reducing clarity and discoverability.
Issue Tracker
Explanation
Incorrect. The Issue Tracker is intended for reporting bugs, feature requests, and work items, each with its own lifecycle and labels. Although you can add markdown content to each issue, it is not suited for a persistent, searchable knowledge repository. Misusing issues for documentation can clutter the backlog and make it harder to distinguish between actionable work and reference material.
Overall explanation
The question tests understanding of Git Hub's built‑in collaboration tools and which one best serves as a centralized, editable knowledge base. Git Hub Wiki is explicitly created for multi‑page documentation, offering version control, easy in‑browser editing, and a structure that mirrors traditional wikis, making it the optimal choice. Common misconceptions include assuming that Pages, README, or Discussions can serve the same purpose, but each lacks either the editing experience, organization, or intended use case for a living documentation hub. Selecting the correct tool helps teams keep project information consistent, searchable, and maintainable, reducing duplication and onboarding friction. In practice, most organizations adopt the wiki for internal docs while reserving Pages for public sites, READMEs for overviews, Discussions for community conversations, Projects for task tracking, and Issues for work items.
Domain
Documentation
Question 34
Skipped
A developer is working on a feature branch and has created a Git Hub issue to track the progress. The feature requires input from multiple team members. Which configuration achieves this collaboration on Git Hub?
Correct answer
Create a pull request from the feature branch and request reviews from the required team members.
Explanation
This option is correct. By opening a pull request and explicitly requesting reviews, the developer invites the designated teammates to comment, suggest changes, and approve the code. In practice this creates a formal review workflow where each reviewer can leave line‑by‑line feedback, ensuring that the feature incorporates input from all required parties before it is merged.
Assign multiple individual users as assignees on the issue.
Explanation
This option is incorrect. While Git Hub does allow multiple assignees on an issue, assigning users does not automatically provide a mechanism for structured feedback on code changes. Without a pull request review step, collaborators may comment on the issue but lack a clear place to review the actual implementation, which can lead to fragmented discussions and missed code‑level insights.
Add the issue to a Git Hub Project board without assigning anyone.
Explanation
This option is incorrect. Adding the issue to a project board helps with visual tracking, but it does not facilitate direct collaboration or feedback from team members on the feature implementation. Project boards are primarily for workflow organization, not for collecting detailed code review input from multiple contributors.
Enable a Git Hub Action that automatically comments on the issue when new commits are pushed.
Explanation
This option is incorrect. Automated comments can provide notifications, but they do not replace human review or enable multiple team members to discuss and approve the changes. Relying solely on bots can give a false sense of collaboration while actual peer feedback is still missing.
Convert the issue into a milestone to track the work.
Explanation
This option is incorrect. Milestones group issues and pull requests by a target date or release, but they do not create a collaborative review mechanism. Converting an issue to a milestone helps with scheduling, yet it does not allow team members to contribute directly to the code review process.
Lock the conversation on the issue to restrict comments to collaborators only.
Explanation
This option is incorrect. Locking a conversation prevents further discussion from all users except those with write access, which actually hinders collaboration rather than enabling it. It is used to stop spam or off‑topic chatter, not to foster the multi‑person input required for a feature development.
Overall explanation
The question tests knowledge of Git Hub's collaborative review workflow. The correct approach is to open a pull request from the feature branch and request reviews from the relevant team members, because this creates a structured environment where reviewers can comment on specific code lines, approve changes, and suggest improvements. Assigning multiple users to an issue, using project boards, milestones, or automation only aids tracking or notification but does not provide the detailed peer‑review mechanism needed for code quality. Locking a conversation is a moderation tool and actually blocks collaboration. In real projects, teams rely on pull‑request review requests to ensure that all required expertise is applied before code is merged, reflecting best practices for code reliability and shared ownership.
Domain
Collaboration Workflow
Question 35
Skipped
As a tech lead, you're responsible for ensuring the security and compliance of your team's Git Hub repositories. You've noticed that some repositories have sensitive information in the commit history. What is the PRIMARY reason for this behaviour?
Correct answer
Git records the entire history of changes, so once a secret is committed it remains in past commits even after removal.
Explanation
This option is correct. Git stores every snapshot of the repository as immutable commit objects, meaning that data committed once is retained forever unless the history is rewritten. Consequently, even if a developer later deletes a file or rewrites a file, the original secret remains accessible in earlier commits, which can be exposed through logs, pull requests, or by anyone cloning the repo.
Git Hub automatically encrypts all files in a repository, preventing any sensitive data from being read after a commit.
Explanation
This option is incorrect. Git Hub does not encrypt repository contents by default; it stores the data as plain text blobs in the Git object database. Therefore, any secrets committed are stored in clear text and can be read by anyone with repository access, which is why encryption alone does not solve the problem of leaked secrets in history.
Developers usually rely on . gitignore to block secrets, but Git Hub ignores . gitignore for large binary files, causing the exposure.
Explanation
This option is incorrect. The . gitignore file only prevents untracked files from being added to the repository; it has no effect on files that have already been committed. Large binary files are treated the same as any other file regarding . gitignore, and once a secret is committed, . gitignore cannot retroactively hide it.
Git's garbage collection immediately deletes any removed files, so the presence of secrets is due to local caching on developers' machines.
Explanation
This option is incorrect. Git's garbage collection (git gc) only cleans up unreachable objects after a certain period and does not delete data that is still reachable in the commit history. Sensitive data that remains in reachable commits will persist regardless of local caches, making garbage collection irrelevant to the core issue.
Branch protection rules force all commits to be retained indefinitely, making it impossible to delete sensitive data from the repository.
Explanation
This option is partially misleading but ultimately incorrect. Branch protection rules can prevent force‑pushes or deletion of branches, which might discourage history rewriting, but they do not inherently cause the existence of secrets in history. The primary technical cause is Git's immutable commit model, not the protection settings themselves.
Git's shallow clone feature hides old commits, which means sensitive data only appears in full clones and is therefore not an issue for most users.
Explanation
This option is incorrect. While shallow clones omit older history, they do not erase the sensitive data from the full repository; any user who performs a full clone can still access the secrets. Relying on shallow clones as a security measure gives a false sense of safety and does not address the root cause of leaked secrets.
Overall explanation
The question tests understanding of Git's immutable history and why secrets persist in commit logs. The correct answer highlights that once a secret is committed, Git preserves it in every snapshot, so later deletions do not erase it from history. Common misconceptions include believing that Git Hub automatically encrypts data, that . gitignore can retroactively protect committed files, or that branch protection rules remove the underlying issue. Misunderstanding garbage collection or shallow clones also leads to false confidence in security. Best practice is to avoid committing secrets in the first place, use tools like secret scanning, and, if a secret is accidentally committed, employ history‑rewriting techniques (e. g., git filter‑repo) followed by a force‑push and rotation of the compromised credentials.
Domain
Secrets Management
Question 36
Skipped
A data engineer is creating a data science project on Git Hub and needs to host a website to showcase the project's results. Which Git Hub feature is BEST suited for this purpose?
Git Hub Actions
Explanation
This option is incorrect. Git Hub Actions is a workflow automation engine that runs CI/CD pipelines, tests, and other scripted tasks. While you could technically use an Action to build and deploy a site, it does not provide a persistent hosting environment for static content, so it is not the feature intended for direct website hosting.
Git Hub Wiki
Explanation
This option is incorrect. A Git Hub Wiki offers a separate Markdown‑based documentation space attached to a repository, useful for internal project docs and knowledge bases. It renders pages within the Git Hub UI but does not expose a standalone public URL that can be used as a custom website for showcasing results.
Correct answer
Git Hub Pages
Explanation
This option is correct. Git Hub Pages is a built‑in service that hosts static HTML, CSS, and Java Script directly from a repository, providing a public URL (e. g., username. github. io/repo). Data scientists often use it to publish dashboards, notebooks rendered as static sites, or interactive visualisations, making it the ideal choice for showcasing project outcomes.
Git Hub Releases
Explanation
This option is incorrect. Git Hub Releases are meant for packaging and distributing versioned binaries, archives, or source snapshots alongside release notes. They do not serve as a web server and cannot render a full website, so they are unsuitable for presenting project results to a broader audience.
Git Hub Packages
Explanation
This option is incorrect. Git Hub Packages provides a registry for container images, npm packages, Maven artifacts, and other binaries, allowing them to be stored and fetched within the same ecosystem. It does not host static web content, so it cannot be used to display a public-facing website for a data science project.
Git Hub Projects
Explanation
This option is incorrect. Git Hub Projects offers Kanban‑style boards for tracking tasks, issues, and pull requests across one or more repositories. While helpful for project management, it does not deliver any web hosting capabilities, making it irrelevant for publishing a showcase site.
Overall explanation
The question tests knowledge of Git Hub's built‑in static site hosting feature. Git Hub Pages is specifically designed to serve HTML, CSS, and Java Script files directly from a repository, giving users a simple way to publish project documentation, visualisations, or dashboards without external infrastructure. Common misconceptions arise because other Git Hub tools—such as Actions, Releases, or Packages—also involve automation or distribution, leading some learners to think they might double as hosting solutions. However, those services serve distinct purposes: Actions runs workflows, Releases publishes versioned artifacts, and Packages stores binary packages, none of which provide a public website endpoint. Best practice is to place the site’s source files in the designated branch (often 'gh-pages' or 'main') and enable Git Hub Pages in the repository settings to get a reliable, free hosting solution.
Domain
Static Site Hosting
Question 37
Skipped
You're a developer working on a project with multiple collaborators. You've noticed that some team members are not following the project's coding standards. What is the MOST likely root cause of this issue?
Team members lack the technical skill to understand the coding standards.
Explanation
This option is incorrect. While skill gaps can affect code quality, coding standards are deliberately written to be understandable by all contributors, irrespective of seniority. If standards are too complex, the usual remedy is to simplify them, not to assume a lack of competence.
The project repository's permission settings hide the standards file from most contributors.
Explanation
This option is incorrect. Repository permissions typically control write access, not read access to documentation files that are part of the codebase. Even if a file were hidden, the team would quickly notice missing documentation, which is a rare scenario.
A misconfigured CI pipeline automatically reformats code, masking style violations.
Explanation
This option is incorrect. Automated formatting tools can hide some style issues, but they do not prevent developers from intentionally writing code that diverges from the standards. Moreover, CI failures would surface when formatting is not applied, making this an unlikely root cause for consistent non‑compliance.
Correct answer
The coding standards have never been documented or communicated clearly to the team.
Explanation
This option is correct. When standards are not recorded in a central location or not shared during onboarding, developers have no reference and will naturally write code in their own style. In practice, this leads to a heterogeneous codebase, increased review time, and defects that could have been avoided with clear guidance.
The coding standards are overly restrictive and conflict with common language idioms.
Explanation
This option is incorrect. While overly strict standards can cause frustration, they are still visible to the team. The primary issue would then be resistance, not ignorance, and the solution would involve revising the standards, not identifying a root cause of non‑adherence.
Different IDEs used by the team do not support the project's linting configuration.
Explanation
This option is incorrect. Most modern IDEs can be configured to honor external linting rules, and lack of support would be apparent during setup. The real problem would be a configuration gap rather than a fundamental cause of ignoring standards.
Overall explanation
The question tests understanding of why developers might ignore coding standards. The most common root cause is the absence of clear, documented, and communicated guidelines, which leaves team members unsure of expectations. Distractors such as skill deficits, permission issues, CI masking, overly strict rules, or IDE incompatibility are plausible but do not address the fundamental gap in communication. In real projects, failing to publish a style guide leads to inconsistent code, longer code‑review cycles, and increased technical debt. Best practice is to maintain a living document (e. g., a CONTRIBUTING. md file) and to reinforce it through onboarding, code reviews, and automated linting.
Domain
Collaboration Practices
Question 38
Skipped
A QA engineer is testing a new feature on a Git Hub repository. The feature requires a specific test environment to be set up. Which tool or feature is BEST suited for creating this environment on Git Hub?
Git Hub Actions
Explanation
Git Hub Actions is a powerful CI/CD platform that can run tests in containers or virtual machines, but it does not itself provision a persistent, fully configured development environment for interactive testing. It is primarily used to automate workflows rather than provide a ready‑to‑use workstation. While you can spin up a container for a single job, the environment disappears after the job finishes, making it less ideal for a reusable test environment.
Correct answer
Git Hub Codespaces
Explanation
Git Hub Codespaces is the correct answer because it delivers a cloud‑hosted, configurable development environment that can be defined with a devcontainer. json file. This allows the QA engineer to spin up an identical environment on demand, complete with all dependencies, tooling, and configurations needed for testing. In real‑world usage, teams use Codespaces to ensure that every tester works in the same environment, eliminating "it works on my machine" problems.
Git Hub Environments
Explanation
Git Hub Environments are used to define deployment targets and protection rules for releases, not to create or configure runtime test environments. They help coordinate approvals and secrets for production, staging, or other deployment stages. Confusing them with an actual compute environment is a common misconception, but they do not provision any machines or containers.
Git Hub Pages
Explanation
Git Hub Pages is a static site hosting service that serves HTML, CSS, and Java Script directly from a repository. It is unrelated to creating a test environment for backend code or services. Some learners mistakenly think any Git Hub feature can host code execution, but Pages only serves static content.
Git Hub Packages
Explanation
Git Hub Packages is a package registry for Docker images, npm packages, and other artifacts. While you can store a pre‑built test image there, Packages does not launch or configure an environment; you would still need a runner or Codespace to run the image. The misconception is that a package registry can also act as a compute platform, which it cannot.
Dependabot
Explanation
Dependabot automatically checks for and updates vulnerable dependencies in a repository. It does not provide any environment creation capabilities. Learners sometimes conflate dependency management tools with environment provisioning, but Dependabot's scope is limited to version updates.
Overall explanation
The question tests knowledge of how to provision reproducible test environments directly within the Git Hub ecosystem. Git Hub Codespaces is purpose‑built for this scenario, allowing a developer or QA engineer to launch a pre‑configured container or VM that mirrors the required setup. Other features like Git Hub Actions automate testing but do not persist an interactive environment, while Environments, Pages, Packages, and Dependabot serve unrelated purposes such as deployment gating, static site hosting, artifact storage, and dependency management. Understanding the distinct roles of these Git Hub services prevents misuse, such as trying to run complex integration tests on Git Hub Pages. Best practice is to define the environment once (e. g., in a devcontainer) and reuse it via Codespaces for consistency across the team.
Domain
Development Environments
Question 39
Skipped
You're an architect designing a new system on Git Hub. The system requires multiple repositories to be managed and coordinated. Which THREE approaches should you take to manage these repositories effectively?
Correct selection
Create a Git Hub Organization, define Teams, and assign repository-level permissions to those teams.
Explanation
This option is correct. An organization provides a top‑level container for related repositories, and teams allow you to group users by role and grant consistent access across many repos. In practice, this prevents the need to add collaborators individually to each repository and makes revoking or changing permissions a single‑point operation.
Correct selection
Use Git submodules to include one repository inside another, allowing shared code to be versioned independently.
Explanation
This option is correct. Submodules let you keep separate repositories while still being able to reference a specific commit of a dependent repo from a parent repo, which is useful for coordinating releases across services. Teams often rely on submodules for shared libraries so that each service can update its dependency on its own schedule without merging unrelated code.
Adopt a mono‑repository (single repository) strategy so all components live in one large repo.
Explanation
This option is incorrect. While a mono‑repo can simplify coordination, the premise of the question is that the system already requires multiple repositories, making a single repo an unsuitable solution. Switching to a mono‑repo would involve rewriting the architecture and could introduce unnecessary coupling and larger checkout times.
Correct selection
Create Git Hub Actions workflows that automate cross‑repository tasks, such as triggering builds or opening pull requests when a dependent repo changes.
Explanation
This option is correct. Automation via Actions reduces manual overhead and ensures that updates propagate consistently across all repositories involved in the system. For example, a workflow can listen for a tag event in a shared component repo and automatically open a PR in each consumer repo, keeping versions in sync.
Rely on manual cloning, pulling, and pushing in each repository without any automation or shared tooling.
Explanation
This option is incorrect. Manual processes are error‑prone, do not scale, and often lead to drift between repos when updates are missed. In a real‑world micro‑services environment, such an approach would quickly become a bottleneck and increase the chance of production outages due to mismatched dependencies.
Use separate Git Hub Project boards for each repository to track work, without linking the boards together.
Explanation
This option is incorrect. Project boards are useful for visualizing work, but they do not provide the coordination mechanisms needed for multi‑repo synchronization like permission management, dependency tracking, or automated propagation of changes. Without additional linking or automation, teams may miss cross‑repo dependencies, leading to fragmented planning.
Overall explanation
The question tests the ability to orchestrate multiple repositories on Git Hub in a scalable and maintainable way. Proper solutions involve using an organization with teams for centralized permission control, leveraging submodules to keep repositories separate yet linked, and automating cross‑repo interactions with Git Hub Actions. Common misconceptions include assuming a mono‑repo solves all coordination problems or that manual processes are sufficient, both of which ignore the complexities of multi‑repo environments. Project boards alone do not provide the technical coordination required, and relying on manual cloning leads to human error. Best practice is to combine structural (organizations/teams), technical (submodules or subtrees), and automation (Actions) approaches to achieve consistent, auditable, and efficient multi‑repo management.
Domain
Multi-repo Coordination
Question 40
Skipped
As a developer, you're working on a project with a tight deadline. You've noticed that the project's Git Hub repository is not optimized for performance. What is the KEY difference between optimizing for performance versus optimizing for security in this context?
Performance optimization is achieved by enabling Git Hub Actions caching, which speeds up CI pipelines, while security optimization is achieved by disabling branch protection rules to allow faster merges.
Explanation
This option is incorrect. Enabling Git Hub Actions caching indeed improves build performance, but it does not define the fundamental difference between performance and security concerns. Disabling branch protection would actually weaken security rather than represent a security‑focused optimization. Mixing the two in this way confuses the separate goals of each discipline.
Optimizing for performance means storing larger binary assets directly in the repository because larger files load faster, whereas security optimization means encrypting those files with Git‑crypt.
Explanation
This option is incorrect. Larger files generally slow down clone and fetch operations; performance optimization usually involves reducing file size or using Git LFS, not enlarging them. Encrypting files can protect data, but it also adds overhead and is not the defining characteristic of security optimization in repository management. The statement mixes misconceptions about file size and encryption.
Correct answer
Performance optimization focuses on reducing clone size, network latency, and build times (e. g., using shallow clones, Git LFS, and packfile compression), while security optimization focuses on protecting the repository’s integrity and confidentiality (e. g., enforcing branch protection, required code reviews, signed commits, and secret scanning).
Explanation
This option is correct. It clearly distinguishes that performance work targets speed and efficiency, whereas security work targets access control and data integrity. Real‑world examples include using "git clone --depth=1" to speed up checkouts and enabling "Require signed commits" to ensure code authenticity, which illustrate the separate objectives.
Optimizing for security means making the repository public so more eyes can spot vulnerabilities, which also incidentally improves performance because public mirrors are faster.
Explanation
This option is incorrect. Making a repository public does not enhance security; it generally reduces confidentiality. While public mirrors can speed up access, the primary goal of security optimization is to restrict who can read or write, not to increase visibility. This conflates openness with security and misrepresents best practices.
Both performance and security optimizations are handled by running "git gc" regularly, because garbage collection cleans up the repository and thus improves both speed and safety.
Explanation
This option is incorrect. Running "git gc" does help reduce repository size and can improve performance, but it does not address security controls such as authentication or branch protection. Security optimizations involve policy enforcement and credential management, which are unrelated to garbage collection. The answer mistakenly assumes a single command solves both concerns.
Performance optimization is achieved by providing a downloadable zip archive of the repository, eliminating the need for Git commands, whereas security optimization is achieved by disabling two‑factor authentication to simplify login for developers.
Explanation
This option is incorrect. Supplying a zip archive can be a quick download method but does not replace the need for efficient Git operations and can bypass version control benefits. Disabling two‑factor authentication directly harms security and is contrary to best practices. Both statements mischaracterize the true nature of performance and security optimization.
Overall explanation
The question tests understanding of the distinct goals of performance versus security optimization in a Git Hub repository. Performance work is about making operations faster—reducing clone size, leveraging shallow clones, using Git LFS, and compressing packfiles—while security work is about protecting code integrity and restricting access through branch protection, required reviews, signed commits, and secret scanning. Options 1, 2, 4, 5, and 6 each contain a kernel of truth but mix concepts or present practices that would actually degrade one of the two goals, reflecting common misconceptions such as equating speed with reduced security or assuming a single tool can solve both problems. The correct answer (Option 3) precisely draws the line between these two optimization domains and provides concrete examples. Learners should remember that performance and security optimizations are complementary but separate; improving one should not unintentionally compromise the other.
Domain
Repository Management
Question 41
Skipped
As a Dev Ops engineer, you are tasked with automating the build and deployment of a new web application on Git Hub. You want to create a CI/CD pipeline that triggers on every push to the main branch. Which Git Hub feature should you use to automate this process?
Git Hub Pages
Explanation
This option is incorrect. Git Hub Pages is a static site hosting service that serves HTML, CSS, and Java Script directly from a repository. While it can be used to publish documentation or simple sites, it does not provide the workflow engine needed to run builds, tests, or deployments on each push.
Git Hub Webhooks
Explanation
This option is partially correct but ultimately incorrect for the asked scenario. Webhooks can notify external services of repository events such as pushes, but they do not themselves execute build or deployment steps. Using a webhook requires you to maintain a separate CI server, adding extra infrastructure overhead.
Git Hub Projects
Explanation
This option is incorrect. Git Hub Projects is a Kanban‑style tool for tracking issues, pull requests, and tasks across a repository or organization. It has no capability to run code, trigger builds, or manage deployment pipelines.
Correct answer
Git Hub Actions
Explanation
This option is correct. Git Hub Actions provides a built‑in CI/CD platform that lets you define workflows triggered by events such as a push to the main branch. With a YAML workflow file, you can specify build, test, and deployment jobs, and the entire pipeline runs within Git Hub's infrastructure, simplifying automation.
Git Hub Packages
Explanation
This option is incorrect. Git Hub Packages is a package registry for storing and distributing container images, npm packages, Maven artifacts, etc. It does not orchestrate build or deployment processes; rather, it is a destination where build artifacts can be published after a pipeline runs.
Git Hub Issues
Explanation
This option is incorrect. Git Hub Issues is a tracking system for bugs, feature requests, and discussion. It has no automation capabilities and cannot initiate build or deployment actions on code changes.
Overall explanation
The question tests knowledge of Git Hub's native CI/CD capability. Git Hub Actions is the built‑in automation engine that lets you create workflows triggered by repository events such as pushes to the main branch, making it the appropriate choice for end‑to‑end build and deployment. Common misconceptions include confusing Actions with Webhooks, which only send notifications, or with Git Hub Pages, which only serves static content. Learners often mistake Git Hub Packages for a CI tool, but it is merely a storage location for artifacts. Best practice is to place the workflow definition in the . github/workflows directory, use appropriate runners, and secure secrets for deployment credentials.
Domain
CI/CD Automation
Question 42
Skipped
You are a developer working on a project that uses Git Hub issues to track bugs and feature requests. You want to create a new issue that is related to an existing issue. Which TWO options can you use to link the issues?
Add a label that contains the other issue's number.
Explanation
This is incorrect. Labels are used for categorizing issues, not for establishing relationships between them. Adding a label like "#42" will not create any clickable link or relationship in Git Hub's issue view.
Correct selection
Mention the other issue by its number prefixed with # in the new issue’s description or comment.
Explanation
This is correct. Writing "Related to #123" creates an automatic reference link that Git Hub renders as a clickable connection between the two issues. This simple markdown reference is widely used to show that work is connected without defining a specific relationship type.
Use a Git commit message that references the other issue number.
Explanation
This is incorrect for linking two issues directly. While a commit can reference an issue to indicate that the commit addresses it, it does not create a bidirectional link between two issue records. Therefore it does not satisfy the requirement of relating one issue to another within the issue tracker.
Add the related issue as an attached file to the new issue.
Explanation
This is incorrect. Attachments are meant for supplementary data such as screenshots or logs, and they do not generate any logical connection or navigation between issue pages. Users would have to manually open the attached file to find the reference, which defeats the purpose of automatic linking.
Correct selection
Use the "Linked issues" sidebar to select a relationship type (e. g., relates to, blocks).
Explanation
This is correct. The Linked issues UI enables you to explicitly define relationships such as "blocks" or "duplicate", creating visible links on both issue pages. It is the recommended method when you need to convey the nature of the dependency or similarity between issues.
Set the same milestone for both issues.
Explanation
This is incorrect. Milestones group issues for planning and release purposes but do not create direct links between individual issues. Sharing a milestone may indicate they are part of the same release, yet there is no clickable relationship shown.
Overall explanation
Git Hub provides two primary mechanisms for linking issues: textual references and the dedicated Linked issues UI. Mentioning an issue number with a leading # (e. g., #123) creates an automatic, clickable reference, which is useful for informal relationships and quick navigation. The Linked issues sidebar, on the other hand, lets you define explicit relationship types such as "relates to", "blocks", or "duplicate", and shows the link on both side of the relationship. Common misconceptions include thinking that labels, milestones, or attached files create issue links; these elements serve different organizational purposes and do not generate the bidirectional connections that developers expect. In practice, combine both methods when appropriate: use a mention for a quick reference and the Linked issues feature when the relationship semantics matter for project tracking.
Domain
Issues Management
Question 43
Skipped
As a product engineer, you are tasked creating a public-facing documentation site for your company's API. You want to host the site on Git Hub and make it easily accessible to users. Which Git Hub feature should you use to host the site?
Git Hub Gists
Explanation
This option is incorrect. Git Hub Gists are designed for sharing small code snippets or single files, not for serving a full static website. Using Gists would limit the ability to organize multiple documentation pages and provide a custom domain, resulting in a poor user experience.
Git Hub Wiki
Explanation
This option is incorrect. While a Git Hub Wiki allows you to create documentation directly within a repository, it is rendered only within the Git Hub interface and cannot be served as a standalone public website with its own URL. Relying on a Wiki would prevent you from leveraging static site generators or custom styling that are common for API docs.
Correct answer
Git Hub Pages
Explanation
This option is correct. Git Hub Pages is a built‑in feature that serves static content directly from a repository, providing a public URL (or custom domain) for documentation sites. It integrates with Jekyll, Hugo, or other static site generators, making it the standard choice for publishing API documentation that is easily accessible to users.
Git Hub Releases
Explanation
This option is incorrect. Git Hub Releases are intended for packaging and distributing binary artifacts or source code snapshots, not for hosting a live, navigable website. Publishing documentation as a release would require users to download files manually instead of browsing a live site, which defeats the goal of easy access.
Git Hub Actions
Explanation
This option is incorrect. Git Hub Actions provides automation for CI/CD pipelines, testing, and deployment, but it does not itself host static content for end users. While you could use Actions to build and deploy a site to another service, the feature asked for in the question is the hosting mechanism, not the automation tool.
Git Hub Marketplace
Explanation
This option is incorrect. The Marketplace is a catalog of third‑party apps and services that integrate with Git Hub, not a hosting platform for static sites. Selecting it would not give you a URL or a place to serve documentation directly from your repository.
Overall explanation
The question tests knowledge of Git Hub's native static site hosting capabilities. Git Hub Pages is the dedicated service that renders files from a repository as a public website, supporting custom domains and integration with static site generators, making it ideal for API documentation. Options like Gists and Wiki are often confused with hosting because they can display content, but they lack the full website features and public URLs needed for a documentation portal. Releases and Marketplace serve entirely different purposes—artifact distribution and third‑party app discovery—so they are common misconceptions for beginners. Understanding the distinction helps engineers choose the right tool, ensuring documentation is discoverable, maintainable, and presents a professional experience to users.
Domain
Git Hub Pages
Question 44
Skipped
As a tech lead, you are tasked with managing a large open-source project on Git Hub. You want to create a project board to track the progress of your team's tasks. What is the PRIMARY reason for using a project board in this scenario?
To automate pull‑request merges based on defined criteria.
Explanation
This option is incorrect. A project board does not perform automated merges; that functionality is provided by branch protection rules, Git Hub Actions, or third‑party bots. Using a board for automation would give a false sense of security and could lead to unreviewed code being merged, which defeats the purpose of code review.
Correct answer
To centralize and visualize the status of tasks, making it easy for the whole team to see what needs to be done, what is in progress, and what is completed.
Explanation
This option is correct. Project boards provide a visual Kanban‑style layout where issues, pull requests, and notes can be moved across columns that represent different workflow stages. By having a single, shared view, the team can quickly assess bottlenecks, prioritize work, and coordinate effort, which is essential for large open‑source collaborations.
To control repository access levels for different contributors.
Explanation
This option is incorrect. Access control is managed through Git Hub's team and permission settings, not through project boards. Mistaking the board for a security tool could lead to improper permission configurations and potential exposure of sensitive code.
To store the project's README and other documentation in a single place.
Explanation
This option is incorrect. Documentation belongs in the repository itself, usually in the docs folder or the README file at the root, where it can be versioned with the code. Placing docs on a project board would make them hard to track across revisions and would not integrate with the codebase history.
To generate release notes automatically from merged pull requests.
Explanation
This option is incorrect. Automatic release‑note generation is handled by tools such as release‑drafter or Git Hub's release automation, not by project boards. Relying on a board for this task would leave release notes incomplete or out‑of‑sync with actual merges.
To enforce coding style guidelines through integrated linters.
Explanation
This option is incorrect. Code style enforcement is performed by CI workflows, pre‑commit hooks, or Git Hub Actions that run linters. A project board cannot run code analysis, and treating it as such would result in style violations slipping through the review process.
Overall explanation
Project boards in Git Hub are primarily a visual task‑management tool that lets teams see the current state of work items in one location. They are used to map issues and pull requests onto columns such as To‑Do, In‑Progress, and Done, enabling quick assessment of progress and bottlenecks. Common misconceptions include thinking boards automate merges, manage permissions, store documentation, generate release notes, or enforce linting—each of these responsibilities belongs to other Git Hub features like branch protection, team settings, the repository file system, release automation tools, and CI pipelines. Understanding the correct purpose of a project board helps teams coordinate large, distributed contributions effectively. Best practice is to link issues and PRs to the board, keep columns aligned with the team's workflow, and regularly review the board in stand‑up meetings to maintain alignment.
Domain
Project Boards
Question 45
Skipped
You are a data engineer working on a project that uses Git Hub to collaborate with your team. You want to create a wiki page that outlines the project's data architecture. Which THREE features can you use to make the wiki page more informative and engaging?
Correct selection
Insert images (PNG, SVG, etc.) to illustrate the data architecture diagram.
Explanation
This is correct. Git Hub wiki pages support standard Markdown image syntax, allowing you to embed visual assets such as architecture diagrams directly in the page. Including images makes the description easier to understand for stakeholders who may not be familiar with the textual description, and the images are version‑controlled along with the wiki repository.
Correct selection
Create Mermaid or Graph Viz diagrams directly in the wiki using markdown code blocks.
Explanation
This is correct. Git Hub Flavored Markdown now renders Mermaid diagrams, enabling you to write flowcharts, entity‑relationship diagrams, or pipeline visuals without external image files. Embedding these live diagrams improves readability and keeps the documentation up to date whenever the source text is edited.
Correct selection
Build markdown tables that summarize data sources, transformations, and destinations.
Explanation
This is correct. Markdown tables are a native feature of Git Hub wikis and let you present structured information—such as source systems, ETL steps, and target tables—in a clear, tabular format. Tables provide a quick reference for team members and can be edited alongside the rest of the page content.
Create a pull request directly from the wiki page to propose changes.
Explanation
This is incorrect. While the underlying wiki repository can be edited via Git and changes can be submitted through pull requests, the wiki UI does not provide a button to open a PR directly from the page. Users must clone the wiki repo, make edits, and then push a PR through the usual Git Hub workflow, which is more cumbersome than standard editing.
Use the wiki’s built‑in discussion forum to host Q&A about the data model.
Explanation
This is incorrect. Git Hub wikis do not have a native discussion or comment forum; conversations about documentation are typically handled via Issues or Discussions at the repository level. Assuming a built‑in forum leads to misplaced expectations and can cause important questions to be lost.
Add a badge that shows the repository’s CI status to the wiki page using a special Git Hub wiki extension.
Explanation
This is incorrect. Badges can be added to a wiki page using ordinary Markdown image links; there is no dedicated "wiki extension" required or provided by Git Hub. Stating that a special extension is needed misrepresents the simplicity of adding badges and may discourage users from enhancing their pages with useful status indicators.
Overall explanation
The question tests knowledge of the content‑enhancement features available in Git Hub wikis. Correct options focus on native Markdown capabilities—embedding images, using Mermaid diagrams, and constructing tables—all of which improve visual appeal and information density without leaving the wiki context. The incorrect choices reflect common misconceptions: users sometimes think the wiki UI supports direct pull‑request creation, includes its own discussion forum, or requires special extensions for badges, none of which are true. Understanding what the wiki can and cannot do helps teams create clear, maintainable documentation that leverages version control while avoiding wasted effort on nonexistent features. Best practice is to combine visual assets, structured tables, and lightweight diagrams to communicate complex data architectures effectively.
Domain
Wiki Documentation
Question 46
Skipped
As a tech lead designing a new e-commerce platform, you need to decide on the architecture. The platform must handle 10,000 concurrent users, and the team consists of 10 developers with varying skill levels. Which approach BEST satisfies these requirements?
Build a monolithic application hosted on a single large virtual machine, expecting it to handle 10,000 users with vertical scaling.
Explanation
This option is incorrect. A single VM creates a single point of failure and limits horizontal scalability, making it difficult to reliably serve 10,000 concurrent users. In a real‑world incident, if that VM crashes, the entire storefront goes down, causing revenue loss and poor user experience.
Adopt a microservices architecture with each service containerized and deployed on a self‑managed Kubernetes cluster, requiring the team to manage clusters and service meshes.
Explanation
This option is incorrect. While microservices can scale independently, managing a self‑hosted Kubernetes environment demands deep Dev Ops expertise that a small, skill‑varied team may lack. The operational overhead often leads to delayed releases and increased risk of misconfiguration, which can degrade performance during traffic spikes.
Correct answer
Implement a modular monolith deployed on a managed container service (e. g., AWS Fargate or Azure Container Apps) with auto‑scaling and load balancing, allowing the team to focus on business logic while the platform handles scaling.
Explanation
This option is correct. A modular monolith keeps codebase simple enough for developers of mixed skill levels while still benefiting from modern container orchestration and automatic scaling provided by managed services. In production, the platform can elastically add instances to handle 10,000 concurrent users without the team needing to manage complex cluster operations.
Use a serverless architecture where every function is written in a language unfamiliar to most developers, relying on vendor lock‑in for scaling.
Explanation
This option is incorrect. Serverless can scale instantly, but forcing the team to adopt an unfamiliar language adds a steep learning curve and can reduce code quality and velocity. Additionally, heavy reliance on a single vendor may create lock‑in concerns and limit flexibility for future architectural changes.
Choose a traditional three‑tier architecture with dedicated database, application, and web tiers, but manually provision capacity for peak load without automation.
Explanation
This option is incorrect. Manual capacity planning is error‑prone and cannot react quickly to sudden traffic spikes, risking overload or under‑utilized resources. Without automated scaling, the system may either crash under load or waste money during idle periods.
Deploy separate microservices for each bounded context on a managed service mesh, but assign a single developer to own each service, assuming they can become an expert instantly.
Explanation
This option is incorrect. Although a managed service mesh reduces operational burden, expecting each developer to instantly master a whole microservice is unrealistic and leads to knowledge silos. In practice, this can cause delays, inconsistent code quality, and difficulty maintaining the overall system.
Overall explanation
The question tests the ability to choose an architecture that balances scalability requirements with the capabilities of a small, heterogeneous development team. A modular monolith on a managed container platform offers the needed elasticity for 10,000 concurrent users while keeping the codebase and operational complexity within the team’s skill set. Options that rely on a single large VM, manual scaling, or highly complex self‑managed Kubernetes demand expertise the team does not have, making them risky choices. Serverless and microservices can provide scalability, but they introduce steep learning curves, potential vendor lock‑in, or ownership burdens that a varied team may struggle with. Best practice is to select a solution that offloads infrastructure scaling to a managed service while keeping the application design simple enough for all developers to contribute effectively.
Domain
Software Architecture
Question 47
Skipped
A Dev Ops engineer is tasked with migrating a legacy monolithic application to a microservices architecture. The application handles sensitive customer data and must comply with GDPR regulations. Which TWO options are correct?
Correct selection
Encrypt all customer data both at rest and in transit for each microservice, using TLS for network communication and strong encryption for stored data.
Explanation
This option is correct. GDPR requires that personal data be protected using appropriate technical measures, and encryption is a primary control for both storage and transmission. In a microservices environment each service may store or transmit data independently, so applying encryption per service ensures that a breach in one component does not expose clear‑text data elsewhere.
Store a single, monolithic database that all microservices share to simplify data management and compliance auditing.
Explanation
This option is incorrect. While a single database might simplify some audits, it re‑introduces the tightly coupled architecture that the migration aims to avoid and creates a single point of failure and a larger attack surface. GDPR also encourages data minimisation, which is harder to enforce when every service can access the entire dataset.
Correct selection
Implement a service mesh that provides mutual TLS and fine‑grained, role‑based access control between services.
Explanation
This option is correct. A service mesh can enforce mutual TLS automatically for every service‑to‑service call, guaranteeing encryption in transit, and it can enforce policies that limit which services may access particular data sets, supporting the principle of least privilege required by GDPR. Real‑world deployments (e. g., Istio or Linkerd) have shown reduced data‑leak incidents when mesh policies are applied consistently.
Rely on manual code reviews for data‑handling logic without any automated testing or compliance scanning.
Explanation
This option is incorrect. Manual reviews are valuable but cannot scale to the continuous delivery pipelines used for microservices, and they miss systematic checks for GDPR‑related issues such as unintended data exposure. Automated static analysis and compliance scans are necessary to maintain consistent protection across many independently deployed services.
Deploy every microservice in a global public cloud region without regard to data residency requirements.
Explanation
This option is incorrect. GDPR imposes restrictions on where personal data may be stored and processed; deploying services in regions without appropriate safeguards can lead to illegal transfers of EU personal data. Organisations must choose cloud regions that guarantee EU‑standard data protection or use appropriate contractual clauses.
Use an API gateway that performs authentication, request validation, and can enforce data‑subject‑access‑request (DSAR) handling logic centrally.
Explanation
This option is incorrect as a primary compliance measure. Although an API gateway can centralize authentication and validation, GDPR compliance is a broader responsibility that includes encryption, access controls, and data lifecycle management within each microservice. Relying solely on the gateway leaves internal service‑to‑service interactions unprotected and does not satisfy the technical safeguards required by GDPR.
Overall explanation
The question tests knowledge of GDPR‑driven security controls when refactoring a monolith into microservices. GDPR demands encryption of personal data both at rest and in transit, making option 1 essential, while option 3 adds the necessary mutual TLS and fine‑grained authorization that a service mesh provides. Options 2, 4, 5, and 6 reflect common misconceptions: believing a shared database simplifies compliance, relying only on manual reviews, ignoring data residency, or thinking an API gateway alone satisfies GDPR. In practice, organizations combine encryption, zero‑trust networking (service mesh), and robust data governance to meet the regulation. Remember that each microservice must be independently hardened, and compliance must be baked into the CI/CD pipeline, not treated as an afterthought.
Domain
Git & Git Hub
Question 48
Skipped
A developer is tasked with debugging a production incident where a service is experiencing high latency. The service is built using a service-oriented architecture, and the team uses a CI/CD pipeline for deployment. What is the PRIMARY reason for this behaviour?
Correct answer
A recent deployment introduced a performance regression, such as an inefficient algorithm or additional synchronous calls, causing the latency spike.
Explanation
This option is correct. In a SOA environment, a code change that adds more processing time or extra network hops will immediately affect response times, and the CI/CD pipeline often pushes these changes to production. Production incidents are most commonly traced to the last deployed version because that is the only variable that changed recently, making it the primary suspect.
The service mesh configuration added extra network hops, increasing round‑trip time between services.
Explanation
This option is incorrect. While a misconfigured service mesh can add latency, it is a secondary infrastructure issue that usually manifests gradually, not as an abrupt spike coinciding with a deployment. In most cases, the primary cause is a direct code change rather than a mesh setting, especially when the incident appears right after a CI/CD release.
The underlying database experienced a temporary outage, forcing the service to retry and wait for fallback connections.
Explanation
This option is incorrect. A database outage would result in errors or timeouts rather than consistent high latency, and it would affect multiple services, not just the one under investigation. Moreover, the question highlights a recent deployment, suggesting the root cause is more likely code‑related than an external datastore failure.
The CI/CD pipeline's automated tests omitted load‑testing, allowing a latency‑heavy change to reach production unnoticed.
Explanation
This option is incorrect. Although insufficient testing can let performance regressions slip through, it is a contributing factor, not the primary reason the service is currently slow. The direct cause remains the code change itself; the lack of testing is a process weakness, not the immediate behavior observed.
The service's logging level was increased to DEBUG, overwhelming I/O and slowing response times.
Explanation
This option is incorrect. Elevated logging can degrade performance, but it typically results in modest slowdowns and is easy to spot in configuration files. High latency spikes matching a deployment event are more indicative of substantive code changes rather than just verbose logging.
The cloud provider's autoscaling failed, leading to CPU saturation on the service instances.
Explanation
This option is incorrect. Autoscaling failures cause resource starvation, but they usually affect many services simultaneously and are detected via metrics alerts. The scenario points to a single service's latency following a CI/CD release, making a recent code change the primary culprit.
Overall explanation
The question tests the learner's ability to identify the most common root cause of a sudden latency increase in a service‑oriented architecture that uses continuous delivery. In practice, the first thing engineers check is the most recent code change because deployments are the only recent alteration that can instantly impact performance. While infrastructure configurations, database health, testing coverage, logging verbosity, and autoscaling issues can all affect latency, they are typically secondary or gradual factors. Misidentifying a secondary factor as the primary cause leads to wasted time and delayed remediation. Best practice is to correlate the timing of the incident with the deployment history, roll back or triage the change, and then broaden the investigation if the latency persists.
Domain
Performance Monitoring
Question 49
Skipped
As a data engineer, you are designing a data pipeline for a real-time analytics application. The pipeline must handle high volumes of data and provide low-latency processing. Which configuration achieves this?
Implement a batch ETL workflow using Hadoop Map Reduce that writes results to a data warehouse once per hour.
Explanation
This option is incorrect because Hadoop Map Reduce is a batch‑oriented engine that materializes data only after the job completes. Running it on an hourly schedule introduces latency far beyond the low‑latency requirement of a real‑time analytics application. In practice, users would see stale results and would be unable to react to events in near‑real time.
Use AWS S3 as the landing zone and run scheduled AWS Glue jobs every 10 minutes to transform the data.
Explanation
While AWS S3 and Glue provide scalable storage and transformation, the ten‑minute schedule creates a deterministic delay that defeats low‑latency goals. Additionally, S3 is an object store, not a streaming source, so data must be written and then read back, adding further overhead. Real‑world systems that need sub‑second insight would find this configuration too slow.
Correct answer
Ingest data with Apache Kafka, process streams with Apache Flink using event‑time windows, and output results to a low‑latency store such as Redis.
Explanation
This configuration is correct because Kafka provides a durable, high‑throughput messaging backbone, while Flink offers true stream processing with stateful operators and sub‑second latency. Event‑time windows allow accurate handling of out‑of‑order data, and writing to Redis gives downstream consumers instant access to fresh results. Companies like Uber and Netflix use similar stacks to power real‑time dashboards and fraud detection with millisecond‑level responsiveness.
Deploy Apache Spark Structured Streaming with a 5‑second micro‑batch interval, reading from Kafka and writing to Parquet files on HDFS.
Explanation
Although Spark Structured Streaming can handle high volumes, its micro‑batch model introduces a fixed 5‑second latency window, which may be acceptable for some use cases but does not meet strict low‑latency requirements. Writing results to Parquet on HDFS further adds disk I/O and compaction delays, making the pipeline unsuitable for instantaneous analytics. Organizations needing true real‑time feedback would typically favor a pure streaming engine rather than micro‑batching.
Trigger AWS Lambda functions from S3 object creation events, then store processed data in Dynamo DB.
Explanation
This option relies on S3 as the ingestion point, which adds storage latency before the Lambda can even start processing. While Lambda scales automatically, the overall end‑to‑end delay is dominated by the time it takes to write objects to S3 and the eventual consistency model of the service. For high‑volume, sub‑second pipelines, this design would create bottlenecks and potentially lead to throttling.
Build a Lambda architecture combining a batch Hadoop layer with a speed layer built on Apache Storm, storing output in Cassandra.
Explanation
The Lambda architecture mixes batch and speed layers, increasing system complexity and often resulting in duplicated processing. Apache Storm, though capable of low‑latency processing, is less actively maintained than newer engines like Flink, and integrating it with a batch Hadoop layer can inflate operational overhead. Consequently, this setup is rarely chosen for new, high‑throughput low‑latency pipelines.
Overall explanation
The question tests knowledge of streaming architectures that can simultaneously handle high data volume and provide sub‑second latency. A proper solution combines a high‑throughput messaging system (Kafka) with a true stream processing engine (Flink) that executes operators on each event without waiting for batches, and writes results to an ultra‑fast store such as Redis. The incorrect options each introduce latency through batching, scheduled processing, or reliance on storage services that are not optimized for real‑time reads. Common misconceptions include assuming micro‑batching (Spark Structured Streaming) or periodic ETL jobs are sufficient for real‑time needs, when in fact they add deterministic delays. Best practice is to choose an end‑to‑end streaming stack that eliminates unnecessary storage hops and leverages event‑time semantics for accurate, low‑latency analytics.
Domain
Real-time Data Pipelines
Question 50
Skipped
A product engineer is tasked with designing a new feature for a mobile application. The feature requires real-time updates and must be scalable. Which statement is CORRECT?
Implement the feature using HTTP long polling on a single server instance; this approach scales automatically as user count grows.
Explanation
This option is incorrect. Long polling involves the client repeatedly opening HTTP connections, which creates a high overhead on both client and server. Running it on a single server instance creates a bottleneck, and the technique does not scale horizontally without additional infrastructure, leading to latency spikes as user numbers increase.
Correct answer
Use Web Sockets behind a load balancer with stateless application servers and a shared message broker; this design supports real‑time delivery and horizontal scaling.
Explanation
This option is correct. Web Sockets maintain a persistent bi‑directional connection, allowing the server to push updates instantly to connected clients. By placing the Web Socket servers behind a load balancer and using stateless instances together with a shared broker (e. g., Redis or Kafka), the architecture can scale horizontally to handle millions of concurrent connections while preserving real‑time guarantees.
Store each update in a local SQLite database on the device and sync periodically; this ensures real‑time data for all users.
Explanation
This option is incorrect. SQLite is a local storage mechanism that only reflects data on the device; periodic sync introduces latency, so updates are not delivered in real time to other users. Moreover, relying on device‑side storage does not address the scalability challenge of coordinating state across a large user base.
Leverage a CDN to push real‑time updates directly to the mobile clients without a backend service.
Explanation
This option is incorrect. CDNs excel at caching and delivering static assets, but they are not designed to maintain persistent, bi‑directional connections required for real‑time push notifications. Without a backend orchestrating state changes, a CDN cannot reliably propagate dynamic updates to clients as they happen.
Encode updates in QR codes that the user scans; this method is both real‑time and highly scalable.
Explanation
This option is incorrect. While QR codes can transmit data, they require a manual scan by the user, introducing significant latency and making the approach unsuitable for real‑time communication. Additionally, scaling such a solution would be impractical because each update would need physical distribution and user interaction.
Deploy a monolithic REST API that returns the latest state on every request; caching the response will make it real‑time and scalable.
Explanation
This option is incorrect. A REST API that is polled for updates introduces round‑trip latency, and caching the response effectively freezes the data, defeating the real‑time requirement. Furthermore, a monolithic architecture creates a single point of failure and limits horizontal scaling, making it unsuitable for large‑scale, real‑time workloads.
Overall explanation
The question tests understanding of how to design a mobile backend that delivers real‑time updates while remaining horizontally scalable. Option 2 correctly combines Web Sockets for low‑latency push communication with a load‑balanced, stateless server pool and a shared message broker, which collectively enable the system to handle many concurrent connections and failover gracefully. The other options each reflect common misconceptions: long polling on a single server is inefficient and non‑scalable; local device storage and periodic sync cannot guarantee instant global visibility; CDNs are not meant for dynamic push traffic; QR codes require manual interaction and are not automated; and a monolithic, cache‑heavy REST API contradicts both real‑time immediacy and scalable design principles. In practice, engineers should choose persistent connection technologies (Web Sockets, SSE, or g RPC streams) backed by scalable infrastructure components such as load balancers and message brokers. Properly separating state management from connection handling ensures the system can grow with user demand without sacrificing latency.
Domain
Real-time Architecture
Question 51
Skipped
An architect is tasked with designing a system for a financial institution. The system must handle high volumes of transactions and provide real-time updates. Which THREE approaches should you take?
Adopt a monolithic architecture with a single relational database server.
Explanation
This option is incorrect. A monolithic design with one database creates a single point of contention and cannot horizontally scale to handle spikes in transaction volume. In a financial setting, this would lead to latency spikes and possible outages during peak trading periods.
Correct selection
Implement an event‑driven architecture using a distributed message broker such as Apache Kafka to stream transactions.
Explanation
This option is correct. Event‑driven pipelines decouple producers from consumers, allowing the system to ingest millions of transactions per second and process them in near real‑time. Financial firms often use Kafka to guarantee ordering and durability, enabling live dashboards and fraud detection without blocking the core transaction flow.
Schedule all transaction processing in nightly batch jobs to reduce peak load.
Explanation
This option is incorrect. Batch‑only processing defeats the requirement for real‑time updates and introduces unacceptable delays for account balances and compliance reporting. In practice, nightly batches would leave customers with stale information and could violate regulatory latency constraints.
Correct selection
Partition the transaction data across multiple shards based on account or geography to parallelize reads and writes.
Explanation
This option is correct. Sharding spreads the workload across many database instances, eliminating hot spots and allowing the system to scale linearly with transaction volume. Real‑world financial platforms use sharding to keep latency low even when processing thousands of trades per second.
Correct selection
Introduce an in‑memory cache or data grid (e. g., Redis, Hazelcast) to serve the most recent balances and updates.
Explanation
This option is correct. An in‑memory layer provides sub‑millisecond read latency for frequently accessed balances, supporting the real‑time user experience required by traders and customers. Caches also offload read traffic from the backend database, improving overall throughput and resilience.
Rely exclusively on eventual consistency without any real‑time guarantees.
Explanation
This option is incorrect. Financial transactions demand strong consistency to prevent double‑spending and to satisfy audit requirements; eventual consistency can produce transient mismatches that are unacceptable. Companies that need immediate correctness typically combine strong consistency for critical paths with eventual consistency only for non‑critical analytics.
Overall explanation
The question tests knowledge of designing high‑throughput, low‑latency systems for financial workloads. Real‑time updates are best achieved with an event‑driven pipeline, data sharding, and in‑memory caching, all of which distribute load and keep latency low. Common misconceptions include believing a monolithic or batch‑only approach can meet these demands, or assuming eventual consistency is sufficient for monetary transactions; each of these would either create a bottleneck or violate correctness guarantees. Best practice is to combine decoupled streaming, horizontal data partitioning, and fast caches while preserving strong consistency for core transaction state. Remember that regulatory and customer‑experience pressures often dictate sub‑second response times, making the three correct strategies essential.
Domain
Scalable Transaction Systems
Question 52
Skipped
A QA engineer is tasked with testing a new feature for a web application. The feature uses an event‑driven architecture, and the team uses a testing framework for automation. What should you do FIRST?
Correct answer
Review the event specifications and identify the events to be emitted and consumed.
Explanation
This is the correct answer. Before any test code is written, a QA engineer must understand the contract of each event – its name, payload, timing, and which components produce or consume it. Knowing these details allows the creation of accurate mocks, stubs, and assertions, preventing false positives or missed defects. In real projects, teams that start with the event schema can rapidly build reliable integration tests for asynchronous flows.
Write the full suite of end‑to‑end UI tests for the feature before any unit or integration tests.
Explanation
This option is incorrect. UI tests are valuable, but in an event‑driven system the underlying communication often occurs without direct UI interaction, so testing the UI first provides little confidence in the core logic. Skipping the understanding of events can lead to brittle UI tests that mask failures in the event pipeline. Teams that prioritize UI tests first often spend extra time debugging why a UI passes while the backend events are silently broken.
Deploy the feature directly to production and monitor logs for failures.
Explanation
This option is incorrect and risky. Deploying untested code to production violates basic quality‑assurance principles and can cause downstream services to misbehave due to malformed events. Without prior verification, production incidents may arise, leading to downtime or data loss, as seen in many high‑profile outages caused by unexpected event payloads.
Mock the downstream services immediately without understanding the event payloads.
Explanation
This option is incorrect. Creating mocks without first knowing the exact shape and semantics of the events will produce inaccurate test doubles, causing tests to pass while the real integration fails. Mis‑matched payloads can hide serialization errors or missing fields that only surface in production. Proper practice is to define the event contract first, then generate or craft mocks that faithfully represent it.
Set up a CI pipeline that runs the existing test suite, ignoring the new feature.
Explanation
This option is incorrect. While a CI pipeline is essential, ignoring the new feature defeats the purpose of automated testing for the change. The new event‑driven feature will have no coverage, allowing regressions to slip through unnoticed. Effective QA adds targeted tests for the new functionality before merging, not merely runs old tests.
Record the network traffic of the feature in a staging environment before any analysis.
Explanation
This option is incorrect. Capturing traffic can be useful later for debugging, but without first understanding the documented event contracts you may misinterpret the captured data. It also consumes time and resources that could be spent reviewing design docs and defining test cases. Relying on raw traffic as the first step often leads to chasing false leads and missing the core business logic of the events.
Overall explanation
The question tests a QA engineer's first step when approaching testing for an event‑driven feature. The best practice is to start by reviewing the event specifications – the schema, producers, consumers, and expected flow – because this knowledge underpins all subsequent test design, including mocking, unit, integration, and end‑to‑end tests. Common misconceptions include jumping straight to UI testing, deploying untested code, or building mocks without a contract, all of which can result in fragile or ineffective test suites and production incidents. Understanding the event contract first enables accurate test doubles, reliable assertions, and faster feedback loops. In real‑world workflows, teams that adopt this disciplined approach can detect mismatched payloads early and maintain confidence as the system scales.
Domain
Event-Driven Testing
Question 53
Skipped
A developer is tasked with optimizing the performance of a web application. The application uses a monolithic architecture, and the team has a limited budget for infrastructure upgrades. What is the MOST likely root cause?
The monolithic architecture itself is causing the slowdown due to its inability to scale components independently.
Explanation
This option is incorrect. While a monolithic design can make scaling individual services harder, it does not automatically create performance problems on its own. In many cases, a well‑written monolith runs efficiently; the bottleneck is more often found in code or data access patterns rather than the architectural style itself.
Limited budget prevents adding more servers, which is the primary reason for the performance degradation.
Explanation
This option is incorrect. Budget constraints limit the options for scaling infrastructure, but they are not a root cause of the actual performance issues. Without identifying the underlying technical bottleneck, simply adding hardware may not resolve the problem and can even mask deeper inefficiencies.
Correct answer
Inefficient database queries and lack of proper indexing are creating bottlenecks.
Explanation
This option is correct. Poorly written SQL, missing indexes, and N+1 query patterns frequently dominate response times in monolithic web apps, especially when hardware cannot be significantly upgraded. Real‑world examples show that optimizing queries or adding indexes can cut latency from seconds to milliseconds, delivering the biggest performance gain on a tight budget.
The front‑end assets are not minified or compressed, leading to large payloads.
Explanation
This option is incorrect. Although unoptimized assets can increase page load times, they typically affect only the perceived latency of static resources, not the core application processing time. In a server‑side performance review, backend bottlenecks such as database access usually have a larger impact than front‑end minification.
Network latency between the client and server is the dominant factor in the observed slowness.
Explanation
This option is incorrect. Network latency can contribute to overall response time, but in a single‑region deployment with typical broadband connections, it is rarely the primary cause of performance problems. The more common culprit is server‑side processing, especially inefficient database interactions, which dominate the end‑to‑end latency.
The application is experiencing memory leaks that cause the process to consume increasing RAM over time.
Explanation
This option is incorrect. Memory leaks can degrade performance over long runtimes, but they usually manifest as crashes or out‑of‑memory errors rather than consistent latency issues. For a monolithic app on a limited budget, the most immediate and measurable slowdown is often tied to database query inefficiencies rather than gradual memory consumption.
Overall explanation
The question tests understanding of where performance bottlenecks most commonly arise in a monolithic web application when infrastructure upgrades are not feasible. The most frequent root cause in such scenarios is inefficient database access, such as slow queries or missing indexes, because these directly affect the time spent processing each request. Options that blame the monolithic architecture, budget limits, or front‑end asset size miss the core server‑side processing issue and reflect common misconceptions. Network latency and memory leaks are also plausible concerns, yet they usually have a smaller or different impact pattern compared to database inefficiencies. Best practice is to profile the application, examine query execution plans, and add appropriate indexes before considering costly hardware scaling.
Domain
Performance Optimization
Question 54
Skipped
As a tech lead, you are tasked ... system must be scalable and provide real-time updates. Which tool or feature is BEST suited here?
Implement a traditional RESTful API and have clients poll for changes every few seconds.
Explanation
This approach is incorrect because polling introduces unnecessary latency and load on the server as the number of clients grows. Each poll creates a new HTTP request, which does not scale well for thousands of simultaneous users. In a real-world startup, frequent polling could quickly exhaust API rate limits and increase cloud costs.
Use Server‑Sent Events (SSE) to push updates from the server to browsers.
Explanation
SSE is a plausible choice since it provides one‑way push capability, but it is limited to HTTP/1.1 and only works for unidirectional streams. It also lacks built-in support for horizontal scaling across many nodes without additional coordination. For a highly scalable system serving many client types (mobile, web, Io T), SSE alone is often insufficient.
Correct answer
Adopt Apache Kafka as a distributed streaming platform to broadcast state changes.
Explanation
This option is correct. Kafka is designed for high throughput, fault‑tolerant, and horizontally scalable event streaming, making it ideal for real‑time updates in a growing startup. By publishing state changes to Kafka topics, multiple consumer services can react instantly, and client‑facing layers can pull from Kafka to deliver updates with minimal latency.
Integrate Web Sockets directly between the backend and every client device.
Explanation
Web Sockets provide true bidirectional communication, which makes them a tempting choice for real‑time features. However, managing large numbers of persistent socket connections without an underlying message broker can become a scalability bottleneck. In production, Web Sockets are typically layered on top of a system like Kafka to handle distribution and durability.
Deploy the entire application as a monolithic server with a single database.
Explanation
A monolithic architecture is an incorrect answer because it hinders both scaling and independent deployment of real‑time components. As user traffic spikes, the whole application must be replicated, leading to resource waste and longer deployment cycles. Modern startups prefer microservice or event‑driven designs to isolate real‑time workloads.
Rely on a CDN to cache dynamic data and serve updates to clients.
Explanation
CDNs excel at delivering static content quickly, but they are not suited for delivering constantly changing, real‑time data. Caching dynamic state would introduce stale information and defeat the purpose of real‑time updates. While CDNs can offload static assets, they do not replace a streaming platform for live data.
Overall explanation
The question tests knowledge of scalable real‑time data delivery architectures. Apache Kafka is the best‑suited tool because it offers durable, high‑throughput event streaming that can be consumed by many services and forwarded to clients, supporting both scalability and low latency. Common misconceptions include thinking that polling REST APIs or simple Web Socket connections alone can handle massive real‑time loads, which they cannot without a robust message backbone. Server‑Sent Events and CDNs are useful in narrow scenarios but lack the bidirectional, fault‑tolerant qualities needed for a startup’s growth. Understanding the role of an event streaming platform and how it integrates with other real‑time transport mechanisms is essential for designing resilient, real‑time systems.
Domain
Event Streaming
Question 55
Skipped
A Dev Ops engineer is tasked with designing a CI/CD pipeline for a new application. The pipeline must handle multiple environments and provide automated testing. What is the KEY difference between X and Y in this context?
X (CI) automatically deploys code to production as soon as it passes unit tests, while Y (CD) only runs the tests.
Explanation
This statement is incorrect. Continuous Integration does not deploy to production; it focuses on merging code changes frequently and running automated tests to verify integration. Deploying to production automatically is a function of Continuous Deployment, not CI. Relying on CI for production releases would break the safety guard that CD provides.
X and Y are essentially the same practice; X is simply a synonym for Y with extra testing steps added.
Explanation
This option is wrong. CI (Continuous Integration) and CD (Continuous Delivery or Deployment) are distinct stages in the software delivery lifecycle. CI emphasizes frequent integration and testing, whereas CD extends the workflow to automate the delivery of those tested changes to environments. Treating them as synonyms ignores the critical handoff point between integration and release.
X handles deployment to multiple environments, whereas Y only runs tests on the developer’s local machine.
Explanation
This is inaccurate. Neither CI nor CD is limited to a single environment. CI runs tests in a shared, often isolated environment (like a CI server), not just locally, and CD is responsible for promoting builds through multiple environments such as dev, staging, and production. Confusing the scope of each leads to incomplete pipeline designs.
Correct answer
X automates code integration and testing, while Y automates the delivery of those tested changes through staging and production environments, sometimes with manual approval steps.
Explanation
This statement is correct. Continuous Integration focuses on regularly merging code and executing automated tests to catch integration issues early. Continuous Delivery/Deployment takes the validated build and automates its progression through various environments, adding approvals if required for Delivery or pushing straight to production for Deployment. This separation allows teams to ensure quality before release while still enabling rapid, repeatable deployments.
Y eliminates the need for any testing because the code is assumed to be correct after X has run.
Explanation
This is false. Continuous Deployment does not dispense with testing; it relies on the comprehensive test suite executed during CI to guarantee quality before any automatic release. Skipping tests would increase risk of defects reaching production, contravening best‑practice pipelines that mandate a full test suite at every stage. Proper CD pipelines still enforce testing at CI and may add additional checks such as integration or performance tests.
X is about source‑control branching strategies, while Y is solely concerned with container orchestration platforms like Kubernetes.
Explanation
This option is incorrect. CI is not limited to branching models; it is about integrating code changes and running automated builds/tests regardless of branch strategy. CD deals with the release process and can target many deployment targets, including VMs, servers, or containers, but its scope is broader than just Kubernetes. Mixing these concepts can cause teams to miss essential steps like artifact versioning and environment promotion.
Overall explanation
The question probes the fundamental distinction between Continuous Integration (CI) and Continuous Delivery/Deployment (CD) in a multi‑environment pipeline. CI's primary goal is to merge code frequently and validate it with automated tests, providing rapid feedback to developers. CD picks up the validated artifact and automates its movement through staging, testing, and production environments, optionally requiring manual approvals for Delivery. Common misconceptions include thinking CI also handles production releases, that CI and CD are interchangeable terms, or that CD removes the need for testing. In practice, a robust pipeline implements CI for fast integration and extensive testing, then layers CD to ensure safe, repeatable releases across all required environments.
Domain
CI/CD Pipelines
Question 56
Skipped
You're a Dev Ops engineer designing a CI/CD pipeline for a new microservices-based application. The pipeline must support automated testing, code quality checks, and deployment to a Kubernetes cluster. Which TWO options are correct?
Configure a single Jenkins pipeline that builds a Docker image for each microservice, runs unit tests, pushes the images to Docker Hub, and then uses `kubectl apply` to deploy the manifests directly to the production cluster.
Explanation
This option is incorrect. While a single Jenkins pipeline can technically perform those steps, deploying straight to production with raw `kubectl apply` bypasses important safety gates such as staged environments and rollback strategies. In real-world scenarios this increases the risk of untested code causing outages, and it does not align with recommended Git Ops or progressive delivery practices.
Correct selection
Add a Sonar Qube analysis stage to the pipeline to enforce code quality gates before images are promoted to the release environment.
Explanation
This option is correct. Integrating Sonar Qube (or a similar static analysis tool) provides automated code quality checks, ensuring that issues like code smells, bugs, and security vulnerabilities are caught early. Enforcing quality gates before promotion helps maintain a healthy codebase and prevents low‑quality builds from reaching production, which is a best‑practice in CI/CD for microservices.
Execute end‑to‑end tests against the live production Kubernetes cluster after each commit to catch regressions early.
Explanation
This option is incorrect. Running end‑to‑end tests directly against production can disrupt real users, introduce unnecessary load, and obscure test results due to production data variability. Best practice is to run integration and e2e tests in a dedicated staging environment that mirrors production, preserving stability for the live system.
Correct selection
Use Git Hub Actions with separate jobs for linting, unit testing, container image building, and a Helm deployment job that upgrades the Helm release in the target cluster.
Explanation
This option is correct. Git Hub Actions provides a flexible, cloud‑native CI platform, and splitting the workflow into distinct jobs allows parallel execution, clear failure isolation, and easy observability. Deploying with Helm adds templating, versioning, and rollback capabilities, which are essential for reliable microservice releases to Kubernetes.
Store all Kubernetes manifests in a separate private repository and pull them during the pipeline without version control linkage to the application code.
Explanation
This option is incorrect. Keeping manifests in an unlinked repository creates a drift between application code and its deployment configuration, making it hard to trace which version of code corresponds to which manifest version. Modern Git Ops workflows recommend storing manifests alongside the source code or using a synchronized branch to maintain traceability and reproducibility.
Skip static code analysis and rely solely on unit test coverage thresholds to guarantee code quality.
Explanation
This option is incorrect. Unit test coverage alone does not detect many categories of defects such as security flaws, code duplication, or maintainability issues that static analysis tools identify. Relying exclusively on coverage can give a false sense of security and lead to technical debt accumulation in a microservices environment.
Overall explanation
The question evaluates understanding of modern CI/CD pipeline design for microservices that run on Kubernetes. Correct pipelines combine automated testing, static code analysis, and reliable deployment mechanisms; therefore, integrating Sonar Qube for quality gates (Option 2) and using a modular Git Hub Actions workflow with Helm deployments (Option 4) are best practices. Common misconceptions include thinking a monolithic pipeline with direct production deployment is sufficient (Option 1), believing that testing in production is safe (Option 3), separating manifests without traceability (Option 5), or assuming unit test coverage replaces static analysis (Option 6). Real‑world teams adopt staged environments, Git Ops principles, and toolchains that enforce quality at every gate to reduce risk and improve maintainability. Remember to keep pipeline steps isolated, use infrastructure‑as‑code tools like Helm, and enforce code quality checks before any promotion to production.
Domain
CI/CD Pipelines
Question 57
Skipped
As a data engineer, you're tasked with optimizing the performance of a data warehousing system that runs on a 4-node cluster with 16 GB RAM per node. The system uses a column-store database and handles 1000 queries per hour. What is the MOST appropriate action?
Add two additional nodes to the cluster, increasing the total to six 4‑node machines.
Explanation
This option is incorrect because adding nodes for a workload of only 1,000 queries per hour is likely over‑provisioning. The overhead of managing extra nodes (network, coordination, licensing) can outweigh any marginal I/O benefit. In most real‑world deployments, scaling out is reserved for workloads that consistently saturate CPU or I/O, not modest query volumes.
Enable aggressive column compression to shrink the on‑disk size of every table.
Explanation
While compression reduces disk I/O, aggressive settings add CPU cycles for decompression, which can actually slow analytical queries on a column store. Moreover, the cluster already benefits from the database's built‑in columnar compression; further tightening it yields diminishing returns. The most impactful bottleneck in this scenario is likely memory, not raw storage size.
Correct answer
Upgrade each node's memory from 16 GB to 32 GB, enlarging the column‑store buffer pool.
Explanation
This is the correct answer. Column‑store databases rely heavily on large in‑memory buffers to keep column segments hot, minimizing costly disk reads. Doubling RAM gives the buffer pool room to cache more data, which directly improves query latency for the given query rate without requiring architectural changes. In production, memory upgrades are a common first‑step optimization for analytic workloads.
Create materialized views for all frequently‑queried tables.
Explanation
Materialized views can speed up repeated queries, but they introduce maintenance overhead and consume extra storage. Deploying them indiscriminately without first addressing the underlying memory limitation may lead to stale data and unnecessary complexity. They are valuable after the system has sufficient resources to keep base tables performant.
Migrate the workload to a row‑store database engine.
Explanation
Switching to a row‑store would degrade performance for analytical queries, which benefit from columnar storage and vectorized processing. The problem described is a performance shortfall, not a mismatch of data model, so this action would be counter‑productive. Best practice is to optimize the existing column‑store before considering a full engine change.
Increase the number of concurrent query threads per node.
Explanation
Raising concurrency can cause CPU contention and increase memory pressure, especially when each thread needs its own buffers. Without sufficient RAM, more threads will simply queue for I/O, worsening latency. The primary constraint here is memory capacity, not thread count, making this option ineffective as a first fix.
Overall explanation
The question tests the learner's understanding of how column‑store databases use memory to accelerate analytic queries. Because columnar engines keep large portions of column segments in RAM, the size of the buffer pool is a critical performance lever; increasing RAM directly expands caching ability and reduces disk reads. Common misconceptions include assuming that more nodes or tighter compression always yield the biggest gain, or that materialized views are a silver bullet; in reality, these measures either over‑engineer the solution or add overhead without addressing the core bottleneck. Switching to a row‑store or merely raising concurrency can even harm performance by mismatching the workload characteristics. The best practice is to first verify that each node has enough memory to hold active column data, then consider secondary optimizations such as caching or materialized views.
Domain
Data Warehouse Performance
Question 58
Skipped
A product engineer is designing a new e-commerce platform that must support 100,000 concurrent users and handle 5,000 transactions per minute. The platform will use a service-oriented architecture with multiple microservices. Which approach BEST satisfies these requirements?
Deploy each microservice on its own dedicated virtual machine and manually provision enough capacity for peak load.
Explanation
This option is incorrect because manual provisioning of VMs does not react quickly to rapid changes in traffic. Scaling a fleet of VMs requires provisioning time, which can lead to periods of under‑capacity when demand spikes. In addition, maintaining many large VMs is costly and introduces operational complexity, making it unsuitable for 100,000 concurrent users.
Build the entire platform as a single monolithic application hosted on a high‑end server.
Explanation
This option is also incorrect. A monolith runs on a single host or a small cluster, creating a single point of failure and a bottleneck for both user traffic and transaction processing. It contradicts the stated service‑oriented architecture and cannot scale horizontally to meet the massive concurrency requirement.
Correct answer
Run the microservices in containers managed by an orchestration system such as Kubernetes, configure horizontal pod autoscaling, place an API gateway in front, use a distributed, sharded data store, and employ a replicated message broker to decouple services.
Explanation
This option is correct. Kubernetes provides automated scaling of containers based on CPU, memory, or custom metrics, allowing the system to expand quickly as concurrent users rise. An API gateway centralizes routing, security, and rate‑limiting, while a sharded data store removes database bottlenecks and a replicated message broker ensures reliable asynchronous communication, together satisfying both high concurrency and transaction‑per‑minute goals.
Implement each microservice as a serverless function (e. g., AWS Lambda) and invoke them directly from the client, without an API gateway or message queue.
Explanation
This option is incorrect. Serverless functions can suffer from cold‑start latency and have regional concurrency limits that may be hard to tune for 100,000 simultaneous users. Without an API gateway or message queue, you lose centralized traffic management, authentication, and decoupling, leading to brittle integrations and unpredictable costs under heavy load.
Use a traditional three‑tier architecture with a load balancer in front of stateful web servers that maintain session affinity.
Explanation
This option is incorrect because maintaining stateful sessions on web servers forces sticky routing, which prevents effective horizontal scaling. Session affinity can cause uneven load distribution and makes it difficult to add or remove servers dynamically. Modern microservice designs favor stateless services and external session stores to achieve the required elasticity.
Rely on a single relational database with strong ACID guarantees and a single, non‑replicated message broker to serialize all transactions.
Explanation
This option is incorrect. A single database and a single, non‑replicated broker become performance choke points, especially at 5,000 transactions per minute, and they introduce a single point of failure. High‑throughput e‑commerce systems typically use distributed databases and replicated brokers to achieve both scalability and resilience.
Overall explanation
The question tests the learner's understanding of designing a highly concurrent, transaction‑intensive system using microservices. The correct approach leverages container orchestration with automatic horizontal scaling, an API gateway for traffic control, a distributed data store, and a replicated message broker, all of which together provide the elasticity, fault tolerance, and decoupling needed for 100,000 concurrent users and 5,000 TPM. Common misconceptions include believing that a monolith or a single high‑end server can handle such load, that manual VM provisioning can keep up with rapid traffic changes, or that serverless functions alone eliminate the need for orchestration and messaging. Each wrong option reflects a real‑world pitfall: static capacity, lack of scalability, stateful designs, or single points of failure. Best practice is to design stateless services, use automated scaling mechanisms, and employ highly available data and messaging layers to meet modern e‑commerce performance demands.
Domain
Scalable Microservices Architecture
Question 59
Skipped
A QA engineer is debugging a production incident where a monolithic application is experiencing intermittent errors due to a third-party library dependency. The application runs on a 2-v CPU instance with 4 GB RAM. What is the PRIMARY reason for this behaviour?
Correct answer
The instance’s limited CPU and memory cause resource contention, leading the third‑party library to fail intermittently.
Explanation
This option is correct. A small instance with only 2 v CPUs and 4 GB of RAM can quickly become saturated under load, causing the library to experience CPU starvation, memory pressure, or garbage‑collection pauses that manifest as intermittent errors. In real‑world incidents, similar resource bottlenecks have caused libraries to throw time‑outs or Out Of Memory exceptions only when the system is busy.
The third‑party library is compiled for a different CPU architecture, causing binary incompatibility on the 2‑v CPU instance.
Explanation
This option is incorrect. Binary incompatibility would typically prevent the application from starting at all, producing clear error messages rather than intermittent failures. While architecture mismatches are a common pitfall, they are not a primary cause of sporadic errors in a running service that otherwise functions.
Network latency between the instance and an external service is the main cause of the intermittent errors.
Explanation
This option is incorrect. The scenario does not mention any external network calls, and intermittent library errors triggered by a third‑party dependency are more likely tied to local resource constraints. Network latency would produce consistent latency spikes, not the erratic behavior linked to CPU/memory pressure.
The monolithic application's logging level is too high, causing I/O saturation and intermittent errors.
Explanation
This option is incorrect. Excessive logging can degrade performance and increase I/O latency, but it usually results in overall slowdown rather than targeted failures within a specific library. Moreover, the primary symptom described points to resource limits rather than logging configuration.
The operating system’s default swappiness setting causes the instance to swap memory, leading to intermittent failures.
Explanation
This option is incorrect. While aggressive swapping can affect performance, the 4 GB RAM on a 2‑v CPU instance is often sufficient for many workloads, and swapping would produce a more constant degradation rather than intermittent library errors. Swappiness is a secondary factor compared with direct CPU and memory contention.
The third‑party library contains a concurrency bug that appears only under concurrent access, independent of instance size.
Explanation
This option is incorrect. A concurrency bug would cause failures regardless of the underlying hardware resources, and the question explicitly highlights the instance specifications as the clue. Although such bugs exist, the primary reason in this context is the limited compute and memory capacity.
Overall explanation
The question tests the learner's ability to link system resource constraints with intermittent application failures, a common scenario in performance debugging. The correct answer identifies that a 2‑v CPU, 4 GB RAM instance can become a bottleneck, causing the third‑party library to suffer from CPU starvation, memory pressure, or GC pauses, which surface as sporadic errors. Distractors such as architecture mismatch, network latency, excessive logging, swap settings, and intrinsic library bugs are plausible but each reflects a typical misunderstanding of where the primary symptom originates. Recognizing that limited resources are the foremost suspect helps engineers prioritize scaling the instance or profiling resource usage before exploring deeper code defects. Best practice dictates monitoring CPU and memory utilization during incidents and, when limits are reached, scaling vertically or horizontally to provide headroom for third‑party dependencies.
Domain
Performance Debugging
Question 60
Skipped
A developer is tasked with onboarding a new team member to a project that uses an event-driven architecture with Apache Kafka and Apache Cassandra. The project requires a zero-downtime deployment strategy. What should you do FIRST?
Correct answer
Set up a blue‑green deployment pipeline and configure Kafka topic versioning and Cassandra schema versioning before any code changes.
Explanation
This is the correct first step because zero‑downtime deployments rely on backward‑compatible contracts between services, data stores, and message schemas. By establishing a blue‑green pipeline you can run the new version alongside the old one, and versioned topics and schema migrations let both versions coexist safely. Skipping this preparation often leads to runtime errors or data loss when the new version attempts to read or write incompatible data.
Immediately deploy the new version to production using rolling updates, trusting that Kafka will handle any incompatibilities.
Explanation
This option is incorrect; rolling updates alone do not guarantee compatibility of Kafka message formats or Cassandra schemas. If the new code expects a different schema or message structure, consumers may crash or produce corrupt data, breaking the system. Proper versioning and compatibility checks must precede any rollout to avoid downtime.
Rewrite all existing Kafka consumers to use the new message format before testing the changes in a staging environment.
Explanation
While updating consumers is eventually necessary, doing it before establishing versioning and testing is premature and risky. Changing all consumers at once removes the safety net of running old and new versions simultaneously, increasing the chance of a complete service outage. The first priority should be to create a compatible deployment path, not to rewrite code outright.
Add a new Cassandra data center and migrate all data manually to avoid downtime.
Explanation
Adding a data center and manual migration is an extreme measure that does not address the core issue of schema compatibility with zero‑downtime expectations. Manual data moves are time‑consuming, error‑prone, and can cause service interruptions. Instead, schema versioning lets you evolve the database schema incrementally without large migrations.
Disable the Kafka broker temporarily during deployment to prevent message loss.
Explanation
Disabling Kafka defeats the purpose of an event‑driven system and introduces downtime, which contradicts the requirement. While it might seem to protect against inconsistent messages, it also stops all production traffic and can cause data backlogs. A zero‑downtime strategy keeps the broker running and relies on compatible schemas to avoid loss.
Clone the production repository, delete the . git folder, and reinitialize a new Git history to start fresh.
Explanation
This action is unrelated to deployment strategy and would actually erase valuable history needed for traceability and rollback. Losing commit history hampers debugging and audit compliance, especially in regulated environments. The first onboarding step should focus on deployment compatibility, not on discarding version control information.
Overall explanation
The question tests knowledge of zero‑downtime deployment practices in an event‑driven architecture that uses Kafka and Cassandra. The essential first action is to establish a deployment pipeline (such as blue‑green) and ensure that both Kafka topics and Cassandra schemas are versioned and backward‑compatible before any code changes are released. Common misconceptions include assuming rolling updates alone guarantee compatibility, or that you must rewrite all consumers or shut down infrastructure before deployment. Those approaches either ignore the need for contract compatibility or introduce unnecessary downtime. Best practice is to keep old and new versions running side‑by‑side, use schema evolution techniques, and verify compatibility in a staging environment before cutting over to production.
Domain
Zero‑Downtime Deployment
Question 61
Skipped
A tech lead is designing a new system that must be GDPR-compliant and support data encryption at rest and in transit. The system will use a microservices architecture with multiple databases. Which configuration achieves this?
Correct answer
Use TLS for all service‑to‑service communication, enable Transparent Data Encryption (TDE) on each database, and store encryption keys in a dedicated Hardware Security Module (HSM) accessed via a centralized Key Management Service (KMS) with role‑based access control.
Explanation
This option is correct. TLS protects every hop between microservices, satisfying the GDPR requirement for encryption in transit. TDE encrypts data at rest for every database, and a dedicated HSM with a centralized KMS provides strong, auditable key management and segregation of duties, which are core GDPR safeguards. In practice, a breach would still require the attacker to compromise the HSM to read the data, dramatically reducing risk.
Use TLS only for traffic coming from external clients, enable database‑level encryption only on the primary database, and store encryption keys in plain‑text environment variables on each host.
Explanation
This option is incorrect. Encrypting only external traffic leaves internal service‑to‑service calls exposed, violating the in‑transit encryption requirement. Encrypting only the primary database means replicas and backups remain in clear text, breaching the at‑rest requirement. Storing keys in environment variables is a common but insecure practice that can be read by any process on the host, making key compromise likely.
Create VPN tunnels between microservices, enable file‑system level encryption on each host, and rotate encryption keys manually once per year.
Explanation
This option is incorrect. VPN tunnels protect network traffic but do not guarantee encryption for application‑level payloads and may not be enforced uniformly across all services. File‑system level encryption does not protect data stored by databases that manage their own storage files, leaving gaps. Annual manual key rotation is far too infrequent for GDPR, which expects regular, automated rotation and strong key lifecycle management.
Perform client‑side encryption before data is sent to services, store the data without any rest‑time encryption, and use plain HTTP for internal API calls.
Explanation
This option is incorrect. While client‑side encryption protects data before it reaches the system, storing it without encryption at rest defeats GDPR’s requirement that data be encrypted while stored. Additionally, using plain HTTP for internal calls leaves inter‑service traffic unprotected, violating the encryption‑in‑transit rule. A real‑world breach could expose unencrypted data on the storage disks despite client‑side measures.
Keep a single master encryption key in the source code repository, enable unencrypted backups, and enforce HTTPS only for external API endpoints.
Explanation
This option is incorrect. Embedding the master key in source control makes it trivially accessible to anyone with repository access, a major security flaw. Unencrypted backups expose data at rest, directly contradicting GDPR requirements. HTTPS for external APIs does not protect internal traffic, leaving a large attack surface for data interception.
Enable the cloud provider’s managed encryption‑at‑rest service for each database, enforce HTTPS for all public APIs, and integrate with the provider’s KMS to rotate keys automatically, but rely on plain HTTP for internal microservice calls.
Explanation
This option is incorrect. Managed encryption‑at‑rest and automatic key rotation fulfill the at‑rest requirement, but using plain HTTP for internal service‑to‑service communication fails to encrypt data in transit within the system. GDPR expects encryption for all personal data movement, not just public endpoints. An attacker who gains access to the internal network could sniff clear‑text payloads, leading to a compliance breach.
Overall explanation
The question tests the learner’s understanding of GDPR’s dual encryption requirements—data must be protected both while stored and while moving between components. A fully compliant architecture encrypts all inter‑service traffic with TLS, encrypts every database at rest (e. g., with TDE), and employs robust key management such as an HSM or centralized KMS with role‑based controls. Options that omit internal TLS, rely on insecure key storage, encrypt only a subset of databases, or neglect backup encryption are common misconceptions because they appear to address part of the requirement but leave critical gaps. Real‑world best practice is to treat encryption as a system‑wide property, not a per‑layer add‑on, and to automate key rotation and access auditing. Selecting the configuration that combines full‑coverage TLS, per‑database at‑rest encryption, and hardened key management therefore satisfies GDPR and reduces exposure to data breach incidents.
Domain
Data Encryption
Question 62
Skipped
As an architect, you're tasked with evaluating the trade-offs between a monolithic architecture and a microservices architecture for a new application. The application will handle 1000 requests per second and require a high degree of scalability. What is the KEY difference between these two architectures in this context?
Microservices always provide faster request processing because they use lightweight communication protocols, while monolithic applications are inherently slower.
Explanation
This statement is incorrect. Although microservices often use lightweight protocols like HTTP/2 or g RPC, the speed of request processing depends on many factors such as code efficiency, network latency, and database access patterns. In practice, a well‑optimized monolith can be as fast as a microservice‑based system, especially when network overhead is eliminated.
A monolithic architecture guarantees higher availability than microservices because there are fewer network hops between components.
Explanation
This option is misleading and therefore incorrect. While a monolith eliminates inter‑service network calls, a failure in any part of the monolith can bring down the entire system, reducing overall availability. Microservices, by contrast, isolate failures to individual services, allowing the rest of the application to remain operational.
Microservices eliminate the need for any database scaling, whereas monolithic applications require complex sharding strategies.
Explanation
This is false. Both architectures must address data scalability; microservices often still rely on shared databases or need their own data stores, and may even increase the complexity of data consistency. Monoliths may use sharding, but they can also employ read replicas or other scaling techniques, so the need for database scaling is not avoided by moving to microservices.
Correct answer
Microservices allow each service to be scaled independently, so you can add resources only to the components that are bottlenecks, whereas a monolithic app must be scaled as an entire unit.
Explanation
This statement is correct. In a microservice architecture, each service can be deployed on separate instances, enabling fine‑grained scaling based on the specific load characteristics of that service. For a system handling 1000 requests per second, you might scale only the authentication service while leaving the reporting service unchanged, which is not possible with a monolith that must be replicated as a whole.
In a monolithic system you can deploy new features without any downtime, while microservices always require rolling restarts for every change.
Explanation
This is incorrect. Both monolithic and microservice deployments can achieve zero‑downtime releases using techniques such as blue‑green deployments, canary releases, or container orchestration. Microservices often make it easier to roll out changes to a single service without affecting others, contrary to the claim that they always need restarts.
Microservices reduce the total number of code lines needed for the application compared to a monolithic architecture.
Explanation
This is a misconception and therefore wrong. Microservices typically increase the amount of boilerplate code because each service needs its own API contracts, deployment descriptors, and infrastructure plumbing. While they may improve logical separation, they do not inherently reduce the overall codebase size.
Overall explanation
The question tests the learner's understanding of the fundamental scalability distinction between monolithic and microservice architectures. The key difference is that microservices enable independent scaling of individual components, allowing resources to be allocated precisely where demand is highest, whereas a monolith must be scaled as a single, inseparable unit. Common misconceptions include believing that microservices are automatically faster, more available, or require less database work—all of which depend on implementation details and are not guaranteed. Additionally, ideas that deployment downtime or code size are inherently better in one approach overlook modern deployment patterns that can provide zero‑downtime for both styles. In real-world scenarios, architects choose microservices when fine‑grained scalability, fault isolation, and organizational independence outweigh the added operational complexity.
Domain
Software Architecture
Question 63
Skipped
A Dev Ops engineer is designing a monitoring and logging strategy for a distributed system that uses a service-oriented architecture. The system must support real-time monitoring and alerting. Which THREE approaches should you take?
Correct selection
Instrument each service with Prometheus client libraries, scrape metrics, and use Alertmanager for real‑time alerts.
Explanation
This is correct. Prometheus pulls metrics at short intervals, giving near‑real‑time visibility of system health, and Alertmanager can fire alerts as soon as thresholds are crossed. In practice, this lets an on‑call engineer see a sudden spike in request latency within seconds and act before users are impacted. It is a foundational pillar of observability for SOA systems.
Correct selection
Deploy a centralized log aggregation pipeline (e. g., Elasticsearch + Logstash + Kibana) that streams logs from all services and defines alerting rules on log patterns.
Explanation
This is correct. Streaming logs to a central store enables real‑time searching and pattern‑based alerts, such as "error rate > 5% in the last minute". Organizations like Netflix use this approach to detect failures instantly across microservices. Without centralized log streaming, important error signals could be missed or delayed.
Correct selection
Implement distributed tracing using Open Telemetry or Jaeger to capture request latency across service boundaries and set latency‑based alerts.
Explanation
This is correct. Distributed tracing provides end‑to‑end visibility of request flows, allowing alerts on abnormal latency or error propagation that pure metrics might not reveal. Real‑world teams use tracing to quickly pinpoint a bottleneck in a downstream service during an outage. Adding tracing complements metrics and logs for a complete observability stack.
Schedule a nightly cron job that copies log files to a data lake for periodic batch analysis, and generate alerts only after the batch completes.
Explanation
This is incorrect. Batch‑oriented log collection introduces a delay of many hours, defeating the requirement for real‑time monitoring and alerting. If a critical error occurs at 2 AM, the nightly job would not surface it until the next day, causing prolonged downtime. Real‑time pipelines are needed instead of offline batch jobs.
Store alert thresholds in static JSON files checked into the code repository and require a code deployment each time a threshold changes.
Explanation
This is incorrect. Tying alert thresholds to source‑controlled files makes threshold updates cumbersome and slow, preventing rapid response to evolving performance baselines. In production, thresholds are typically managed in a dedicated configuration service or in the alerting system itself, allowing changes without a full deployment. Relying on code changes introduces unnecessary risk and latency.
Configure each microservice to send health‑check pings over email to the on‑call engineer, relying on manual inspection for incidents.
Explanation
This is incorrect. Email‑based health checks are not scalable for a distributed SOA and impose a heavy manual burden, leading to missed or delayed reactions. Automated alerting systems consume structured metrics or log events and route alerts to paging tools; email is too slow and prone to noise. Consequently, this approach would not meet real‑time alerting requirements.
Overall explanation
The question tests knowledge of modern observability practices for distributed, service‑oriented systems. Real‑time monitoring and alerting rely on the three pillars: metrics (e. g., Prometheus + Alertmanager), logs (centralized streaming and query), and traces (Open Telemetry/Jaeger) to provide immediate insight into system health and performance. The three correct options each represent one of these pillars and follow best‑practice patterns used by leading companies. The incorrect options reflect common misconceptions: treating logs as batch data, hard‑coding alert thresholds in source control, or using manual email health checks, all of which impede rapid detection and response. Learners should remember to implement automated, streaming pipelines for metrics, logs, and traces, and to use dedicated alerting tools that can act within seconds of an anomaly.
Domain
Observability
Question 64
Skipped
A developer is tasked with optimizing the performance of a slow-performing API endpoint that uses a database query with a complex JOIN operation. The endpoint must complete in under 200ms. What is the MOST likely root cause?
The API server is experiencing high network latency to the database server.
Explanation
This option is incorrect. While network latency can add overhead, typical LAN latency is measured in microseconds or low single-digit milliseconds, which rarely pushes a well‑indexed query over the 200 ms threshold. In most production environments, the dominant factor for a complex JOIN is the query execution plan rather than the transport time.
The endpoint is returning more columns than necessary, causing large payloads.
Explanation
This option is incorrect. Sending extra columns increases response size, but the bottleneck described is the time to complete the endpoint, which includes query execution on the DB side. Even with a bloated payload, the database must still produce the rows, and the primary latency source is usually the query itself, not the serialization of data.
The database connection pool is exhausted, causing queuing delays.
Explanation
This option is partially plausible but not the most likely root cause. Connection pool exhaustion leads to requests waiting for a free connection, which can add latency, yet the scenario emphasizes a single slow‑performing query with a complex JOIN. If the pool were the issue, many requests would be delayed uniformly, not just the specific JOIN‑heavy endpoint.
Correct answer
Missing or inefficient indexes on the columns used in the JOIN operation.
Explanation
This option is correct. Without appropriate indexes, the database must perform full table scans or costly merge joins, dramatically increasing execution time for multi‑table queries. Adding or optimizing indexes on the foreign‑key columns typically reduces the JOIN cost from seconds to milliseconds, allowing the endpoint to meet the 200 ms SLA.
The query uses SELECT * instead of specific columns.
Explanation
This option is incorrect. Selecting all columns can increase I/O, but the performance impact is usually far less than that caused by a missing index on join keys. The optimizer still has to retrieve and join rows; the lack of targeted indexing dominates the execution plan cost.
The database server is under‑provisioned, leading to CPU bottlenecks.
Explanation
This option is a plausible distraction but not the most likely root cause for a single complex JOIN. CPU saturation affects many queries and would manifest as overall system slowness, whereas a missing index specifically penalizes join operations. The first step in diagnosing such latency is to examine the execution plan for index usage before scaling hardware.
Overall explanation
The question tests knowledge of typical performance bottlenecks in relational database queries that involve complex JOINs. The most common root cause for a query failing to meet a tight latency target is the absence of appropriate indexes on the columns participating in the JOIN, which forces the engine to scan large tables and dramatically increase execution time. Distractors such as network latency, over‑selecting columns, or connection‑pool limits are tempting because they can affect response time, but they are less directly related to the specific symptom of a slow JOIN. Understanding that an execution‑plan analysis and proper indexing are first‑line diagnostics helps developers quickly resolve performance issues without unnecessary hardware upgrades. Best practice is to profile the query, ensure indexes on foreign keys and filter columns, and then consider other factors like caching or resource provisioning if indexing alone does not meet the SLA.
Domain
Query Optimization
Question 65
Skipped
A product engineer is designing a new system that must support real-time data processing and analytics. The system will use an event-driven architecture with Apache Kafka and Apache Flink. Which tool or feature is BEST suited here?
Kafka Connect for data ingestion
Explanation
This option is incorrect. Kafka Connect is primarily used to move data between Kafka and external systems via pre-built connectors. It does not provide stream processing or analytics capabilities, so it would not satisfy the real-time computation requirement of the system.
Kafka Streams API
Explanation
This option is also incorrect. While Kafka Streams offers a lightweight library for processing records directly from Kafka, the architecture already includes Apache Flink, which offers far richer stateful processing, event‑time semantics, and scaling features. Choosing Streams would duplicate effort and forgo Flink's advanced capabilities needed for complex analytics.
Apache Spark Structured Streaming
Explanation
This option is incorrect. Spark Structured Streaming is a capable streaming engine, but mixing it with Flink adds unnecessary operational complexity and can increase latency compared to using Flink alone. The question explicitly mentions using Flink, making Spark a sub‑optimal choice for this design.
Correct answer
Flink's Stateful Stream Processing with Exactly-Once Guarantees
Explanation
This option is correct. Flink's Data Stream API supports true stateful processing, event‑time handling, and exactly‑once semantics when consuming from Kafka, which are essential for real‑time analytics. It allows the system to process unbounded streams with low latency while guaranteeing consistent results, making it the best fit for the described architecture.
Flink Batch Processing with the Data Set API
Explanation
This option is incorrect. The Data Set API is designed for bounded, batch workloads and does not provide the continuous, low‑latency processing required for real‑time analytics. Using batch processing would introduce unnecessary delays and would not align with the event‑driven nature of the system.
Hadoop Map Reduce
Explanation
This option is incorrect. Hadoop Map Reduce is a batch‑oriented framework with high latency and no native support for stream processing or integration with Kafka. It cannot meet the real‑time processing and analytics demands of the described system.
Overall explanation
The question tests knowledge of appropriate stream‑processing tools for an event‑driven architecture that combines Kafka and Flink. Flink's stateful stream processing with exactly‑once guarantees is the ideal choice because it natively consumes Kafka topics, offers low latency, and provides strong consistency, which are crucial for real‑time analytics. The distractors are plausible because they are all related to data movement or processing, yet each misses a key requirement: Kafka Connect only moves data, Kafka Streams duplicates functionality, Spark adds unnecessary complexity, Flink's batch API cannot handle unbounded streams, and Hadoop Map Reduce is fundamentally batch‑oriented. Understanding the distinction between batch and streaming paradigms, as well as the integration points between Kafka and Flink, is essential for designing efficient real‑time systems. In practice, engineers should select Flink's Data Stream API when they need fine‑grained state management, event‑time semantics, and exactly‑once processing in a Kafka‑centric pipeline.
Domain
Stream Processing
Question 66
Skipped
As a lead architect designing a new e-commerce platform, you must decide on the architecture pattern. The system must handle 10,000 concurrent users, process 500 orders per minute, and ensure zero downtime during deployments. Which TWO options are correct?
Correct selection
Microservices architecture orchestrated by Kubernetes with rolling updates
Explanation
This option is correct. A microservices approach lets you split the e‑commerce functionality into independently deployable services that can each be scaled horizontally to meet the 10,000 concurrent user target. Kubernetes provides automatic pod scaling and rolling updates, which replace containers without taking the service offline, satisfying the zero‑downtime requirement. In practice, companies like Netflix use this pattern to serve millions of users while deploying new features continuously.
Correct selection
Blue‑green deployment using immutable infrastructure on virtual machines
Explanation
This option is also correct. Blue‑green deployment maintains two identical production environments; traffic is switched from the old (blue) to the new (green) version once the new code is validated, guaranteeing no user‑visible downtime. By provisioning the green environment as immutable VMs or images, you avoid configuration drift and can roll back instantly if needed. Many high‑traffic sites, such as e Bay, rely on this pattern to push updates without disrupting shoppers.
Monolithic architecture hosted on a single VM behind a load balancer
Explanation
This option is incorrect. A monolith running on a single VM cannot elastically scale to 10,000 concurrent users; the load balancer can only distribute traffic to that one instance, creating a single point of failure. Additionally, updating the monolith usually requires taking the whole application offline, violating the zero‑downtime requirement. Real‑world failures, such as the 2016 Git Hub outage, illustrate the risk of a single massive node.
Serverless architecture using Functions‑as‑a‑Service across multiple cloud providers
Explanation
This option is incorrect. While serverless platforms automatically scale and can handle bursts of traffic, they suffer from cold‑start latency that can affect user‑facing checkout flows, especially under the steady load of 500 orders per minute. Coordinating deployments across multiple providers also adds operational complexity and makes guaranteeing zero‑downtime harder. Companies often reserve serverless for auxiliary workloads, not core order processing where latency consistency is critical.
Event‑driven architecture with a central message bus but without containerization
Explanation
This option is incorrect. An event‑driven design with a message broker (e. g., Kafka) is excellent for decoupling order processing, but the lack of containerization or orchestration means you cannot reliably perform rolling upgrades without service interruption. The central bus itself can become a bottleneck or a single point of failure if not replicated, jeopardizing both scalability and availability. Hence, it does not alone satisfy the zero‑downtime deployment requirement.
N‑tier (three‑layer) architecture with a dedicated cache tier but manual deployment scripts
Explanation
This option is incorrect. An N‑tier design with caching improves read performance, yet manual deployment scripts require human intervention, leading to potential downtime during releases. The architecture does not inherently provide the automated, seamless rollout mechanisms needed for 10,000 concurrent users and continuous availability. Organizations typically replace manual steps with CI/CD pipelines to meet such SLAs.
Overall explanation
The question tests the learner's understanding of how architectural patterns influence scalability and deployment safety. A microservices architecture managed by Kubernetes offers granular scaling and rolling updates, directly addressing the need for high concurrency and zero‑downtime releases. Blue‑green deployment with immutable infrastructure guarantees that a new version can be switched in without affecting live traffic, meeting the uptime requirement. The incorrect choices reflect common misconceptions: monoliths are assumed to be simple but cannot scale or update without downtime; serverless adds scaling but introduces latency and cross‑provider coordination challenges; event‑driven designs improve decoupling but do not replace the need for orchestrated deployments; and traditional N‑tier setups with manual scripts lack automated, zero‑downtime capabilities. The best practice is to combine a scalable service architecture with proven deployment patterns such as rolling updates or blue‑green releases to meet demanding e‑commerce SLAs.
Domain
Architecture Patterns
Question 67
Skipped
What is the PRIMARY reason for choosing a monolithic architecture over a microservices architecture in a small startup with limited resources and a simple application?
It provides superior scalability, allowing each component to be scaled independently as demand changes.
Explanation
This statement is incorrect. Independent scaling of components is a hallmark of microservices, not monoliths. In a monolithic system the entire application must be scaled together, which can be wasteful for a small startup that does not need granular scaling.
It enables the team to write each component in a different language, leveraging the best tool for each job.
Explanation
This option is incorrect. The ability to use multiple programming languages per component is a benefit of microservices, where each service can have its own tech stack. A monolithic codebase typically shares a single language runtime, simplifying builds but limiting polyglot flexibility.
Correct answer
It reduces operational complexity and cost by requiring only one deployable unit and a single runtime environment.
Explanation
This statement is correct. With a monolith there is only one artifact to build, test, and deploy, which cuts down on the infrastructure needed for service discovery, networking, and independent deployment pipelines. For a resource‑constrained startup, lower operational overhead translates directly into saved budget and faster time‑to‑market.
It ensures better fault isolation, so a bug in one module won't bring down the whole system.
Explanation
This option is incorrect. Fault isolation is a primary advantage of microservices, where a failure in one service can be contained. In a monolithic application a runtime exception can propagate and affect the entire application, making fault containment harder.
It eliminates the need for inter‑service communication, removing network latency and serialization overhead.
Explanation
This statement is misleading and therefore incorrect. While a monolith does not have network calls between services, internal module calls still incur method‑call overhead, and the benefit of removing network latency is not the main driver for architecture choice. Startups usually care more about simplicity and cost than about marginal latency savings.
It guarantees higher performance because all code runs in the same process, eliminating any possible bottlenecks.
Explanation
This option is incorrect. Running in a single process does not automatically guarantee better performance; a monolith can still suffer from CPU, memory, or I/O bottlenecks that affect the whole application. Performance tuning is often more flexible in microservices where problematic services can be optimized or replicated independently.
Overall explanation
The question tests the learner's understanding of why a small, resource‑limited startup would opt for a monolithic architecture. The correct answer highlights that monoliths dramatically reduce operational complexity and cost by needing only a single deployable artifact and a unified runtime, which aligns with the primary constraints of a startup. The distractors each target common misconceptions: that monoliths are inherently more scalable, language‑agnostic, or provide better fault isolation and performance—features that actually belong to microservices. Recognizing these misconceptions helps candidates choose the right architecture based on real business constraints rather than theoretical advantages. In practice, many early‑stage companies start with a monolith to launch quickly and only consider microservices once the application grows in size and complexity.
Domain
Software Architecture
Question 68
Skipped
As a Dev Ops engineer, you notice that the average response time of your web application has increased by 30% after a recent deployment. What is the MOST likely root cause?
The deployment unintentionally increased the logging verbosity, causing excessive disk I/O and slowing down request processing.
Explanation
This option is incorrect as a primary cause. While higher logging levels can add some latency, the impact is usually minimal compared to a code-level performance regression. In most real-world incidents, logging overhead does not produce a 30% increase in response time unless the log volume is extreme, which would have been noticed during testing.
A sudden spike in user traffic coincidentally occurred at the same time as the deployment, overwhelming the application.
Explanation
This option is incorrect because the scenario describes a direct correlation with the deployment, not external load. Although traffic spikes can degrade performance, they are independent of the code change and would be observed across all instances, not just after a specific release. Proper monitoring would show a gradual increase rather than an abrupt 30% jump immediately following deployment.
Correct answer
A recent code change introduced an inefficient algorithm or a database N+1 query, increasing the processing time per request.
Explanation
This option is correct. Deployments often bring new features or refactored code, and a regression such as an N+1 query or a suboptimal loop can dramatically raise latency. In production, this manifests as a measurable increase in average response time, exactly matching the 30% slowdown observed after the release.
The load balancer was reconfigured to use a round‑robin algorithm instead of least‑connection, causing uneven request distribution.
Explanation
This option is incorrect because changing load‑balancing algorithms typically affects distribution, not overall response time unless one backend is severely under‑provisioned. Even if some servers receive more traffic, the aggregate average response time would not jump by 30% instantly. Most teams verify load‑balancer settings before promotion, making this an unlikely root cause.
CPU and memory limits for the containerized service were lowered during the deployment, leading to throttling under normal load.
Explanation
This option is plausible but not the most likely cause given the information. Resource limits can cause latency, yet they usually result in errors or timeouts rather than a uniform 30% increase in response time. If limits were the issue, monitoring would show CPU or memory throttling spikes, which the question does not mention.
A network routing change introduced additional hop latency between the application servers and the database.
Explanation
This option is incorrect because network routing changes are rare in a typical application deployment and would affect all traffic, not just after a specific code push. The symptom described—response time rising immediately after deployment—points more toward a code‑level regression. Moreover, network latency increases are usually measured in milliseconds, insufficient to explain a 30% slowdown on its own.
Overall explanation
The question tests the ability to pinpoint the most common root cause of performance degradation after a code deployment. The most likely culprit is a regression introduced by the new code, such as an inefficient algorithm or an N+1 database query, which directly increases the processing time per request. Misconceptions like increased logging, traffic spikes, or load‑balancer tweaks are plausible but typically have distinct signatures that differ from the sudden, deployment‑correlated latency rise. Understanding the typical impact of code changes versus infrastructure or traffic variations helps engineers quickly isolate the issue. Best practice includes comprehensive performance testing and monitoring of query patterns before promotion to production to catch such regressions early.
Domain
Git & Git Hub
Question 69
Skipped
You are tasked with designing a data processing pipeline for a real-time analytics system. The pipeline must handle 100,000 events per second, process data within 10ms, and ensure data consistency across multiple nodes. Which THREE approaches should you take?
Correct selection
Use a distributed stream processing framework (e. g., Apache Flink) with exactly‑once state checkpointing.
Explanation
This option is correct. Distributed stream processors are built for high‑throughput, low‑latency workloads and can guarantee exactly‑once semantics through periodic checkpointing and state snapshots. In a real‑world scenario, Flink can recover from failures without duplicating or losing events, keeping the 10 ms latency target and consistency across nodes intact.
Process events in micro‑batches of one second using a traditional batch engine like Apache Spark.
Explanation
This option is incorrect. Micro‑batching introduces a fixed aggregation window that far exceeds the required 10 ms processing latency, turning a real‑time pipeline into a near‑real‑time one. Using a batch engine would also make it difficult to enforce strict consistency guarantees across nodes, leading to stale or duplicated analytics results.
Correct selection
Partition events by a consistent hash key and assign each partition to a dedicated processing node.
Explanation
This option is correct. Key‑based sharding ensures that all events related to the same entity are processed on the same node, dramatically reducing the need for cross‑node coordination and latency. For example, a user‑centric analytics pipeline can hash the user ID, guaranteeing that each user's events stay on a single node, preserving consistency and meeting the 10 ms SLA.
Rely on an eventual‑consistency No SQL database (e. g., Cassandra) for intermediate state to improve write throughput.
Explanation
This option is incorrect. Eventual consistency allows temporary divergence between replicas, which violates the requirement for data consistency across multiple nodes in a real‑time analytics scenario. While Cassandra offers high write throughput, the lag in replication could cause conflicting results when aggregating data within the strict 10 ms window.
Correct selection
Store intermediate results in a high‑throughput, in‑memory data store such as Redis Cluster with synchronous replication.
Explanation
This option is correct. In‑memory stores provide sub‑millisecond read/write latency, and synchronous replication ensures that data is persisted on multiple nodes before acknowledging the write, preserving strong consistency. Real‑time dashboards often use Redis to hold rolling aggregates that must be instantly available to every consumer.
Deploy a single high‑spec server that ingests all events sequentially to avoid coordination overhead.
Explanation
This option is incorrect. A single node cannot sustain 100,000 events per second with 10 ms latency and also represents a single point of failure, breaking both scalability and consistency requirements. In production, horizontal scaling across multiple nodes is essential to meet the performance and reliability goals.
Overall explanation
The question tests knowledge of designing ultra‑low‑latency, consistent streaming pipelines. Correct solutions involve using a distributed stream processor with exactly‑once guarantees, sharding work by a deterministic key to limit cross‑node communication, and persisting state in a fast in‑memory store that offers synchronous replication. Common misconceptions include assuming batch processing can meet millisecond latency, or that eventual consistency is acceptable when strict data correctness is required. Learners should remember that real‑time analytics demand both high throughput and strong consistency, which is achieved through specialized stream processing engines, careful data partitioning, and strong‑consistency stores. Deploying a single server or relying on eventually consistent databases will lead to bottlenecks, data loss, or stale analytics, undermining the system's objectives.
Domain
Real-time Stream Processing
Question 70
Skipped
What is the KEY difference between a service-oriented architecture and an event-driven architecture in a system that requires loose coupling and scalability?
SOA mandates the use of a single, central service registry, whereas EDA requires each component to expose its own REST endpoint.
Explanation
This option is incorrect. While a service registry (like UDDI or Eureka) is common in SOA, it is not mandatory, and many SOA implementations operate without a single registry. Event-driven systems also often use registries for event topics, but they do not require every component to expose a REST endpoint; instead, they publish or subscribe to events. Conflating registry usage with architectural style leads to a misunderstanding of the core communication pattern.
In SOA, services communicate through shared databases, while EDA employs direct socket connections between components.
Explanation
This statement is incorrect. Sharing a database for communication is an anti-pattern in both SOA and EDA because it creates tight coupling and data contention. EDA typically uses message brokers (e. g., Kafka, Rabbit MQ) or event streams, not raw socket connections, to decouple producers and consumers. Assuming database sharing distinguishes the two styles misrepresents how each architecture achieves loose coupling.
Correct answer
SOA primarily uses synchronous request/response calls, while EDA relies on asynchronous event publishing and subscription.
Explanation
This option is correct. The fundamental distinction lies in the communication model: SOA services generally invoke each other through synchronous APIs (e. g., SOAP or REST), which can introduce blocking behavior. EDA, on the other hand, decouples producers and consumers by sending events to a broker, allowing listeners to react at their own pace, which enhances scalability and resilience. Real‑world examples include a traditional order‑service call in SOA versus an order‑placed event streamed to multiple downstream services in an event‑driven system.
SOA guarantees low latency by processing events in real time, whereas EDA tolerates high latency through batch processing.
Explanation
This answer is incorrect. SOA does not inherently guarantee low latency; latency depends on service implementation, network, and load. Conversely, EDA is often designed for low‑latency, real‑time processing using streams, though it can also support batch consumers. Confusing latency characteristics with the architectural style overlooks the fact that both can be tuned for various performance requirements.
SOA architectures are inherently more scalable than event-driven ones because they avoid the overhead of message queues.
Explanation
This claim is false. Scalability in SOA is limited by synchronous coupling; adding more instances does not remove the need for each request to wait for a response. Event‑driven systems scale horizontally by adding more consumers to the same event stream, and modern message brokers are designed to handle high throughput with minimal overhead. Assuming message‑queue overhead makes EDA less scalable ignores the benefits of decoupling and load‑balancing provided by asynchronous processing.
SOA and EDA differ mainly in their preferred programming languages: SOA uses Java, while EDA uses Java Script.
Explanation
This statement is incorrect. Both architectures are language‑agnostic; the choice of language is driven by team expertise, ecosystem, and performance needs, not by the architectural style. SOA services can be written in Java, . NET, Python, etc., and event producers/consumers can be implemented in any language that can read/write to the event bus. Equating language preference with architectural difference is a common misconception that distracts from the real technical distinctions.
Overall explanation
The question tests understanding of the core communication paradigm that separates service‑oriented architecture (SOA) from event‑driven architecture (EDA). The correct answer highlights that SOA typically relies on synchronous request/response interactions, which can create tighter coupling, while EDA uses asynchronous event publishing/subscription to achieve loose coupling and better scalability. The incorrect options each misrepresent a peripheral aspect—such as registry usage, database sharing, latency expectations, scalability myths, or language preferences—and thus reflect common misconceptions that learners encounter. Recognizing that the primary difference is the async vs. sync messaging model helps architects choose the right pattern for systems that must scale and remain resilient. In practice, using EDA for high‑volume, real‑time data flows (e. g., sensor streams) and SOA for well‑defined transactional services (e. g., account lookup) aligns with these principles.
Domain
Software Architecture
Question 71
Skipped
As a developer, you are tasked with optimizing the performance of a slow database query that runs on a 4 v CPU machine with 16 GB RAM. Which option should you choose?
Add more CPU cores to the machine.
Explanation
This option is incorrect. While additional CPU cycles can help compute‑heavy operations, most database query slowness stems from I/O or poor execution plans rather than raw CPU power. Adding cores without addressing the underlying cause often yields little improvement and incurs unnecessary cost, as seen when a production server with extra CPUs still performed full table scans.
Increase the amount of RAM on the server.
Explanation
This option is incorrect. More memory helps when the working set exceeds available RAM, but a query that scans large tables due to missing indexes does not benefit from extra RAM alone. Over‑provisioning RAM can be wasteful, and real‑world cases show that adding 8 GB of RAM to a well‑indexed database rarely changes query latency.
Correct answer
Create appropriate indexes on the columns used in the query's WHERE and JOIN clauses.
Explanation
This option is correct. Indexes allow the database engine to locate matching rows quickly, turning costly full‑table scans into efficient index seeks. In practice, adding an index on a frequently filtered column reduced query time from tens of seconds to sub‑second performance in many production systems.
Rewrite the query to use SELECT * instead of selecting specific columns.
Explanation
This option is incorrect. Selecting all columns increases the amount of data read from disk and sent over the network, often worsening performance. Real‑world experience shows that changing a targeted column list to SELECT * can double the I/O load without any benefit to query speed.
Lower the transaction isolation level to READ UNCOMMITTED.
Explanation
This option is incorrect. Although a lower isolation level can reduce lock contention, it does not address the root cause of a slow query, which is usually inefficient data access. Moreover, READ UNCOMMITTED introduces dirty reads, leading to inconsistent results—a trade‑off most applications cannot accept.
Enable query caching or replace the query with a materialized view.
Explanation
This option is incorrect as a primary step. Caching benefits repetitive identical queries, but a single slow, possibly ad‑hoc query will not see a performance boost from caching. Materialized views can help but require maintenance overhead and still depend on proper indexing of the underlying tables.
Overall explanation
The question tests understanding of fundamental database performance tuning—specifically, recognizing that logical improvements often outweigh raw hardware upgrades. The most effective first action for a slow query is to examine its execution plan and add suitable indexes, which directly reduces I/O and speeds up row retrieval. Common misconceptions include assuming that more CPU or RAM automatically fixes query latency, or that broader query changes like SELECT * or lower isolation levels will help. While hardware scaling can be a later consideration, it is usually more expensive and less impactful than proper indexing. Best practice is to profile the query, add or adjust indexes, and only then consider caching, materialized views, or hardware upgrades.
Domain
Database Performance Tuning
Question 72
Skipped
As a product engineer, you must decide on the architecture for a new Io T device that must process 1000 sensor readings per second, transmit data to the cloud within 1s, and ensure GDPR compliance. Which TWO options are correct?
Send each raw sensor reading directly to the cloud via an unsecured HTTP POST request and store it forever for later analytics.
Explanation
This option is incorrect. Transmitting raw data over plain HTTP exposes the information to eavesdropping, violating GDPR's requirement for data protection in transit. Additionally, indefinite storage without a retention policy breaches the GDPR principle of data minimisation and limits on storage duration, potentially leading to regulatory penalties.
Correct selection
Process data on the edge, retain raw readings for no longer than necessary, encrypt data in transit with TLS 1.3, and store only pseudonymised data in an EU‑hosted cloud while providing mechanisms for data‑subject access and erasure.
Explanation
This option is correct. Edge processing reduces the volume of data that must be transmitted, helping meet the 1 second latency requirement, and keeping raw data locally limits exposure. TLS 1.3 fulfills the GDPR security requirement for encryption in transit, and pseudonymisation plus defined retention policies satisfy data‑minimisation and the right‑to‑be‑forgotten obligations.
Upload every reading to a cloud datastore without encryption but enable role‑based access controls, and keep the data indefinitely for future machine‑learning projects.
Explanation
This option is incorrect. While role‑based access controls improve internal security, the lack of encryption in transit violates GDPR's security mandates. Moreover, keeping data indefinitely disregards the GDPR principle that personal data should not be retained longer than necessary, exposing the organization to compliance risk.
Use Lo Ra WAN to batch sensor data and send it to a gateway every minute, then forward the batch to the cloud for processing.
Explanation
This option is incorrect. Lo Ra WAN's typical data rates are far below what is needed to handle 1000 readings per second, and a one‑minute batching interval exceeds the stipulated one‑second transmission deadline, resulting in unacceptable latency for time‑critical Io T applications.
Correct selection
Adopt MQTT over TLS with Qo S 1, employ a hardware security module for key storage, and aggregate sensor values on‑device to transmit concise summaries each second, sending only purpose‑limited data to the cloud.
Explanation
This option is correct. MQTT with TLS ensures confidentiality and integrity of the data in transit, while Qo S 1 provides guaranteed delivery without overwhelming the network. On‑device aggregation reduces payload size, meeting the one‑second latency target, and transmitting only aggregated, purpose‑limited data aligns with GDPR's data‑minimisation principle.
Implement on‑device processing but compress data using a proprietary algorithm without standard encryption, assuming that the cloud will later apply consent checks before storage.
Explanation
This option is incorrect. Relying on a proprietary, non‑standard compression scheme does not provide the cryptographic guarantees required by GDPR for data in transit. Deferring consent checks to the cloud does not mitigate the risk of exposing personal data during transmission, and GDPR mandates that appropriate safeguards be in place before any personal data is transferred.
Overall explanation
The question assesses the learner's ability to design an Io T architecture that balances high‑frequency data processing, low‑latency transmission, and GDPR compliance. Correct solutions must incorporate edge or on‑device processing to handle 1000 readings per second, use strong encryption (e. g., TLS 1.3) for data in transit, and adopt data‑minimisation techniques such as aggregation or pseudonymisation, together with clear retention and erasure policies. Options 2 and 5 meet these criteria by combining edge computation, secure transport, and GDPR‑friendly storage practices. The other options illustrate common misunderstandings: assuming that internal access controls replace encryption, believing that batch transmission can meet strict latency, or neglecting data‑minimisation and retention rules. In real‑world deployments, engineers should always evaluate throughput, latency, and privacy requirements together, choosing proven protocols (MQTT/HTTPS) with TLS and implementing on‑device data reduction to stay both technically performant and legally compliant.
Domain
Io T Security and Compliance
Question 73
Skipped
What is the MOST appropriate action when a production incident occurs in a system with a microservices architecture, and the root cause is unknown?
Roll back the most recent deployment across all services.
Explanation
This option is incorrect. Rolling back every microservice indiscriminately may introduce new instability and does not target the actual failing component. In a microservices environment, unrelated services could be reverted unnecessarily, leading to wasted effort and potential regression of unrelated functionality.
Correct answer
Enable a feature flag or circuit breaker to disable the affected microservice(s) while investigating.
Explanation
This option is correct. Isolating the problematic service using a feature flag or circuit breaker limits the blast radius, keeps the rest of the system functional, and buys time for engineers to collect telemetry. Real‑world incidents often show that quickly cutting off traffic to a faulty service restores overall availability while the team performs root‑cause analysis.
Immediately restart all containers in the cluster.
Explanation
This option is incorrect. A blanket restart may temporarily clear transient issues but also resets healthy services, disrupting ongoing user sessions and potentially masking the underlying problem. Without knowing the cause, restarting everything adds noise to logs and can delay accurate diagnosis.
Spend several hours reviewing logs of every service before taking any mitigation steps.
Explanation
This option is incorrect. While thorough log analysis is essential, postponing mitigation can prolong user impact and violate SLAs. In production, delaying action to protect users is risky; immediate containment is prioritized before deep digging.
Scale out all services horizontally to absorb the increased load.
Explanation
This option is incorrect. Adding more instances does not address the root cause and may amplify the problem if the failing service continues to generate errors. In many cases, scaling a faulty service merely spreads the fault, leading to larger outages or cascading failures.
Notify stakeholders only after the incident has been fully resolved.
Explanation
This option is incorrect. Communication is a critical part of incident response; stakeholders should be informed early about the outage, impact, and mitigation actions being taken. Waiting until resolution can erode trust and prevent coordinated business responses such as incident declarations or customer outreach.
Overall explanation
The question tests knowledge of incident response best practices in a microservices environment where isolation is key. The correct action is to quickly isolate the failing component using a feature flag or circuit breaker, preserving the rest of the system's functionality while the team gathers data. Common misconceptions include assuming a full rollback or full restart will automatically fix the issue, but these actions can disrupt unrelated services and obscure diagnosis. Scaling out or delaying mitigation ignores the principle of minimizing blast radius, and postponing communication undermines stakeholder trust. Effective incident handling therefore balances rapid containment, targeted investigation, and transparent communication.
Domain
Incident Management
Question 74
Skipped
As a data engineer, you are tasked with designing a data warehouse for a company with 10,000 employees, 100,000 customers, and 1 million sales records per year. Which configuration achieves this?
A snowflake schema where the employee and customer dimensions are fully normalized into multiple related tables and the sales fact is partitioned only by year.
Explanation
This option is incorrect. While a snowflake schema normalizes dimension tables, it adds unnecessary join complexity for a warehouse of this size and can degrade query performance. Partitioning only by year is too coarse for a fact table that grows by about 1 M rows annually, leading to slower daily or monthly queries.
A fully normalized third‑normal‑form (3NF) relational model with no denormalized dimensions, storing all tables in a row‑store database.
Explanation
This option is incorrect. A pure 3NF design is optimal for OLTP systems, not analytical workloads, because it requires many joins across many small tables. For reporting on sales, this would increase query latency and make aggregations inefficient, contrary to data‑warehouse best practices.
Correct answer
A star schema with a sales fact table partitioned by month, and separate denormalized dimension tables for employees and customers stored in columnar format.
Explanation
This option is correct. The star schema presents a single, wide fact table linked to flat dimension tables, minimizing joins and improving query speed for analytical queries. Monthly partitioning of the fact table aligns with the data growth rate, enabling efficient pruning, and columnar storage further accelerates aggregate operations on large fact tables.
A single flat CSV file that is loaded nightly into a relational database without any dimensional modeling.
Explanation
This option is incorrect. Storing everything in a single flat file eliminates the benefits of dimensional modeling, making ad‑hoc queries slow and error‑prone. Moreover, loading a massive CSV each night introduces scalability and data‑quality risks, especially as the sales volume grows.
A No SQL document database where each sales record embeds the full employee and customer details as nested objects.
Explanation
This option is incorrect. While document stores handle semi‑structured data, embedding full dimension data duplicates information, inflates storage, and makes updates (e. g., employee name changes) cumbersome. Data warehouses benefit from shared dimension tables to ensure consistency and support efficient analytics, which No SQL designs typically lack.
A data lake on object storage where raw sales, employee, and customer files are queried directly without any predefined schema.
Explanation
This option is incorrect. Querying a raw data lake without a schema forces the engine to scan all files, resulting in poor performance for the expected analytical workloads. A structured data warehouse with defined dimensions and fact tables provides predictable performance and governance, which a schema‑less lake does not guarantee.
Overall explanation
The question tests understanding of appropriate data‑warehouse architectural patterns for moderately large analytical workloads. A star schema with a partitioned fact table and denormalized dimensions (Option 3) is the industry standard because it reduces join complexity, improves query performance, and aligns partitioning with data growth. Common misconceptions include assuming that deeper normalization (snowflake) or fully OLTP‑style 3NF designs are automatically better for reporting, when they actually increase overhead. Likewise, treating raw files, No SQL documents, or a data lake as a substitute for a purpose‑built warehouse ignores the need for consistent dimensions and efficient aggregation. Best practice is to model facts and dimensions explicitly, use columnar storage, and partition the fact table at a granularity that matches query patterns (e. g., monthly for a million‑row‑per‑year fact).
Domain
Data Warehouse Design
Question 75
Skipped
What is the PRIMARY reason for choosing a monolithic architecture over an event-driven architecture in a system that requires high cohesion and low latency?
Monolithic architecture simplifies deployment, allowing the entire application to be deployed as a single unit, which reduces operational overhead.
Explanation
This statement is incorrect as the primary reason for selecting a monolith in a latency‑sensitive system is not merely deployment simplicity. While a single‑unit deployment does reduce operational steps, it does not guarantee higher cohesion or lower response times. In practice, teams may still face latency issues if the internal components are poorly organized, regardless of deployment simplicity.
Monolithic systems offer superior scalability by allowing each component to be scaled independently, which ensures low latency under load.
Explanation
This option is incorrect because monolithic applications do not provide independent scaling of individual components; that advantage belongs to micro‑service or event‑driven designs. Scaling a monolith typically involves replicating the entire application, which can be inefficient and does not directly address latency concerns. Consequently, the claim that independent scaling ensures low latency is a common misconception.
Correct answer
Event-driven architectures inherently introduce higher latency due to asynchronous message queues, so choosing monolithic eliminates this latency.
Explanation
This option is correct. The core advantage of a monolithic design in a high‑cohesion, low‑latency context is the elimination of inter‑process communication overhead that event‑driven systems incur through message brokers and serialization. By keeping all logic in‑process, the system can respond more quickly, which is critical for real‑time user experiences such as high‑frequency trading platforms.
Monolithic designs enable teams to use multiple programming languages within the same codebase, which improves cohesion and reduces latency.
Explanation
This statement is incorrect. While technically possible, mixing multiple languages in a single codebase often reduces cohesion rather than improves it, because it introduces divergent runtime environments and build pipelines. Moreover, language variety does not have a direct impact on latency; the primary latency factor is the communication path, not the language choice.
Choosing a monolith provides better fault isolation, ensuring that failures in one module don’t affect others, which is critical for low-latency requirements.
Explanation
This option is incorrect. Monolithic architectures actually have weaker fault isolation than event‑driven systems, where a failure in one service is contained and does not bring down the entire application. Poor fault isolation can increase latency during recovery, making this a common but inaccurate justification for choosing a monolith.
Monolithic architecture reduces the need for complex orchestration tools, which directly improves high cohesion and minimizes latency.
Explanation
This statement is incorrect. While it is true that monoliths avoid the overhead of orchestration platforms like Kubernetes, the reduction of tooling complexity does not directly translate to lower latency or higher cohesion. Latency is primarily driven by the cost of intra‑process calls versus inter‑service messaging, not by the presence of orchestration tools.
Overall explanation
The question tests understanding of why a monolithic architecture may be favored when high cohesion and low latency are paramount. The correct answer (option 3) highlights that eliminating asynchronous message passing and the associated serialization/deserialization overhead results in faster, in‑process calls, which directly reduces response time. Options 1, 2, 4, 5, and 6 each touch on legitimate advantages of monoliths (deployment simplicity, perceived scalability, language flexibility, fault isolation, and tooling reduction) but they either misrepresent the primary latency factor or describe benefits that belong more to distributed systems. Learners often conflate operational convenience with performance characteristics, leading to the misconceptions reflected in the distractors. Best practice dictates evaluating latency requirements first; if sub‑millisecond response is critical, a tightly coupled monolith can be justified despite its drawbacks in modularity and scalability.
Domain
Software Architecture
Question 76
Skipped
Your team is designing a new e-commerce platform that needs to handle 10,000 concurrent users, with a requirement for zero-downtime deployment. Which microservices architecture pattern should you choose?
Monolithic architecture
Explanation
This option is incorrect. A monolithic architecture bundles all functionality into a single deployable unit, so any code change requires taking the entire application offline, violating the zero‑downtime requirement. In a real e‑commerce scenario, a single point of failure during deployment could cause lost sales and a poor customer experience.
Canary release pattern
Explanation
This option is plausible but incorrect for the given requirement. Canary releases gradually route a small percentage of traffic to the new version, which does provide near‑zero downtime, yet they introduce additional operational complexity and slower full‑scale rollout, which may be undesirable when you must instantly serve 10,000 concurrent users. Using a canary for a high‑traffic launch could delay the full benefit of the new version and increase latency for early adopters.
Correct answer
Blue‑Green deployment pattern
Explanation
This option is correct. Blue‑Green deployment maintains two identical production environments (Blue and Green) and switches all traffic from the old to the new environment in a single, atomic operation, guaranteeing zero downtime. For an e‑commerce platform expecting 10,000 concurrent users, this pattern allows you to fully test the new version under production‑like load before the cutover, minimizing risk and preserving user experience.
Service mesh pattern
Explanation
This option is incorrect. A service mesh provides sophisticated traffic management, security, and observability between microservices, but it does not define a deployment strategy that eliminates downtime. Deploying a new version without a proper zero‑downtime pattern could still cause interruptions even if a mesh is in place.
API gateway pattern
Explanation
This option is incorrect. An API gateway acts as a single entry point for client requests, handling routing, rate limiting, and authentication, but it does not address how new service versions are rolled out without downtime. Relying on an API gateway alone would not prevent a brief outage during a full deployment.
Sidecar pattern
Explanation
This option is incorrect. The sidecar pattern supplements a service with auxiliary processes (such as logging or monitoring) running in a separate container, yet it says nothing about deploying new code without interruption. Using sidecars does not solve the need for an instant, zero‑downtime cutover required for high‑traffic e‑commerce workloads.
Overall explanation
The question tests knowledge of deployment patterns within a microservices architecture, specifically those that enable zero‑downtime releases for high‑traffic applications. Blue‑Green deployment is the correct choice because it provides two complete production environments and allows an instantaneous switch, ensuring that 10,000 concurrent users experience no interruption. Monolithic architecture, while simple, forces full application downtime on every change, violating the requirement. Canary releases, though safe, introduce gradual rollout and operational overhead that may delay serving the full user base. Service mesh, API gateway, and sidecar patterns each solve different concerns—service communication, request routing, and auxiliary functionality—but they do not define a zero‑downtime deployment strategy. Learners should remember that when zero‑downtime is non‑negotiable for large user volumes, Blue‑Green deployment is the go‑to pattern, often combined with load testing and automated traffic switching.
Domain
Microservices Architecture
Question 77
Skipped
As a Dev Ops engineer, you are tasked with designing a CI/CD pipeline for a legacy monolithic application. Which TWO approaches should you take to ensure a smooth transition to a microservices architecture?
Rewrite the entire monolith into microservices before setting up any CI/CD pipelines.
Explanation
This option is incorrect. Rewriting the whole application in one step is high risk and defeats the purpose of incremental migration, leading to massive downtime and unknown defects. In practice, teams that attempt a full rewrite often encounter schedule overruns and may never complete the transition.
Correct selection
Containerize the existing monolith and establish automated builds and deployments, then incrementally extract functionality into independent services using the Strangler Fig pattern.
Explanation
This option is correct. Containerizing the monolith provides a consistent, reproducible environment for CI/CD while the Strangler Fig pattern allows you to replace parts of the system gradually without disrupting users. Real‑world teams have used this approach to move from a single JAR to Docker‑based microservices, reducing risk and keeping production stable.
Disable all automated tests during migration to speed up delivery and rely on manual testing after each service is deployed.
Explanation
This option is incorrect. Turning off automated testing removes a safety net, making it easy to introduce regressions that may go unnoticed until they affect customers. Organizations that have removed tests during migration often experience production incidents that could have been caught by CI pipelines.
Use a single shared repository for all new microservices to simplify version control and avoid managing multiple pipelines.
Explanation
This option is incorrect. While a monorepo can work, forcing all microservices into one repository creates coupling, makes pipeline scaling harder, and can lead to longer build times. Best practice is to give each service its own repo and pipeline so teams can deploy independently.
Correct selection
Introduce feature flags and a proxy layer to route requests to new services while maintaining the legacy codebase, allowing gradual cutover within the same pipeline.
Explanation
This option is correct. Feature flags let you toggle new functionality on or off without redeploying, and a proxy (or service mesh) can direct traffic to the new microservice version, enabling a controlled, observable rollout. Companies like Netflix use this technique to shift traffic gradually and roll back instantly if issues arise.
Require developers to commit directly to the production branch to reduce merge overhead during the transition.
Explanation
This option is incorrect. Direct commits to production bypass code review, testing, and approval gates, increasing the likelihood of defects reaching users, especially during a complex migration. Proper branching strategies and pull‑request workflows are essential for maintaining stability.
Overall explanation
The question tests the learner's understanding of how to orchestrate a low‑risk migration from a monolithic system to microservices using CI/CD. The two correct approaches—containerizing the monolith with incremental Strangler Fig extraction and employing feature flags with a proxy layer—both emphasize gradual change, automated testing, and observability. Common misconceptions include trying to rewrite everything at once, removing safety nets like automated tests, or simplifying version control at the cost of service independence. In real deployments, teams that adopt incremental containerization and traffic‑routing controls experience smoother cutovers and can rollback quickly if problems arise. Best practice is to keep the existing system operational while new services are introduced, using CI/CD to enforce quality and speed throughout the transition.
Domain
Microservices Migration
Question 78
Skipped
A tech lead is tasked with optimizing the performance of a slow-loading web application, with a constraint that the solution must be implemented within a week. What is the MOST appropriate action?
Initiate a complete rewrite of the front‑end using a new Java Script framework.
Explanation
This option is incorrect because a full rewrite is a massive effort that far exceeds a one‑week timeline. Re‑architecting the UI entails design, development, testing, and regression verification, which would likely introduce new bugs. In the real world, teams that attempt such sweeping changes under tight deadlines often miss the deadline and degrade stability.
Correct answer
Profile the application with performance tools, pinpoint the biggest bottlenecks, and apply quick‑win fixes such as caching, asset minification, and query optimization.
Explanation
This option is correct. Profiling quickly surfaces the most expensive operations, allowing the team to focus on changes that deliver the greatest latency reduction with minimal development effort. Implementing caching headers, compressing static files, and optimizing database queries are classic low‑effort, high‑impact measures that can be completed within a week, leading to measurable load‑time improvements.
Add additional server instances behind a load balancer without first analyzing the root cause of slowness.
Explanation
This option is incorrect because scaling horizontally does not address the underlying performance issues and may simply mask them. Without identifying whether the latency is due to CPU, I/O, or network latency, extra servers might be underutilized and waste resources. In practice, premature scaling can increase cost without delivering the expected speed gains.
Disable all third‑party scripts and widgets to reduce load time, regardless of functionality impact.
Explanation
This option is incorrect as a blanket removal of third‑party code can break essential features, resulting in a poor user experience. While third‑party scripts often contribute to latency, a systematic evaluation (e. g., async loading, lazy loading) is required rather than outright disabling. Real‑world incidents show that removing analytics or payment scripts without replacement can cause revenue loss or broken workflows.
Write a comprehensive unit‑test suite before making any performance changes.
Explanation
This option is incorrect because unit testing improves code correctness but does not directly address performance, and it consumes valuable time that could be spent on optimization. While tests are valuable, they are not the most efficient first step for a one‑week performance deadline. Teams that prioritize testing over profiling in such scenarios often miss the performance target.
Request an extension of the deadline and defer the optimization to the next release cycle.
Explanation
This option is incorrect because the scenario explicitly imposes a one‑week constraint, and a responsible tech lead should seek a feasible solution within that window. Asking for more time without exploring rapid‑impact actions undermines project commitments. In many organizations, stakeholders expect the lead to prioritize pragmatic, incremental improvements rather than simply delay the work.
Overall explanation
The question tests the ability to choose a realistic, high‑impact performance‑optimization strategy under a tight deadline. The correct answer emphasizes quick profiling and targeted low‑effort fixes, which aligns with industry best practices for rapid performance gains. The distractors each represent common misconceptions: massive rewrites, blind scaling, indiscriminate removal of third‑party code, over‑emphasis on testing, or deferring responsibility—all of which either waste time, increase cost, or risk functionality. Understanding that profiling guides effort allocation is crucial for delivering measurable improvements in constrained timeframes. Practically, teams should first gather data, then implement caching, compression, and query tuning before considering larger architectural changes.
Domain
Performance Optimization
Question 79
Skipped
A data engineer is designing a data warehouse for a company with a large customer base, with a requirement for GDPR compliance. Which service-oriented architecture pattern is BEST suited for this scenario?
Correct answer
Service Facade pattern
Explanation
This option is correct. A Service Facade abstracts the underlying data‑store APIs and presents a controlled, privacy‑aware interface to callers, making it easier to enforce consent, data minimisation, and the right‑to‑be‑forgotten requirements of GDPR. In practice, the façade can filter out personal identifiers or apply masking before data leaves the warehouse, reducing exposure risk.
Broker pattern
Explanation
This option is incorrect. The Broker pattern centralises communication between services but does not inherently provide mechanisms for data privacy or consent management required by GDPR. While it can simplify integration, without additional layers it leaves personal data exposed in the message flow, which could result in compliance gaps.
Event‑Driven Architecture
Explanation
This option is incorrect. An Event‑Driven Architecture focuses on asynchronous messaging and real‑time processing, which can help propagate deletion events, but it does not itself define how personal data is accessed or masked. Relying solely on events may lead to orphaned records if proper data‑purge logic is not embedded in each consumer.
API‑Gateway pattern
Explanation
This option is a plausible distractor but not the best answer. An API gateway can enforce authentication, rate‑limiting, and logging, which are useful for GDPR, yet it operates at the network edge and does not encapsulate the internal data‑model transformations that a façade provides. Without a façade, the gateway may still forward raw personal data to downstream services.
Service Mesh pattern
Explanation
This option is incorrect. A Service Mesh manages service‑to‑service communication, observability, and security at the network layer, but it does not address data‑level concerns such as consent handling or data minimisation. Implementing a mesh alone would not satisfy GDPR's requirement to control how personal data is presented to consumers.
Anti‑Corruption Layer pattern
Explanation
This option is incorrect. The Anti‑Corruption Layer protects a system from legacy data models, focusing on translation between bounded contexts, but it does not directly provide the privacy‑by‑design controls needed for GDPR. Using it without a façade could still expose personal data to downstream services without proper masking.
Overall explanation
The question tests knowledge of how service‑oriented architecture patterns can support GDPR compliance when building a large‑scale data warehouse. The Service Facade pattern is optimal because it creates a curated interface that can enforce consent checks, data masking, and deletion logic before personal data is exposed, aligning with privacy‑by‑design principles. Other patterns such as Broker, Event‑Driven, API‑Gateway, Service Mesh, and Anti‑Corruption Layer each address different architectural concerns—communication, scalability, network security, or legacy integration—but they do not inherently provide the fine‑grained data‑level controls required by GDPR. Learners often mistake the API‑Gateway or Event‑Driven approaches as sufficient for privacy, yet without a façade they may still leak unfiltered personal data. Best practice is to combine a Service Facade with supporting patterns (e. g., API gateway for auth, event‑driven notifications for erasure) to achieve a comprehensive GDPR‑compliant solution.
Domain
Service-Oriented Architecture
Question 80
Skipped
A product engineer is tasked with designing a real-time analytics system that needs to process 100,000 events per second, with a requirement for a latency of under 200ms. Which event-driven architecture pattern should you choose?
Lambda Architecture
Explanation
This option is incorrect. Lambda Architecture combines a batch layer for historical accuracy with a speed layer for low‑latency results. The batch layer typically introduces processing windows measured in minutes or hours, which violates the sub‑200 ms latency requirement. In a real‑time analytics use case like fraud detection, the delayed batch view would cause missed alerts.
Correct answer
Kappa Architecture
Explanation
This option is correct. Kappa Architecture uses a single, immutable stream processing pipeline, allowing every event to be processed exactly once in near real time. Platforms such as Apache Kafka paired with Flink can comfortably handle 100 k events per second while keeping end‑to‑end latency well below 200 ms. Companies like Uber use this pattern to compute live driver‑location heat maps with sub‑second freshness.
CQRS with Event Sourcing
Explanation
This option is incorrect. Command Query Responsibility Segregation (CQRS) separates write and read models, and Event Sourcing persists state as a series of events. While powerful for auditability, reconstructing read models often requires replaying events, adding latency that exceeds the 200 ms target. It is better suited for domains where eventual consistency is acceptable, such as banking ledger systems, not ultra‑low‑latency analytics.
Simple Message Queue with fan‑out (e. g., Rabbit MQ)
Explanation
This option is incorrect. A traditional message queue provides reliable delivery and decoupling, but its per‑message overhead and routing complexities can become a bottleneck at 100 k events per second. Additionally, typical queues do not guarantee the sub‑200 ms end‑to‑end latency needed for real‑time dashboards, leading to delayed insights in scenarios like Io T sensor monitoring.
Pub/Sub with micro‑batching (e. g., Cloud Pub/Sub with 1‑second batches)
Explanation
This option is incorrect. Micro‑batching aggregates incoming events into small time windows before processing, which inevitably adds latency equal to the batch interval. Even a 1‑second batch would exceed the 200 ms latency requirement, making it unsuitable for high‑speed analytics such as click‑stream processing during live ad auctions.
RESTful request‑response pattern
Explanation
This option is incorrect. A synchronous REST API forces each client to wait for a response, limiting scalability and throughput far below 100 k requests per second without massive provisioning. Moreover, the round‑trip time and server processing often push latency beyond 200 ms, so it cannot satisfy the real‑time analytics constraints of the scenario.
Overall explanation
The question tests knowledge of event‑driven architecture patterns and their suitability for ultra‑high‑throughput, low‑latency analytics. Kappa Architecture is the optimal choice because it relies on a single streaming pipeline that can ingest and process 100 k events per second with latency well under 200 ms, as demonstrated by real‑world deployments using Kafka and Flink. Lambda Architecture is a common misconception; its batch layer introduces latency that violates the strict requirement. CQRS with Event Sourcing, while useful for consistency and audit trails, adds replay overhead that hampers real‑time performance. Simple message queues and micro‑batch Pub/Sub systems improve decoupling but cannot guarantee the sub‑200 ms latency at the required scale. Finally, a RESTful request‑response model is fundamentally synchronous and unsuitable for streaming analytics. Learners should remember that when sub‑second latency and massive event rates are mandatory, a single‑stream processing approach like Kappa is preferred over hybrid or batch‑oriented designs.
Domain
Event Streaming
Question 81
Skipped
As an architect, you are tasked with modernizing a legacy monolithic application to a cloud-native architecture. Which THREE approaches should you take to ensure a successful migration?
Correct selection
Adopt the strangler fig pattern to incrementally replace parts of the monolith.
Explanation
This option is correct. The strangler fig pattern allows you to gradually replace legacy functionality with new cloud‑native services while keeping the system operational, reducing risk and providing a clear migration path. Real‑world teams often use it to ship small microservices alongside the monolith, phasing out old code as new capabilities become stable.
Rewrite the entire application in a new programming language before migrating.
Explanation
This option is incorrect. A full rewrite introduces massive uncertainty, often leading to cost overruns, missed deadlines, and loss of domain knowledge embedded in the existing code. Companies that attempted complete rewrites, such as a large retailer’s 5‑year project, frequently discovered that the new system lagged behind business needs and required a later, more painful migration.
Correct selection
Containerize the application components and orchestrate them with Kubernetes for portability and scalability.
Explanation
This option is correct. Containerizing decomposed services isolates dependencies, enables consistent deployment across environments, and Kubernetes provides automated scaling, self‑healing, and service discovery. In practice, organizations moving to cloud‑native often see faster rollout cycles and lower infrastructure friction after containerization.
Perform a lift‑and‑shift of the unchanged monolith to cloud VMs and rely on the cloud provider’s auto‑scaling.
Explanation
This option is incorrect. A simple lift‑and‑shift does not refactor the application to use cloud‑native features such as elasticity, managed services, or observability, so the monolith may still become a performance bottleneck or incur unnecessary costs. Many migrations that only moved VMs ended up re‑architecting later because they could not achieve the expected scalability or resilience.
Correct selection
Implement automated CI/CD pipelines with comprehensive testing to enable incremental releases.
Explanation
This option is correct. Continuous integration and delivery ensure that each small change is validated, reducing regression risk and allowing rapid, reliable deployments of new cloud‑native components. Enterprises that adopt CI/CD report higher deployment frequency and faster feedback loops during migration projects.
Migrate all functionality directly to serverless functions regardless of workload characteristics.
Explanation
This option is incorrect. While serverless can be powerful for specific event‑driven workloads, forcing every component into functions can cause issues such as cold‑starts, state management complexity, and unpredictable costs. A balanced approach evaluates where serverless is appropriate rather than applying it universally, as seen in firms that experienced performance degradation after over‑using function‑as‑a‑service.
Overall explanation
The question tests knowledge of proven cloud‑native migration strategies. Successful modernization relies on incremental techniques like the strangler fig pattern, containerization with orchestration, and automated CI/CD pipelines, all of which reduce risk and enable continuous delivery. Common misconceptions include believing that a full rewrite, a simple lift‑and‑shift, or indiscriminate use of serverless will automatically deliver cloud benefits; each of these approaches ignores the need to re‑architect, refactor, and adopt appropriate cloud services. Practitioners should assess each legacy component, choose the right target runtime, and evolve the system gradually while maintaining operational stability. Remember that a thoughtful, phased migration backed by automation and observability leads to a resilient, scalable cloud‑native architecture.
Domain
Cloud Migration
Question 82
Skipped
A QA engineer is tasked with testing a new feature that requires a specific test data setup, with a constraint that the test environment must be identical to production. Which configuration achieves this?
Deploy the test code to a local development machine with a mock database seeded with synthetic data and configure environment variables to dummy values.
Explanation
This option is incorrect because a local machine with synthetic data does not reflect the exact state of production data. Mock databases often lack the same schema nuances, data distribution, and edge‑case records found in production, leading to false confidence. In real projects, relying on such mocks can cause missed bugs that only appear with real production data patterns.
Use a separate staging server that runs the same Docker image as production but with a subset of production data manually extracted for the test case.
Explanation
While this option moves closer to production by using the same image, extracting only a subset of data breaks the requirement for an identical environment. Production may have inter‑related records, referential integrity constraints, and data volume that affect performance and behavior; a subset can miss those interactions. Consequently, test results may not surface issues that would arise with the full data set.
Correct answer
Create a test environment that replicates production by copying the production database snapshot, using identical configuration files, and wiring the same external services in read‑only mode.
Explanation
This option is correct because it ensures the test environment mirrors production in every configurable aspect while protecting live data. By using a snapshot, the data is an exact replica at a point in time, and identical configuration files guarantee the same feature flags, locale settings, and resource limits. Running external services in read‑only mode prevents accidental mutation, enabling safe yet realistic testing.
Run the tests against the live production environment directly, ensuring the data is exactly as users see it.
Explanation
Testing directly on production is incorrect and hazardous; while it does use identical data, it violates the principle of protecting production stability. Test execution can introduce latency, consume resources, or even corrupt live data if the test writes inadvertently. Best practice dictates separating test workloads from live traffic to avoid downtime or data loss.
Configure a CI pipeline to spin up a new container using the production image but replace all secrets with test secrets and use an in‑memory database.
Explanation
Replacing secrets and using an in‑memory database means the environment no longer matches production, where persistent storage and real credentials are used. In‑memory databases lack the durability, indexing, and query performance characteristics of the production database, leading to misleading test outcomes. This option is a common misconception that the image alone guarantees fidelity.
Set up a test environment with a fresh, empty database and only the core application binaries, relying on unit tests to simulate production behavior.
Explanation
An empty database cannot emulate the complex state of a production system, making this choice incorrect. Unit tests that simulate behavior miss integration points, data‑driven edge cases, and performance characteristics tied to real data volumes. Deploying such an environment would give a false sense of security about the feature's readiness.
Overall explanation
The question probes understanding of how to construct a test environment that is truly identical to production. The correct configuration involves cloning the production database, applying the exact same configuration files, and connecting to external services in a non‑mutating (read‑only) mode, which preserves data fidelity while safeguarding live systems. Options that use synthetic data, partial data extracts, or altered secrets break this fidelity, leading to gaps in test coverage or risk to production stability. Misconceptions often arise from assuming that matching the application image or merely using a separate staging server is sufficient, ignoring the critical role of data and configuration parity. Best practice is to create a full production replica with safeguards, enabling realistic testing without endangering the actual production environment.
Domain
Test Environment Configuration
Question 83
Skipped
A developer is tasked with debugging a production issue that is causing a high error rate, with a constraint that the solution must be implemented without affecting the current users. What is the PRIMARY reason for this behaviour?
Correct answer
The developer is making the fix directly on the live production code path without using any isolation mechanism such as feature flags, canary releases, or a separate hot‑fix branch.
Explanation
This option is correct. Changing code that is already serving traffic means the modification is instantly visible to all users, so any mistake or untested change can increase the error rate. In real world, deploying a hotfix directly to the main branch without a toggle can cause a spike in 500 errors for every request, violating the requirement to not affect current users.
The high error rate stems from insufficient unit test coverage in the continuous integration pipeline.
Explanation
This option is incorrect. While lack of unit tests can lead to bugs slipping into code, it does not directly explain why the current users are affected during a live fix. In practice, many organizations have good test coverage yet still need to protect users by using phased rollouts when fixing production defects.
The repository’s default branch is protected, which prevents the developer from creating a safe hot‑fix branch.
Explanation
This option is incorrect. A protected branch restricts forced pushes and direct commits, but it does not cause the behaviour of impacting users when fixing an issue. In fact, protection encourages developers to create pull requests or separate branches, which would help avoid immediate user impact.
The problem is caused by a stale local cache on the developer’s machine, which only affects their own testing environment.
Explanation
This option is incorrect. A stale local cache would not produce a high error rate for all production users; it would be isolated to the developer’s environment. Real‑world incidents where all users see errors usually involve code or configuration changes that are deployed to the shared production environment.
The deployment pipeline automatically rolls back failing builds, so the changes never reach users at all.
Explanation
This option is incorrect. Automatic rollbacks would prevent the new code from affecting users, not cause a high error rate. If rollbacks were functioning correctly, the production system would stay on the last known good version, eliminating the described behaviour.
The monolithic architecture of the application makes it impossible to isolate bugs without taking the entire service offline.
Explanation
This option is incorrect. Although monoliths can make isolation harder, they do not inherently force every change to affect all users; strategies like blue‑green deployments or feature flags can still mitigate impact. Many large monolithic services successfully deploy fixes with zero downtime using these techniques.
Overall explanation
The question tests the learner’s understanding of how production changes can unintentionally affect all active users when proper isolation mechanisms are not used. The primary reason for the observed behaviour is that the fix is applied directly to the live code path, making the change instantly visible to everyone. Common misconceptions include blaming lack of tests, repository protection, or architectural style, all of which are tangential but not the root cause of immediate user impact. Best practice is to employ feature flags, canary releases, blue‑green deployments, or dedicated hot‑fix branches to safely introduce fixes while keeping the existing user experience stable. Remember that any direct modification to production code without a rollout strategy risks increasing error rates and violating service‑level objectives.
Domain
Git & Git Hub
Question 84
Skipped
A data engineer is tasked with designing a data pipeline for a company with a large volume of Io T sensor data, with a requirement for real-time processing. Which tool or feature is BEST suited for this scenario?
Apache Spark Structured Streaming
Explanation
This option is incorrect for the given scenario. While Spark Structured Streaming does provide micro‑batch processing that can approximate real‑time, it generally incurs higher latency than true stream processors and requires a Spark cluster, which may be overkill for raw sensor ingestion. Using it for high‑frequency Io T data could lead to delayed insights and increased operational costs compared to a purpose‑built streaming engine.
AWS Glue
Explanation
AWS Glue is a managed ETL service focused on batch transformations and cataloging. It does not provide low‑latency streaming capabilities, so it would not meet the real‑time requirement of the pipeline. Deploying Glue for continuous Io T streams would result in data being processed minutes or hours after arrival, negating the need for immediate analysis.
Correct answer
Apache Kafka with Kafka Streams
Explanation
This option is correct. Apache Kafka offers a durable, high‑throughput log for ingesting massive sensor streams, and Kafka Streams adds lightweight, exactly‑once processing capabilities without needing a separate processing cluster. In a real‑world Io T deployment, this combination can handle millions of events per second and deliver processed results within milliseconds, satisfying the real‑time constraint.
Apache Hadoop Map Reduce
Explanation
Map Reduce is a batch‑oriented framework that writes intermediate results to disk, leading to high latency. It is unsuitable for continuous, low‑latency processing of sensor data and would introduce unnecessary complexity. Using Map Reduce for real‑time Io T analytics would cause delays that could make the insights obsolete by the time they are produced.
Azure Data Factory (ADF) scheduled pipelines
Explanation
ADF’s scheduled pipelines are designed for orchestrating batch workloads on a periodic basis rather than continuous streaming. While ADF can move data between services, it lacks native real‑time processing primitives, so sensor data would be staged and processed only at the next scheduled run. This approach would not satisfy requirements for immediate detection of events such as equipment failures.
Google Cloud Pub/Sub alone
Explanation
Pub/Sub provides reliable message ingestion and fan‑out but does not perform any processing itself. Using Pub/Sub without a downstream stream processor would leave the pipeline at the transport layer, requiring additional services to achieve real‑time analytics. Consequently, Pub/Sub alone is insufficient as a complete solution for the described real‑time processing need.
Overall explanation
The question tests knowledge of streaming data architectures and the ability to match technology to real‑time processing requirements. Apache Kafka paired with Kafka Streams is purpose‑built for high‑volume, low‑latency ingestion and transformation, making it the optimal choice for Io T sensor streams. The other options either focus on batch processing (Map Reduce, AWS Glue, Azure Data Factory) or lack processing capabilities (Pub/Sub) or introduce higher latency with micro‑batching (Spark Structured Streaming). Common misconceptions include assuming any "big data" tool can handle streaming or that managed ETL services automatically provide real‑time capabilities. Best practice is to evaluate latency, throughput, and operational complexity, selecting a native stream processing platform when immediate insights are critical.
Domain
Streaming Data
Question 85
Skipped
A Dev Ops engineer is tasked with designing a monitoring system for a distributed microservices application, with a requirement for a 99.99% uptime. What is the MOST likely root cause of a monitoring alert?
The alert thresholds were set too aggressively, causing frequent false positives.
Explanation
This option is incorrect. While overly sensitive thresholds can generate unnecessary alerts, they are a configuration issue rather than the underlying cause of a service outage. In practice, teams tune thresholds after initial rollout, and false‑positive alerts are usually identified and corrected before they dominate the alert stream.
A temporary spike in network latency between two microservices.
Explanation
This option is also incorrect. Network latency spikes can temporarily degrade performance, but they rarely trigger critical alerts that jeopardize a 99.99% uptime SLA. Most monitoring systems treat latency anomalies as warning‑level events, and the underlying health of the services remains intact once the network stabilizes.
Correct answer
A failure in a critical downstream service or external dependency.
Explanation
This option is correct. In a distributed microservices architecture, many services depend on others; when a downstream component goes down, health checks and downstream request failures cascade, producing alerts. Real‑world incidents, such as a payment gateway outage, illustrate how a single dependent service can cause alerts across multiple upstream services, making it the most common root cause for alerts in high‑availability systems.
Insufficient CPU resources on a single microservice instance.
Explanation
This option is incorrect. CPU starvation can cause performance degradation, but modern auto‑scaling and resource limits usually mitigate the issue before it triggers a critical alert. Moreover, CPU limits tend to affect only the overloaded instance, not the entire system, making it less likely to be the primary source of alerts for overall uptime.
A recent code deployment introduced a regression bug.
Explanation
This option is incorrect. Deployments can certainly cause alerts, but rigorous CI/CD pipelines, canary releases, and automated rollback mechanisms reduce the frequency of such events. While a regression is a plausible cause, statistically it occurs less often than dependency failures in a mature microservices environment.
Missing instrumentation for a key metric, so the alert cannot be generated.
Explanation
This option is incorrect. Lack of instrumentation leads to a blind spot rather than an alert; the system simply does not report the condition. Consequently, missing metrics would prevent detection, not generate an alert, making it an unlikely root cause for an observed monitoring alarm.
Overall explanation
The question tests knowledge of root‑cause analysis in monitoring distributed microservices. Because services are tightly coupled through APIs, the most frequent trigger for a serious alert is the failure of a downstream or external dependency, which propagates errors upstream and violates health checks. Misconfigured thresholds, transient latency spikes, CPU constraints, deployment bugs, and missing instrumentation are all plausible concerns, but they either produce lower‑severity warnings, are mitigated by automation, or prevent alerts altogether. Understanding that dependency failures dominate alert patterns helps engineers design more resilient observability stacks, such as implementing circuit breakers and dependency health dashboards. Best practice is to prioritize monitoring of critical downstream services and to design alerts that reflect cascade failures rather than isolated metric thresholds.
Domain
Monitoring & Observability
Question 86
Skipped
As a tech lead, you're tasked with designing a new e-commerce platform that must be highly scalable and fault-tolerant. The system should be able to handle 1000 concurrent users and ensure zero-downtime during deployments. Which TWO options are correct?
Deploy the application as a monolithic service on a single EC2 instance and increase its instance size to meet load.
Explanation
This option is incorrect. Running a monolith on a single virtual machine creates a hard limit on CPU, memory, and I/O, making it difficult to serve 1000 concurrent users. Moreover, the single instance becomes a single point of failure, so any crash or maintenance event would cause downtime, violating the zero‑downtime requirement.
Correct selection
Use a container orchestration platform (e. g., Kubernetes) with rolling updates and pod health checks.
Explanation
This option is correct. Kubernetes can automatically scale pods based on metrics, ensuring the application can handle spikes in concurrent users. Rolling updates replace old pods with new ones only after health checks pass, guaranteeing that traffic is never sent to unhealthy instances, thus providing zero‑downtime deployments.
Implement a blue‑green deployment pipeline combined with a load balancer that routes traffic between the two identical environments.
Explanation
While blue‑green deployments do provide zero‑downtime releases, on their own they do not address dynamic scaling to 1000 concurrent users. Without auto‑scaling groups or capacity planning, both environments may become overloaded. Therefore, this answer is incomplete for the stated scalability requirement.
Rely on a single primary relational database without replication, and perform schema migrations during peak traffic.
Explanation
This option is incorrect. A single primary database is a single point of failure; if it becomes unavailable, the entire platform is impacted. Performing schema changes during peak load can lock tables and cause service interruptions, directly contradicting the zero‑downtime goal.
Correct selection
Configure auto‑scaling groups behind a managed load balancer, and store session data in a distributed cache like Redis.
Explanation
This option is correct. Auto‑scaling groups add or remove compute instances based on real‑time demand, ensuring the system can sustain 1000 concurrent users. A managed load balancer evenly distributes traffic, while a distributed cache removes session‑state coupling from individual instances, improving fault tolerance and enabling seamless deployments.
Use feature flags to hide new code paths, but deploy directly to production without any staging environment.
Explanation
This option is incorrect. Feature flags can limit exposure of new functionality, but they do not replace the need for a safe deployment strategy. Deploying straight to production without staging or rolling mechanisms can still introduce bugs or performance regressions that cause downtime.
Overall explanation
The question tests understanding of architectural patterns that deliver both high scalability and zero‑downtime deployments. Correct solutions combine automated scaling (auto‑scaling groups, Kubernetes pod scaling) with deployment techniques that keep traffic away from unhealthy or changing instances (rolling updates, health checks). Options 2 and 5 satisfy both dimensions: they provide the ability to add capacity on demand and ensure that updates never interrupt live traffic. The incorrect options each miss a critical piece—either they rely on a single point of failure, lack automatic scaling, or ignore safe deployment practices—common misconceptions among teams transitioning from legacy monoliths. In real-world e‑commerce systems, blending these patterns (container orchestration, load‑balanced auto‑scaling, and stateless session handling) is considered a best practice for achieving resilient, continuously deployable services.
Domain
Scalable Architecture
Question 87
Skipped
As a Dev Ops engineer, you're responsible for troubleshooting a performance issue in a microservices-based application. The issue is causing a 30% increase in latency, and the system is running on 4 v CPUs with 2 GB RAM. What is the PRIMARY reason for this behaviour?
Correct answer
The application is exhausting the available RAM, causing the host to swap memory pages to disk.
Explanation
This option is correct. With only 2 GB of RAM, a collection of microservices can quickly consume physical memory, forcing the kernel to swap to disk. Swapping dramatically increases response times because disk I/O is orders of magnitude slower than RAM access, which manifests as a noticeable latency increase. In production, teams often see latency spikes after a memory pressure event, exactly matching the described 30% degradation.
The four v CPUs are fully saturated, leading to excessive context switching and CPU throttling.
Explanation
This option is incorrect. While CPU saturation can cause latency, the described environment (4 v CPUs) is typically sufficient for many microservices unless they are extremely CPU‑bound. Moreover, a 30% latency jump without a corresponding CPU usage spike points to another bottleneck. Learners often mistake CPU contention for the root cause when memory pressure is the actual driver.
The overlay network used for inter‑service communication is congested, limiting bandwidth.
Explanation
This option is incorrect. Network congestion would usually present as packet loss or timeouts rather than a steady 30% latency increase across the board. Overlay networks add latency, but the magnitude described is more characteristic of local resource starvation. Misattributing latency to network issues is common when the symptoms are observed in distributed logs, but metrics would show low network utilization in this case.
Heavy logging to a shared persistent volume is creating a disk I/O bottleneck.
Explanation
This option is incorrect. Disk I/O bottlenecks can increase latency, yet they generally impact write‑heavy workloads and are reflected in high I/O wait times. The scenario highlights limited RAM, which more directly causes swapping than logging‑induced I/O pressure. Many practitioners mistakenly blame disk activity without checking swap statistics first.
Improper JVM garbage‑collection tuning is causing long GC pauses in the services.
Explanation
This option is incorrect. Poor GC settings can indeed produce latency spikes, but they usually appear as irregular, high‑latency outliers rather than a consistent 30% increase. Additionally, the problem statement does not specify Java‑based services, making this a less likely primary cause. This distractor reflects the common misconception that GC is always the culprit in latency problems.
An excessive number of threads in each microservice is leading to lock contention and thread‑pool exhaustion.
Explanation
This option is incorrect. Thread contention can raise latency, yet it typically shows up as jittery response times and can be diagnosed via thread‑dump analysis. The limited RAM environment points to swapping as the dominant factor. Learners often over‑emphasize concurrency issues without first verifying resource metrics.
Overall explanation
The question tests the learner's ability to identify the most likely root cause of latency in a resource‑constrained microservices deployment. With only 2 GB of RAM, memory exhaustion is the primary driver because the operating system will start swapping once physical memory is depleted, and swapping dramatically slows down request processing. The other options represent plausible but less likely causes: CPU saturation, network congestion, disk I/O, GC pauses, and thread contention are all common performance symptoms, yet each would be evident through specific metrics that are not indicated in the scenario. Understanding the hierarchy of resource bottlenecks—memory first, then CPU, then I/O—is essential for effective troubleshooting. Best practice dictates monitoring swap usage and memory pressure before investigating other layers, and provisioning sufficient RAM or tuning service memory limits to prevent swapping.
Domain
Performance Optimization
Question 88
Skipped
A developer is tasked with implementing a new feature in a monolithic architecture-based system. The feature requires integrating with a third-party API that has a rate limit of 100 requests per minute. Which approach BEST satisfies these requirements?
Increase the monolith's thread pool size to handle bursts of requests.
Explanation
This is incorrect. Enlarging the thread pool only allows the application to issue more concurrent calls, but it does nothing to enforce the external API's rate limit. In fact, it can increase the likelihood of exceeding 100 requests per minute, resulting in HTTP 429 responses. Real‑world consequence: the service may be throttled or blocked by the third‑party provider, causing failures for end users.
Cache API responses for 1 minute to reduce the number of outbound calls.
Explanation
This is partially correct but not sufficient, so it is considered incorrect for the "best" approach. Caching can lower the number of calls for read‑only data that does not change frequently, but many API interactions (e. g., writes or time‑sensitive queries) cannot be cached safely. Relying solely on caching may still exceed the 100‑request limit for uncached operations, leading to rate‑limit errors.
Deploy a separate microservice that proxies API calls and enforces the rate limit.
Explanation
This is incorrect in the context of a monolithic architecture. Introducing a separate microservice adds unnecessary complexity, deployment overhead, and deviates from the existing monolith design. While it could enforce limits, the question asks for the best solution within the current monolithic system, making internal throttling preferable.
Correct answer
Implement client‑side throttling using a token‑bucket algorithm in the service.
Explanation
This is correct. A token‑bucket algorithm allows the monolith to track the number of permitted requests and block or delay excess calls, ensuring the 100‑request‑per‑minute ceiling is never breached. It can be implemented directly in the application code without altering the architecture, providing precise control and predictable behavior. In production, this prevents HTTP 429 errors and keeps the integration reliable.
Use a message queue to buffer requests and process them at a controlled rate.
Explanation
This is incorrect as the best answer. While queuing can smooth bursts, it introduces additional latency and operational components (broker, workers, monitoring) that are unnecessary for a simple rate‑limit requirement. In a monolith, adding a queue may over‑engineer the solution and complicate debugging.
Ignore the rate limit and rely on the third‑party API to return HTTP 429 errors.
Explanation
This is incorrect. Deliberately exceeding the rate limit will cause the provider to reject requests with 429 Too Many Requests, leading to failed operations and a poor user experience. Moreover, many providers may temporarily block the client IP or key after repeated violations, causing longer outages. Proper rate‑limit handling is essential for robust integrations.
Overall explanation
The question tests understanding of how to respect third‑party rate limits within a monolithic application. The best practice is to embed client‑side throttling—such as a token‑bucket algorithm—directly in the service so that no more than 100 requests are sent per minute, guaranteeing compliance without architectural changes. Common misconceptions include thinking that scaling thread pools or relying on caching alone will solve the problem, when they either ignore the limit or only partially address it. Deploying a separate microservice or a message queue adds unnecessary complexity and latency for a simple rate‑limit enforcement scenario. Ignoring the limit altogether is a dangerous approach that leads to 429 errors and possible bans. Learners should remember that rate limiting is a responsibility of the client code, and lightweight, in‑process algorithms are usually the most effective solution in monolithic contexts.
Domain
Rate Limiting
Question 89
Skipped
As an architect, you're designing a system that must be GDPR-compliant and ensure data sovereignty. The system will be deployed in multiple regions, and data must be stored locally in each region. Which THREE approaches should you take?
Correct selection
Deploy separate databases in each target region and configure the application to write and read data only from the local database.
Explanation
This option is correct. By physically locating a database instance within each jurisdiction, you guarantee that personal data never leaves the region, satisfying GDPR's data‑locality requirements. In practice, a European e‑commerce site might use an Azure SQL instance in Germany for German customers and another in France for French customers, routing traffic based on the user's IP address.
Correct selection
Enable the cloud provider’s region‑lock or data‑residency feature so that any storage service you create can exist only in the selected region.
Explanation
This option is correct. Most major cloud providers offer a setting that prevents resources from being created outside a designated region, effectively enforcing residency at the service level. For example, AWS S3 Object Lock with a "bucket location constraint" ensures that objects cannot be replicated to a different geography without explicit permission.
Store all user data in a single, globally replicated datastore and rely on encryption to satisfy GDPR.
Explanation
This option is incorrect. Encryption alone does not address the legal requirement that personal data remain within a specific geographic boundary; replication to other regions would still breach data‑sovereignty rules. Companies that use worldwide Cosmos DB with multi‑region writes may find themselves non‑compliant if they do not restrict the replication locations.
Keep the primary data in the headquarters data center and copy it nightly to regional caches for read‑only access.
Explanation
This option is incorrect. Although regional caches reduce latency, the authoritative copy remains outside the user’s jurisdiction, which can still be interpreted as a violation of GDPR’s storage provisions. Real‑world audits often focus on where the source of truth resides, not on transient copies.
Configure backups to be written to a multi‑region bucket that automatically replicates to all availability zones worldwide.
Explanation
This option is incorrect. Backups are considered personal data under GDPR, and replicating them globally defeats the purpose of data sovereignty. An organization that stores backup snapshots of EU citizen data in a US bucket could face hefty fines if the data is accessed from the US.
Correct selection
Ensure that both primary data and its backups are stored in the same geographic region as the user, and that disaster‑recovery snapshots are also region‑bound.
Explanation
This option is correct. Keeping backups in the same jurisdiction prevents inadvertent cross‑border transfers during recovery scenarios, a common oversight in multi‑region designs. Many regulated financial services enforce this practice by using region‑scoped storage accounts for both live and backup datasets.
Overall explanation
The question tests knowledge of GDPR data‑sovereignty requirements, which mandate that personal data be stored and processed within the data subject's jurisdiction unless a lawful transfer mechanism exists. Correct approaches involve physically locating primary databases and their backups within each region (Option 1), leveraging cloud‑provider features that lock resources to a specific region (Option 2), and ensuring that disaster‑recovery copies also stay region‑bound (Option 6). The distractors are common misconceptions: assuming encryption alone satisfies residency (Option 3), believing that a central database with read‑only caches is sufficient (Option 4), or overlooking backup locations (Option 5). Practitioners should design their architecture with explicit regional boundaries for all data stores, backups, and recovery points, and verify that cloud services are configured with residency constraints to avoid inadvertent cross‑border replication.
Domain
Data Residency
Question 90
Skipped
As a data engineer, you're tasked with optimizing the performance of a data pipeline that processes 100 GB of data daily. The pipeline is running on a cluster with 2 nodes, each with 16 GB RAM and 4 v CPUs. What should you do FIRST?
Add a third node to the cluster to increase parallel processing capacity.
Explanation
This option is incorrect because scaling out before understanding the root cause can waste resources. Adding another node may increase network overhead or introduce data shuffling without solving the underlying bottleneck, which could be CPU, I/O, or memory bound. In real-world scenarios, teams often incur unnecessary cloud costs by provisioning extra nodes prematurely.
Increase the RAM on each node from 16 GB to 32 GB.
Explanation
While more memory can help if the pipeline is memory‑starved, this option assumes that RAM is the limiting factor without evidence. Upgrading RAM without profiling may not address issues such as disk I/O saturation or CPU contention, and it adds cost for a benefit that might be negligible. Many performance problems are resolved by tuning existing resources rather than simply adding more.
Correct answer
Gather detailed metrics (CPU, memory, I/O, network) and profile the pipeline to locate the actual bottleneck.
Explanation
This is the correct first step. Profiling provides empirical data about where the pipeline spends time and which resources are maxed out, enabling targeted optimizations. In practice, teams use tools like Spark UI, Ganglia, or custom logs to pinpoint hotspots before making infrastructure changes, which prevents costly trial‑and‑error adjustments.
Rewrite the entire pipeline in a lower‑level language such as C++.
Explanation
Rewriting in a lower‑level language is an extreme measure and not appropriate as an initial action. It involves significant development effort and risk, and may not address the true performance constraints if they are due to configuration or hardware limits. Often, modest tuning or configuration changes yield comparable gains without massive code refactoring.
Enable aggressive caching of intermediate results without monitoring cache hit rates.
Explanation
Enabling caching without first measuring cache effectiveness can lead to increased memory pressure and potential out‑of‑memory errors. If the pipeline is I/O bound, caching may help, but without metrics you cannot know whether cached data is reused often enough to justify the extra RAM usage. Proper cache strategy should be informed by observed hit/miss ratios collected during profiling.
Increase the number of v CPUs per node by changing the VM type to a larger instance.
Explanation
Increasing v CPUs assumes CPU is the bottleneck, which may not be true. Without profiling, you might add more cores that sit idle while the pipeline waits on disk or network I/O, leading to unused capacity and higher costs. Best practice is to validate CPU utilization first before scaling compute resources.
Overall explanation
The question tests the learner's understanding of systematic performance tuning in data engineering. The first and most reliable step is to collect detailed metrics and profile the pipeline to identify the real bottleneck, as this informs any subsequent hardware or code changes. Options that suggest adding nodes, RAM, or CPUs assume specific resource constraints without evidence, which is a common misconception leading to unnecessary expense. More drastic actions like rewriting the pipeline or adding caching without data also reflect a lack of measurement-driven decision making. Real‑world best practice emphasizes measurement, monitoring, and targeted optimization before scaling infrastructure.
Domain
Performance Tuning
Question 91
Skipped
A product engineer is responsible for designing a new feature that requires real-time data processing. The system must be able to handle 1000 events per second and ensure low-latency processing. Which option should you choose?
Deploy a relational database (e. g., Postgre SQL) and process events synchronously within the API layer.
Explanation
This option is incorrect. Relational databases are optimized for transactional consistency, not for ingesting and processing a continuous stream of 1000 events per second with sub‑second latency. Synchronous processing would block API threads, leading to request back‑pressure and degraded user experience, as seen in systems that try to write every click directly to a SQL table.
Use a message queue (e. g., Rabbit MQ) and process events in batches every few seconds.
Explanation
This option is also incorrect. Batch processing introduces deliberate delay while the system waits to accumulate a batch, which contradicts the low‑latency requirement. While a queue can smooth spikes, processing only every few seconds would cause stale data and could miss real‑time responsiveness needed for features like live dashboards.
Correct answer
Adopt an event streaming platform (e. g., Apache Kafka) combined with a low‑latency stream processing engine such as Apache Flink or Kafka Streams.
Explanation
This option is correct. Event streaming platforms are built to handle high throughput (millions of events per second) while preserving ordering and offering sub‑second processing latency. By coupling Kafka with Flink or Kafka Streams, the engineer can perform continuous transformations and aggregations in real time, a pattern widely used in fraud detection and Io T telemetry pipelines.
Implement serverless functions (e. g., AWS Lambda) that are invoked per event without any buffering.
Explanation
This option is incorrect. Although serverless functions can scale automatically, they suffer from cold‑start latency and concurrent execution limits that can make it difficult to guarantee consistent low latency at 1000 events per second. In high‑frequency scenarios, occasional latency spikes can break SLAs, as observed in some real‑time analytics prototypes that relied solely on Lambda.
Build a microservices architecture where each service polls a shared database for new events.
Explanation
This option is incorrect. Polling adds unnecessary round‑trips and latency, and it wastes resources when no new events are present. An event‑driven approach is far more efficient for real‑time workloads; polling can cause missed deadlines and increased load on the database, which is why it is discouraged for high‑frequency streams.
Store events in a No SQL document store (e. g., Mongo DB) and run periodic Map Reduce jobs.
Explanation
This option is incorrect. Map Reduce jobs are batch‑oriented and typically run on minute‑ or hour‑scale intervals, which does not satisfy the low‑latency requirement. While No SQL stores can handle high write rates, the downstream batch processing defeats the purpose of real‑time analytics, leading to stale insights similar to legacy reporting pipelines.
Overall explanation
The question tests understanding of architectural patterns for real‑time, high‑throughput event processing. An event streaming platform like Apache Kafka, paired with a low‑latency stream processor such as Flink or Kafka Streams, is purpose‑built to ingest and transform thousands of events per second with millisecond‑level latency. Common misconceptions include assuming a relational DB can serve as a real‑time backbone, that batching improves latency, or that serverless functions automatically guarantee sub‑second response times. Each of those distractors fails because they either introduce additional delay, suffer from scaling quirks, or are designed for batch rather than continuous processing. Best practice is to choose a technology stack explicitly optimized for streaming semantics, ordering guarantees, and horizontal scalability when designing low‑latency features.
Domain
Event Streaming
Question 92
Skipped
As a QA engineer, you're tasked with testing a new feature in a service-oriented architecture-based system. The feature requires integrating with multiple services, each with its own API. What is the KEY difference between X and Y in this context?
Contract testing requires deploying all dependent services, whereas integration testing can be performed with only the consumer component mocked.
Explanation
This statement is incorrect. Contract testing is deliberately designed to avoid deploying real dependent services; it validates the consumer's expectations against a contract file. Integration testing, on the other hand, typically needs the actual provider services running so that end‑to‑end communication can be exercised.
Contract testing focuses on UI behavior, while integration testing validates the underlying database schema.
Explanation
This option is also incorrect. Neither contract testing nor integration testing is primarily about UI or database schema; contract testing deals with API contracts (request/response shapes, status codes) and integration testing verifies interactions among components, often including database operations but not limited to schema validation.
Contract testing can catch runtime performance bottlenecks, whereas integration testing cannot detect performance issues.
Explanation
This is wrong. Contract testing runs in isolation with simulated providers and therefore cannot measure real runtime performance of the full system. Performance bottlenecks are typically discovered during integration or load testing when the actual services are exercised under realistic traffic.
Correct answer
Contract testing validates the API contract without invoking the real service, while integration testing exercises the real service endpoints to verify end‑to‑end behavior.
Explanation
This statement is correct. Contract testing uses a predefined contract (such as a Pact file) to ensure the consumer's expectations match the provider's declared interface, all without launching the provider service. Integration testing, in contrast, spins up the actual providers and checks that the whole request flow, data transformations, and responses work together as expected, revealing issues that pure contract verification would miss.
Contract testing replaces the need for unit tests, whereas integration testing replaces functional tests.
Explanation
This is incorrect. Contract testing complements unit tests; it does not replace them because unit tests still verify internal logic. Likewise, integration testing does not replace functional tests; functional tests validate user‑visible behavior, which may span multiple layers beyond just integration points.
Contract testing ensures data persistence, while integration testing ensures correct message queue ordering.
Explanation
This option is false. Data persistence is typically verified by integration or end‑to‑end tests that involve a real database, and message queue ordering is a concern of integration or system tests that involve the actual messaging infrastructure. Contract testing neither accesses a database nor a message broker; it only checks the shape and semantics of API contracts.
Overall explanation
The question tests the learner's understanding of the fundamental distinction between contract testing and integration testing in a service-oriented architecture. Contract testing isolates the consumer and validates that the API contract (request/response format, status codes, etc.) is honoured without needing the real provider, which speeds up testing and reduces flakiness. Integration testing, by contrast, brings up the actual provider services to verify that the complete end‑to‑end interaction works, catching issues like serialization mismatches or network errors that a contract test would miss. Common misconceptions include believing contract tests require full service deployment, that they measure performance, or that they replace other test layers; these stem from conflating the goals of different test types. Best practice is to use contract tests for fast, reliable verification of API agreements and reserve integration tests for full‑stack validation of real service interactions.
Domain
Testing Strategies