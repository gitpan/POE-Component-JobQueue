#!/usr/bin/perl
# $Id: Makefile.PL 26 2009-07-25 06:44:35Z rcaputo $

use ExtUtils::MakeMaker;

# Touch CHANGES so it exists.
open(CHANGES, ">>CHANGES") and close CHANGES;

WriteMakefile(
	NAME          => 'POE::Component::JobQueue',
	AUTHOR        => 'Rocco Caputo <rcaputo@cpan.org>',
	LICENSE       => 'perl',
	ABSTRACT      => (
		'POE component for processing large numbers of tasks ' .
		'with finite numbers of workers.'
	),
	LICENSE       => 'perl',
	VERSION_FROM  => 'JobQueue.pm',
	PM            => { 'JobQueue.pm' => '$(INST_LIBDIR)/JobQueue.pm' },
	PREREQ_PM     => {
		POE         => 0.31,
	},
	dist          => {
		COMPRESS    => 'gzip -9f',
		SUFFIX      => 'gz',
		PREOP       => (
			'svn-log.perl --repo https://thirdlobe.com/svn/poco-jobqueue | ' .
			'tee ./$(DISTNAME)-$(VERSION)/CHANGES > ./CHANGES'
		),
	},
);
