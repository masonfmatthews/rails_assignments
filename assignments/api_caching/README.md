# API Caching

## Description

Given an existing application which pulls from the Github API and displays its results in an HTML page, add a database which will store the Github responses so that the API does not need to be queried repeatedly.  Decide on a cache invalidation strategy.

## Objectives

After completing this assignment, you should...

* Understand the benefits of caching API responses.
* Be able to create a database to store API responses.
* Be able to define reasonable rules for when to re-query an API.
* Be able to implement models which sometimes query the database and sometimes poll and API.

## Deliverables

* **A Data Structure Diagram.**
* **A Repository.** You will be working from an existing application.  Your instructor will provide that link.
* **A Test Suite.**

## Normal Mode

For this assignment, you will be taking an existing application which was created to pull from the Github API and attempt to generate a user's repositories page.  The application chosen for tonight did not totally meet that goal, but accomplished the core parts of it.

The issue we are now faced with is that we don't want to call out to the Github API each time a user requests the same page.  If a user's profile is requested more than once, the information should be pulled from a database in this Rails app, and Github will not get an additional request.  This approach has two benefits:

1. It takes longer to pull from an API and render its results than it takes to display data from a database.
2. Subsequent requests of the same information does not count against our allowed number of Github API requests.

Once you've accomplished this, take it a step further.  This database that you've created can be thought of as a "cache" of the github data.  You keep it around to make future requests faster or easier.

Unfortunately, we can't just assume that user profiles never change.  They may move to another city, they may create new repositories, and any number of other changes may occur.  Because of this, we need a strategy for cache invalidation.

Make two additional changes to your application:

1. If information about the requested user's profile is more than one day old, requery from the API and refresh your database cache of that profile.
2. If information about the requested user's profile is more than two hours old, requery from the API and refresh your database's cache of those repositories.

This is called a cache invalidation strategy.  May the force be with you.

## Hard Mode

The Profile model presents some information which changes very infrequently (e.g. username and location), but other information which changes moderately frequently (number of followers and number following).  Modify your code so that those two cached fields (number of followers and number following) are kept for at least a day, but the other fields are kept for at least a week.

Describe in your README why this modification does or does not make practical sense.
