# Add Javascript

## Description

Given an existing application with `accepts_nested_attributes_for` behavior, add javascript to make a page more responsive.

## Objectives

After completing this assignment, you should...

* Understand how Javascript fits into the Rails asset pipeline.
* Be able to create simple Javascript behaviors.

## Deliverables

* **A Repository.** You will all be forking the code from an existing application.  Your instructor will provide that link.

## Normal Mode

For this assignment, you will be modifying Coursyl, an existing open source application.  This application uses `accepts_nested_attributes_for` in multiple places, but does not have any Javascript in place to make this behavior as clean as users would expect.

To access the appropriate page of this application, pull down the repository, run migrations and seeds, then log into the application using `mason.matthews@theironyard.com` and `password`.  Click on the Databases course on your dashboard, then scroll to the bottom and click on "Edit Grading Scale."

You must add the following Javascript functionality to this page:

* When the user clicks on the save button, disable the button so that it cannot be accidentally double-clicked.
* Hide the last empty row of the grading scale section when the page loads.
* When the "Add Grade Threshold" button is clicked, show the last row.  You do not need to make it show an additional row if the user clicks again.
* When a Delete button is clicked, hide the row to which it belongs, but mark the hidden `_destroy` field in that row as truthy.
* Back on the course detail page, you'll notice that clicking on the various nav buttons in the blue box will cause the page to snap to that section.  Implement smooth scrolling instead.  You'll have to look it up on Google, and I expect that you'll copy and paste a solution into your code.  It's okay if you don't understand it all; welcome to the vast world of JavaScript.

## Hard Mode

If you dig around in the application, you'll notice that there are other pages that use accepts_nested_attributes.  For instance, editing the course details will take you to a page where you can add more instructors for a course.  Also, editing an assignment will allow you to add more questions to the assignment.

These are all examples of `accepts_nested_attributes_for`.  Modify your Javascript so that this enhanced behavior from Normal Mode will work on ALL of those pages.

## Nightmare Mode

Change the "Add Grade Threshold" button to work more than once without reloading the page.  Yes, this means that you'll be in the business of changing the `[4]` section of the fields' names.
