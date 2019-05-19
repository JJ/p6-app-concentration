[![Build Status](https://travis-ci.org/JJ/p6-app-concentration.svg?branch=master)](https://travis-ci.org/JJ/p6-app-concentration)

NAME
====

App::Game::Concentration - Implementation of the game of Concentration

SYNOPSIS
========

```perl6
use App::Game::Concentration;
```

DESCRIPTION
===========

App::Game::Concentration is a fast and dirty implementation of Concentration: https://en.wikipedia.org/wiki/Concentration_(card_game)

Methods and subs
================

new()
-----

Generates a random deck.

select( @positions )
--------------------

Takes an array of Pairs, and selects the cards in that position. If the cards are paired (same number), they are substituted by `✖✖✖`, "eliminating" them from the deck. 

sub paired( $first-card, $second-card)
--------------------------------------

Checks if the cards are paired by extracting the figure from the suit.

AUTHOR
======

JJ Merelo <jjmerelo@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2019 JJ Merelo

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

