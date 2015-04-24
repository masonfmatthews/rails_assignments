# To-do App

## Description

Build an application from the ground up which utilizes many of the concepts covered in class, culminating in a drag-and-drop interface.

## Objectives

After completing this assignment, you should...

* Understand how to use JQuery and JQuery UI in a real-world application
* Understand how AJAX can create rich client interfaces
* Understand the concept of multi-tenancy (and its relative difficulty)
* Be able to implement drag and drop behavior in a list of elements
* Be able to implement an AJAX action which saves the order of elements which were dragged and dropped.

## Deliverables

* **An ERD.** Before writing any code, review the requirements below and draw a data structure diagram for this project.
* **A GitHub organization.** Create an organization in github to represent your team for this project.  Give all team members full rights.
* **A repository.** Create a repository in your github organization.
* **A Heroku app.** Your application should be deployed and running on Heroku.
* **A test suite.** Your application should be developed using test driven development.  It is up to you whether you use ping-pong pairing.
* **A Clean Design.** Your applicaton should utilize one of the three design frameworks mentioned in class thus far (Bootstrap, Foundation, or Bourbon/Neat/etc).
* **A README.** Your README should describe the application and include a link to the live version on Heroku.

## Normal Mode

For this project, you will be creating a To-do Manager.  This application will be a Rails app deployed on Heroku, and its purpose is for its user to be able to create as many to-dos as he or she wants, mark them as complete, and drag and drop them into the preferred order.

The following are requirements for this application:

* The data structure can be simple.  To-dos need to be stored in a table, but it is up to you whether you create an additional table for categorizing your to-dos (e.g. Family vs Work).
* To-dos have an optional due date.
* On the to-do list page, to-dos can be reordered via dragging and dropping.  This means that some notion of order must be stored in the data table.
* AJAX should be used to save the order immediately when the drag is completed.  The user should not have to hit a button to save the order.
* AJAX should be used to mark a to-do as complete without having to hit a save button or refresh the entire page.
* AJAX need not be used anywhere else.  For instance, you can have a standalone new to-do page that uses a normal request/response if you would like.
* You should use one of the three design frameworks from class to make this application look "nice."  It should be styled to have a consistent, non-scaffold look and feel.

You are expected to use TDD (ping-pong pairing if you'd like), but you are not expected to write tests for the drag and drop functionality.  That's a whole different ball of wax, and we're not planning to test JavaScript in this class.

## Hard Mode

For Hard Mode, extend your application to allow for multi-tenancy.  This means that multiple users can access the same application, but that each user only ever sees his or her content.  There will be no overlap in content, and additional users can be added with no developer intervention.

In broad strokes, this means:

* You must add a User model and associate tasks with users
* You must allow users to set up their own accounts
* You must allow users to log in
* You must restrict data visibility so that one user can't see another user's info

## Nightmare Mode

Allow to-dos to be recurring.  In other words, you know from Normal Mode that you can set up a to-do to be due on 1/1/2016, but you can also set it to show up again every month after you've completed it.  It should be possible to set to-dos up for weekly, quarterly, and annual recurrence as well.

## Links

* Drag and drop option: [Ben Woodward Tutorial](http://benw.me/posts/sortable-bootstrap-tables/)
* Drag and drop option: [Joseph Ndungu Tutorial](http://josephndungu.com/tutorials/ajax-sortable-lists-rails-4)
* Drag and drop option: [JQuery UI Sortable](http://jqueryui.com/sortable/)
* [Bootstrap Documentation](http://getbootstrap.com/2.3.2/)
