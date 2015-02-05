# Simple Homegrown Authentication

## Description

Build an application that allows teachers to log in and log out based on email address and password, and to keep track of parent e-mail addresses.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand basic Rails authentication
* Understand sessions in Rails
* Understand basic Rails associations

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Implement :has_many and :belongs_to relationships in Rails
* Build your own authentication system

## Details

### Deliverables

* **A Repository.** Create a new github repository under your account.  Commit often, not just at the end.  Continue to #shipit!
* **A README.** Doesn't have to be much, but it does have to exist.  It must include at least one header and a link to your app running on Heroku.
* **A Working Rails app on Heroku.**
* (No test suite quite yet)

### Requirements

* Users who have not logged in should only be able to see the login page.
* Teachers should be able to:
  * Log in using their e-mail address and password
  * See a message like "Hello, Mrs. Smith" at the top of every page
  * Manage their list of parents (scaffold is fine if you want; this isn't the point of the assignment)
  * Change their own passwords
  * Change their name without changing their password at the same time
  * Log out
* Teachers should NOT see other teachers' students

## Normal Mode

You run a school, and you know that your teachers can't seem to keep track of parental e-mail addresses (or, if they can, they spend too much time on it).  You want the teachers to be able to log into a simple system and create/update/delete parent e-mail addresses.  For each parent, you need to keep track of the student name, the parent name, and the parent e-mail address.

In Normal Mode, you will have two models: Teacher and Parent.

## Hard Mode

Instead of just having two models, restructure your application to have three: Teacher, Student, and Parent.  Teacher will have many Students, and Student will have many Parents.  No direct relationship will exist between teachers and parents, but it will be indirect.

## Nightmare Mode

Allow parents to have more than one child who is a student.  This may mean that one teacher has two siblings in his/her class, or that two different teachers who use the application have the two siblings in separate classes.  Regardless, two parent records should not be made for the same parental e-mail address.
