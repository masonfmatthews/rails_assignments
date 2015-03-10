# Reports on S3

## Description

Given an existing application which generates a report from a large data set, store that report as a file on Amazon S3 to improve runtime when requesting it again.

## Objectives

After completing this assignment, you should...

* Understand how files can be stored in cloud services like Amazon S3.
* Understand how reports can be cached to save on execution time.
* Be able to integrate a Rails application with your S3 account.
* Be able to add files to and read files from S3.

## Deliverables

* **A Repository.** You will be working from an existing application.  Your instructor will provide that link.

## Normal Mode

In last night's homework, you improved the efficiency of an application by offloading report generation to a background process.  This was helpful, but we can take it yet another step further.  Since we have thousands of users, the same report is likely to be requested by more than one user.

Your task in this assignment is to store each report in a file (HTML or CSV is fine, but feel free to get creative).  If a particular report that a user requests has already been generated, don't regenerate it, but just send it again.

Since your theoretical end goal (not tonight) is to deploy this application on a service like Heroku, you're not going to be able to store these files in a local folder.  You'll instead have to use Amazon's S3 storage service.  Write these files to S3 when they are generated and pull them down when they are requested again.

## Hard Mode

Because you don't want to incur extra costs from using too much space on S3, implement a cache invalidation strategy for these files.  Once per evening, delete all cached reports.
