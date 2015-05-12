# Vehicle Modules

## Description

Create and/or modify classes to store information about various types of vehicles.

## Instructions

Yesterday you built classes to keep track of various properties of vehicles.  Today we are adding a few requirements:

* Trucks can carry cargo (return `true` when `.cargo?` is called)
* Planes can carry cargo
* Standard vehicles cannot carry cargo (a `NoMethodError` is raised when `.cargo?` is called)
* Planes can fly (return `true` when `.can_fly?` is called)
* Helicopters can fly (return `true` when `.can_fly?` is called)
* Standard vehicles cannot fly (a `NoMethodError` is raised when `.can_fly?` is called)

Write the `.cargo?` method in exactly one place.  Write the `.can_fly?` method in exactly one place.
