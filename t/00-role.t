use v6.c;
use Test;
use Game::Concentration::Role;

my @deck =  (("A", 2..10, <J Q K>).flat X <♥ ♣ ♦ ♠>).map: *.join(" ");
my @cards[4;13];
for 0..3 -> $i {
    for 0..12 -> $j {
        @cards[$i;$j] = @deck[ $i*13+$j ];
    }
}

my Game::Concentration::Role $board .= new: :@cards ;

does-ok( $board, Game::Concentration::Role, "Object created" );
isa-ok( $board.show( 1, 1 ), Str, "Returns first card" );
isa-ok( $board.show( 3 => 3 ), Str, "Returns from Pair" );
isa-ok( $board.show( 4, 13 ), Str, "Returns last card" );

done-testing;
