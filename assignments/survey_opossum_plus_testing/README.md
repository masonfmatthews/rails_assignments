# Survey Opossum Plus Testing

## Description

You have completed Survey Opossum, so it is now a playground on which we can practice other new skills.  In this assignment, you will add a test suite to the application.

## Objectives

After completing this assignment, you should...

* Understand the general structure of Rails test suites.
* Be able to write fixtures with MiniTest
* Be able to write unit tests with MiniTest
* Be able to write controller tests with MiniTest
* Be able to write an integration test with MiniTest

## Deliverables

* **A Repository.** You will all be forking the code from one weekend submission.  Your instructor will provide that link.  Fork it to your individual account and make changes there.

## Normal Mode

Your goal is to add tests to an existing application.  This is not Test-Driven Development, as the application code already exists, but it is a fine approach for your first shot at Rails testing.

Unit tests.  Create at least one test to ensure each of the following:

* that your fixtures ran (this will require you to write at least one fixture).
* that an unsatisfied validation will prevent a record from saving.
* that a successful save changes the number of records in the database.
* that one of the six SQL/AREL methods we created on a model last night runs properly.

Controller tests.  Create at least one test to ensure each of the following:

* that a `get` request returns a `success` response (e.g. that a page loads successfully)
* that the right number of a certain element exists on a page (perhaps test that the right number of questions show up when attempting to take a survey)
* that an expected template is rendered
* that an expected redirect actually occurs

Integration tests.  Create at least one test to ensure that:

* a user who attempts to create a survey is redirected to the login page and given a flash message instructing him or her to log in.

And, of course, all of these tests must pass when you run the `rake test` command.

## Hard Mode

Add an additional integration test:

* an author can get the login page, fail to login once, succeed to log in the second time, create a new survey, and see the number of surveys on his/her survey index page go up by one.
