# Overview: Time Tracking App

## Description

In order to review, practice, and demonstrate your Rails knowledge, build a Rails application of moderate complexity from the ground up by yourself.

## Objectives

After completing this assignment, you should...

* Understand any gaps in your knowledge which you hope to fill over the coming weeks.
* Understand which parts of Rails development are more likely to put you in a flow state.
* Have built a Rails application from scratch and deployed it to Heroku in a working state.
* Have used best practices such as test-driven development and committing/deploying early and often.

## Deliverables

* **A Data Structure Diagram.**
* **A Repository.**
* **A Heroku App.**
* **A Test Suite.**
* **A Clean User Interface.**
* **A README.**

## Overview Mode

For this assignment, you are going to build a standard time tracking application.  The purpose of this work is to review the core components of a Rails application and demonstrate your ability to put them together appropriately.  In order to help you and your instructor reflect on your acquired skills, you will be working independently.  You may talk with others and draw on whiteboards together, but no other students should look at your actual code, and you should not look at theirs.  You may, of course, use Google and online references as frequently as you would like.

You are building an application to manage developer time.  This application will keep track of all projects within your organization, all developers within your organization, and all time put towards projects by each developer.  In terms of code:

* You should not use scaffold or Devise.
* Passwords should not be stored in the database in plain text.
* Foreign keys should have indices.
* You should have at least one developer and one project in your seed data (by the end).
* Your application UI should look polished and clean, not unfinished like views generated from scaffold do.
* You may use whatever web design framework you like (e.g. Bootstrap, Foundation, Bourbon/Neat/etc), but they are not required.

Start by writing out the following (before writing any code):

* Your data structure diagram.
* A list of all controllers and actions which your application will have.
* Your best guess at a list of things to test.  Try to be complete.  This is not standard practice, but will encourage TDD once you get started.

The requirements are presented below in a particular order.  You MUST complete each one of these phases in order, without jumping around.  Each completed phase must have tests in place, a README in place, a series of good commit messages, and a final commit message (for that particular phase) which includes the `#shipit` tag.

Record the number of hours you put towards each of the phases, and email or message your instructor when you complete each phase.

### Phase One

* Anyone can list/create/edit/delete developers.
* Developers must have unique email addresses.
* Anyone can create a time entry for any developer.
* The time entry form should include a dropdown for selecting the developer by name, not by id.
* Time entries must have a duration, a developer, and a date.
* The developer index page should have a link to the time entry creation page, and vice-versa.
* Submitting a new time entry should redirect somewhere sensible.
* The application should have a root route.

### Phase Two

* Developers can log in.
* Developers can log out from any page.
* Anyone who tries to access any page without logging in is redirected to the login page.
* The application should have a root route which is NOT the login page.

### Phase Three

* Developers can only create time entries for themselves.
* Developers can see a list of just their own time entries.
* Developers can edit/delete just their own time entries.

### Phase Four

* Developers can list/create/edit/delete projects.
* Projects must have a maximum number of allowed hours.
* When time entries are created or updated, they must have a project associated with each one.  
* The time entry form should include a dropdown for selecting the project by name, not by id.
* There must be a project list page which:
  * Includes a total number of hours worked on each project.
  * Shows the project in red if the total number of hours on the project exceeds the number of hours allowed.

### Phase Five

* No one can delete a developer once that developer has made a time entry.
* No one can delete a project once that project has a time entry on it.
* Modify the developer list page to:
  * Show the developer in red if he or she has worked more than 40 hours in the current calendar week.

### Bonus Phase

* Allow developers to create a time entry by choosing to start work at one point in time, then to end work by coming back to the application later and hitting a simple "End Current Task" button.
* Work in progress should not be counted towards the total for projects or developers.  It should count as soon as the "End Current Task" button is hit.
* The "End Current Task" button should be present on every page of the application.  Near this button, you should also see the project and start time of the current work in progress.
