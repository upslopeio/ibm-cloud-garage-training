# User Stories

See here for a good guide on how to write user stories - INVEST: https://www.agilealliance.org/glossary/invest/

## Types of Stories

### Stories (a.k.a. Features)

New functionality that the team will add to the site.

- Is user-verifiable
    - not "setup database" for example
- Can include security, for example "Hank the hacker cannot view another user's profile."
- Can include performance, for example "Mary can see the page load in under 200ms even when there are 200k people on the site."
- Can include accessibility, for example "Barry can checkout efficiently using a text-only browser."

**POs** manage the full lifecycle of stories.

### Chores

Things that developers need to do in order to improve Software Delivery Performance Metrics. May include:

- Setting up CI/CD pipelines
- Automating tasks related to building and deploying the site
- Updating testing libraries

Chores generally do not include any technical todos related to functionality in user stories. So generally you won't have chores for setting up databases.

**POs** work with developers to prioritize chores

**Developers** manage the lifecycle of Chories (e.g. dragging them into "Accepted")

### Bugs

When the team breaks something they previously built, it is a bug.

## Estimation / Story Points

No need to estimate stories.

## Story Lifecycle

Stories generally go through the following states:

- **Icebox** - an unprioritized list of ideas that may or may not happen
- **Backlog** - a prioritized list of stories, chores and bugs
- **In Progress** - stories currently being worked on
    - There should be only one story per pair in progress at any given point
    - Stories should be completed before moving onto another story (except in the case of things being temporarily blocked)
- **Ready for Acceptance** - code is complete, and deployed to QA environment and ready for PO to review
- **Accepted** - PO reviewed, ready to go to production
- **Deployed to Production** - the story is live in the production environment
