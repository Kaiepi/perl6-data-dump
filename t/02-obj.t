#!/usr/bin/env perl6

use Test;
use Data::Dump;

plan 3;

class E {
  has $.public;
  has Int $!private = 5;

  method r(Str $a) { };
  method s($b, :$named? = 5) { };
  method e returns Int { say $!private; };
};

my $out = Dump(E.new, :color(False));

my $expected = "E :: (\n  \$!private => 5.Int,\n  \$!public => (Any),\n\n  method e () returns Int \{...},\n  method public () returns Mu \{...},\n  method r (Str \$a) returns Mu \{...},\n  method s (\$b, :\$named = 5) returns Mu \{...},\n)";

ok $out eq $expected, "got expected data structure" or die $out;

is Dump(Mu), '(Mu)', 'Can dump an undefined Mu type object';
is Dump(Any), '(Any)', 'Can dump an undefined Any type object';;

# vi:syntax=perl6
