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
