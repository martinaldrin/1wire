package sensors;
use strict;
use Data::Dumper;

use Exporter;
use vars qw(@ISA @EXPORT @EXPORT_OK);
@ISA = qw(Exporter);
@EXPORT = qw( get_value print_value $foo );  # symbols to export on request
our $foo = 1;



sub new
{
	my $class = shift;
	my (%self) = @_;
	
	
	print Dumper(%self);
	
	bless \%self, $class;
	return \%self;
}

sub get_value{
	my $self = shift;
	open SENSOR, "<$$self{filename}";
	my $value = <SENSOR>;
	$value =~ s/\s+//g;
	close SENSOR;
	$$self{value} = $value;
}

sub print_value{
	my $self = shift;
	printf( "sensor: %s, location: %s, value: %s\n", $$self{file}, $$self{location}, $$self{value} );
}

sub load_sensors{

}

sub print_sensor_value{

}
1;
