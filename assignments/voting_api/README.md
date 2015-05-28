# Voting API

## Description

Create an API using Rails which allows users to vote for candidates for public office.

## Objectives

After completing this assignment, you should...

* Understand how organizations present information via APIs.
* Understand how APIs can be used to change data as well as view it.
* Be able to write a versioned, nested API to share and allow edits to a database.
* Be able to write Rails tests to cover a Rails API.
* Be able to write a token-based authentication system for an API.

## Deliverables

* **A Repository.** Create your own repository for this assignment.
* **A Test Suite.** Every action in your controllers should be tested.
* **A README.** Your README should describe the API and provide instructions for others on how to use it.
* **An ERD.** Create a database diagram in Lucidchart (or a similar tool).

## Normal Mode

For this project, you will be building a Rails-based application which serves up only an API.  This API will be responding with JSON.  The API must have the following actions in the following locations:

* `/candidates`
  * Based on a `candidates` table, with at least `name`, `hometown`, `district`, and `party` attributes
  * `index` action
  * `show` action
* `/voters`
  * Based on a `voters` table, with at least `name` and `party` attributes
  * `create` action
  * `show` action, with token authentication to prove that you are the voter
  * `update` action, with token authentication to prove that you are the voter
* `/votes`
  * Based on a `votes` table, with at least `voter_id` and `candidate_id` attributes
  * Each voter can cast at most one vote, period.
  * `create` action, with token authentication to show that you are the voter
  * `destroy` action, with token authentication to show that you are the voter
  * `index` action (which shows all candidates and a number of votes for each)

See the notes section below for links that will be helpful.  Your easiest path will be to accept the token from the user as a parameter.

## Hard Mode

Extend the application to allow for voters to vote multiple times (one for each race, e.g. Senate race).  Add the following API actions:

* `/api/v1/race`
  * Based on a races table, with at least a name attribute
  * `index` action
  * `show` action

Modify the candidates, voters, and votes models and controllers as follows:

* candidates belong to a race
* votes belong to a candidate, a voter, and a race
* votes are unique for a voter and a race, not just one vote per voter
* votes index is grouped by race
* votes index shows number of votes per candidate, and is sorted by number of votes (within the race)

Also, modify your token auth to receive the token in the request header rather than as a parameter.

## Nightmare Mode

Extend the application to track ballots.  A ballot does not refer to one piece of paper that has been turned in by one voter, but to the set of races which appear together on the ballot for a particular geographic region.  Specifically:

* races have many ballots and ballots have many races
* voters belong to a ballot
* voters can only vote for races on their ballot

Also, extend your voting restrictions to allow certain races to take the form "vote for at most two of these candidates."  Make sure that "two" can be replaced with any number for a particular race.

Make your own choices about which API endpoints to add.

Also, instead of using Token Auth, use OAuth.

## Notes

* [Building API Basics](http://www.theodinproject.com/ruby-on-rails/apis-and-building-your-own)
* [Railscast on securing APIs](http://railscasts.com/episodes/352-securing-an-api)
