# Build Your Own API

## Description

Create a Rails application which presents a novel (unique, new) API to the world.  This API must consume at least two other, publicly available APIs.

## Objectives

After completing this assignment, you should...

* Understand the variety of public APIs available to developers
* Be able to read and utilize API documentation for publicly available data sets
* Be able to merge data from multiple points of origin
* Be able to create a public-facing API
* Be able to create your own API documentation

## Deliverables

* **A GitHub Organization.** Create an organization in github to represent your team for this project.  Give all team members full rights.
* **A Repository.** Create a repository in your github organization.
* **A Test Suite.** Your application should be developed using test driven development.
* **A README.** Your README should describe the API and provide instructions for others on how to use it.

## Normal Mode

For this project, you have complete autonomy on the data that your application displays, the sources of that data, and the behavior that your application has.  The conditions for this assignment are:

* You must consume at least two publicly available APIs on two different data sets (e.g. two API requests from the GitHub API are not sufficient).  A few links to public data set directories are given below.
* You must combine this data in some meaningful and interesting way.
* You must display this merged data in a JSON API of your own making.  The api must be accessible under `/api/v1/...`.
* Your API must have at least one endpoint (e.g. `/api/v1/search` or `/api/v1/details`), but more are allowed.
* The endpoint must accept at least two parameters to allow users to ask a variety of questions.
* You must write clear API documentation in your README.  Give an explicit list of all your endpoints and their parameters.  Ideally, your README will also include sample output for each of your endpoints.

Authentication is optional.

(I say "complete autonomy," but, of course, nothing illegal, pornographic, offensive, or involving cats and/or the instructor's face.)

## Hard Mode

Cache your data in a database to (a) speed up future queries and (b) reduce the number of requests you make of the existing public APIs.

## Links

* [Mashape](https://www.mashape.com/)
* [PublicAPIs.com](http://www.publicapis.com/)
* [Government APIs](https://www.data.gov/developers/apis)
* [Duke APIs](http://dev.colab.duke.edu/resource/duke-public-apis)
* [Sports APIs](http://www.programmableweb.com/news/91-sports-apis-fanfeedr-seatwave-and-espn/2012/08/01)
* [Random API Directory](http://www.programmableweb.com/apis/directory)
* [GitHub](https://api.github.com/users/masonfmatthews/events)
* [Who is my Representative](http://whoismyrepresentative.com/getall_mems.php?zip=27701)
* [Twitter](https://dev.twitter.com/rest/public)
* [Nutritionix](https://www.mashape.com/msilverman/nutritionix-nutrition-database)
* [TrailAPI](https://www.mashape.com/trailapi/trailapi)
* [Yoda Speak](https://www.mashape.com/ismaelc/yoda-speak)
* [Marvel API](http://developer.marvel.com/docs)
* [Blackjack API](http://deckofcardsapi.com/)
* [Static Data Sets](http://vincentarelbundock.github.io/Rdatasets/datasets.html)
* NPR
* Flickr
* Getty Images
* LinkedIn
* YouTube
* Twitch
* IGN
* ESPN
* ...and here's [a beastly list](http://tiyd-rails-2015-08.github.io/notes/apis)
