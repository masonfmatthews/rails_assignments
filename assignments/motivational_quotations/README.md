# Motivational Quotation Generator

## Description

Build a one-page Rails app.  The page asks you to select your mood from a dropdown, then click a submit button.  After hitting the button, the page should also display a random motivational quotation and an image that speaks to your mood.


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
* Create an HTML form and process user input from the form

## Details

### Deliverables

* **A Repository.** Create your own github repository.  Commit often, not just at the end.
* **Your First Rails App!**

Send your instructor an e-mail with a link to your repository when you are finished with your work.

### Requirements

From the user's point of view:

* The user should be able to go to the root URL of the application and be asked for their current mood.  The mood should be selected from a dropdown with a pre-defined set of moods (determined by you).
* The user should be able to submit their mood via an HTML form, and he/she will then be presented with a motivational quotation which matches that mood.  The quotation must not be the same every time a specific mood is selected; there must be a few options and one should be selected randomly.
* An image related to the quotation should be shown underneath the quotation as well.  Two quotations from the same mood must have different images.

In terms of code:

* The application should have one view, one controller, and no models.
* You do not need to store the images in your app.  For now, it's better 

## Normal Mode

'Nuff said.  Meet all of the requirements given above.

## Hard Mode

Rather than showing a quotation and and image separately, display an image with text overlaid by integrating with the memegenerator.net API.  Documentation is linked below.

## Normal Mode

Use a Model as well.  The model should be called `Quotation`, and it should be respond to a method that returns the text of the quotation and also to a method that returns a URL of the related image.

## Additional Resources

* [Meme Generator API Documentation](http://version1.api.memegenerator.net/)
