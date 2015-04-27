# GitHub Profile Page

## Description

Recreate the GitHub profile page (with real, live data) in a Rails application.  Use GitHub's public API.

## Objectives

After completing this assignment, you should...

* Understand how Rails views can present HTML and CSS.
* Understand how information is passed between Rails controllers and Rails views.
* Understand how HTML forms pass parameters to Rails
* Be able to write ERB.
* Be able to build a Rails application to consume and data from a public-facing JSON API.
* Be able to experiment with and research CSS in order to mimic a design as closely as possible.

## Deliverables

* **A Repository.** Create your own repository for this assignment.

## Normal Mode

In this assignment, you will be building a Rails application which consumes information from the [GitHub API](https://developer.github.com/v3/) and presents it back to the user on one of your own views.  When the user sees the view in your application (perhaps at `localhost:3000/repositories/`), it should show them a page that looks as much like the GitHub profile repositories page as possible.  Here is an example link to the repositories page:

https://github.com/masonfmatthews?tab=repositories

You will notice a lot going on on this page, from styling to navigation bars to icons.  Make it as similar as you can, but keep in mind that the most important part is for the information on the page to be accurate and complete.

Your application should have TWO pages.  The root page can be very simple.  It should show a text field and a button.  Feel free to add whatever styling or headers you see fit.  In the text field, the user should enter a GitHub username (e.g. `masonfmatthews`).  The submit button should pass this information on to your second page, which will display your clone of the GitHub profile page for that user.

Your Rails application will not need to have any database tables.

## Hard Mode

For Hard Mode, implement your Public Activity Page in a second view.

## Notes

* [Example Repository Page](https://github.com/masonfmatthews?tab=repositories)
* [Example Public Activity Page](https://github.com/masonfmatthews?tab=activity)
* [GitHub API Documentation](https://developer.github.com/v3/)
