# Auction App - Add AJAX

## Description

Given an existing application, add AJAX for submitting information without reloading the page.

## Objectives

After completing this assignment, you should...

* Understand what AJAX is and how it can enrich a Rails application.
* Implement AJAX to refresh information on a page.
* Implement AJAX to accept a form submission without reloading its page.

## Deliverables

* **A Repository.** This README is stored in a folder with an existing Rails application.  Fork this repository and do your work in this Rails app.

## Normal Mode

This application is an auction site, and although it doesn't do much now, it will do more and more over time.  You will note that you can view a list of all items for sale, can make new items, and can make bids on items.

Tonight, your assignment is to modify the bidding page.  Currently, to see if anyone else has bid, you have to refresh the entire page.  Also, if you place a bid yourself, the page refreshes to display the changes.  You will be using AJAX to allow both of those behaviors to occur without page reload.

To be specific:

* The place bid form should be remote, and should (a) update the highest bid and (b) update the next bid field to be $10 higher than the max bid.
* Every 15 seconds, these same two areas should update if someone else places a new bid.

In order to test the case of "someone else" placing a bid, feel free to have the app open in two different tabs.  You can make a bid in one and then check that the other one updates automatically.

## Hard Mode

Improve the styling of the application.  Feel free to make whatever modifications you see fit, but at least work on the following:

* Foundation has more styles that could be useful.  Use a few.
* Images are sometimes shown stretched, sometimes shown with extra space on the sides.  Make them always appear the same size, but do not change their native aspect ratio.
* Modify the main items index page.  Make it look nice, and remove the table.  Build the whole page without any tables.
* Color.

## Notes

* [AJAX in Rails 4 Tutorial](http://www.gotealeaf.com/blog/the-detailed-guide-on-how-ajax-works-with-ruby-on-rails)
* [Foundation Documentation](http://foundation.zurb.com/docs/)
