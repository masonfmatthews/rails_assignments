# Delayed Mailer

## Description

Given an existing application with a long-running view, modify the application to ask for the user's e-mail address, then send the information by e-mail using background processing and ActiveJob.

## Objectives

After completing this assignment, you should...

* Understand how mail can (and when mail should) be sent from a Rails application
* Be able to create jobs for resource-intensive tasks using ActiveJob.
* Be able to send mail later using ActionMailer.
* Be able to save files for later use on Amazon S3.

## Deliverables

* **An estimate.**  After you read through this assignment (but before you start coding), write down a number of hours that you expect this assignment to take.  Record your hours as you go.
* **A repository.** You will be working from your existing application.
* **A test suite.** Extend your application using TDD.  Your test suite must include unit tests, controller tests, and at least two integration tests.
* **A reflection on your estimate.**

## Normal Mode

In an earlier homework, you modified an existing application to improve its efficiency.  That application had a large number of records (on the order of 500,000), and when you generated the list page, it was returned in a couple of seconds.  Depending on your customer, this may or may not be reasonable.  However, once the number of records increases by a factor of 10, it will certainly no longer be reasonable.

Your task tonight is to offload the generation of this index page to a background job.  Instead of the index page showing the list, it should ask the user for an e-mail address.  The user should be able to enter his or her e-mail address, then be immediately presented with a confirmation notice stating that the information will be sent to that e-mail address.

Your controller action which receives this e-mail address should queue up a message to be delivered later via a background process.  When the background job is picked up off the queue, that process should do the work of querying the database and generating the report.  The report should then be e-mailed to that e-mail address.

In addition, the report itself should not be attached to the e-mail.  It should be created in a CSV file and saved to Amazon S3 using paperclip.  The email should include a link to the file stored on S3.

This has the advantage of giving the user a quick web application response time and doing the heavy lifting asynchronously.

## Hard Mode

First, get your app running on Heroku!  You will need a plugin like SendGrid or MailGun.

Although running the database queries asynchronously is a big advantage, it still has the potential to slow down the entire server.  If we're doing enough work at any particular point in time, the server will still be slow about handing small web requests.

Rather than having the e-mail be delivered "later" in the standard ActiveJob sense, only allow these messages to be generated between the hours of midnight and 4 am.  This will prevent any web application users from seeing a slowdown.

## Notes

* [Delayed Job](https://github.com/collectiveidea/delayed_job)
* [Active Job Rails Guide](http://edgeguides.rubyonrails.org/active_job_basics.html)
* [Action Mailer Rails Guide](http://guides.rubyonrails.org/action_mailer_basics.html)
