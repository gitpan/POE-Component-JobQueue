#!/usr/bin/perl
# $Id: Makefile.PL,v 1.3 2002/09/10 03:42:50 rcaputo Exp $

use ExtUtils::MakeMaker;

# Touch CHANGES so it exists.
open(CHANGES, ">>CHANGES") and close CHANGES;

WriteMakefile
  ( NAME         => 'POE::Component::JobQueue',
    AUTHOR       => 'Rocco Caputo <rcaputo@cpan.org>',
    ABSTRACT     => ( 'POE component for processing large numbers of tasks ' .
                      'with finite numbers of workers.'
                    ),
    VERSION_FROM => 'JobQueue.pm',

    PM           => { 'JobQueue.pm' => '$(INST_LIBDIR)/JobQueue.pm' },
    PREREQ_PM    => { POE      => 0.11,
                    },
    dist         =>
    { COMPRESS   => 'gzip -9f',
      SUFFIX     => 'gz',
      PREOP      => ( 'cvs-log.perl | ' .
                      'tee ./$(DISTNAME)-$(VERSION)/CHANGES > ./CHANGES'
                    ),
    },
  );
