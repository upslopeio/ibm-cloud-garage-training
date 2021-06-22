# Pair Programming

## What is pair programming?

Two developers, one machine, two keyboards, two mice - co-developing the code.

## Roles

- **driver** types
- **navigator** talks

## Benefits

- Knowledge sharing - "The lottery count" to be very high
- Quality - catching typos / bugs, helping design more understandable code

Side effects:

- Shared responsibility (collective owernship)
  - You can have higher standards for code/processes, without having to worry about feelings
  - When things need to change you'll be more receptive

## Getting the most out pair programming

Rotate pairs at least daily.

Some stories will have more than 2 people work on them.

When you rotate:

- 1 person stays on the story
- the other person swaps out

## Determine Pairs

At daily standup.

Sometimes come up with a rotation schedule (if needed).

## Techniques

2 people of roughly equal skill:

**Ping Pong** <-- really good default

1. Person A writes a failing test
1. Person B makes it pass, then writes the next failing test
1. Person A makes it pass, then writes the next failing test
1. ....

---

One person who knows the code/system better than the other:

**Driving School** (backseat driver)

1. Person who knows more is the navigator (talk)
1. Person who knows less is the driver (type)

---

When both people are comfortable with both the code/system and with pair programming:

**Natural**

1. You both just talk and code switch back and forth effortlessly
1. No "keyboard hogs"

---

You have some keyboard hogs.

**Chess Timers**

1. You have a timer that goes off every N minutes
1. Switch driver/navigator roles when the timer goes off
1. Navigator "sits on their hands"

---

ANTI-PATTERN:

**Tour Guide**

1. One person thinks and types, and the other person watches. 🙁

## Who pairs

- Developers (from IBM or from the customer)
- UX designers (sometimes) - Driving School

## How much should you pair?

Goal: 100%

Sometimes teams are odd - 7 people, for example.

- Ensemble programming (aka mob programming) with 3 people
- 1 person solo, but then have their code reviewed before merging (solo writes code in a branch)

## How do you track ownership in git?

Use a tool like https://github.com/chrisk/git-pair which allows you to change the email / name per-project to show both people.

One person commit / push, and the other person merges.

## Code Reviews

Do you need code reviews? No.

You don't _need_ Pull Requests, Code Reviews, approvals.

It's builtin to the process.

## What can you pair on?

Infrastructure-as-code & Devops / pipeline setup:

- driving school
- chess timers
- ensemble programming

## Ensemble Programming

(used to be called mob programming)

https://ensembleprogramming.xyz/

Really good for situations where nobody knows what they're doing: example, you're working on Android, but nobody has every built an Android app.

## Pair / TDD / Branch Workflow

"Real life"

1. Grab story (as a pair)
1. Create a feature branch
1. TDD (code & tests)
1. Merge/rebase your feature branch regularly (every hour)
1. Pushing to your feature branch
   - which triggers CI pipeline (runs tests)
   - deploy to a lower environment per-branch
1. Product Owner does user story acceptance on that branch's QA env
1. Merge the code to main

In class - where we're using IGC (and also at customer engagements with IGC):

1. Do everything on master
1. OR setup a pipeline per-branch (know Tekton a little better)
