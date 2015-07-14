# Time Entry SQL Practice

## Description

Given a data structure for tracking time entries, create a set of SQL queries to pull out meaningful information.

## Objectives

After completing this assignment, you should be able to effectively...

* Reason about an existing data structure.
* Interpret user requests and plan queries.
* Write SQL queries using:
  * SELECT
  * FROM
  * WHERE
  * GROUP
  * HAVING
  * INNER JOIN
  * LEFT JOIN

## Deliverables

* **A Gist.** For each of the questions below, add the following information to your gist:
  * The original question text
  * Your final SQL query (which you must have run and validated on the included database)
  * The number of results returned (if more than one)
  * The specific datum returned for each field (if one row returned)

Submit your homework via the class assignments Google Form.

## Normal Mode

* Find all mobile phone numbers
* Find the phone number which was updated most recently
* Find the number (count) of each type of phone number in the database
* Find the most common type of phone number for the person with an `id` of 1
* Find all mobile phone numbers, and show their owners' names with them
* Find all people with no phone numbers

Unless otherwise specified, return all columns in the requested table (e.g. people).

## Hard Mode

Write these queries as well:

* Find the first name of the person who has the most phone numbers
* Find all people who have at least five phone numbers

## Nightmare Mode

Write these queries as well:

* Find the phone number of each type which was entered most recently
* Find a list of the missing person ids. In other words, over time the list of ids in a data table can be sparse.  We may have created people 1 through 10, and then deleted 4, 5, 6, and 9.  This means that the list of ids present in the people table will be 1, 2, 3, 7, 8, 10.  In this case, your query should return 4, 5, 6, and 9.
