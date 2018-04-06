High School Software Major Project - Snake
==========================================

Overview
--------

This is a version of Snake which I coded in 2015 for the Commodore 64. This is
the original with no changes made, and as such it contains some features and
bugs, listed below. I ended up porting it to C++ before submitting the
assignment to fix the performance issues and have a more playable game. At some
point I would like to return to the Commodore 64 and code an efficient version.

Features
--------

* Title screen
* Difficulty and level settings
* High scores
* Instructions

Bugs
----

* Sometimes fails to start the game
* Game slows down as the snake gets bigger due to the implementation and
  processor limitations of the Commodore 64
* Inputs during the game carry into the high score name entry screen

Playing
-------

I have included the files required to open this program in a Commodore 64
emulator such as VICE. With VICE, it can run from the command line with a
command such as  
```
x64sc auto.prg
```
or through the GUI by selecting File>Smart-attach disk/tape... and choosing
auto.prg in the pop-up menu.

Authors
-------

* Adam Douglas
