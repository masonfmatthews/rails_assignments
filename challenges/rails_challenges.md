## Rails Challenges

#### Router

* Create a root route to point to the `form` action in the `home` controller.

* Make it possible to also type `localhost:3000/home/form` and get the same page.

* Note that when you load the root path and fill in the form, it cannot be submitted.  Add a route to allow this form to be submitted successfully.  You should have to change nothing outside `routes.rb`.

* The view does an `if params[:name]` check.  This is a code smell.  How could you do this better?

#### Dev vs. Prod

* Modify the Gemfile to use the 'puma' server in production.

* Set an environment variable called `API_KEY` which is only available in development.

* What is a better approach to storing environment variables?

* Do you ever run migrations on the test database?

#### ActiveRecord

* Create a migration for storing survey results submitted on `home/form`.  It needs five fields (matching the HTML form fields), plus an `id` field.

* Whenever the form is submitted, create a new record in the database.

* Change the "Thank You" view to show information out of the database rather than out of params.

* This migration was probably pretty dissatisfying to create.  How would you change your migration to make the survey more flexible in the future?

#### REST

* Having both the form and the thank-you page in one action is suboptimal.  Restructure the `home` controller to implement REST.

* You may wish that I had not asked you to restructure the `home` controller.  What would you rather have done instead?

#### HTML Forms

* Edit an existing form response.  Uncheck a box which you had previously checked.  When you go back to view that response, the box will still be checked.  RAGE!  Fix this bug.

* Can you think of a better user interface for this information rather than showing a series of checkboxes?

#### Helpers and Partials

* The form currently has four mostly-repeated lines to show the checkboxes.  The thank-you page also has four mostly-repeated lines to display the results.  DRY out this duplication.

* When are partials better to use than helpers?  When is the opposite true?

#### Session

* Modify your data table and your action so that there is some way to group responses together based on which user wrote them.  Do this without creating a user model or checking to see if the "Name" fields are equal.

* Alternatively, prevent any user from submitting the form more than once (even if he/she hits back).

* Why is it bad to see if the name fields are equal?

#### Scope and Authorization

* Modify your results index page so that the user only sees results which he or she wrote.  Use a scope.

* Modify the results' show, edit, and destroy pages so that the user is redirected if he/she didn't create that particular result.

* (Teacher hint: see if they caught to also do update)

#### JavaScript

* When the button to submit the form is clicked, disable the button so that the user cannot double-click.  Do not use jQuery.

#### jQuery

* Using jQuery, hide the checkboxes until the user types in a name.

* If the user deletes the name, hide the checkboxes again.
