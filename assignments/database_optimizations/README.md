# Database Optimizations

## Description

Given an existing application which generates a report from a large data set, improve the efficiency of the report using database optimization methods.

## Objectives

After completing this assignment, you should...

* Understand the downsides of loops within loops in Rails.
* Understand the benefits and appropriate use of indices on database tables.
* Understand the downside of indices.
* Be able to measure the runtime of various webapp functions.
* Be able to query the database more efficiently.
* Be able to implement database indices.

## Deliverables

* **An estimate.**  After you read through this assignment (but before you start coding), write down a number of hours that you expect each part to take (1-3).  Record your hours as you go.
* **A repository.** You will be working from the existing application found in this repository, but you will make your own copy.
* **A README.** The README should include data on all of the metrics requested below.
* **A test suite.** Build your application using TDD.  Your test suite must include unit tests, controller tests, and at least two integration tests.
* **A reflection on your estimate.**

## Normal Mode

#### Part One - Analysis

For this project, you will be starting with an application which runs very slowly.  This inefficiency is due partly to the sheer amount of data present, but mostly due to the structure of the code and the database.  Your task is to make it run in a reasonable amount of time.

Once you pull down the application from GitHub, run `bundle install` and `rake db:migrate`, then follow the steps below.

1. Run `rake db:seed`.  When it is finished, it will tell you how long the process took (in seconds).  Record the amount of time.
1. Turn on your server and open your browser to `localhost:3000`.  You will have to sort out which parameters you need to pass it.
1. Open Chrome's timeline in developer tools, then hit Cmd-R on your keyboard.  The timeline will track time to load the page.  Record the following:
  1. Total time in Chrome's timeline
  1. "Idle" time in Chrome's timeline
  1. The time given by Rails at the top of the page
  1. The time given by Rails at the bottom of the page (sorry for the long scroll)
  1. Explain what these four numbers are and which are subsets of the others
1. Add appropriate indices to the data structure (via migrations).
1. Record how long it takes to run the migrations that add indices.
1. Reload the root page and record the four time numbers again.  Calculate your percent improvement in runtime.
1. Examine the code that is run when the root path loads.  Modify the controller commands which access the database to make them more efficient.
1. Calculate your percent improvement in runtime.
1. Once you have optimized your code as much as you think you can, drop the database, run `rake db:migrate`, and then time how long it takes to run `rake db:seed`.  Was there an improvement or a worsening of runtime?  By what percent and why?
1. Which is faster: (a) running `rake db:seed` without indices and then running a migration to add indices, or (b) adding indices during your initial `rake db:migrate`, then running `rake db:seed`?

You've done a thorough job of analyzing runtime, but now take a look at storage space:

* Record the size of your database (in bytes).
* Record the size of your development log.
* Give at least one method (feel free to Google) for reducing the size of one of these, yet keeping your data intact.
* Do you think that this is smaller, about right, or larger than the size of databases you'll be working with in your career?

Now let's talk about the "memory" numbers given on the page.  What impact have your changes had on memory usage?  If you reload a page again and again (with no code changes in between reloads), does memory used stay the same?  Have you ever been able to make memory used go down?

#### Part Two - Search Bar

A common feature which you'll be asked to develop is a Google-like search.  You enter information in one field, and results are returned when any one of a number of fields matches what you entered.

Create a new action in your `reports` controller which loads the same data, but with no `:name` parameter.  Call the new action/view/route `search`.  In the view, add a single search field (and search button).  The user should be able to type any part of an assembly's `name`, a hit's `match_gene_name` OR a gene's `gene` field.  When the search button is pressed, the page will reload and the user will be shown all of the hits for which any of those things match.

In other words, if a user types in "special" and one assembly has a `name` "Special Assembly" (and no hits have "special" in their `match_gene_name`), all hits for just that assembly will be shown.  If a user types in "tetanus" and only one hit has a `match_gene_name` which includes "tetanus" (and no assemblies have "tetanus" in their `name`), only that one hit will be shown.  If a user types in "AACCGGTT", only hits for genes with "AACCGGTT" in them should be shown.

The search should also be case insensitive.

## Hard Mode

Improve the intelligence of the search bar.  If you type in multiple words, your search algorithm should split on spaces and display results for which ALL of the terms are found in ANY of the three fields.  For instance, if you search for "Special Tetanus ACTG", a result would still get returned if "Special" was in its assembly, "Tetanus" was in its hit, and "ACTG" was in its gene.

## Nightmare Mode

Back to the `all_data` action.  This data structure has a number of tables connected with a series of one-to-many relationships between them.  A more advanced way to improve efficiency would be to cache the id of the upper-most (ancestor) table's id in a field in the lower-most (descendant) table.  To accomplish this, do the following:

* Write a migration to add this cached foreign key.
* Write callbacks to maintain this foreign key appropriately.  Hint: you will need more than one.
* Modify the report to use this new cached field instead of the actual id stored in the ancestor table.
* Measure the improvement in runtime.
