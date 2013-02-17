use 5.008001;
use strict;
use warnings;
use Test::More 0.96;
use Test::Deep '!blessed';
use Test::Fatal;

use aliased 'Statistics::NonParametric' => 'NP';

subtest "sort on demands" => sub {
    my $data = NP->new->add( reverse 1 .. 10 );
    is( $data->{_sorted}, undef, "sort is lzay" );
    cmp_deeply( $data->_sorted, [ 1 .. 10 ],            "saw expected sorted data" );
    cmp_deeply( $data->_data,   [ reverse( 1 .. 10 ) ], "original data untouched" );
};

subtest "adding more data clears sort" => sub {
    my $data = NP->new->add( reverse 1 .. 10 );
    cmp_deeply( $data->_sorted, [ 1 .. 10 ], "saw expected data" );
    $data->add( reverse 11 .. 20 );
    cmp_deeply( $data->_sorted, [ 1 .. 20 ], "saw expected data" );
    cmp_deeply(
        $data->_data,
        [ reverse( 1 .. 10 ), reverse( 11 .. 20 ) ],
        "original data untouched"
    );
};

done_testing;
# COPYRIGHT
# vim: ts=4 sts=4 sw=4 et:
