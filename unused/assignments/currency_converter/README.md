# Currency Converter

## Description

Build on the Currency assignment.  Create a ruby class for converting currencies using Test-Driven Development.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand how objects can return objects of other classes as responses to messages
* Understand how to override mathematical operators

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Initialize a set of objects from a data structure (rather than a simple list of parameters)
* Raise exceptions/errors as appropriate
* Parse strings to isolate specific symbols

## Details

### Deliverables

* **A Repository.** Add code to the previous repository used for last night's work.
* **An Updated Currency Class.**
* **A CurrencyConverter Class.**
* **A Test Suite.** Not only must this test suite be conceptually complete, it must be written before the code that satisfies it.  This can be determined by git commits (so commit often!!!)

### Requirements

CurrencyConverter:

* Should be initialized with a Hash of currency codes to conversion rates (see link to rates below)
* At first, just make this work with two currency codes and conversation rates, with one rate being 1.0 and the other being the conversation rate. An example would be this: `{USD: 1.0, EUR: 0.74}`, which implies that a dollar is worth 0.74 euros.
* Should be able to take a Currency object and a requested currency code that is the same currency code as the Currency object's and return a Currency object equal to the one passed in (that is, currency_converter.convert(Currency.new(1, :USD), :USD) == Currency.new(1, :USD))
* Should be able to take a Currency object that has one currency code it knows and a requested currency code and return a new Currency object with the right amount in the new currency code
* Should be able to be created with a Hash of three or more currency codes and conversion rates. An example would be this: `{USD: 1.0, EUR: 0.74, JPY: 120.0}`, which implies that a dollar is worth 0.74 euros and that a dollar is worth 120 yen, but also that a euro is worth `120/0.74 = 162.2` yen.
* Should be able to convert Currency in any currency code it knows about to Currency in any other currency code it knows about.
* Should raise an UnknownCurrencyCodeError when you try to convert from or to a currency code it doesn't know about.

Currency (modifications to earlier code):

* Currency.new should be able to take one argument with a currency symbol embedded in it, like "$1.20" or "€ 7.00", and figure out the correct currency code. It can also take two arguments like before, one being the amount and the other being the currency code.

## Normal Mode

You will be using Test-Driven Development to design two Ruby classes, Currency (last night) and CurrencyConverter (tonight). The Requirements section above contains a list of all the things CurrencyConverter should do. In order to complete this assignment, follow these directions:

* For each requirement, write a test first, and then make the test pass, no exceptions, do not pass Go, do not collect $200.
* Every time you finish a requirement, commit your code with a message describing the requirement.
* Go through the requirements one-by-one. Do not skip around.

## Hard Mode

Build a third class called CurrencyTrader.  CurrencyTrader should be initialized with CurrencyConverter objects from two different points in time, plus a starting Currency.  CurrencyTrader should have a method which returns the best currency investment over that span of time.

For instance, if you are starting with $1,000,000, assume that you can convert your dollars to one currency at the first point in time, but that you must then convert it back to dollars at the second point in time.  The best bet given two CurrencyConverters may be GBP.  If USD -> GBP is 1 to 1 at the first point in time, then 1 to 0.5 at the second point in time, you can double your money.

You should not need to modify Currency or CurrencyConverter to get this to work, but if you see a path that involves modifying them and want to give it a shot, feel free.

Regardless, continue using TDD!!

## Nightmare Mode

You guessed it.  Modify your CurrencyTrader to accept an array of CurrencyConverter objects and a starting Currency.  If the length of the array is greater than 2, you can move your currency more than once, so long as it ends in the same currency code as it started.  Find the best set of currency trades for your money over time.

And use TDD!!

## Additional Resources

* A good site to get [real conversion rates](http://www.xe.com/currencyconverter/#rates)
* A list of [active currency codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)
