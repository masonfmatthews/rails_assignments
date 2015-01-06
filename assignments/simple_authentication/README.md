# Simple Homegrown Authentication

## Description

Build an application that allows teachers to log in and log out based on email address and password, and to keep track of student and parent e-mail addresses.

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

* **A Repository.** Create a new github repository under your account.  Commit often, not just at the end.
* **A README.** Doesn't have to be much, but it does have to exist.
* **A Test Suite.** Include integration testing!

### Requirements

* Visitors who have not logged in should only see the login page.
* Teachers who have logged in should be able to:
  * Manage their students (scaffold is fine)
  * Manage their students' parents (name and e-mail address)
  * Change their own passwords
  * Change their
  * Log out
* Teachers should not see other teachers' students or their parents.

## Normal Mode

You run a school, and you know that your teachers can't seem to keep track of parental e-mail addresses (or, if they can, they spend too much time on it).  You want the teachers to be able to log into a simple system, add students, and then add those students' parents and their e-mail addresses.  Students can have more than one parent, but you need to keep track of the student name, the parent name, and the parent e-mail address.

## Hard Mode

Allow parents to have more than one child who is a student.  This may mean that one teacher has two siblings in his/her class, or that two different teachers who use the application have the two siblings in separate classes.  Regardless, two parent records should not be made for the same parental e-mail address.
