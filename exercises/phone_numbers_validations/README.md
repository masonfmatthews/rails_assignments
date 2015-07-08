# Phone Numbers Validations

## Description

Modify your existing address book code to prevent empty phone numbers, empty last names, duplicate phone numbers, and duplicate full names.

## Instructions

Thus far, your database code has allowed records to be saved to data tables with no restrictions.  Now it's time to lock them down.  Using only `initialize` methods which call `super`, add the following restrictions to your code:

* Prevent person records from being created without a `last_name`.
* Prevent phone number records from being created without a `phone_number`.
* Prevent phone number records from being created with a number which is already in the database.
* Prevent person records from being created with a full name (first name and last name together) which is already in the database.

If you happen to finish this, also add these restrictions at update time.  In other words, users should not be able to remove last names from existing records (and so on).
