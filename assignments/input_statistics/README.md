# User Input Tracker

## Description

Create a program which will take repeated input from the user and generate statistics on those inputs.

## Objectives

After completing this assignment, you should...

* Understand control flow, specifically looping and branching.
* Understand variables and data types.
* Understand basic ways in which a Ruby program can present information to the user and request information from the user.
* Understand how ruby code resides on the file system.
* Be able to use `puts` and `gets`.
* Be able to perform calculations on variables.
* Be able to run ruby code from the command line.

## Deliverables

* **Ruby code.** This code should be executable, should run without errors, and should accomplish the requirements given below.
* **A link to a Gist.** Create a Ruby Gist on http://gist.github.com and paste your Ruby code into it.  Submit the link to this gist via the homework submission form found on the course website.

## Normal Mode

Your goal for tonight is to create a program to keep track of user input.  You will repeatedly ask the user to enter a number, and as long as the user types a number and hits enter, you will ask again.  If the user hits enter on a blank line (without typing a number first), this means that the user is finished.

Once the user is finished, you should present statistics about the inputs.  You should give:

* The total of all the numbers.
* The average of all the numbers.

Your program should still work if the user inputs negative numbers and/or non-integer rational numbers (e.g. `3.45`).

If the user enters something that is not a number (e.g. `Potato`), your program should state that this was a mistake and ask again.

## Hard Mode

Extend your program to accept strings as well.  If the user starts off by entering a string (e.g. `correct`), then the program will accept strings for subsequent inputs.  Rather than showing statistics at the end, it will show the concatenated version of the inputs.  For example, if the inputs are the following:

* `correct`
* `horse`
* `battery`
* `staple`

Then the output will be `correcthorsebatterystaple`.

Your program should continue to work exactly like Normal Mode if the user starts by entering a number.  If the user mixes numbers and strings in the same run, your program should tell the user to start over, then stop execution.

## Nightmare Mode

When the user is inputting numbers, add the following statistics to the output:

* Standard Deviation
* Median

When the user is inputting strings, add the following statistics to the output:

* Average length of inputs
* Number of times the letter `e` was used in the inputs.
