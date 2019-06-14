#!/usr/bin/perl
# Author: Todd Larason <jtl@molehill.org>
# $XFree86: xc/programs/xterm/vttests/256colors2.pl,v 1.2 2002/03/26 01:46:43 dickey Exp $

# use the resources for colors 0-15 - usually more-or-less a
# reproduction of the standard ANSI colors, but possibly more
# pleasing shades

# colors 16-231 are a 6x6x6 color cube
for ($red = 0; $red < 6; $red++) {
    for ($green = 0; $green < 6; $green++) {
	for ($blue = 0; $blue < 6; $blue++) {
	    printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\",
		   16 + ($red * 36) + ($green * 6) + $blue,
		   ($red ? ($red * 40 + 55) : 0),
		   ($green ? ($green * 40 + 55) : 0),
		   ($blue ? ($blue * 40 + 55) : 0));
	}
    }
}

# colors 232-255 are a grayscale ramp, intentionally leaving out
# black and white
for ($gray = 0; $gray < 24; $gray++) {
    $level = ($gray * 10) + 8;
    printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\",
	   232 + $gray, $level, $level, $level);
}


# display the colors

# first the system ones:
print "System colors:\n";
for ($color = 0; $color < 8; $color++) {
    print "\x1b[48;5;${color}m  ";
}
print "\x1b[0m\n";
for ($color = 8; $color < 16; $color++) {
    print "\x1b[48;5;${color}m  ";
}
print "\x1b[0m\n\n";

# now the color cube
print "Color cube, 6x6x6:\n";
for ($green = 0; $green < 6; $green++) {
    for ($red = 0; $red < 6; $red++) {
	for ($blue = 0; $blue < 6; $blue++) {
	    $color = 16 + ($red * 36) + ($green * 6) + $blue;
	    print "\x1b[48;5;${color}m  ";
	}
	print "\x1b[0m ";
    }
    print "\n";
}


# now the grayscale ramp
print "Grayscale ramp:\n";
for ($color = 232; $color < 256; $color++) {
    print "\x1b[48;5;${color}m  ";
}
print "\x1b[0m\n";

# now the numbered Colour
print "\n Numbered Colouring\n";
$resetColour="\x1b[0m";
for($ind1=0; $ind1 < 256 ; $ind1++)
{
    print "\n" if(($ind1 %36 == 0) && ($ind1 !=0));
    $myColour= "\x1b[38;5;${ind1}m";
    #print $myColour,"$ind1 ",$resetColour;
    print $myColour,sprintf("%4s",$ind1),$resetColour;
}

use constant COLOUR256_BOLDBACKGRND => "\x1b[38;5;";
use constant COLOUR256_BOLD         => "\x1b[1m";
use constant COLOUR256_ITALIC       => "\x1b[3m";
use constant COLOUR256_BLINK        => "\x1b[5m";
use constant COLOUR256_STRIKETHRU   => "\x1b[9m";
use constant COLOUR_TRAIL           => "m";
use constant    {
                    myColRESET        => "\x1b[0m",
                    myColCYAN         =>  COLOUR256_BOLDBACKGRND.'51' .COLOUR_TRAIL,
                    myColPURPLE       =>  COLOUR256_BOLDBACKGRND.'141'.COLOUR_TRAIL,
                    myColPURPLE1      =>  COLOUR256_BOLDBACKGRND.'171'.COLOUR_TRAIL,
                    myColPURPLE2      =>  COLOUR256_BOLDBACKGRND.'129'.COLOUR_TRAIL,
                    myColRED1         =>  COLOUR256_BOLDBACKGRND.'197'.COLOUR_TRAIL,
                    myColRED2         =>  COLOUR256_BOLDBACKGRND.'160'.COLOUR_TRAIL,
                    myColGREY         =>  COLOUR256_BOLDBACKGRND.'245'.COLOUR_TRAIL,
                    myColGREEN        =>  COLOUR256_BOLDBACKGRND.'40' .COLOUR_TRAIL,
                    myColMILDGREEN    =>  COLOUR256_BOLDBACKGRND.'109'.COLOUR_TRAIL,
                    myColAMBER        =>  COLOUR256_BOLDBACKGRND.'142'.COLOUR_TRAIL
                };
print myColAMBER,"\nNormal",myColRESET,myColCYAN,"Test_CYAN",myColRESET,myColPURPLE,"Test_PURP";
print COLOUR256_ITALIC,myColAMBER,"\nItalic",myColRESET,COLOUR256_STRIKETHRU,myColCYAN,"StrikeTru",myColRESET,COLOUR256_BOLD,myColPURPLE,"Bold";
