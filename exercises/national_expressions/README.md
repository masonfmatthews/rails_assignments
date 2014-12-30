# National Expressions

## Description

Create one parent class describing the expressions of a baseline person, then create classes which inherit from the parent to override country-specific expressions.

## Instructions

You are an international flight attendant who continues to get confused by your passengers.  You think you know what they're asking for, but then someone shows up from a country you've never visited and you get lost.

Thankfully, you fly on a very very very loud plane, so you don't have to worry about the languages.  You just have to worry about body and hand motions.  Here's what you've determined is a baseline set of motions and what they mean:

* Yes: nod head up and down.
* No: shake head.
* I'd like one: hold up pointer finger.
* I'd like two: peace sign.
* I approve: thumbs up.
* Go away: flick of the wrist.

You happen to also be a developer.  Create a ruby class called `Human` which has one method for each of these behaviors and returns symbols.  For instance, the `say_yes` method should return `:nod`.

Now, you've learned that people from the following countries have different motions for the following meanings:

* Germans - I'd like one: thumbs up.
* Germans - I'd like two: hold up thumb and pointer finger.
* Germans - I approve: big smile.
* Greeks - No: nod head up.
* Americans - Go away: middle finger.
* Australians - Go away: peace sign backwards.

Write four additional classes (e.g. `class German`) that inherit from `Human` and override only these unusual behaviors.
