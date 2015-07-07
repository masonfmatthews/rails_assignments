# Phone Numbers SQL

## Description

You've spent some time dealing with student names and contact information, and you've designed a data structure to keep track of them.  Your task now is to write SQL commands to pull information out of this data structure.

## Instructions

This folder includes a file called `contact.sqlite3`.  Pull this file down to your computer and open it with a database browser.  Write SQL queries which accomplish the following:

* Find all mobile phone numbers
* Find the phone number which was updated most recently
* Find the number (count) of each type of phone number in the database
* Find the most common type of phone number for the person with an `id` of 1
* Find all mobile phone numbers, and show their owners' names with them
* Find all people with no phone numbers

Unless otherwise specified, return all columns in the requested table (e.g. people).

## More Instructions (if you dare)

Write these queries as well:

* Find the first name of the person who has the most phone numbers
* Find all people who have at least five phone numbers

## Even More Instructions (but really, this is getting ridiculous)

Write these queries as well:

* Find the phone number of each type which was entered most recently
* Find a list of the missing person ids. In other words, over time the list of ids in a data table can be sparse.  We may have created people 1 through 10, and then deleted 4, 5, 6, and 9.  This means that the list of ids present in the people table will be 1, 2, 3, 7, 8, 10.  In this case, your query should return 4, 5, 6, and 9.
