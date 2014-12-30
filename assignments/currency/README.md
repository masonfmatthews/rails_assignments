# Currency

## Description

Create a ruby class for storing currencies using Test-Driven Development.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand the flow benefit of Test-Driven Development
* Understand how to override mathematical operators

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Create a test suite while writing application code
* Raise exceptions/errors as appropriate

## Details

### Deliverables

* **A Repository.** Create a new github repository under your account.
* **A Currency Class.**
* **A Test Suite.** Not only must this test suite be conceptually complete, it must be written before the code that satisfies it.  This can be determined by git commits (so commit often!!!)

### Requirements

Currency:

* Should be created with an amount and a currency code
* Should equal another Currency object with the same amount and currency code
* Should be able to be added to another Currency object with the same currency code
* Should be able to be subtracted by another Currency object with the same currency code
* Should raise a DifferentCurrencyCodeError when you try to add or subtract two Currency objects with different currency codes.
* Should be able to be multiplied by a Fixnum or Float and return a Currency object

## Normal Mode

You will be using Test-Driven Development to design two Ruby classes, Currency (tonight) and CurrencyConverter (tomorrow night). The Requirements section above contains a list of all the things Currency should do. In order to complete this assignment, follow these directions:

* For each requirement, write a test first, and then make the test pass, no exceptions, do not pass Go, do not collect $200.
* Every time you finish a requirement, commit your code with a message describing the requirement.
* Go through the requirements one-by-one. Do not skip around.

## Hard Mode

If you are attempting Hard Mode, finish Normal Mode first, then branch your code.  

Given what you've learned thus far about object-oriented programming, remove the DifferentCurrencyCodeError. Make it possible to add two currency objects from different codes together.  The result should be another Currency object with the first of the two codes.  For instance, if a dollar is worth 100 yen, then 1 dollar plus 1000 yen should return an object representing 11 dollars.

There are right ways to do this, wrong ways to do this, and okay ways to do this.  Take your best shot, but continue using TDD!!

## Additional Resources

* A good site to get [real conversion rates](http://www.xe.com/currencyconverter/#rates)
* A list of [active currency codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)
