# Survey Opossum Plus SQL

## Description

You have completed Survey Opossum, so it is now a playground on which we can practice other new skills.  In this assignment, you will write SQL queries to return useful pieces of information on the data structure, and will write methods in the models using AREL to return the pertinent data.

## Objectives

After completing this assignment, you should...

* Understand the structure and components of SQL SELECT statements.
* Understand how AREL commands (.where, .order, .group, etc) map to the components of SQL statements.
* Understand and be able to create database indices.
* Be able to write model methods which return data from complex queries.

## Deliverables

* **A Gist of SQL SELECT Commands.**  For each of the data requested below, write an SQL statement which will give it to you.  Create one gist with all of these SQL commands in it.
* **A Repository.** You will all be forking the code from one weekend submission.  Your instructor will provide that link.  Fork it to your individual account and make changes there.

## Normal Mode

First, create a migration to add the appropriate indices to the application's data structure.

Second, write SQL statements (in your gist) and model methods (in your model files) to accomplish the following:

* Find all authors with an email address of "shakespeare@example.com"
* Find the author who was created most recently
* Find the number (count) of each type of question in the database
* Find the most common answer to a particular question (given a question_id)
* Find all survey names, and show their author's email addresses with them
* Find all authors who have never created a survey

Unless otherwise specified, return all columns in the requested table (e.g. authors).

Third (and in conjunction with Second), you will want to make sufficient seed data to test if your queries are working.

## Hard Mode

Add these queries to your SQL gist and to your models:

* Find the email address of the author who has created the most surveys
* Find all questions which have been answered more than five timess

## Nightmare Mode

Add these queries to your SQL gist and to your models:

* Find the title of the question of each type which was answered most recently.
* Find a list of the missing author ids. In other words, over time the list of ids in a data table can be sparse.  We may have created authors 1 through 10, and then deleted 4, 5, 6, and 9.  This means that the list of ids present in the authors table will be 1, 2, 3, 7, 8, 10.  In this case, your query should return 4, 5, 6, and 9.
