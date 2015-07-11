# Currency Converter

## Description

Create two Ruby classes: one for storing currencies and another for converting currencies.

## Objectives

After completing this assignment, you should...

* Understand how to override mathematical operators
* Understand how objects can return objects of other classes as responses to messages
* Understand how to execute Ruby code which spans multiple files
* Understand how to create your own exception classes
* Be able to initialize an object from a set of parameters
* Be able to initialize a set of objects from a complex data structure
* Be able to raise exceptions/errors as appropriate
* Be able to parse strings to isolate specific symbols

## Deliverables

* **A GitHub repository.**
* **A Currency class in its own file.**
* **A CurrencyConverter class in its own file.**
* **A quality README.**
* **A series of commits on that repository.**  Not just one at the end!

After your work is complete, make sure to `git push` your changes up to GitHub.  Feel free to do this more than once along the way, of course.

Use the homework submission form on the course website to turn in a link to your GitHub repository.

## Normal Mode

In this weekend assignment, you will be asked to create your first Ruby classes.  One of those classes will represent an amount of currency (a real-world thing you can point to), and the second will represent a currency converter (arguably a real-world person, but actually a set of procedures).

In order to complete this assignment, your classes (and objects instantiated from them) must satisfy all of the requirements below.  You may tackle these in any order, but every time you finish a requirement, commit your code with a message describing the requirement.  This means that you should have a lot of commits.

Currency objects:

* Should be created with an amount and a currency code
* Should equal another Currency object with the same amount and currency code
* Should NOT equal another Currency object with different amount or currency code
* Should be able to be added to another Currency object with the same currency code
* Should be able to be subtracted by another Currency object with the same currency code
* Should raise a DifferentCurrencyCodeError when you try to add or subtract two Currency objects with different currency codes.
* Should be able to be multiplied by a Fixnum or Float and return a Currency object
* Currency.new should be able to take one argument with a currency symbol embedded in it, like "$1.20" or "€ 7.00", and figure out the correct currency code. It can also take two arguments like before, one being the amount and the other being the currency code.

CurrencyConverter objects:

* Should be initialized with a Hash of currency codes to conversion rates (see link to rates below)
* At first, just make this work with two currency codes and conversation rates, with one rate being 1.0 and the other being the conversation rate. An example would be this: `{USD: 1.0, EUR: 0.74}`, which implies that a dollar is worth 0.74 euros.
* Should be able to take a Currency object and a requested currency code that is the same currency code as the Currency object's and return a Currency object equal to the one passed in (that is, `currency_converter.convert(Currency.new(1, :USD), :USD) == Currency.new(1, :USD))`
* Should be able to take a Currency object that has one currency code it knows and a requested currency code and return a new Currency object with the right amount in the new currency code
* Should be able to be created with a Hash of three or more currency codes and conversion rates. An example would be this: `{USD: 1.0, EUR: 0.74, JPY: 120.0}`, which implies that a dollar is worth 0.74 euros and that a dollar is worth 120 yen, but also that a euro is worth `120/0.74 = 162.2` yen.
* Should be able to convert Currency in any currency code it knows about to Currency in any other currency code it knows about.
* Should raise an `UnknownCurrencyCodeError` when you try to convert from or to a currency code it doesn't know about.

## Hard Mode

Build a third class called CurrencyTrader.  CurrencyTrader should be initialized with two CurrencyConverter objects from two different points in time, plus a starting Currency.  CurrencyTrader should have a method which returns the best currency investment over that span of time.

For instance, if you are starting with $1,000,000, assume that you can convert your dollars to one currency at the first point in time, but that you must then convert it back to dollars at the second point in time.  The best bet given two CurrencyConverters may be GBP.  If USD -> GBP is 1 to 1 at the first point in time, then 1 to 0.5 at the second point in time, you can double your money.

You should not need to modify Currency or CurrencyConverter to get this to work, but if you see a path that involves modifying them and want to give it a shot, feel free.

## Nightmare Mode

You guessed it.  Modify your CurrencyTrader to accept an array of CurrencyConverter objects and a starting Currency.  If the length of the array is greater than 2, you can move your currency more than once, so long as it ends in the same currency code as it started.  Find the best set of currency trades for your money over time.

## Additional Resources

* A good site to get [real conversion rates](http://www.xe.com/currencyconverter/#rates)
* A list of [active currency codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)
