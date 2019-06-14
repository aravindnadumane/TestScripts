#! /usr/bin/perl
use Term::ANSIColor qw(:constants);
use constant{PI => 3.14, STRING => 'Test'};


print PI,"  ",STRING,"\n";
print "\n This is a Test ",RED,"RED", RESET," and ",GREEN,"Green", RESET, " Colour";

$Colour1='RED';
$Colour2='GREEN';
#$Colour1=qr/$Colour1/;
#$Colour2=qr/$Colour2/;
print "\n This is a Test ",\Q$Colour2,"RED", RESET," and ",\Q$Colour1,"Green", RESET, " Colour";
