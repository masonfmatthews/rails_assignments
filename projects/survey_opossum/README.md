# Survey Opossum

## Description

SurveyMonkey has started charging $4 billion per survey (not really, but go with us here). Their customers are (understandably) outraged. Being the savvy entrepreneurs that you are, you spot an opportunity and jump on it. Time to build the SurveyMonkey killer!

## Objectives

### Learning Objectives (Front End)

After completing this assignment, you should...

* Understand the concept of factory objects
* Know how to build a UI that runs on Rails

### Learning Objectives (Rails)

After completing this assignment, you should...

* Understand relational and normalized database concepts
* Understand how Rails models and associations map to database concepts
* Know how to build back-end code to enable a rich user interface

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Design a data structure to handle a complex set of workflows
* Work on a project with multiple developers
* Resolve merge conflicts in git
* Model and query relational databases with ActiveRecord and AREL
* Build different views of the same data for different types of users
* Restrict access to parts of an application based on identity

## Details

### Deliverables

* **A Data Structure Diagram.** Before writing any code, review the requirements below and draw a data structure diagram for this project.  It should include:
  * A box for each table
  * Each field you'll need for each table inside its box
  * A data type for each field
  * A mark to indicate that it's a required field
  * Relationships between each pair of tables with a primary/foreign key pair
* **A github organization.** Create an organization in github to represent your team for this project.  Give all team members full rights.
* **A Repository.** Create a new repository under your github organization's account.
* **A README.** Your README should describe the application and include a link to the live version on Heroku.
* **A Working App.** See the requirements below!

### Requirements

During this project, you'll be paired up with someone from the other class, and your goal will be to build Survey Opossum, the SurveyMonkey killer.  Your instructors can count on 42 hands the number of times they've had to write a form/survey builder, so, theythinks ye shall do the same.

In summary, users should be able to sign up and create their own surveys, entering questions to be asked, possible answers, and other assorted details.  Once the survey is complete, the survey author should be able to send links to their new surveys out to anyone with an e-mail address.  Survey takers can submit their answers, and then survey authors can look back at any time to see the results.

Detailed requirements are given for different modes below.  Note that these requirements talk about authors (those who have written surveys) and takers (who may also be authors, but who are currently in the process of taking a survey).

## Normal Mode

Signup

* New authors can sign up

Survey Creation

* Authors have a "my surveys" screen that lists all the surveys they have created
* Authors can create a new survey
* Authors can delete a survey (that they authored)
* Authors can mark textual answers as required
* Authors can save their own surveys
* Authors can edit their own surveys
* Surveys must have:
  * Title (required)
  * Description (optional)
  * A list of questions
* Every question has:
  * Question text (required)
  * Question description (optional)
* There are four types of questions that should be supported:
  * Yes/no
    * The yes and no labels should be editable in the survey designer
    * This displays as either two radio buttons or a toggle checkbox
  * Short answer
    * This displays as a textbox
  * Long answer
    * This displays as an auto-expanding textarea
  * Single choice (from multiple options)
    * The set of possible options should be editable in the survey designer
    * The author must select at least two possible choices
    * This displays as either a set of radio buttons or a select field (dropdown)
* Questions can be reordered
  * This does not have to be a drag/drop implementation it can be more naive
    * (e.g. a move up / move down button on each question)
* Publishing a survey works as follows:
  * The survey must have at least one question to be published
  * When published, user is presented a link that they can send to people to take the survey.

Notifications

* If a taker has given a link to a survey,
  * She can follow the link which will take her directly to the survey
  * She can complete the survey in her browser.

Taking a Survey

* Takers cannot change their answers once they have submitted a survey
* Takers can take the survey as many times as they want
* Takers cannot submit a survey until the required fields have been filled in
* Authors cannot edit a survey after it has been taken by anyone

Viewing Results

* Authors can view all of the answers for any survey they have created
  * This displays a question, followed by all of the answers for that question


## Hard Mode

Survey Creation

* Authors can drag-and-drop questions
* Authors can add "Other" as an option to single-select multiple choice questions
  * At design time:
    * There should be a checkbox "allow other"
    * If selected, those surveyed can enter their own text as an answer
  * When the survey is being filled out:
    * If the "allow other" option was specified at design-time,
      * The user can check the option: "other", and a textbox will appear
* Authors can create multi-select multiple choice questions
  * This is very similar to the single-select question mentioned in Hard Mode, except when taking the survey, takers can select any number of answers.

Viewing Results

* Authors can export the results of their survey (in CSV)
* When a survey author views survey results
  * He should be given the option to view an aggregate report
    * For yes/no questions and single-choice questions:
      * Show each possible answer along with the percentage of people who chose that answer
    * For textual questions:
      * Show the answers in a list

## Nightmare Mode

Survey Creation:

* Authors can add questions which only appear to takers if the taker selected a particular answer to an earlier question.  In other words, perhaps question 3 only appears if the answer to question 1 was "Donkey."  Note that this answer-checking could be done on Yes/No answers, multiple choice answers, or textual answers.

Viewing Results:

* Graph the answers.

That's the only description you get for Nightmare Mode.  Make it work, make it awesome, and definitely use JavaScript.
