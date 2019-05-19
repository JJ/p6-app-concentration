use v6.c;

use Game::Concentration::Role;

unit class App::Game::Concentration:ver<0.0.1> does Game::Concentration::Role;

method new() {
    my @deck =  (("Ace", 2..10, <J Q K>).flat X <♥ ♣ ♦ ♠>).map: *.join(" ");
    @deck = @deck.pick( * );
    my @cards[4;13];
    for 0..3 -> $i {
        for 0..12 -> $j {
            @cards[$i;$j] = @deck[ $i*13+$j ];
        }
    }
    self.bless( :@cards );
}

proto select(|) {*};

multi method select( @positions --> Array ) {
    say @positions;
    return self.select( @positions[0], @positions[1] );
}

multi method select( Pair $first, Pair $second --> Array) {
    return if ! self!_check( $first) or ! self!_check( $second );
    say "$first, $second";
    say @!cards;
    my $first-card = self.show( $first );
    my $second-card = self.show( $second );
    if paired( $first-card, $second-card ) {
        @!cards[$first.key-1; $first.value-1] = '✖✖✖';
        @!cards[$second.key-1; $second.value-1]= '✖✖✖';
    }
    return [$first-card,$second-card];

}

sub paired( Str $first-card, Str $second-card --> Bool ) is pure is export {
    return  $first-card.split(" ")[0] eq $second-card.split(" ")[0];
}

method !_check( Pair $to-check --> Bool ) {
    if $to-check.key ∈ 1..4 and $to-check.value ∈ 1..13 {
        return True;
    } else {
        return  False;
    }
    
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
