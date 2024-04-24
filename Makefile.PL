#!perl

use strict;
use ExtUtils::MakeMaker;
use Alien::PLplot;

# Libs required to build PLplot applications
my $pllibs = Alien::PLplot->libs;

# Include files
my $plinc = Alien::PLplot->cflags;

# Write the makefile
WriteMakefile(
	      NAME => 'Graphics::PLplot',
	      VERSION_FROM => 'PLplot.pm',
	      LIBS => [ $pllibs ],
	      INC  => "$plinc",
	      OBJECT  => 'PLplot.o arrays.o',
	      PREREQ_PM => {'Alien::PLplot' => 0},
	      'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => 'gz',
			      'ZIP'=>'/usr/bin/zip','ZIPFLAGS'=>'-rl'},
	      ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
	       (ABSTRACT_FROM => 'PLplot.pm',
		AUTHOR     => 'Tim Jenness <t.jenness@jach.hawaii.edu>') : ()),
);
