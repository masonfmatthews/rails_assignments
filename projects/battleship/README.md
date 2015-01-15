# Battleship

## Description

Write a program that plays the game of Battleship.  The user can act as Player 1, and the computer can act as Player 2.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand the basics of control flow, variables, and methods in Ruby.
* Understand the basics of Object Oriented Programming.
* Understand the basic use cases of Git for single-developer projects.
* Understand the purpose of test suites and how they can assist in development.
* Understand how frustrating it would have been to try to check and debug this assignment without written tests!

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Accomplish all objectives from earlier in the week.
* Build a game-playing application that asks the user for input and provides output to the user.
* Create a computer player that can act like a human (albeit not necessarily an intelligent one).
* Write an program that can satisfy a test suite.

## Details

### Deliverables

* **A Repository.** Fork this repository to your own github account.
* **A README.** Wipe out this README and write your own.  It should tell readers how to play your version of the game.
* **Ruby Files.** You'll need a lot of these, and you'll be creating them from scratch.  Again, you should have one per class, plus at least one other to be executed from the command line to run the game.
* **A Playable Game.** When I clone your repository, I should be able to run your program and play through an entire game of Battleship.  I should be able to win and to lose.

When you are finished, create a pull request.

### Requirements

The major requirement of this project is for the TEST SUITE TO PASS.  You are coding to the tests, and ideally, you're making them pass one at a time.  As discussed in class, I would suggest making the first test pass USING THE SIMPLEST MEANS POSSIBLE.  Then move on to the second test, the third test and so on.  You should commit after each test passes.

Just to be clear, your computer player does not have to be smart.  It just has to play until the game is finished.

Here's the odd thing.  READ THIS.  If you're ever going to call `gets.chomp` in your code to prompt the user for his/her input, don't.  Put the following code at the top of any file that needs to prompt the user:

```
def get_user_input
  gets.chomp
end
```

This goes BEFORE you start defining your class.  I know that looks stupid, and I apologize for it, but the test suite will only run if you ALWAYS ask for user input by calling `get_user_input` rather than `gets.chomp`.  Sorry again.

## Normal Mode

It's finally time.  Your task this weekend, whether or not you choose to accept it, is to write a program that plays the game of Battleship.  The user can act as Player 1, and the computer can act as Player 2.  However, as you work through the assignment, you'll notice that you're also building it so that two humans could play each other.

This assignment will bring together two of the assignments from earlier in the week: your written set of computer-friendly instructions from Day 1, and the draft code of your objects from Day 3.  You WON'T be using that draft code as a starting point, because it's likely that the classes you designed won't match what the test suite is expecting.  You'll be writing code to make a test suite pass, so it is going to dictate a lot of what you put together.

Your program should allow the user to play a full game of Battleship against the computer.  The rules of the game are given in the [Hasbro instructions](http://www.hasbro.com/common/instruct/battleship.pdf).

## Hard Mode

Modify your computer player so that it makes intelligent moves.  In other words, Normal Mode is satisfied if the computer fires randomly.  Hard mode required the computer to fire with some meaning.  It has to have a chance of winning.

In addition to the above, add ten more (meaningful) tests to the test suite.  Get them to pass!

## Nightmare Mode

In addition to the above, modify your existing code to ask the user which type of game he/she would like to play: regular or SALVO.  Allow the user to select and play either game.
