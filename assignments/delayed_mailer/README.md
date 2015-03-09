# Delayed Mailer

## Description

Given an existing application with a long-running view, modify the application to ask for the user's e-mail address, then send the information by e-mail using background processing and ActiveJob.

## Objectives

After completing this assignment, you should...

* Understand how and why applications run asynchronous background processes.
* Create jobs for resource-intensive tasks using ActiveJob.
* Send mail later using ActionMailer.

## Deliverables

* **A Repository.** You will be working from an existing application.  Your instructor will provide that link.

## Normal Mode

In last night's homework, you modified an existing application to improve its efficiency.  That application had a number of records on the order of 500,000, and when you generated the list page, it was returned in less than a second.  Depending on your customer, this may or may not be reasonable.  However, once the number of records increases by a factor of 10, it will no longer be reasonable.

Your task tonight is to offload the generation of this index page to a background job.  Instead of the index page showing the list, it should ask the user for an e-mail address.  The user should be able to enter his or her e-mail address, then be immediately presented with a confirmation notice stating that the information will be sent to that e-mail address.

Your controller action which receives this e-mail address should queue up a message to be delivered later via a background process.  When the background job is picked up off the queue, that process should do the work of querying the database and generating the report.  The report should then be e-mailed to that e-mail address.

This has the advantage of giving the user a quick web application response time and doing the heavy lifting asynchronously.

## Hard Mode

Although running the database queries asynchronously is a big advantage, it still has the potential to slow down the entire server.  If we're doing enough work at any particular point in time, the server will still be slow about handing small web requests.

Rather than having the e-mail be delivered "later" in the standard ActiveJob sense, only allow these messages to be generated between the hours of midnight and 4 am.  This will prevent any web application users from seeing a slowdown.


## Notes

* [Delayed Job](https://github.com/collectiveidea/delayed_job)
* [Active Job Rails Guide](http://edgeguides.rubyonrails.org/active_job_basics.html)
* [Action Mailer Rails Guide](http://guides.rubyonrails.org/action_mailer_basics.html)
