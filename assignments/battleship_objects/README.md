# Battleship Objects

## Description

Create a set of classes to represent concepts from the game of Battleship.  

## Objectives

### Learning Objectives

After completing this assignment, you should...

* Understand and be able to define "class"
* Understand and be able to define "object"
* Understand and be able to define "method"
* Understand when and why methods require parameters
* Understand mappings between simple real-world concepts and their code representation in classes and methods
* Understand how a Ruby application can span more than one file on disk

### Performance Objectives

After completing this assignment, you should be able to effectively...

* Create repository READMEs
* Write classes
* Write initializers
* Instantiate objects
* Use code in multiple files to solve one problem

## Details

### Deliverables

* **A Drawing.** Draw your classes, their methods, their instance variables, and their relationships out on a piece of paper.  At the conclusion of your work, make sure to give the paper to your instructor.  This is meant to be a creative exercise, so it odes not need to adhere to any particular format.  Just use paper as one of your development tools.
* **A Repository.** Fork this repository.
* **A README.** Wipe out this README file and create your own.  Describe each of your classes individually in the README.  Include a description of each method (behavior) you're giving them.  You should start this before writing any code, but it's fine (and good) if you modify it as you code later.
* **Ruby Files Containing Classes.** Create one `.rb` file for each of your classes.  
* **One Ruby File Instantiating Objects.** After your classes exist, it will be time to bring them all together.  You'll create an additional ruby file called "battleship_objects.rb" and write code in that file that instantiates each of your objects (HINT: this means calling `.new` on each class and passing it the appropriate information).

After you fulfill each requirement below, `git add` and `git commit`.  After your work is complete, make sure to `git push` to get your changes up to github.  Feel free to push more than once along the way, of course.

Make a pull request when you're done.

### Requirements

* Each class should be in a separate file.  If the class is called `Ship`, then the file should be named `ship.rb`.
* Each of your classes should have an initializer.  These initializers SHOULD have code in them to set all the instance variables you provided in your diagram.
* All other methods you write for your classes will NOT need to have code in them.  You'll just be writing "stubs" for those.
* Consider the following behaviors.  They will all need to be executed during a game of Battleship.  Each of these behaviors will need to be a method, and you have to place them in the appropriate classes.  You DO NOT have to write code inside of them.  Just give them reasonable names and put them in the right places:
  * Start a new game
  * Place a ship on the game board
  * Report whether a specific shot was a hit
  * Display the game board
  * Announce a winner
* NOTE: This behavior list is not a complete list.  Add at least three other behaviors (methods) to your classes that will be needed over the course of the game.
* `battleship_objects.rb` should instantiate at least one object from each class.  When the objects are created, make sure to set all of the instance variables appropriately.

## Normal Mode

When you talk about the game of Battleship, you use lots of nouns.  The first step in good object/class design is to list out those nouns and the things they need to do.  Consider these nouns, map out their state (which will translate to instance methods) and their behavior (which will translate to methods), then implement them in code.

Meet all requirements given above.

## Hard Mode

Actually implement one method for each of the classes you've written.  Then call your implemented methods in the overarching `battleship.rb` in a meaningful way.
