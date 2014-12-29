# Currency

## Description

Create a ruby class for storing currencies using Test-Driven Development.

## Objectives

### Learning Objectives

After completing this assignment, you should…

* Understand some key concept

### Performance Objectives

After completing this assignment, you be able to effectively use

* Use some tool or technique

## Details

### Deliverables

* A repo containing at least:
  * `foo.bar`

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

## Additional Resources

* A good site to get [real conversion rates](http://www.xe.com/currencyconverter/#rates)
* A list of [active currency codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)
