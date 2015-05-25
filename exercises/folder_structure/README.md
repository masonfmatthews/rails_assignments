# Display a Model Object as JSON

## Description

Create a class which inherits from `ActiveRecord::Base` and can display one row or all rows in JSON format.

## Instructions

Assume that you have a table named `candidates` which contains the following fields:

* `name:string`
* `hometown:string`
* `district:string`
* `party_id:integer`

Write this class with two methods in it.  The first will return JSON of all the fields for a particular candidate, and the second will return JSON of all of the fields for all of the candidates.

Once you are finished, review your code.  Will this code need modifications if you add fields to the database and want them to appear in the JSON as well?  The best solutions do not.

(If you sort this out before time is up, modify your code to also nest all properties of the associated party for each candidate.  Assume that party simply has `name` and `abbreviation` fields.)
