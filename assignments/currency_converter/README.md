# Currency Converter

## Description

Build on the Currency assignment.  Create a ruby class for converting currencies using Test-Driven Development.

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

CurrencyConverter:

* Should be created with a Hash of currency codes to conversion rates (see below)
* At first, just make this work with two currency codes and conversation rates, with one rate being 1.0 and the other being the conversation rate (like this: {USD: 1.0, EUR: 0.74})
* Should be able to take a Currency object and a requested currency code that is the same currency code as the Currency object's and return a Currency object equal to the one passed in (that is, currency_converter.convert(Currency.new(1, :USD), :USD) == Currency.new(1, :USD))
* Should be able to take a Currency object that has one currency code it knows and a requested currency code and return a new Currency object with the right amount in the new currency code
* Should be able to be created with a Hash of three or more currency codes and conversion rates
* Should be able to convert Currency in any currency code it knows about to Currency in any other currency code it knows about.
* Should raise an UnknownCurrencyCodeError when you try to convert from or to a currency code it doesn't know about.

Currency (addition to earlier code):

* Currency.new should be able to take one argument with a currency symbol embedded in it, like "$1.20" or "€ 7.00", and figure out the correct currency code. It can also take two arguments like before, one being the amount and the other being the currency code.

## Normal Mode

Normal Mode description

## Hard Mode

Hard Mode description

## Additional Resources

* A good site to get [real conversion rates](http://www.xe.com/currencyconverter/#rates)
* A list of [active currency codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)
