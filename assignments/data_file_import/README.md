# Data File Import

## Description

Given an existing application, add functionality for users to upload a data file and have that data file be imported into the database via background processing.

## Objectives

After completing this assignment, you should...

* Understand how background jobs are created and run in Rails.
* Understand how files can be received and read in a Rails app.
* Be able to use ActiveJob.
* Be able to install and run a background processing tool.

## Deliverables

* **A repository.** You will be working from your existing application.
* **A test suite.** Extend your application using TDD.  This was not needed last night, as you were only changing existing code.  Your test suite must include unit tests, controller tests, and at least two integration tests.

## Normal Mode



## Hard Mode

You've noticed that creating a ton of records is sloooooow.  Time to make it faster.

Do the work using only one SQL operation per table.  In other words, you can't just loop over all rows and do separate `.create`s for each iteration of the loop.

## Notes

*
