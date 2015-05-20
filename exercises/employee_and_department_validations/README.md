# Employee and Department Validations

## Description

Modify your existing employee and department code to prevent duplicate department names, empty employee names, and negative salaries.

## Instructions

Thus far, your database code has allowed records to be saved to data tables with no restrictions.  Now it's time to lock them down.  Using only `initialize` methods which call `super`, add the following restrictions to your code:

* Prevent employee records from being created without names.
* Prevent employee records from being created with negative salaries.
* Prevent department records from being created with duplicate names.

If you happen to finish this, add these restrictions at update time.  In other words, users should not be able to remove employee names from existing records (and so on).
