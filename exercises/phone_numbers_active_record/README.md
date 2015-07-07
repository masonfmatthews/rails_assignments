# Phone Numbers ActiveRecord

## Description

You've spent some time dealing with student names and contact information, and have written SQL commands.  Invent a way to invoke these SQL commands from Ruby.

## Instructions

As a quick refresher, these are the queries that you wrote yesterday:

1. Find all mobile phone numbers
1. Find the phone number which was updated most recently
1. Find the number (count) of each type of phone number in the database
1. Find the most common type of phone number for the person with an `id` of 1
1. Find all mobile phone numbers, and show their owners' names with them
1. Find all people with no phone numbers

Given our time spent in object oriented programming, you should be thinking about each table as a class.  In this case, there will be a `Person` class and a `PhoneNumber` class.

Start from the top of this list of queries and think about how you would want to interact with these classes in order to make method calls.  Write down example calls that you would make (e.g. `Person.filter_by_last_name("Matthews")`) which would feel more like Ruby.  Also, describe what type of data structure (hash, array, object, etc) these calls would return.

Reminder: the SQL clauses which you used were:

* `SELECT`
* `FROM`
* `WHERE`
* `GROUP`
* `LIMIT`
* `OFFSET`
* `INNER JOIN`
* `LEFT JOIN`
