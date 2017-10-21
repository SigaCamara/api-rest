#!/usr/bin/perl

package App::Controller::Relations;

use Mojo::Base 'Mojolicious::Controller';

sub index {
  my $self = shift;

  $self -> render (
    json => $self -> relations -> all
  );
}

1;
