##############################################
# 10_connair.pm 2016-01-11 Stefan Seegel <post@seegel-systeme.de>
# dev for connair, brennenstuhl brematic or connair-clone: www.seegel-systeme.de
package main;
use strict;
use warnings;

my $clientsSlowRF = ":FS20:";

my %matchListSlowRF = (
    "G:IT"        => "^i......\$"
);

sub connair_Initialize($) {
	my ($hash) = @_;
	$hash->{DefFn}   = "connair_Define";
	$hash->{SetFn}     = "connair_Set";
	$hash->{AttrList}  = "setList ". $readingFnAttributes;
	$hash->{WriteFn} = "connair_Write";
	#$hash->{ReadyFn} = "CUL_Ready";
}

sub connair_Define($$) {
	my ($hash, $def) = @_;
	my @param = split("[ \t][ \t]*", $def);
	
	$hash->{Clients} = $clientsSlowRF;
	$hash->{MatchList} = \%matchListSlowRF;

	if (int(@param) != 3) {
		my $msg = "wrong syntax: define <name> connair host";
		Log3 undef, 2, $msg;
		return $msg;
	}
	
	$hash->{host} = $param[2];
	
	return undef;
}

sub connair_Set($@) {
	return undef;
}

sub connair_Write($$$) {
	my ($hash,$fn,$msg) = @_;
	
	Log3 $hash->{name}, 3, "Writing to connair! $msg";
}

1;

=pod
=begin html

=end html
=cut
