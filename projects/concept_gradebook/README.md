# Concept Gradebook

## Description

Build an application to track public school student progress on predefined lists of concepts (e.g. Common Core).  Allow parents, teachers, and students to see scores on each concept.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand the difference between authentication and authorization
* Understand the session and how Rails uses it
* Understand the purpose and benefits of integration testing
* Understand REST

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Extend a homegrown authentication system
* Use Rails helpers and partials
* Write various flavors of Rails routes
* Write test-driven integration tests in Rails
* Present your own viewpoint on a problem and modify the purpose of an app to make it more useful

## Details

### Deliverables

* **A github organization.** Create an organization in github to represent your team for this project.  Give all team members full rights.
* **A Repository.** Fork this repository to your own github organization's account.
* **A README.** Wipe out this README and write your own.
* **A Working Rails App.** The README should describe how to run the application, and it should include standard steps like `bundle install` and `rake db:migrate`.
* **A Test Suite.** Not only must this test suite be conceptually complete, it must be written before the code that satisfies it.  This can be determined by git commits (so commit often!!!)
* **A Heroku Link.** Your app must be up and working on Heroku. Don't forget to deploy early in this process!  Waiting until the code is entirely finished is just asking for surprises.

### Requirements

The following actions should possible for the following types of users:

* Visitors who have not logged in should only see the login page.
* Teachers who have logged in should be able to:
  * Create teachers
  * Create students
  * Create a parent for a student
  * Create concepts
  * Enter, edit, or delete a student's score on a specific concept
* Students who have logged in should be able to:
  * See their individuals scores and average score.
* Parents who have logged in should be able to:
  * See their student's individual scores and average score.
* Any user who has logged in should be able to:
  * Change his or her password.

These lists are not cumulative.  For instance, a student should NOT be able to create teachers.

In terms of code, you must:

* Write tests before writing code.
* Use at least two partials.
* Use at least two helpers.
* Have at least one controller that implements Rails' flavor of REST.

## Normal Mode - Part 1

Although it's definitely a mixed bag, education is a hot spot in both the entrepreneural community and in legislatures these days.  Startups are being funded to create all manner of education software, so we're going to jump on the bandwagon and build something.

Assume that you are responsible for building software to track public high school student scores on state- or nation-wide standards.  Three types of users will access your software: teachers (who will enter all of the information about standards, parents, and students), students (who will view their own scores), and parents (who will view their student's scores).  The score that each student can receive on a specific concept will range from a 0 to a 5.

Just to help you understand the problem, an example concept from the Common Core is "Perform arithmetic operations with complex numbers."  Jane Doe, daughter of John Doe, might be taught by Bob Barker and receive a 4 out of 5 on "Perform arithmetic operations with complex numbers."  She did pretty well on that.  Jane can log in as a student and see her score, John can log in as her parent and see her score, and Bob Barker is the one who entered the score in the first place.  He can also see it.

That's the idea; build your application to meet all of the requirements given above.

It's possible that you are familiar with public schools and are frustrated by the centralization and standardization of scores that this app would enable.  You may feel resistance to building this app.  If so, read on to Part 2 before throwing shade on your instructor.

## Normal Mode - Part 2

Before starting on Part 2, commit your code for Part 1, then branch.

Now, let's get to the truth of the matter.  You've proven that you can build software to track student scores, but honestly, that's not terribly novel.  You might even think that it's counter-productive to learning.  You'll now be throwing away the student scoring components of your application, but you'll be keeping the parent, teacher, and student login functionality.  That's quite useful for what comes next.

Under the assumption that transparency and communication are good things, your task for part 2 is to invent your own topic of communication between parents, teachers, and students.  It can take any form, and it does not have to flow only from teachers outward (as in part 1).  It can be more collaborative, or can flow in a different direction.

The content is up to you.  Just make it helpful.

## Hard Mode

Add a fourth type of user to this app.  It could be anyone, from principal to superintendant to chaplain to sports coach.  This fourth type of user should either be able to add to the conversation or benefit from being able to listen to the conversation.  Regardless, the fourth type of user should have a view of the conversation which the others do not.
