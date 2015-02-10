# Achievement Gradebook

## Description

Modify an existing Gradebook application to allow teachers give out student grades based on achievements rather than assignments.  Utilize a many-to-many relationship and database seeding.

## Objectives

After completing this assignment, you should be able to effectively...

* Design many-to-many relationships
* Utilize has_and_belongs_to_many associations in the model
* Create a visual database diagram
* Use seeding to set a starting point for an application's database
* Deal with HTML checkboxes in your params
* Add a member method to your routes

## Deliverables

* **An ERD Diagram.** Create a database diagram in Lucidchart.
* **A Repository.** Fork the organization's gradebook repository to your own account.
* **An improved README.**

No Heroku, no test suite.  Still commit often and #shipit as frequently as possible!

Submit your homework via the class assignments Google Form.

## Normal Mode

Most schools give grades on each assignment during the course of a semester, then use a weighted average to calculate a semester grade for each student.  It's time to buck the trend and create a totally different grading method.

Your goal for this project is to modify an existing Gradebook application to utilize achievement grading.  In achievement grading, you reach certain milestones during the course and receive points for each one, regardless of the time at which you reach it.  For instance, one achievement (milestone) might be "Use integration by parts correctly," and that could be worth 200 points.  Another (if we're going with the calculus example) might be "Give a presentation on a paper you've read," and that might be worth 500 points.  A single class may have 5000 possible points, and the teacher may decide that you need 4000 to get an A, 3000 to get a B, and so on.

In broad strokes, here are the steps you'll need to take to complete this assignment:

* Create a database diagram for what you intend to build.
* Write migration(s) to change your data structure.  You will need to drop your grades table and add an achievements table (each achievement must have its number of points), then create a many-to-many join table between students and achievements.
* You should NOT edit existing migrations.  They should be considered frozen in time.
* Write seed files to prepopulate a set of possible achievements (which you invent) and at least one teacher (so that you don't have to use the console to create your initial user anymore).
* You will need to delete your grades controller.  You may need to
* Make it possible to give any or all of the achievements to any or all of your students.  Do this by adding a member action to your students controller.  Call it `edit_achievements`.  On the achievements view, show checkboxes for all of the possible achievements, and allow teachers to give out achievements to the student by checking the appropriate boxes and submitting.  This form should post to a second action in the students controller called `update_achievements.`
* Add a link to achievements for each student on the achievements list page.
* You'll need to make everything work for teachers.  Don't worry about what students and parents see when they log in until you've finished with the teacher interface.  If you have time, modify what students and parents see when they log in to reflect achievements rather than grades.

It is fine for the application to have a single list of achievements which span all teachers.  If you're feeling ambitious, it is better for each teacher to have his or her own set of achievements which apply to just his/her students.

## Hard Mode

In normal mode, you simply had to allow achievements to be given out; you didn't have to be able to do any math with the points.  In hard mode, two new requirements exist:

* Teachers can set thresholds for their students (e.g. 4000 total points is an A, 3000 total points is a B, etc).  These thresholds can be different for each teacher.
* The students index page should show a new column for the grade that each student has reached thus far.  They will all start out as F at the beginning of the semester.

## Nightmare Mode

Allow teachers to design visual badges for the achievements.  I would suggest utilizing [Glyphicons](http://glyphicons.com/) and allowing them to pick an icon and a color.
