# Online Constituent Voting

## Description

Build an application which would enable a US Senator or Representative to query his/her constituents for their opinions on upcoming bills.

## Objectives

After completing this assignment, you should...

* Understand relational and normalized database concepts
* Understand scopes and delegators
* Understand the purpose of indices
* Be able to send email from a Rails app
* Be able to accept file uploads in a Rails app
* Be able to write a Rails app using TDD

## Details

### Deliverables

* **A Data Structure Diagram.** Before writing any code, review the requirements below and draw a data structure diagram for this project.  It should include:
  * A box for each table
  * Each field you'll need for each table inside its box
  * A data type for each field
  * A mark to indicate that it's a required field
  * A different mark to indicate that the field has an index on it
  * Relationships between each pair of tables with a primary/foreign key pair
* **A Repository.** Create a new repository under your organization's github account.
* **A README.** Wipe out this README and write your own.
* **A Working Rails App on Heroku.**
* **A Test Suite.** Not only must this test suite be conceptually complete, it must be written before the code that satisfies it.  This can be determined by git commits (so commit often!!!)

### Requirements

Your application should allow for the following:

* Any visitor to the app can view details of upcoming bills.
* Constituents can log in and:
  * Vote yes or no on any upcoming bill
  * View constituent voting results of closed bills
  * View the congressperson's voting history on these bills
* Someone from the congressperson's office can log in and:
  * Create constituent accounts
  * Create new upcoming bills and upload a PDF of each bill
    * This should send an e-mail to all constituents notifying them of the new bill to view
  * See the constituent voting results of each bill
  * See all constituent questions on any upcoming bill in one place
  * Mark an upcoming bill as closed (no longer "upcoming")
  * Enter the congressperson's actual vote on a bill placed in congress

Your code should also:

* Use AREL queries throughout
* Use at least one scope
* Use delegation at least once
* Be written using TDD

## Normal Mode

Assume that you are building an application for a Senator or Representative who actually wants all of his or her votes in congress to be representative of their constituents.  In order to meet this goal, the congressperson's office will post details of upcoming bills and ask constituents to log in and vote yes or no.  The congressperson will then cast a real vote in congress that matches the views of the majority of his or her constituents.

You must satisfy all of the requirements given in the section above.  People using the app will be in one of the three states shown in the requirements section (Visitor not logged in; Constituent logged in; Congressperson's staff logged in), and different actions will be available in those different states.

And yes, real-world adoption of this software would be... unlikely.  Sorry about that.

## Hard Mode

In addition to normal mode requirements, hard mode should also include:
* Any visitor to the app can view details of upcoming bills.
* Constituents can log in and:
  * Ask a question about an upcoming bill
  * View all users' questions on a single upcoming bill
  * View answers to all questions on single upcoming bill
  * +1 a question (in essence, mark it to say that you think it's a good question)
  * View all questions that you +1'd (and their answers)
* Someone from the congressperson's office can log in and:
  * See questions on a bill written by constituents
  * Answer questions
  * See number of followers for each question
