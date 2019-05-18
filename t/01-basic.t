use v6.c;
use Test;
use App::Game::Concentration;

my App::Game::Concentration $cards .= new;

isa-ok( $cards, App::Game::Concentration, "Object created" );

done-testing;
