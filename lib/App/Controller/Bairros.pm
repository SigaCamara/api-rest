#!/usr/bin/perl

package App::Controller::Bairros;

use Mojo::Base 'Mojolicious::Controller';

sub index {
  my $self = shift;

  $self -> render (
    json => $self -> bairros -> all
  );
}

1;
