# Health Tracker

## Description

Build a Rails application to store information on your weight (measured once per day), daily steps taken, calories consumed, and exercises performed.

## Objectives

After completing this assignment, you should...

* Understand basic MVC architecture
* Understand basic data table design
* Understand basic Rails file conventions
* Understand how test-driven development extends to the Rails structure
* Understand that smaller amounts of working code are more valuable than vast amounts of unfinished code
* Understand the basics of deploying Rails apps to Heroku

After completing this assignment, you be should able to effectively...

* Set up a github organization.
* Create a new Rails application.
* Create multiple data tables for use in the same application.
* As a team, use multiple branches to perform separate work, then merge work together.
* Deploy a Rails application to Heroku
* Utilize seeds and fixtures

## Deliverables

* **An ERD.** Create a database diagram in Lucidchart (or a similar tool).
* **A GitHub organization.** Create an organization in GitHub to represent your team for this project.
* **A Repository.** Create a new repository.  In the end, your repository should have multiple branches (that is, don't delete them after merging).
* **A README.**
* **A working Rails app on Heroku.**
* **A test suite.** Build your application using TDD.  Your test suite must include unit tests, controller tests, and at least two integration tests.

## Normal Mode

Build an application which lets you enter and review information about your health and activity.  You should be able to enter all four of these pieces of information (and each will correspond to its own data table):

* Weight
* Steps Taken
* Calories Consumed
* Exercises Performed (including a field for the number of calories burned)

The forms for viewing and entering these pieces of information can look however you'd like them to, but the user will need to be able to access your application by going to the root address (e.g. `http://simmering-plateau-1234.herokuapp.com/`) and seeing a dashboard.  From the dashboard, the user can then follow links to get to the other pages.

There must also be a fifth table: `exercise_types`.  This table only needs an `id` and a `name`, but it must be related to the table of exercises.  In other words, each exercise must be assigned an exercise type.  You do not need to create views to edit these types if you don't want to; you can set them up via seeds.

During the course of this assignment:

* Each developer should build out code to manage one of these pieces of information by him or herself, and should do so in different branches.  Merging should be done together, and then the remaining work can be divided up or done together however you see fit.
* You can use scaffold for three of these controllers, but you must build one by hand without scaffold.
* During development, the application should have a number of points in time in which there are no known bugs.  If you have links that go nowhere, pages that don't work, or random errors you can't explain, DON'T move on to the next feature.  Fix the bugs first, clean up the links, and get it in a solid state.  Then put `#shipit` somewhere in the commit message and move on to the next feature.  I'll check your commits to see how many times you've been shippable.
* You should create at least a few seeds and fixtures.
* Your dashboard must:
  * have links to all four of the list pages.
  * show the net number of calories for the day (calories consumed minus calories burned through exercise).
  * show two other statistics of your choosing (but they must be calculated from your data).

There are a few data requirements:

* Each of these measurements should be given for a particular date.
* You should not be able to enter two weight measurements for the same date.
* You should be able to enter multiple records for steps taken, calories consumed, and exercises performed for the same date.

Hint: when naming tables, think about how the names will work in singular and in plural.  For example, you might be tempted to have a model called `CaloriesConsumed`, but you have to admit that `calories_consumeds` is an awful table name.  Also, don't name a table `calories`.  If you don't believe me, try it and you'll see why.

## Hard Mode

First, commit code to complete Normal mode, then create a branch called `hard_mode`.

Improve your central dashboard page to allow users to (a) see all entries for the current day in one place, and (b) enter new records for any of the four data tables.  These four forms should all be on this one page (although if you submit a form, it's fine if you leave the dashboard).

Test this dashboard action, and in the tests, make sure that all of the correct numbers are showing up appropriately (given your fixtures).

## Nightmare Mode

Make sure your code for previous modes is committed and create a new branch called `nightmare_mode`.

Add a table called `days` which will have one record for each day in which some information was tracked.  Change each of the four existing tables to remove their date field and have a `:belongs_to` relationship with the `days` table.

In the `Day` model, add functionality for calculating the number of calories burned on each day.  Also add the ability to determine the user's basal metabolic rate.  It's up to you to figure out how to calculate this, but you can assume that a pound is equal to 3,500 calories.


## Additional Resources

* [Heroku docs on installing Rails 4 apps](https://devcenter.heroku.com/articles/rails4)
