# Display a Model Object as JSON

## Description

Create a class which inherits from `ActiveRecord::Base` and can display one row or all rows in JSON format.

## Instructions

Assume that you have a table named `candidates` which contains the following fields:

* `name:string`
* `hometown:string`
* `district:string`
* `party_id:integer`

Write a `Candidates` class with two methods in it.  The first will be an INSTANCE method, and will return JSON of all the fields for ONE particular candidate, and the second will be a CLASS method, and will return JSON of all of the fields for ALL of the candidates.

Once you are finished, review your code.  Will this code need modifications if you add fields to the database and want them to appear in the JSON as well?  The best solutions do not, but it's really hard to accomplish this.

(If you sort this out before time is up, modify your code to include party fields - `party.name` and `party.abbreviation` - in the JSON.)
