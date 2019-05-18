use v6.c;
unit class App::Game::Concentration:ver<0.0.1>;

has @!cards[4;13];

method new() {
    my @cards =  (("Ace", 2..10, <J Q K>).flat X <♥ ♣ ♦ ♠>).map: *.join(" ");
    self.bless( :@cards );
}

=begin pod

=head1 NAME

App::Game::Concentration - blah blah blah

=head1 SYNOPSIS

=begin code :lang<perl6>

use App::Game::Concentration;

=end code

=head1 DESCRIPTION

App::Game::Concentration is a fast and dirty implementation of Concentration: https://en.wikipedia.org/wiki/Concentration_(card_game)

=head1 AUTHOR

JJ Merelo <jjmerelo@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 JJ Merelo

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
