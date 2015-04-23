# Employee Reviews with a Database

## Description

Modify your existing Employee Reviews code to persist the information in a database.  Modify your test suite to utilize the database as well.

## Objectives

After completing this assignment, you should...

* Understand how the database can store information between code executions
* Understand ActiveRecord
* Be able to write migrations
* Be able to create, read from, and write to a development database
* Build a test suite which can access a test database

## Deliverables

* **A modified version of your original GitHub repository.**
* **A migration to create a database.**
* **A modified README.**
* **A modified test suite.**
* **An ERD.** Create a database diagram in Lucidchart (or a similar tool).

Use the homework submission form on the course website to turn in a link to your GitHub repository.

## Normal Mode

Simply put, modify your existing Employee Reviews code to store all instance variables in Employee and Department to the database.  In addition, modify your test suite so that all existing tests pass given the new persistent data store.

The trickiest part will be the array of employees stored in each department.  Rather than trying to make an "Array" type data field (which only works in a few database management systems anyway), add a foreign key which points to a department to the employees table.

## Hard Mode

Now that you're in the database, there's a whole series of additional things that you can test.  Add ten database-specific tests to your test suite.
