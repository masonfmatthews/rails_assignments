# Gradebook

## Description

Build an application to track public school student grades.  Allow parents, teachers, and students to see scores in each class.

## Objectives

After completing this assignment, you should...

* Understand the difference between authentication and authorization
* Understand the session and how Rails uses it
* Be able to build an application which has multiple types of users

## Deliverables

* **An estimate.**  After you read through this assignment (but before you start coding), write down a number of hours that you expect this app to take.  Record your hours as you go.
* **A Repository.** Create a new repository your own github organization's account.
* **A README.**
* **A test suite.** Build your application using TDD.  Your test suite must include unit tests, controller tests, and at least two integration tests.
* **A reflection on your estimate.**

Submit your homework via the class assignments Google Form.

## Normal Mode

Although it's definitely a mixed bag, education is a hot spot in both the entrepreneurial community and in legislatures these days.  Startups are being funded to create all manner of education software, so we're going to jump on the bandwagon and build something.

Assume that you are responsible for building software to track student grades.  Three types of users will access your software: teachers (who will enter all of the information about grades, parents, and students), students (who will view their own grades), and parents (who will view their student's grades).

That's the idea; build your application to meet all of the requirements given below.

It's possible that you are familiar with public schools and are frustrated by the centralization and standardization of scores that this app would enable.  You may feel resistance to building this app.  If so, roll with it for now, and read on to Hard Mode before throwing shade on your instructor.

The expected data structure for this assignment is for teachers to have many students, students to have many parents, and students to have many grades.  This means that we're implicitly making the assumption that no parent has two kids in the same school.  That's unrealistic, true, but it's the set of assumptions that makes the data structure simplest.  

In addition, you might think about making grades and assignments separate tables.  That is not expected at this point.  For now, you can have a `grades` table with an `assignment_name` string column.  On both of these fronts, increase flexibility at your own risk.

The following actions should possible for the following types of users:

* Visitors who have not logged in should only see the login page.
* Teachers who have logged in should be able to:
  * Create teachers
  * Create students
  * Create parents (for a particular student)
  * Enter, edit, or delete grades for a student.  These grades would indicate a level of detail like "Anne Smith got a B on the 2/4/2015 homework", not just "Anne Smith got a B in the class."
* Students who have logged in should be able to:
  * See their grades.
* Parents who have logged in should be able to:
  * See their student's grades.
* Any user who has logged in should be able to:
  * Change his or her password.

These lists are not cumulative.  For instance, a student should NOT be able to create teachers.

Part of this assignment is to review requirements and decide how to tackle a smaller problem before you tackle the whole thing.

## Hard Mode

Before starting on Hard Mode, commit your code for Normal Mode, then branch.

Now, let's get to the truth of the matter.  You've proven that you can build software to track student scores, but honestly, that's not terribly novel.  You might even think that it's counter-productive to learning.  You'll now be throwing away the student scoring components of your application, but you'll be keeping the parent, teacher, and student login functionality.  That's quite useful for what comes next.

Under the assumption that transparency and communication are good things, your task for Hard Mode is to invent your own topic of communication between parents, teachers, and students.  It can take any form, and it does not have to flow only from teachers outward (as in Normal Mode).  It can be more collaborative, or can flow in a different direction.

The content is up to you.  Just make it helpful.

## Nightmare Mode

Add a fourth type of user to this app.  It could be anyone, from principal to superintendent to chaplain to sports coach.  This fourth type of user should either be able to add to the conversation or benefit from being able to listen to the conversation.  Regardless, the fourth type of user should have a view of the conversation which the others do not.
