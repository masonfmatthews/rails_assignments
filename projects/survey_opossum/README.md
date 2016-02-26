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

* **A data structure diagram.** Before writing any code, review the requirements below and draw a data structure diagram for this project.  It should include:
  * A box for each table
  * Each field you'll need for each table
  * A data type for each field
  * A mark to indicate that it's a required field
  * Relationships between each pair of tables with a primary/foreign key link
* **A workflow diagram.**  Any format is fine, including paper.
* **A GitHub organization.** Create an organization in GitHub to represent your team for this project.  Give all team members full rights.
* **A repository.** Create a new repository under your GitHub organization's account.
* **A README.** Your README should describe the application and include a link to the live version on Heroku.
* **A working app.** See the requirements below!

### Requirements

During this project, you'll be paired up with folks from the other class, and your goal will be to build Survey Opossum, the SurveyMonkey killer.  Your instructors can count on 42 hands the number of times they've had to write a form/survey builder, so, theythinks ye shall do the same.

In summary, users should be able to sign up and create their own surveys, then enter questions to be asked, possible answers, and other assorted details.  Once the survey is complete, the survey author should be given a link which he/she give to anyone.  Survey takers can follow the link (without logging in) and submit their answers.  Survey authors can then look back and see the results which have accumulated.

Detailed requirements are given for different modes below.  Note that these requirements refer to users as "authors" (those who have logged in and written surveys) and "takers" (who may also be authors, but who are currently in the process of taking a survey).

## Normal Mode

Signup

* New authors can sign up

Survey Creation

* Authors have a "my surveys" screen that lists all the surveys they have created
* Authors can create a new survey
* Authors can mark questions as required
* Authors can edit their own surveys
* Authors can delete a survey (that they authored)
* Surveys must have (at least):
  * Title (required)
  * Description (optional)
  * A set of questions
* Every question has (at least):
  * Question text (required)
  * Question description (optional)
* There are three types of questions that should be supported:
  * Yes/no
    * The yes and no labels should be editable in the survey designer
    * This displays as either two radio buttons or a toggle checkbox
  * Short answer
    * This displays as a textbox
  * Long answer
    * This displays as an auto-expanding textarea
* Questions can be reordered
  * This does not have to be a drag/drop implementation; it can be more naive (e.g. a move up / move down button on each question)
* Publishing a survey works as follows:
  * By default, surveys are not published.  The author must choose to publish a survey.
  * The survey must have at least one question before it can be published.
  * When published, the author is immediately presented a link that they can send to people to take the survey.

Taking a Survey

* If a taker has a link to a survey:
  * The taker can follow the link directly to the survey
  * The taker can complete the survey in a browser
* Takers cannot change their answers once they have submitted a survey
* Takers can take the survey as many times as they want
* Takers cannot submit a survey until the required fields have been filled in
* Authors cannot edit a survey after one or more submissions have been made for the survey

Viewing Results

* Authors can view all of the answers for any survey they have created
* In this view, answers are grouped by question

## Hard Mode

Authors can create a fourth question type: dropdown.

* Authors can choose to make any question a dropdown question.  Dropdown questions will still have text and description fields.
* When creating a dropdown question, the author will have to enter a list of all possible answers.
* The author must give at least two possible answers for each dropdown question before the survey can be saved.
* Takers will see a select field (dropdown) for each dropdown-type question.  The default value shown to takers will be blank.
* If a dropdown question is required, takers cannot leave the dropdown on the blank option when submitting their answers.

## Nightmare Mode

Survey Creation

* Authors can drag-and-drop questions
* Authors can add "Other" as an option to single-select multiple choice questions
  * At design time:
    * There should be a checkbox "allow other"
    * If selected, those surveyed can enter their own text as an answer
  * When the survey is being filled out:
    * If the "allow other" option was specified at design-time, the user can check the option: "other", and a textbox will appear
* Authors can create multi-select multiple choice questions
  * This is very similar to the Dropdown question type, except when taking the survey, takers can select any number of answers, not just one.

Viewing Results

* Authors can export the results of their survey (in CSV)
* When a survey author views survey results
  * He should be given the option to view an aggregate report
    * For yes/no questions and single-choice questions:
      * Show each possible answer along with the percentage of people who chose that answer
    * For textual questions:
      * Show the answers in a list

## Apocalypse Mode

Survey Creation:

* Authors can add questions which only appear to takers if the taker selected a particular answer to an earlier question.  In other words, perhaps question 3 only appears if the answer to question 1 was "Donkey."  Note that this answer-checking could be done on Yes/No answers, multiple choice answers, or textual answers.

Viewing Results:

* Graph the answers.  That's the only description you get.  Make it work, make it awesome, and definitely use JavaScript for the graphs.
