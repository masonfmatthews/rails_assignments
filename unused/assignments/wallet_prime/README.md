# Wallet Prime

## Description

Start from your existing Wallet application and add the ability to track multiple accounts.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand basic model associations
* Understand the workflow for modifying an existing data structure

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Use basic relation methods (e.g. `.order` and `.where`)
* Build data tables with associations between them
* Create a second scaffold in an existing application to manage supporting data

## Details

### Deliverables

* **A Repository.**
* **A Working Rails App on Heroku.**
* **A README.**

## Normal Mode

In this assignment, you will be increasing the usefulness of your Wallet app.  Rather than only keeping track of your debit card transactions, you will now be able to track multiple accounts (e.g. checking, savings, cash, etc).

This improvement will require changes to the data structure, your models, your controllers, and your views.  On the broadest scale, you should perform the following steps:

* Add an accounts table and model.  
* Add a relationship between transactions and accounts.  Add `belongs_to`, `has_many`, and `validates` as needed.
* Add a dropdown field on your `transaction/edit` page for selecting the account for each transaction.  
* Change your index page to either:
  * add a column to your transactions HTML table which displays the account, or
  * show multiple tables on the index page, one for each account.
* For each statistic that you show, break it out into multiple statistics, one for each account.
