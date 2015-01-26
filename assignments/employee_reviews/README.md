# Employee Reviews

## Description

Create classes to track employees and their departments, interpret employee reviews, and give out raises to those with good reviews.


## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand how a pair of classes can work together
* Understand keyword arguments
* Understand how regular expressions can be used in real-world problems
* Understand simple classification problems
* Reflect on how natural language can be read by a computer to convert it to quantitative data

### Performance Objectives

After completing this assignment, you should be able to effectively use...

* Test-driven development
* Simple regular expressions
* Keyword arguments

## Details

### Deliverables

* **A Pull Request.** Fork this repository, make your changes, and then create a pull request.
* **An Employee and a Department Class.**
* **A Test Suite.** Not only must this test suite be conceptually complete, it must be written before the code that satisfies it.  This can be determined by git commits (so commit often!!!)

### Requirements

You want to keep track of employees (with their names and salaries), departments (with their names), and which employees are in which department.  You should be able to:

* Create a new department (given its name).
* Create a new employee (given his/her name and salary).
* Add an employee to a department.
* Get an employee's name.
* Get an employee's salary.
* Get a department's name.
* Get a total salary for all employees in a department.
* Add some employee review text (a paragraph or two) to an employee.
* Mark whether an employee is performing satisfactorily or not satisfactorily.
* Give a raise to an individual.  You decide if this makes sense in dollars or in percent.
* Give raises to a department's employees.  You must pass this method a total dollar amount, and it must distribute the raise amounts reasonably to the department's employees.  Only employees who are performing satisfactorily should get raises.

## Normal Mode

To complete normal mode, you must first meet all of the requirements above.  Your test suite should have at least one complete example (also known as a "pathological" example) of how the two classes can be used in the real world.

In order to finish normal mode, you must also TRY hard mode.  You do not have to complete it, but you to have to try.

## Hard Mode

As a part of this repository, you have a file called `sample_reviews.txt`.  This file includes two negative employee reviews and two positive employee reviews.  Your task is to write a method on the employee class which looks the employee review text stored in an employee instance variable (added as a part of Normal Mode) and return a true or false for whether this employee is performing satisfactorily.

Regular expressions will be your friend here, but even so, this is not an easy problem.  It is in a category of problems called "Natural Language Processing," and since you are attempting to take reviews and place them in one of two buckets (satisfactory or not), it is known as a "Classification" problem.

## Nightmare Mode

As mentioned above, placing reviews into two buckets is a "Classification" problem.  Your task in Nightmare Mode is to solve a "Regression" problem instead.  Assign each employee a SCORE based on his/her review rather than a yes/no value.  After creating this method, modify your departmental raise function to take this score value into account when giving out raises.

## Additional Resources

* My favorite tutorial for learning Regular Expressions is [RegexOne](http://regexone.com/)
* The best way to fiddle with Regex is [Rubular](http://rubular.com/)
