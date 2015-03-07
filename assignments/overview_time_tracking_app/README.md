# Overview: Time Tracking App

## Description

In order to review, practice, and demonstrate your Rails knowledge, build a Rails application of moderate complexity from the ground up by yourself.

## Objectives

After completing this assignment, you should...

* Have built a Rails application from scratch and deployed it to Heroku in a working state.
* Have used best practices such as test-driven development and committing/deploying early and often.
* Understand any gaps in your knowledge which you hope to fill over the coming weeks.
* Understand which parts of Rails development help you reach a flow state.

## Deliverables

* **A Data Structure Diagram.**
* **A Repository.**
* **A Heroku App.**
* **A Test Suite.**
* **A Clean User Interface.**
* **A README.**

## Overview Mode

For this assignment, you are going to build a standard time tracking application.  The purpose of this work is to review the core components of a Rails application and demonstrate your ability to put them together appropriately.  You will be working independently.  You may talk with others and draw on whiteboards, but you may not look at anyone else's code, and they may not look at yours.  You may also use Google and online references as frequently as you would like.

You are building an application to track of developer time.  This application will keep track of all projects within your organization, all developers within your organization, and all time put towards projects by each developer.  Time entries must have a duration, a project, a developer, and a date.  Projects must have a maximum number of allowed hours.  Developers must have unique email addresses.

Your application must allow the following:

* People who access any page without logging in are redirected to the login page.
* Developers can log in.
* Developers who have already logged in are not taken back to the login page when they go to the application's root URL.
* Developers can create/edit/delete other developers.
* Developers can create/edit/delete projects.
* Developers can create/edit/delete time entries for themselves, not for other developers.
* No one can delete a developer once that developer has made a time entry.
* No one can delete a project once that project has a time entry on it.
* There must be a project list page which:
  * Includes a total number of hours worked on each project.
  * Shows the project in red if the number of hours on the project exceeds the number of hours allowed.
* There must be a developer list page which:
  * Shows the developer in red if he or she has worked more than 40 hours in the current calendar week.
* Developers can log out from any page.

In terms of code:

* You may not use scaffold or Devise.
* Passwords may not be stored in the database in plain text.
* Foreign keys must have indices.
* You must have at least one developer and one project in your seed data.
* Your application UI must look polished and clean, not unfinished like views generated from scaffold do.
* You may use whatever web design framework you like (e.g. Bootstrap, Foundation, Bourbon/Neat/etc), but it is not required.

Start by writing out the following (before writing any code):

* Your data structure diagram.
* A list of all controllers and actions which your application will have.
* Your best guess at a list of things to test.  Try to be complete.  This is not standard practice, but will encourage TDD once you get started.
