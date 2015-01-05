# Motivational Quotation Generator

## Description

Build a two-page Rails app.  The first page asks you to select your mood from a dropdown.  The second page displays a random motivational quotation that speaks to your mood.


## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand how to create a basic Rails app (with no database tables)
* Understand the MVC architecture
* Understand GET and POST
* Understand basic HTML forms


### Performance Objectives

After completing this assignment, you should be able to effectively...

* Generate a new Rails app
* Create and use a plain (not ActiveRecord) model
* Create an HTML form and process user input from the form

## Details

### Deliverables

* **A Repository.** Create a new github repository under your account.  Commit often, not just at the end.
* **Your First Rails App!**

### Requirements

From the user's point of view:

* The user should be able to go to the root URL of the application and be asked for their current mood.  The mood should be selected from a dropdown with a pre-defined set of moods (determined by you).
* The user should be able to submit their mood via an HTML form, and he/she will then be presented with a motivational quotation.
* An image related to the quotation should be shown on the quotation page as well.
* The user should be able to link from the list page back to the mood selection page to request another quotation

In terms of code:

* The application should have two views, one controller, and one model.
* The model should be called `Quotation`, and it should be respond to a method that returns the text of the quotation and also to a method that returns a URL of the related image.

## Normal Mode

'Nuff said.  Meet all of the requirements given above.

## Hard Mode

Rather than showing a quotation and and image separately, display an image with text overlaid by integrating with the memegenerator.net API.  Documentation is linked below.

## Additional Resources

* [Meme Generator API Documentation](http://version1.api.memegenerator.net/)
