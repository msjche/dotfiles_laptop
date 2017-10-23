#!/usr/bin/perl

use warnings;
use strict;
use FileHandle;
use Term::ReadKey;

$0 = 'pianobar-control';
$SIG{'INT'}   = \&safe_exit;
$SIG{'TERM'}  = \&safe_exit;
$SIG{'HUP'}   = \&safe_exit;
$SIG{'QUIT'}  = \&safe_exit;
$SIG{__DIE__} = \&safe_exit;
END { safe_exit(); }

sub safe_exit()
{
	ReadMode 0;
	exit(@_);
}

ReadMode 4;
while (my $in = ReadKey(0))
{
	# Exit this program on C-C, C-D or q
	my $c = ord($in);
	last if (
		# C-D
		$c == 4
			or
		# C-C
		$c == 3
			or
		# 'q'
		$c == 113
	);

	# Ignore all commands that expect more input in pianobar. Pretty much only
	# leave transport controls, bookmarking, explanation and volume.
	next if ($in =~ /h|s|r|g|a|c|d|j|m|x|b/);

	if (my $fh = FileHandle->new("$ENV{HOME}/.config/pianobar/ctl", O_WRONLY|O_APPEND))
	{
		print "$in";
		$fh->print("$in");
		$fh->close
	}
	else
	{
		die "Couldn't open fifo: $!";
	}

}

safe_exit;
