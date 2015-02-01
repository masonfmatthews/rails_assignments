# Menu

## Description

Create an online menu for a restaurant with a fixed number of categories and images for each category.  Allow users to enter new menu items and display them on a single menu page.

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand REST and when to break it
* Understand the Rails Asset Pipeline
* Understand how Rails uses gems
* Understand basic model associations

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Use images as part of the Asset Pipeline
* Use SCSS as part of the Asset Pipeline
* Utilize Rails redirects
* Use Heroku to serve up images from the asset pipeline
* Start putting cleaner style on your apps
* Build data tables with associations between them

## Details

### Deliverables

* **A Repository.** Fork this repository to your own github account.
* **A README.** Wipe out this README and write your own.  It should include a link to the app running on Heroku.
* **A Working Rails App.**
* (No test suite quite yet)

## Normal Mode

Your goal in this project is to create a webapp for a restaurant.  This app will allow the restaurant to display their menu in an appealing format on the web, but will also allow them to edit their items as time passes.

This application will require the following:

* At least two models: Item and Category.  An example of an item is "Meatloaf" and an example of a category is "Entrees".  Items should have prices, names, and descriptions.
* The Bourbon, Neat, and Bitters gems.
* The index page for all items should be an appealing menu, not a simple table with a list of all items.  The items should be grouped into categories.
* Each category should have an image associated with it, and the category's image should be displayed somewhere in its group.
* Users should be able to edit the item's information by clicking on the item's name.
* Users should be able to destroy an item by going to the item's edit page and then hitting a delete button on that page.
* Users should not be able to edit categories.  Those should be set up by developers (even though they are stored in the database).
* The show page for each item should redirect to the edit page, not show the show page.
* The application should utilize the nesting property of SCSS.
* The application should be deployed to Heroku.


## Hard Mode

Hard mode requires the addition of two features:

* Users should be able to upload images for each item, and only SOME of them should be displayed on the menu.  Figure out some way to show only those marked as the best.  This is harder, and can't be accomplished with just the Asset Pipeline (afaik).
* Add another layer of complexity to the menu.  Menus can now have mealtimes (breakfast, lunch, dinner).  Each mealtime will still have categories, which will still have items.

## Additional References

* [Bourbon, Neat, Bitters](http://bourbon.io/)
* [SCSS Guide](http://sass-lang.com/)
* [The Asset Pipeline on Heroku](https://devcenter.heroku.com/articles/rails-4-asset-pipeline)
