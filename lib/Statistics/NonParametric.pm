use 5.008001;
use strict;
use warnings;

package Statistics::NonParametric;
# ABSTRACT: Statistical tools for non-parametric analysis
# VERSION

# Dependencies
use autodie 2.00;
use Moo;
use MooX::Types::MooseLike::Base ':all';

has _data => (
    is      => 'ro',
    isa     => ArrayRef,
    default => sub { [] },
);

has _sorted => (
    is      => 'lazy',
    isa     => ArrayRef,
    clearer => 1,
);

sub _build__sorted {
    my ($self) = @_;
    return [ sort { $a <=> $b } @{ $self->_data } ];
}

=method add

    $data->add( map { rand() } 1 .. 10 );

Add data to the objects.  Returns the object so you can chain it off the
constructor:

    my $data = Statistics::Parameteric->new->add(...);

It can also take one or more array references, in which case the values will be
copied into the object.

    $data->add( \@some, \@more, \@data );

=cut

sub add {
    my ( $self, @data ) = @_;
    push @{ $self->_data }, map { ref($_) ? @{$_} : $_ } @data;
    $self->_clear_sorted;
    return $self;
}

1;

=for Pod::Coverage method_names_here

=head1 SYNOPSIS

    use Statistics::NonParametric;

    my $data = Statistics::Parameteric->new->add( @observations );

=head1 DESCRIPTION

This module provides non-parametric statistical analysis tools.

=cut

# vim: ts=4 sts=4 sw=4 et:
