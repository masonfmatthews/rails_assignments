# Health Tracker

## Description

As a team, build a Rails application to store information on daily weight, daily steps taken, calories consumed, and exercises performed.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand basic MVC architecture
* Understand basic SQL data table design
* Understand basic Rails file conventions
* Understand how test-driven development extends to Rails models
* Understand that smaller amounts of working code are more valuable than vast amounts of unfinished code

### Performance Objectives

After completing this assignment, you be should able to effectively...

* Set up a github organization.
* Create a new Rails application.
* Create multiple data tables for use in the same application.
* Manually create simple routes.
* Create simple model validations.
* As a team, use multiple branches to perform separate work, then merge work together.

## Details

### Deliverables

* **A github organization.** Create an organization in github to represent your team for this project.  Give all team members full rights.
* **A Repository.** Fork this repository to your own github organization's account.  In just this case, your repository should have multiple branches (that is, don't delete them after merging).
* **A README.** Wipe out this README and write your own.
* **A Working Rails App.** The README should describe how to run the application, and it should include standard steps like `bundle install` and `rake db:migrate`.
* **A Test Suite.** Not only must this test suite be conceptually complete, it must be written before the code that satisfies it.  This can be determined by git commits (so commit often!!!)

### Requirements

* At least one of your routes should have been written manually by one of the team members (rather than the generators).
* You should use test-driven development to create your test suite.
* During development, the application should have a number of points in time in which there are no known bugs.  If you have links that go nowhere, pages that don't work, or random errors you can't explain, DON'T move on to the next feature.  Fix the bugs first, clean up the links, and get it in a solid state.  Then put `#shipit` somewhere in the commit message and move on to the next feature.  I'll check your commits to see how many times you've been shippable.

## Normal Mode

Build an application which lets you enter and review information about your health and activity.  You should be able to enter all four of these pieces of information (and each will correspond to its own data table):

* Weight
* Steps Taken
* Calories Consumed
* Exercises Performed

The forms for viewing and entering these pieces of information can look however you'd like them to, but the user will need to be able to access your application by going to the root address (e.g. `http://simmering-plateau.herokuapp.com/`) and then following links to get to the other pages.

There are a few other minor requirements.

* Each of these measurements should be for a particular date.
* You should not be able to enter two weight measurements for the same date.
* You should be able to enter multiple records for steps taken, calories consumed, and exercises performed for the same date.
* Each exercise performed should have a number of calories burned.

## Hard Mode

First, commit code to complete Normal mode, then create a branch called `hard_mode`.

Add a table called `days` which will have one record for each day in which some information was tracked.  Change each of the four existing tables to remove their date field and have a `:belongs_to` relationship with the `days` table.

In the `Day` model, add functionality for calculating the number of calories burned on each day.  Also add the ability (given enough data) to see how many calories equal a pound of weight for the user.  It's up to you to figure out how to calculate this.

## Nightmare Mode

This won't be a nightmare at all in a couple of weeks, but for now it's a stretch.  Make sure your code for previous modes is committed and create a new branch called `nightmare_mode`.

Build a central dashboard page which allows you to (a) see all entries for the current day in one place, (b) see the  stats from hard mode, and (c) enter new records for any of the four data tables.  All on one page (although if you submit a new record, it's fine if you leave the page).
