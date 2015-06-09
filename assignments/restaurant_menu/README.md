# Restaurant Menu

## Description

Create an online menu for a restaurant with a fixed number of categories and images for each category.  Allow users to enter new dishes and display them on a single menu page.

## Objectives

After completing this assignment, you should...

* Understand REST and when to break it
* Understand the Rails Asset Pipeline
* Understand how Rails uses gems
* Understand workflow design

After completing this assignment, you should be able to effectively...

* Use images as part of the Asset Pipeline
* Use SCSS as part of the Asset Pipeline
* Utilize Rails redirects
* Use Heroku to serve up images from the asset pipeline
* Start putting cleaner style on your apps

## Deliverables

* **A repository.** Fork this repository to your own github account.
* **A README.** Wipe out this README and write your own.  It should include a link to the app running on Heroku.
* **A working Rails app on Heroku.**
* **A test suite.** Build your application using TDD.  Your test suite must include unit tests and controller tests.
* **A workflow diagram.**  Any format is fine, including paper.

Continue to #shipit!

## Normal Mode

Your goal in this project is to create a webapp for a restaurant.  This app will allow the restaurant to display their menu in an appealing format on the web, but will also allow them to edit their dishes as time passes.

This application will require the following:

* Two models: Dish and Course.  An example of a dish is "Meatloaf" and an example of a course is "Entrees".  Dishes should have prices, names, and descriptions.  Courses should have names.  You need to add a foreign key to one of these tables, but you have to determine that for yourself.
* One controller: DishesController.  You may decide to add another controller to display your menu if you would like, but it will be simplest if you build `dishes/index` to display all items in the menu format rather than in the standard scaffolded table.  Regardless of where you put it, your menu should show in an appealing format, grouped in courses.
* Each course should have an image associated with it (set up by you, the developer, not by users uploading it), and the course's image should be displayed somewhere in its group.  This image should NOT be pulling from somewhere else on the web, but should be a part of your application.
* Users should be able to edit the dish's information by clicking on the dish's name.
* Users should be able to add dishes for a specific course by clicking on an add link underneath that specific course.  In other words, there should be no "course" dropdown on the dish's new page.  That should be determined based on which link you clicked on in the first place.
* Users should be able to destroy a dish by going to the dish's edit page and then hitting a delete button on that page.
* Users should not be able to edit courses.  Those should be set up by developers (you) through seeds.
* The show action for each dish should redirect to the dish's edit page.  This means that you do need a `def show` in your controller, but you don't need a `show.html.erb` in your `views/dishes` folder.
* After creating or editing a dish, the user should be redirected to the menu page, not the show page.
* The application should utilize the (a) variable assignment and (b) selector nesting features of SCSS.
* The application may utilize Bootstrap.
* The application should be deployed to Heroku.

## Hard Mode

Hard mode requires the addition of two features:

* Users should be able to add URLs to images for each dish, but only SOME of them should be displayed on the menu.  Figure out some way to show only the best ones.
* Add another layer of complexity to the menu.  Menus can now have mealtimes (breakfast, lunch, dinner).  Each mealtime will still have courses, which will still have dishes.  These courses are not consistent across mealtimes (e.g. Breakfast might have "Pastries" and "Meats" while Lunch might have "Sandwiches" and "Desserts").

## Nightmare Mode

Rather than allowing users to paste in URLs of images, require them to UPLOAD the images.  This is harder than having images for each course (set up by you, the developer).  This is user-created imagery.

## Additional References

* [Bootstrap](http://getbootstrap.com/)
* [SCSS Guide](http://sass-lang.com/)
* [The Asset Pipeline on Heroku](https://devcenter.heroku.com/articles/rails-4-asset-pipeline)
