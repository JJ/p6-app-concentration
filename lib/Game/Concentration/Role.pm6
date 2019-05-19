use v6.c;

unit role Game::Concentration::Role:ver<0.0.2>;

has @.cards[4;13];

multi method show( | ) {*};

multi method show( $row where (1 <= * <= 4), $column where (1 <= * <= 13) ) {
    return @!cards[$row-1;$column-1];
}

multi method show( Pair $row-column  ) {
    return self.show($row-column.key,$row-column.value);
}

=begin pod

=head1 NAME

Game::Concentration::Role - Basic role for the Concentration game with playing board

=head1 SYNOPSIS

=begin code :lang<perl6>

use Game::Concentration::Role;


=end code

=head1 DESCRIPTION

App::Game::Concentration is a fast and dirty implementation of
Concentration: https://en.wikipedia.org/wiki/Concentration_(card_game)
. This role includes the basic board that can be
used either to record the game or to record gameplay.

=head1 METHODS

=head2 cards

Shows the whole deck of cards

=head2 show( $row, $column )

Shows the card in that row (between 1 and 4) and
column (between 1 and 13)

=head2 show( Pair $row-column )

The variable must contain the row as key and the column as value

=head1 AUTHOR

JJ Merelo <jjmerelo@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 JJ Merelo

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
