#!/usr/bin/perl
# $Id: Makefile.PL,v 1.1 2000/09/04 20:19:57 rcaputo Exp $

use ExtUtils::MakeMaker;

WriteMakefile
  ( NAME         => 'POE::Component::JobQueue',
    AUTHOR       => 'Rocco Caputo <troc+poe@netrus.net>',
    ABSTRACT     => ( 'POE component for processing large numbers of tasks ' .
                      'with finite numbers of workers.'
                    ),
    VERSION_FROM => 'JobQueue.pm',

    PM           => { 'JobQueue.pm' => '$(INST_LIBDIR)/JobQueue.pm' },
    PREREQ_PM    => { POE      => 0.11,
                    },
    dist         => { COMPRESS => 'gzip -9f',
                      SUFFIX   => 'gz',
                    },
  );
