package Template::Plugin::deJSON;

=head1 NAME

  Template::Plugin::DeJSON - de-JSONify a JSON string

=head1 SYNOPSIS

  [%
    USE deJSON;
    hash = deJSON.deJSON(json_string);
    FOREACH field=hash;
      field; field.value;
    END;
  %]

=head1 DESCRIPTION

Well, I needed this. I had JSON string things flying around between servers,
and passed into templates. (If you must know, objects were stringified using
JSON, and bit-shifted around the world.) It seemed to me I needed a plugin to
take those strings and turn them into something a bit more useful.

So it takes a JSON string, and gives you back a hash. Or me. It gives it back
to me. YMMV.

=cut

use strict;
use warnings;

use base 'Template::Plugin';

our $VERSION = 0.01;

sub new {
  my ($class, $context) = @_;
  bless { 
    _CONTEXT => $context, 
  }, $class;
}

sub deJSON {
  my ($self, $json)= @_;
  my @parts = split /,/, $json;
  my %hash;
  while (@parts) {
    my @bits = map { $_ =~ s/("|{|})//g; $_ } split /:/, shift @parts;
    $hash{$bits[0]} = $bits[1];
  }
  return %hash;
}

=head1 AUTHOR

Stray Taoist E<lt>F<mwk@strayLALALAtoaster.co.uk>E<gt>

=head1 COPYRIGHT

Copyright (c) 2007 StrayTaoist

This module is free software; you can redistribute it or modify it
under the same terms as Perl itself.

=head1 STUFF

 o things

=head1 THINGS

 o stuff

=cut

return qw/You drink your kawfee and I sip my tay/;
