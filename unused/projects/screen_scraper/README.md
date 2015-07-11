# Google Scholar Screen Scraper

## Description

In pairs, build an application which reads (i.e. "scrapes") information from the HTML version of the search results at scholar.google.com and presents it to the users in a useful way.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand how gems can be used to perform common tasks like requesting HTML from a website.
* Understand the structure of HTML documents.
* Understand the degrees of variance in responses that can returned to the user from a seemingly simple web response.

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Parse a tag-based document.
* Build tests to cover an existing codebase.
* Fix bugs in an out-of-date codebase.
* Refactor an existing non-object-oriented codebase to become object-oriented.
* Add features to an existing codebase using Test-Driven Development.
* Develop simple applications while pair programming.

## Details

### Deliverables

* **A Repository.** Fork this repository to your own github account.
* **A README.** Wipe out this README and write your own.
* **A Gemfile.** After cloning your version of the application, `bundle install` should install the necessary gems.
* **A Working Screen Scraper.** The README should describe how to run the application.
* **A Test Suite.** Not only must this test suite be conceptually complete, it must be written before the code that satisfies it.  This can be determined by git commits (so commit often!!!)

### Requirements

* The program must take a researcher's name from the user.  You decide how this should be done.  Is it a command line argument?  Is it a prompt?
* The program must use HTTParty (or a similar gem) to connect to Google Scholar.
* The program must use Nokogiri (or a similar gem) to traverse the HTML document's components.
* At least three classes should be defined in your code.
* The results of a search should be encapsulated in a single object (this object may, of course, wrap other objects as instance variables).

## Normal Mode

The steps of the project will look something like this:

* Fork this repository and clone it to your local machine.
* Run the code.  You'll have to do something with gems and bundler before it will work.
* Interpret what you think the code is trying to do.  It's not doing it correctly, but it does have a clear intent.
* Write tests to capture this intent.
* Modify the code to make the tests pass.
* Refactor the code to have an object-oriented structure.  Ensure that the tests still pass along the way (otherwise, it wouldn't be refactoring).
* Once your refactor is complete, begin writing code test-first.  Write a test to capture one of the new requirements below, make sure the test fails, then write code to make the test pass.  Refactor as needed.

In the simplest case, your program should:

* Take a researcher's name from the user
* Output a bibliography (via `puts` or similar) of the first 10 results in IEEE citation format (the format typically used in Computer Science).  

Note that this citation format has MANY subrequirements, so test them one at a time.

The link to the IEEE citation formats is given below.  Consider the results to all be "Conference Technical Articles."

## Hard Mode

Add two features for Hard Mode:

* Allow the user to also specify the number of results they'd like to have in the bibliography.  Note that Google Scholar only returns 10 results, so you'll have to pull from the second page if the user asks for 20.
* Google Scholar is a bit over-eager in giving you results.  Note that if you search for "Carlo Tomasi," the 5th result will actually be for an "M Tomasi."  Remove these false positives.

## Nightmare Mode

This is going to be REALLY hard.

You've no doubt seen that these results don't look terribly good in bibliograpy format, primarily because Google Scholar abbreviates some things.  If the paper has 20 authors, for instance, you'll just see something like "…, R Estrada, SJ Chiu, C Tomasi…" for the author list.

However, you'll also notice that if you click on the "Cite" link beneath each paper, you'll see a popup with full, clean citations.  Modify your code to scrape these popups instead of the main HTML page.  Feel free to give your citations in MLA format for this mode.

## Additional Resources

* [HTTParty](https://github.com/jnunemaker/httparty)
* [IEEE Citation Formats](http://www.ieee.org/documents/ieeecitationref.pdf)
* Fiddle with [Google Scholar](http://scholar.google.com) to see the sorts of responses that you might get back (and, most importantly, what the URLs look like after you search).
