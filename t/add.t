use 5.008001;
use strict;
use warnings;
use Test::More 0.96;
use Test::Deep '!blessed';
use Test::Fatal;

use aliased 'Statistics::NonParametric' => 'NP';

subtest "add values" => sub {
    my $data = NP->new;
    $data->add( 1 .. 10 );
    cmp_deeply( $data->_data, [ 1 .. 10 ], "saw expected data" );
};

subtest "chain constructor" => sub {
    my $data = NP->new->add( 1 .. 10 );
    cmp_deeply( $data->_data, [ 1 .. 10 ], "saw expected data" );
};

subtest "add array refs" => sub {
    my $data = NP->new->add( [1 .. 10] );
    cmp_deeply( $data->_data, [ 1 .. 10 ], "saw expected data" );
};

subtest "add mixed list and array refs" => sub {
    my $data = NP->new->add( [1 .. 5], 6, 7, [8 .. 10] );
    cmp_deeply( $data->_data, [ 1 .. 10 ], "saw expected data" );
};

done_testing;
# COPYRIGHT
# vim: ts=4 sts=4 sw=4 et:
