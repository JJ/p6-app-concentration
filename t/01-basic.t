use v6.c;
use Test;
use App::Game::Concentration;

my App::Game::Concentration $cards .= new;

isa-ok( $cards, App::Game::Concentration, "Object created" );
isa-ok( $cards.show( 1, 1 ), Str, "Returns first card" );
isa-ok( $cards.show( 4, 13 ), Str, "Returns last card" );
like $cards.show( 2, 2 ), /\w\s/, "Cards have correct format" ;

my @cards;
my $card-number = 2;
repeat {
    @cards := $cards.select( 1 => 1, 1 + $card-number div 13 => 1 + $card-number % 13 );
    ok( $_, "Extracted card" ) for @cards;
    $card-number++;
} until @cards.?Str eq 'Pair';

ok( paired( @cards[0], @cards[1] ), "Cards are actually paired" );
isa-ok( $cards.show( 1, 1), Any, "First card deleted" );
isa-ok( $cards.select( [1 => 1, 4 => 13] ), Array, "Can call deleted cards using array");

done-testing;
