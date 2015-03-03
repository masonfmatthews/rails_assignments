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

## Normal Mode

For this project, you will be building a Rails-based application which serves up only an API.  This API will be responding with JSON.  The API must have the following actions in the following locations:

* `/api/v1/candidates`
  * Based on a candidates table, with at least name and party attributes
  * `index` action
  * `show` action
* `/api/v1/voters`
  * Based on a voters table, with at least name and party attributes
  * `create` action
  * `show` action, with authentication to show that you are the voter
  * `update` action, with authentication to show that you are the voter
* `/api/v1/votes`
  * Based on a votes table, with at least voter_id and candidate_id attributes
  * Each voter can cast at most one vote, period.
  * `create` action, with authentication to show that you are the voter
  * `index` action (which shows all candidates and a number of votes for each)

See the notes section below for links that will be helpful.

## Hard Mode

Extend the application to allow for voters to vote multiple times (one for each race, e.g. Senate race).  Add the following API actions:

* `/api/v1/race`
  * Based on a races table, with at least a name attribute
  * `index` action
  * `show` action

Modify the candidates, voters, and votes models and controllers to allow:

* candidates to belong to a race
* votes belong to a candidate, a voter, and a race
* votes to be unique for a voter and a race, not just one vote per voter
* votes index page to show number of votes per candidate grouped by race.


## Notes

* [Building API Basics](http://www.theodinproject.com/ruby-on-rails/apis-and-building-your-own)
* [Railscast on securing APIs](http://railscasts.com/episodes/352-securing-an-api)
