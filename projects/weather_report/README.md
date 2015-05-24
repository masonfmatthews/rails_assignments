# Weather Report

## Description

Build a Ruby application to pull data from multiple Weather Underground API endpoints and present a weather report to the user.

## Objectives

After completing this assignment, you should...

* Understand the purpose and structure of Web APIs
* Understand JSON structure
* Be able to access an API using a token
* Be able to make HTTP requests via HTTParty
* Be able to pull and merge information from multiple API endpoints
* Be able to write tests that mock API responses

## Deliverables

* **An estimate.**  After you read through this assignment (but before you start coding), write down a number of hours that you expect each part to take (1-3).  Record your hours as you go.
* **A GitHub repository.**
* **A quality README.**
* **A test suite.** Not only must this test suite be conceptually complete, it must be written before the code that satisfies it.
* **A reflection on your estimate.**  Well?  How did you do?

Use the homework submission form on the course website to turn in a link to your GitHub repository.

## Normal Mode

Your task tonight is to create a Ruby application which will query multiple API endpoints from Weather Underground, and will present a weather summary to the user.  When the user runs the application, he or she will be asked for a zip code, and the summary will be for that location.

Your summary will be `puts`'ed to the screen, and must include the following (information):

* Current conditions at that location.
* 10 day forecast for that location.
* Sunrise and sunset times.
* Any current weather alerts.
* A list of all active hurricanes (anywhere).

Make sure that the summary you display is easy to read for users.  A pile of numbers with no descriptors won't do anyone any good.

Your code must be written in classes and be spread across multiple files.  It is suggested that you build one class for each API endpoint which you access, and then you create instances of each class when you have parameters to make a call to that endpoint.  If you can think of a better way that still involves classes, though, go for it.

Testing is going to be tricky on this one.  You should mock the API responses so that you don't need to hit the API every time you run your tests.  You should also be able to explain WHY this is good.

No database is needed for Normal Mode.

## Hard Mode

Rather than just receiving a zip code from the user, allow him or her to type in a city and state instead (for instance: `Durham, NC` or `Durham, North Carolina`).

You should use regular expressions to determine which format (zip or city, state or city, st) the user has entered, and then make the appropriate API calls based on that.

No database is needed for Hard Mode.

## Nightmare Mode

Store the responses in a database so that if the same request is made twice by your users, the information is pulled out of the database rather than hitting the APIs each time.

## Additional Resources

* [HTTParty](https://github.com/jnunemaker/httparty)
* [Weather Underground documentation](http://www.wunderground.com/weather/api/d/docs?MR=1)
