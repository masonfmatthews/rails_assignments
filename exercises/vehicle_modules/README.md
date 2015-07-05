# Vehicle Composition

## Description

Create and/or modify classes to store information about various components of vehicles.

## Instructions

There are a lot of things that a modern car can tell you.  It can tell you the outside temperature (and even the interior temperature).  It can tell you what time it is.  If you're listening to the radio, it can even tell you what song is playing.

Although you may think of these things as capabilities of your car, they are actually capabilities of the components.  For instance, the temperature is being determined by a thermometer, and if we wanted to, we could use thermometers like that in other settings (e.g. on your back deck).

Create code which meets the following requirements:

* You should have a `Thermometer` class.
* You should have a `Clock` class.
* You should have a `Vehicle` class.  When you create new objects of this class, it should take a Thermometer and a Clock as parameters.
* You should be able to ask a clock for the current time.
* You should be able to ask a thermometer for the current temperature (and it should randomly give you a number back).
* You should also be able to ask the car for the time or the temperature.  It should then pass the request off to the vehicle's clock or thermometer, and then return the answer given by the clock or thermometer.
