# Data File Import

## Description

Given an existing application, add functionality for users to upload a data file and have that data file be imported into the database via background processing.

## Objectives

After completing this assignment, you should...

* Understand how background jobs are created and run in Rails.
* Understand how files can be received and read in a Rails app.
* Be able to interpret the contents of CSV data files.
* Be able to use ActiveJob.
* Be able to install and run a background processing tool.

## Deliverables

* **A repository.** You will be working from your existing application.
* **A test suite.** Extend your application using TDD.  This was not needed last night, as you were only changing existing code.  Your test suite must include unit tests, controller tests, and at least two integration tests.

## Normal Mode

During this assignment, you will be working from the same application you used for the Database Optimization assignment.  Your task today is to create a new action with a new view.  That view will allow a user to upload a CSV file containing hits, and that CSV file will be used to create new records in the hits table.

An example CSV file can be found [here](https://tiyd-rails.s3.amazonaws.com/data.csv).

Note that the fields in this file span more than just the hits table.  Some come from assemblies, some come from genes, and some come from sequences.  This means that you will need to create more than just Hit records in the database.  Assume that every row of an uploaded CSV is new, and that you may have to create records in all four tables.

I understand that there are still ambiguities in this description.  Welcome to the real world!  Feel free to ask your instructor for any clarifications you need.

You should start this assignment by processing the upload synchronously (in other words, let the browser wait for the upload to complete before showing the user the next page).  Time how long it takes for the upload to complete, and note that this will inevitably be longer than the user is willing to wait.  Once it works synchronously, move the file import process into a background job and show the user the next page (saying something like "your file is being processed") immediately.

## Hard Mode

Modify your code so that:

1. The columns in the CSV can be given in any order.  Match on column headers.
2. The file import checks to see if assemblies, sequences, and genes already exist in the database.  The upload should assume that each HIT is new, but it might need to link a new hit to an existing gene.  It might instead need to link a new hit to a new gene to an existing sequence.  It might instead need to link a new hit to a new gene to a new sequence to an existing assembly.  It might instead need to create all four new records.

Find existing assemblies by name, find existing sequences by DNA, and find existing genes by DNA.

Once you complete and execute this code, cry about how long it takes to run.

## Nightmare Mode

You've noticed that creating a ton of records is sloooooow.  Time to make it faster.

Do the work using only one SQL operation per table.  In other words, you can't just loop over all rows and do separate `.create`s for each iteration of the loop.

## Notes

* [CSV Docs for Rails](http://ruby-doc.org/stdlib-1.9.3/libdoc/csv/rdoc/CSV.html)
