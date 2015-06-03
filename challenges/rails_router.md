## RAILS: Router Challenge

As with all Rails challenges, work from the `tabula_railsa` project provided for your particular class.

* Create a root route to point to the `form` action in the `home` controller.

* Make it possible to also type `localhost:3000/home/form` and get the same page.

* Note that when you load the root path and fill in the form, it cannot be submitted.  Add a route to allow this form to be submitted successfully.  You should have to change nothing outside `routes.rb`.

* Reflect: The view does an `if params[:name]` check.  This is a code smell.  How could you do this better?
