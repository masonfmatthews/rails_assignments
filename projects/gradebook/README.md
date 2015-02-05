# Gradebook

## Description

Build an application to track public school student grades.  Allow parents, teachers, and students to see scores in each class.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand the difference between authentication and authorization
* Understand the session and how Rails uses it
* Understand REST

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Build an application which has multiple types of users
* Use Rails helpers and partials
* Write various flavors of Rails routes
* Present your own viewpoint on a problem and modify the purpose of an app to make it more useful

## Details

### Deliverables

* **A github organization.** Create an organization in github to represent your team for this project.  Give all team members full rights.
* **A Repository.** Create a new repository your own github organization's account.
* **A README.**
* **A Heroku Link.** Your app must be up and working on Heroku. Don't forget to deploy early in this process!  Waiting until the code is entirely finished is just asking for surprises.

Submit your homework via the class assignments Google Form.

### Requirements

The following actions should possible for the following types of users:

* Visitors who have not logged in should only see the login page.
* Teachers who have logged in should be able to:
  * Create teachers
  * Create students
  * Create parents (for a particular student)
  * Enter, edit, or delete grades for a student.  These grades are things like "Got a B on the 2/4/2015 homework", not just one grade per student.
* Students who have logged in should be able to:
  * See their grades.
* Parents who have logged in should be able to:
  * See their student's grades.
* Any user who has logged in should be able to:
  * Change his or her password.

These lists are not cumulative.  For instance, a student should NOT be able to create teachers.

In terms of code, you must:

* Use at least two partials.
* Use at least two helpers.
* Have at least one controller that implements Rails' flavor of REST (i.e. a `resources` route).

## Normal Mode

Although it's definitely a mixed bag, education is a hot spot in both the entrepreneural community and in legislatures these days.  Startups are being funded to create all manner of education software, so we're going to jump on the bandwagon and build something.

Assume that you are responsible for building software to track student grades.  Three types of users will access your software: teachers (who will enter all of the information about grades, parents, and students), students (who will view their own grades), and parents (who will view their student's grades).

That's the idea; build your application to meet all of the requirements given above.

It's possible that you are familiar with public schools and are frustrated by the centralization and standardization of scores that this app would enable.  You may feel resistance to building this app.  If so, read on to Hard Mode before throwing shade on your instructor.

## Hard Mode

Before starting on Hard Mode, commit your code for Normal Mode, then branch.

Now, let's get to the truth of the matter.  You've proven that you can build software to track student scores, but honestly, that's not terribly novel.  You might even think that it's counter-productive to learning.  You'll now be throwing away the student scoring components of your application, but you'll be keeping the parent, teacher, and student login functionality.  That's quite useful for what comes next.

Under the assumption that transparency and communication are good things, your task for Hard Mode is to invent your own topic of communication between parents, teachers, and students.  It can take any form, and it does not have to flow only from teachers outward (as in Normal Mode).  It can be more collaborative, or can flow in a different direction.

The content is up to you.  Just make it helpful.

## Nightmare Mode

Add a fourth type of user to this app.  It could be anyone, from principal to superintendant to chaplain to sports coach.  This fourth type of user should either be able to add to the conversation or benefit from being able to listen to the conversation.  Regardless, the fourth type of user should have a view of the conversation which the others do not.
