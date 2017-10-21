#!/usr/bin/perl

package App::Model::Relations;

use Mojo::Base -base;

has 'mysql';

sub all {
  shift -> mysql -> db -> select (
    'relations'
  ) -> hashes -> to_array;
}

1;
