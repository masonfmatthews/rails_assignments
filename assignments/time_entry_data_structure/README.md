# Time Entry Data Structure

## Description

Create a data structure diagram for a web app that stores developer time entries.

## Objectives

After completing this assignment, you should be able to effectively...

* Create a visual database diagram
* Reason about complex data sources

## Deliverables

* **An ERD Diagram.** Create a database diagram in Lucidchart (or a similar tool).

Submit your homework via the class assignments Google Form.

## Normal Mode

If you happen to go to work for an agency/consultancy after finishing your studies, you'll find that the company has an important job: billing the customer appropriately for the number of hours worked.  Some agencies circumvent this by only assigning developers to projects for entire weeks, but others allow developers to work on multiple projects within a week (or even within a day).  This makes billing more complicated.

Your assignment is to design a data structure (visually, in a tool like Lucidchart) to store information about your company's development team, your company's projects, and hours worked across those projects.  Your data structure must capture the following:

* Developers have names, email addresses, and start dates with the company.
* Projects have names and start dates, and are assigned to a client.
* Clients have names and are assigned to an industry.
* A developer can be assigned to many projects.
* Conversely, a project can have many developers assigned to it.
* Developers can create time entries, which state:
  * Who did the work
  * Which project the time entry is for
  * Which day the developer worked
  * How long the developer worked
* A developer can be placed in groups.  For instance, two groups might be "Front End" and "Back End."
* Conversely, a group can have many developers placed into it.
* Developers can leave comments on a project.
* Developers can leave comments on a client.
* Developers can leave comments on an industry.

## Hard Mode

Add the following requirement to your data structure:

* Projects can have many tasks.  These tasks can be structured hierarchically.  For instance, the "Iron Yard Website Redesign" project could have two tasks within it: "Build marketing pages" and "Build administrative pages."  "Build administrative pages" could have tasks inside of it, like "Admins can edit list of campuses," "Admins can edit list of teachers," and so on.  This can go on for an arbitrary number of levels.
* Time entries will no longer be made for the project as a whole, but for the specific task the time was put against.
