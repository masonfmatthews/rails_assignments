# Legacy Associations and Validations

## Description

Take an existing legacy codebase with no associations or validations and add them.

## Objectives

After completing this assignment, you should...

* Become more comfortable working with code which you did not write
* Become more comfortable adding functionality to an existing codebase
* Understand how two developers can work on the same codebase
* Be able to branch your code
* Be able to handle merge conflicts
* Be able to write associations
* Be able to write validations
* Be able to add tests to verify associations and validations

## Deliverables

* **A GitHub organization.**  Your team should create a new organization in GitHub for this assignment.
* **A pull request to this repository.**  Fork this repository to your organization, do the work, then create a pull request.
* **A modified README.**
* **A test suite.**  This test suite must be written using TDD.

This means that BEFORE adding any of these validations or associations you must:

* Write a new test.
* Run your tests and see that ONLY the new one fails (but make sure that it DOES fail).
* Write code to make the test pass.
* Run your tests and see that all tests pass.
* (Repeat those last two as necessary.)

Use the homework submission form on the course website to state when you are done.

## Normal Mode

Your assignment is to take the existing code in this folder and add associations and validations to it.  You will be working with a partner, but you will be branching your code, splitting the tasks amongst the two of you, and working on them separately.  Once you have finished your separate tasks, then you will merge your branches together and deal with any merge conflicts that arise.

If you would like, you can merge your branches more than once.

The tasks will be divided as follows.  "Associate" means to place `has_many`, `belongs_to`, `has_and_belongs_to_many`, etc in the appropriate classes.  "Validate" means to use `validates` in the appropriate classes with the appropriate parameters.

Person A:

* Associate `schools` with `terms` (both directions).
* Associate `terms` with `courses` (both directions).  If a term has any courses associated with it, the term should not be deletable.
* Associate `courses` with `course_students` (both directions).  If the course has any students associated with it, the course should not be deletable.
* Associate `assignments` with `courses` (both directions).  When a course is destroyed, its assignments should be automatically destroyed.
* Associate `lessons` with their `pre_class_assignments` (both directions).
* Set up a School to have many `courses` through the school's `terms`.
* Validate that Lessons have `names`.
* Validate that Readings must have an `order_number`, a `lesson_id`, and a `url`.
* Validate that the Readings `url` must start with `http://` or `https://`.  Use a regular expression.
* Validate that Courses have a `course_code` and a `name`.
* Validate that the `course_code` is unique within a given `term_id`.
* Validate that the `course_code` starts with three letters and ends with three numbers.  Use a regular expression.

Person B:

* Associate `lessons` with `readings` (both directions).  When a lesson is destroyed, its readings should be automatically destroyed.
* Associate `lessons` with `courses` (both directions).  When a course is destroyed, its lessons should be automatically destroyed.
* Associate `courses` with `course_instructors` (both directions).  If the course has any instructors associated with it, the course should not be deletable.
* Associate `lessons` with their `in_class_assignments` (both directions).
* Set up a Course to have many `readings` through the Course's `lessons`.
* Validate that Schools must have `name`.
* Validate that Terms must have `name`, `starts_on`, `ends_on`, and `school_id`.
* Validate that the User has a `first_name`, a `last_name`, and an `email`.
* Validate that the User's `email` is unique.
* Validate that the User's `email` has the appropriate form for an e-mail address.  Use a regular expression.
* Validate that the User's `photo_url` must start with `http://` or `https://`.  Use a regular expression.
* Validate that Assignments have a `course_id`, `name`, and `percent_of_grade`.
* Validate that the Assignment `name` is unique within a given `course_id`.

Don't forget to write tests for each of these before coding them!


## Hard Mode

After merging, add the following validations and associations, then merge again:

Person A:

* Associate `course_instructors` with `instructors` (who happen to be users)
* Associate `assignments` with `assignment_grades` (both directions)
* Set up a Course to have many `instructors` through the Course's `course_instructors`.
* Validate that an Assignment's `due_at` field is not before the Assignment's `active_at`.

Person B:

* Associate CourseStudents with `students` (who happen to be users)
* Associate CourseStudents with `assignment_grades` (both directions)
* Set up a Course to have many `students` through the course's `course_students`.
* Associate a Course with its ONE `primary_instructor`.  This primary instructor is the one who is referenced by a course_instructor which has its `primary` flag set to `true`.

Again, don't forget to write tests!

## Nightmare Mode

Although you've set up associations between these records, there's no telling what order the associated records will come back in.  For instance, when you call `course.assignments`, they may or may not be sorted by the due date.

After merging hard mode, modify the associations to do the following, then merge again:

Person A:

* A Course's `assignments` should be ordered by `due_at`, then `active_at`.

Person B:

* A Course's `students` should be ordered by `last_name`, then `first_name`.

Then, together:

* Associate Lessons with their `child_lessons` (and vice-versa).  Sort the `child_lessons` by `id`.

(And, of course, tests tests tests).
