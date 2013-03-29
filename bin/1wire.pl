#!/usr/bin/perl
use strict;
use Cwd qw( abs_path );
use File::Basename qw( dirname );
BEGIN{
	my $BASE = dirname(abs_path($0));
	$BASE =~s/bin//;

	#say file($0)->absolute->dir;
	unshift(@INC,$BASE . 'lib');
	unshift(@INC,$BASE . 'lib/sensors');
	#print "INC:@INC\n";
}

use sensors;
use DS18S20;




print "temperature monitor:\n";

my $sensor_path = '/mnt/1wire/';


my $livingroom = DS18S20->new(  path => $sensor_path, dirname => '28.6379D6020000', file => 'temperature', location => 'livingroom' );
$livingroom->get_value();
$livingroom->print_value();
my $outdoor = DS18S20->new(  path => $sensor_path, dirname => '28.DA36D6020000', file => 'temperature', location => 'outdoor' );
$outdoor->get_value();
$outdoor->print_value();

#my $ds1820 = DS1820->new(  path => $sensor_path, dirname => '', file => 'temperature' name => 'outdoor' );
