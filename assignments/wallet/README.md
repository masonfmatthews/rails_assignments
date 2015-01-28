# Wallet

## Description

Build a Rails app to tell you how much money you have right now.  The application will have one data table of transactions, simple edit/create forms, and a total amount displayed on the index page.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand how to create a basic Rails app (with one database table)
* Understand the MVC architecture
* Understand GET and POST
* Understand basic HTML forms

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Generate a new Rails app
* Create and use an ActiveRecord model

## Details

### Deliverables

* **A Repository.** Fork this github repository, then clone it to your local machine, cd into the directory, and call `rails new .`.  Commit often, not just at the end.
* **Your Second Rails App!**
* **A README.** Create a README that describes the purpose of this project and the steps necessary to set it up and use it.

Create a pull request when you're done.

### Requirements

This application will be built around a set of scaffold-like views (for editing transactions), but it will include an additional page at the root of the application.

* The user should be able to go to the root URL of the application and see:
  * the total amount of money in his/her account.
  * the number of transactions on the account.
* The user should be chastised vehemently if the balance on the account is negative.
* The user should be able to see all transactions, add new transactions, and edit or delete existing transactions.  The total and count on the root page should update as these transactions change.

## Normal Mode

Assume that you only (ever) pay for things with your debit card.  In order to avoid spending more than you have, you want to build an application to keep track of how much money exists in your account.  You'll need to be able to make deposits and withdrawals, and you'll store each of these as a record in your data table.

The first transaction in the application will be something like "Initial Deposit," so you'll assume that the account has $0 in it prior to the initial deposit.

## Hard Mode

Extend this application to keep track of multiple accounts.  You could set up, for instance, a cash account, a checking account, two credit card accounts, and a savings account, then enter transactions against any of them.
