## Rails Challenge Drafts

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

#### AREL

* Write an AREL query to return all responses that were created in the last week.

* Write an AREL query to return all responses with names that start with "M".

* Write an AREL query to return all responses with three or more favorites.
