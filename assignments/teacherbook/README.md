# Teacherbook

## Description

Build an application that allows teachers to log in and log out based on email address and password, and to keep track of parent names and e-mail addresses.

## Objectives

After completing this assignment, you should...

* Understand basic Rails authentication
* Understand sessions in Rails

After completing this assignment, you should be able to effectively...

* Build your own authentication system

## Details

### Deliverables

* **A repository.** Create a new github repository under your account.  Commit often, not just at the end.  Continue to #shipit!
* **A README.** It must include at least one header and one paragraph.
* **A test suite.** Build your application using TDD.  Your test suite must include unit tests, controller tests, and at least two integration tests.

## Normal Mode

(First off, if you've actually been a teacher, humor me and pretend that this is a useful app!)

You run a school, and you know that your teachers can't seem to keep track of their kids' parents' e-mail addresses (or, if they can, they spend too much time on it).  You want the teachers to be able to log into a simple system and create/update/delete parent e-mail addresses.  For each parent, you need to keep track of the student name, the parent name, and the parent e-mail address.

In Normal Mode, you will have two models: Teacher and Parent.  You will also have two controllers: ParentsController and SessionsController.  ParentsController will be a resource, but SessionsController will only have two actions: `login` and `logout`.  Note, however, that `login` will need to respond to a GET request (when someone goes to the page for the first time) and a POST request (when someone hits the login button after entering their username and password).

* Users who have not logged in should only be able to see the login page.
* Teachers should be able to:
  * Log in using their e-mail address and password
  * See a message like "Hello, Mrs. Smith" at the top of every page
  * Manage their list of parents (but not any other teachers' parents)
  * Change their own passwords
  * Change their name without changing their password at the same time
  * Log out
* Teachers should NOT see other teachers' parents

## Hard Mode

Instead of just having two models, restructure your application to have three: Teacher, Student, and Parent.  Teacher will have many Students, and Student will have many Parents.  No direct relationship will exist between teachers and parents, but it will be indirect.

## Nightmare Mode

Allow parents to have more than one child who is a student.  This may mean that one teacher has two siblings in his/her class, or that two different teachers who use the application have the two siblings in separate classes.  Regardless, two parent records should not be made for the same parental e-mail address.
