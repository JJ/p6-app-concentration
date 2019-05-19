use v6.c;
use Test;
use App::Game::Concentration;

my App::Game::Concentration $cards .= new;

isa-ok( $cards, App::Game::Concentration, "Object created" );
isa-ok( $cards.show( 1, 1 ), Str, "Returns first card" );
isa-ok( $cards.show( 4, 13 ), Str, "Returns last card" );
my ($first-card, $second-card);

my $card-number = 2;
repeat {
    ($first-card, $second-card) = $cards.select( 1 => 1, 1 + $card-number div 13 => 1 + $card-number % 13 );
    say $second-card;
    ok( $first-card, "Extracted first card" );
    ok( $second-card, "Extracted second card" );
    $card-number++;
} until paired( $first-card, $second-card );

ok( paired( $first-card, $second-card ) );

isa-ok( $cards.show( 1, 1), Any, "First card deleted" );
ok( $cards.select( [1 => 1, 4 => 13] ), "Can call deleted cards using array");

done-testing;
