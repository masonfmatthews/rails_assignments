# Wallet

## Description

Build a Rails app to tell you how much money you have right now.  The application will have one data table of transactions, simple edit/create forms, and a total amount displayed on the index page.

## Objectives

After completing this assignment, you should...

* Understand how to create a complete Rails app (with one database table)
* Understand all components of the MVC architecture
* Understand basic HTML forms
* Create and use an ActiveRecord model, a controller, multiple views, and a router.
* Create and use a Rails scaffold

## Deliverables

* **An estimate.**  After you read through this assignment (but before you start coding), write down a number of hours that you expect each part to take (1-3).  Record your hours as you go.
* **A repository.** Create a new repository.  Commit often, not just at the end.
* **A README.** Create a README that describes the purpose of this project and the steps necessary to set it up and use it.
* **A test suite.** Build your application using TDD.  Your test suite must include unit tests, controller tests, and at least two integration tests.
* **A reflection on your estimate.**

## Normal Mode

Assume that you only (ever) pay for things with your debit card.  In order to avoid spending more than you have, you want to build an application to keep track of how much money exists in your account.  You'll need to be able to make deposits and withdrawals, and you'll store each of these as a record in your data table.

This application will be built around a set of scaffold-like views (for editing transactions), but it will include an additional page at the root of the application.

* The user should be able to go to the root URL of the application and see:
  * the total amount of money in his/her account.
  * the number of transactions on the account.
* The user should be chastised vehemently if the balance on the account is negative.
* The user should be able to see all transactions, add new transactions, and edit or delete existing transactions.  The total and count on the root page should update as these transactions change.

Regarding the code:

* Make sure to have a database column which shows the name of the person/organization receiving the money.
* You will be tempted to create two columns (one for credits and another for debits).  That is not the only option.
* Choose wisely between float and decimal.
* Hint: the word "transaction" is a bit risky in Rails.  You can name a table `transactions` and a model `Transaction`, but you should not have any fields/columns in your database called `transaction`.  If you can think of a better name than "transaction" for the event of spending or depositing money, feel free to use it!

The first transaction in the application will be something like "Initial Deposit," so you'll assume that the account has $0 in it prior to the initial deposit.

## Hard Mode

Add more statistics to the index page, including the following:

* The total amount spent in the current calendar month
* The total amount spent in the prior calendar month
* The total number of transactions in the current calendar month
* The total number of transactions in the prior calendar month
* The biggest expense in the current calendar month
* The biggest expense ever
* The name of the place/person where you have spent the most money (over all time)
