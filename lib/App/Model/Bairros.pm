#!/usr/bin/perl

package App::Model::Bairros;

use Mojo::Base -base;

has 'mysql';

sub all {
  shift -> mysql -> db -> select (
    'bairros'
  ) -> hashes -> to_array;
}

1;
