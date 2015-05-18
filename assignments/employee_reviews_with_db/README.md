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

One tricky part will be the array of employees stored in each department.  Rather than trying to make an "Array" type data field (which only works in a few database management systems anyway), add a foreign key which points to a department to the employees table.

Write these additional methods on your models:

* Return the total salary for an entire department.
* Return the total number of employees in a department.
* Return the employee who is being paid the least in a department.
* Return all employees in a department, ordered alphabetically by name.
* Return all employees who are getting paid more than the average salary.
* Return all employees with names which are palindromes.
* Return the department with the most employees.
* Move everyone from one department to another department.
* Give a raise of 10% to ALL employees with good reviews.

DON'T FORGET TEST-DRIVEN DEVELOPMENT.  Write a test for each one of these first, makes sure the test FAILS, then write code to make it pass, then refactor as needed.  Finally, commit.  Then repeat until you complete all the additional methods.

## Hard Mode

Write additional migrations to accomplish the following.  Make sure they run successfully on your original database (with real data in multiple rows in both tables).

* Add a companies table.  Add one company called "The Iron Yard."
* Add a foreign key on the departments table which points to companies. Associate all existing departments with The Iron Yard.
* Change the employee `salary` field to `rate`.  Do math on each employee to convert an annual salary to an hourly rate, then save the new hourly rate in the field.

The last migration will not be reversible if you write it in a `change` method.  Instead, write both `up` and `down` methods.

## Nightmare Mode

Modify your application to keep track of every employee's history.  In other words, you should keep a record of each position that the employee has held at any company.  You should know when each position started and ended.

Write a method on an employee which takes a particular date.  The method should return the company and department name in which the employee worked on that date.

Write a method on an employee which gives back an array of intervals during which the employee was not employed.

Write a method on a department which gives back the employee which has worked longest in that department (ever).  If the employee left and came back, his or her total should include time across all positions with that department.

Write a method on a company which gives back all employees who have been with the company for longer than 5 years.

Write a method which returns all departments, ordered by the total number of employee-days which have been worked for that department.
