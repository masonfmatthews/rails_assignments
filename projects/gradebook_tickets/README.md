# Gradebook Tickets

## Description

Given an existing version of the Gradebook application, students will form groups and work on tickets to improve the project, then progressively merge changes together.

## Objectives

After completing this assignment, you should...

* Understand some complications of developing in large groups
* Understand some complications of developing on legacy code
* Be able to claim GitHub issues and work on them
* Be able to work in all areas of a Rails application
* Have practice with ping-pong pairing

## Deliverables

* **A workflow diagram.**  Any format is fine, including paper.  This diagram should include part of the existing worflows so that you can show how you attach to them.
* **An estimate.**  After you read through this assignment (but before you start coding), write down a number of hours that you expect it to take.  Record your hours as you go.
* **A Repository.** Create a new repository your own github organization's account.
* **A README.**
* **A test suite.** Build your application using TDD.  Your test suite must include unit tests, controller tests, and at least two integration tests.
* **A reflection on your estimate.**

## Normal Mode

For this weekend project, you will be claiming a GitHub issue which exists on this project.  The issue description contains the details you need to get started.

You will work in pairs on your own branch to complete your GitHub issue.  When you are finished, you will create a pull request.  The first pull request will be reviewed and accepted by the instructor.

Immediately after your changes are merged into master, you must also deploy to Heroku, test your work, and fix any bugs that appear.

The second group (and later groups) to create a pull request will have their pull request reviewed by the group that finished immediately before them.  For instance, group B will have their pull request reviewed by group A.  Group A should look for modifications that would improve the code and suggest them to group B.  Group B will then make the modifications, push their latest code, and notify group A to review again.  

If group A approves of the request and the request can be automatically merged, group A should do so.  If the request is approved but cannot be automatically merged, they should notify group B, and it is then group B's responsibility to deal with the merge conflicts and merge to master themselves.
