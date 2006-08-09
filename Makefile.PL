#!/usr/bin/perl
# $Id: Makefile.PL 22 2005-06-21 18:50:16Z rcaputo $

use ExtUtils::MakeMaker;

# Touch CHANGES so it exists.
open(CHANGES, ">>CHANGES") and close CHANGES;

WriteMakefile(
	NAME          => 'POE::Component::JobQueue',
	AUTHOR        => 'Rocco Caputo <rcaputo@cpan.org>',
	ABSTRACT      => (
		'Handle large numbers of tasks with finite numbers of workers.'
	),
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
