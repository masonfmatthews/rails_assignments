# Blackjack Advisor

## Description

Create a program which will take information about a current blackjack hand and return the optimal action for the player to take.

## Objectives

After completing this assignment, you should...

* Understand complex data structures and how they can store multi-dimensional data.
* Be able to create and use hashes.
* Be able to create and use nested data structures.
* Be able to write READMEs in Markdown.

## Deliverables

* **A GitHub repository.**
* **A Ruby file called `blackjack_advisor.rb`.**
* **A README.**  This document must contain a description of your program, what it is for, and how to use it.  It must be called `README.md` and be written in Markdown.
* **A series of commits on that repository.**  Not just one at the end!

After your work is complete, make sure to `git push` your changes up to GitHub.  Feel free to do this more than once along the way, of course.

Use the homework submission form on the course website to turn in a link to your GitHub repository.

## Normal Mode

Although Blackjack is a game of chance, it is simple enough that the mathematically optimal next move can be given for any hand.  Don't worry, though; I won't be asking you to calculate them.  Your goal for this assignment is to store the set of optimal moves for a 1 deck blackjack hand, ask the user for his or her current hand (and the dealer's up card), then give the user his or her optimal move.

The set of optimal moves can be found [here](http://wizardofodds.com/games/blackjack/strategy/calculator/).

For normal mode, use the default settings that occur on this page when you load it (1 deck, etc).

Your program must use a hash within a hash (at least) to solve this problem.  The prompts to the user should go something like this:

* `Please enter your first card:`
* (user enters 9)
* `Please enter your second card:`
* (user enters 9)
* `Please enter the dealer's card:`
* (user enters 7)
* `Your optimal move is to stand.`

You can either allow the user to enter `J`, `Q`, or `K` for Jack, Queen, or King, respectively, or you can expect the user to enter a `10` for any of these.  However, the user should have to enter `A` for an Ace.

It is up to you to use the Googlez to determine what makes a hand "Soft" or "Hard."


## Hard Mode

In addition to the three inputs given above, allow the user to also specify whether the game is being played with 1 deck, 2 decks, or 4 or more decks.


## Nightmare Mode

Modify your hard mode game to allow the program to continue running in the case of a hit.  If it suggests that you hit, it should then ask you what card you received on your hit.  It should then continue to offer you additional advice until the hand is over (i.e. until it tells you do something other than hit).
