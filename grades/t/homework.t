use strict;
use warnings;

use Test::More tests => 2;
use Test::DBIx::Class;
use DDP;

my $rs = Schema->resultset('Homework');

$rs->create({name => 'test1'});
$rs->create({name => 'test2', path => '/hw/test2'});
$rs->create({name => 'test3'});

my @no_path = $rs->search_no_path()->all();

#p @no_path;

is(scalar @no_path, 1, 'no_path size');
is($no_path[0]->name, 'test2', 'no_path content');
