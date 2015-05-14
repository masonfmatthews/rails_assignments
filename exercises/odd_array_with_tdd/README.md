# OddArray with TDD

## Description

Create one (very odd) class that contains an Array but only allows odd items to be stored in it.

## Instructions

You are a (very odd) mathematician who has set out to prove that any mathematical operation can be performed using only odd numbers (e.g. 1, 3, 5, 333) and no even numbers (e.g. 2, 4, 6, 448).  You'll be writing a lot of code along the way, but before you get started on the mathy stuff, you want to make sure that you have a class which will help you with the basics.  You need a class like an array which will only store odd numbers in it.  Do NOT use inheritance; use composition instead.

Behavior should include:

* You can initialize an OddArray by passing it an array.
* You can add an element to OddArray using the shovel operator.
* You can call `.to_a` on an OddArray to return an Array which only has the odd numbers that were initialized/added to it.
* You can add two OddArrays together and get back an OddArray which contains the odd numbers from both of the original OddArrays.

Write this class using TDD.  TDD has four steps:

* Write a test which tests one (isolated) new behavior
* Make sure your new test fails
* Write code to make your test pass
* Refactor while keeping all tests passing
