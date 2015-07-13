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

* **An estimate.**  After you read through this assignment (but before you start coding), write down a number of hours that you expect this assignment to take.  Record your hours as you go.
* **A repository.** Create a new repository.  Commit often, not just at the end.
* **A README.** Create a README that describes the purpose of this project and the steps necessary to set it up and use it.
* **A test suite.** Build your application using TDD.  Your test suite must include unit tests and controller tests, and at least two of each must have been written by you.
* **A reflection on your estimate.**

## Normal Mode

#### Part One

Assume that you only (ever) pay for things with your debit card.  In order to avoid spending more than you have, you want to build an application to keep track of how much money exists in your account.  You'll need to be able to make deposits and withdrawals, and you'll store each of these as a record in your data table.

This application will be built around a set of scaffold-like views (for editing transactions), but it will include an additional page at the root of the application.

* The user should be able to go to the root URL of the application and see a dashboard.  The dashboard should include:
  * the total amount of money in his/her account (this should be a method which is tested!)
  * a link to the list of transactions
  * a link to create a new transaction
* The user should be chastised vehemently if the balance on the account is negative.
* The user should be able to see all transactions, add new transactions, and edit or delete existing transactions.  The total and count on the root page should update as these transactions change.

Regarding the code:

* Make sure to have a database column which shows the name of the person/organization receiving the money.
* You will be tempted to create two columns for amounts (one for credits and another for debits).  That is not the only option.
* Choose wisely between float and decimal.
* Hint: the word "transaction" is a bit risky in Rails.  You can name a table `transactions` and a model `Transaction`, but you should not have any fields/columns in your database called `transaction`.  If you can think of a better name than "transaction" for the event of spending or depositing money, please use it!

The first transaction in the application will be something like "Initial Balance," so you'll assume that the account has $0 in it prior to the initial deposit.

#### Part Two

Add more statistics to the dashboard page, including the following:

* The total number of transactions on the account.
* The total amount spent in the current calendar month
* The total amount spent in the prior calendar month
* The total number of transactions in the current calendar month
* The total number of transactions in the prior calendar month
* The biggest expense in the current calendar month
* The biggest expense ever
* The name of the place/person where you have spent the most money (over all time)

Each of these should be a method somewhere on a model, and EACH SHOULD BE TESTED.  

Finally, make the dashboard look nice and cleanly organized.

## Hard Mode

Time to increase the usefulness of your Wallet app.  Rather than only keeping track of your debit card transactions, you will now be able to track multiple accounts (e.g. checking, savings, cash, etc).

This improvement will require changes to the data structure, your models, your controllers, and your views.  In broad terms, you should perform the following steps:

* Add an accounts table and model.
* Add HTML views (and a new controller) to allow you to manage the accounts.
* Add a relationship between transactions and accounts.  Add `belongs_to`, `has_many`, and `validates` as needed.
* Add a dropdown field on your `transactions/edit` page for selecting the account for each transaction.  
* Change your `transactions/index` page to either:
  * add a column to your transactions HTML table which displays the account, or
  * show multiple tables on the index page, one for each account.
* For each statistic that you show on the dashboard, break it out into multiple statistics, one for each account.

Make sure that your test suite covers all of this!
