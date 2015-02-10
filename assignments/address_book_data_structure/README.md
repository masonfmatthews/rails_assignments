# Address Book Data Structure

## Description

Create a data structure diagram for a web app that stores address book information.

## Objectives

After completing this assignment, you should be able to effectively...

* Create a visual database diagram
* Reason about complex data sources

## Deliverables

* **An ERD Diagram.** Create a database diagram in Lucidchart (or a similar tool).

Submit your homework via the class assignments Google Form.  Put the link to your diagram in the github repository field.

## Normal Mode

The Contacts/Address Book app on your phone does quite a lot, even if you don't use it all.  You will eventually be building an address book application, and tonight's homework is to design its data structure.  Your data structure should allow for the following:

* The address book can store information for many contacts.
* Contacts can be either people or companies/organizations.
* Basic information such as first name, last name, title, birthday, etc can be stored for each contact.
* Each contact can have any number of telephone numbers
* Each contact can have any number of email addresses
* Each contact can have any number of addresses
* Each address is composed of a city, state, zip, and any number of street address lines
* Each telephone number, email address, and address can be assigned a type (e.g. Home, Work, Mailing, Fax, etc).
* Each contact can have any number of notes.
* The address book can have groups.  You may, for instance, have a group of "High School Friends" and put how ever many contacts you want into that group.  A given contact may also be in more than one group at a time.

If you finish creating the data structure, you can get a head start on the next day's assignment.  Create a new Rails app called address_book.  Only create contacts, telephone_numbers, and telephone_types for now, as those are the only tables (and related views) that you'll be working on during the next assignment.  

## Hard Mode

Add the following requirement to your data structure:

* Each contact can have relationships with other contacts.  In other words, Sarah Smith can be marked as Jane Smith's mother.
