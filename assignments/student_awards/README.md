# Student Awards

## Description

Given an existing application with code duplication, sloppy routing, and limited tests, modify the application to use partials, helpers, and REST.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand REST
* Understand basic routing
* Understand the benefits of code consolidation tools like partials and helpers

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Use rails partials
* Use rails helpers
* Use Bourbon (and related tools) in a Rails app
* Delete tests
* Write integration/controller tests in advance of writing features.

## Details

### Deliverables

* **A Repository.** Fork this repository to your own github account.
* **A README.** Wipe out this README and write your own.
* **A Working App.**
* **A Test Suite.** Yes, this app already has one, but you have to admit that it's bad.  Leave it better than you found it.  In this case and all cases, you have to be okay with deleting tests.  Take a deep breath.  You can do it.  There.  Didn't that feel good?

### Requirements

* Your code should have at least two partials.
* At least one of your partials should call another partial.
* Use at least one helper.
* Write at least one test to ensure that your helper works.
* Create at least one fully REST-compliant controller (and set of routes and views).
* Make it look usable.  You have bourbon, neat, and bitters installed; feel free to add refills.
* Write an integration test to allow users to create more than one award for a particular student at a time.  Then write code.

## Normal Mode

Overall, this assignment asks you to clean up an application with suboptimal code.  The funny part is that the code feels somewhat reasonable when you look at it for the first time (the app itself is horrificly ugly, but let's not bash the creator, eh?).

This application is bad because it's going to be nasty to work with moving forward.  It will be hard to make links to other parts of the application, if changes need to happen on one page, you'll probably have to make the same code changes on other pages, and the lame tests aren't going to help you catch errors in the future.

Your task today is to meet all of the requirements above, which will go a long way towards making this app more maintainable in the future.

## Hard Mode

From the main page (which lists all teachers), allow users to add many awards for different students at the same time.  Use TDD.

## Additional Resources

* [Bourbon, Neat, etc](http://bourbon.io/)
