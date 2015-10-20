# Overview: Tic Tac Toe

## Description

In order to review, practice, and demonstrate your Ruby knowledge, build a program of moderate complexity from the ground up by yourself.

## Objectives

After completing this assignment, you should...

* Understand any gaps in your knowledge which you hope to fill over the coming weeks.
* Understand which parts of Ruby development are more likely to put you in a flow state.
* Have built a Ruby application from scratch.
* Have used best practices such as test-driven development and committing/deploying early and often.

## Deliverables

* **A Repository.**
* **A Test Suite.**
* **A README.**

## Overview Mode

For this assignment, you are going to build a tic tac toe game.  The purpose of this work is to review the core components of a Ruby application and demonstrate your ability to put them together appropriately.  In order to help you and your instructor reflect on your acquired skills, you will be working independently.  You may talk with others and draw on whiteboards together, but no other students should look at your actual code, and you should not look at theirs.  You may, of course, use Google and online references as frequently as you would like.

You are building an application to play tic tac toe, and the requirements will be presented to you in a particular order.  You MUST complete each one of these in order, without jumping around.  Each completed phase must have tests in place, a README in place, a series of good commit messages, and a final commit message (for that particular phase) which includes the `#shipit` tag.

Record the number of hours you put towards each of the phases.

### Phase One

* When executed, your Ruby file should display an empty tic tac toe board on the screen.
* The user should be asked for a location.  A1 is the upper-left, A2 is the upper-middle, A3 is the upper-right, B1 is the middle-left, etc.
* When the user enters something that is not A1, A2, A3, B1, B2, B3, C1, C2, or C3, the user should be reprimanded and asked to try again.
* When the user enters a valid location, the board should redisplay with an X in that location.
* The user should be asked for another location, and these steps should continue until the board is completely full of X's.  Then the game (and the program) should end.

### Phase Two

* Refactor your application to use two classes: `Board` and `Position`.
* The computer should alert a player if they enter coordinates which are already occupied and then ask again.
* All the other functionality should stay the same.

### Phase Three

* Rather than only placing X's on the board, change the program so that two human players take turns.
* At the beginning of the game, the first player (the X player) should be asked for his/her name.  Then the second player (the O player) should be asked for his/her name.
* The computer should then alternate asking the players for coordinates and placing the appropriate X's or O's in the appropriate places.
* If any player enters an invalid or already occupied set of coordinates, they should not lose their turn, but be asked again.
* The game should continue until the board is completely full.  Do not yet think about assessing who has won.
* Continue to use your two classes.

### Phase Four

* The game should stop if someone wins, and the computer should report the winner's name.
* Continue to use your two classes.

### Phase Five

* Modify the game so that the human (X) plays against the computer (O).  The computer can be dumb (e.g. just take the next available position), but it should be possible for the human to lose if the human makes even worse decisions.
* Continue to use your two classes.

### Phase Six

* Make the computer player unbeatable.  Use [the XKCD guide to tic tac toe for the optimal strategy](https://xkcd.com/832/).
