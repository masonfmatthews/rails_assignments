# Find Names

## Description

Create a method which finds a person's name in an array of strings.

## Instructions

You are the NSA.  Given how sneaky you are, you have access to a very large array of text messages that all people have sent to each other.  You also have a name which is on one of your watch lists, and you want to see if that name appears in any of the text messages.

Write a method which takes a string (the name on the watch list) and an array of strings (the text messages).  Return all the text messages which have the name somewhere inside them.  Ideally, the search should be case insensitive, and should only look for whole words.

Just to be clear, if you are searching for "Clinton", text messages with "Clinton" or "clinton" ANYWHERE in them should be returned (e.g. "mr. clinton is 1337").  However, text messages like "Clintonian" should NOT be returned.
