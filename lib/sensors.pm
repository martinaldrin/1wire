package sensors;
use strict;
use Data::Dumper;

use Exporter;
use vars qw(@ISA @EXPORT @EXPORT_OK);
@ISA = qw(Exporter);
@EXPORT = qw( get_value print_value $foo );
our $foo = 1;



sub new
{
	my $class = shift;
	my (%self) = @_;
		
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

sub print_all_sensors{
	my $self = shift;
	print("Print sensors:\n");
	opendir( DIR, $$self{path} );
	while( my $dir = readdir(DIR) ){
		if( $dir =~ /^\d{2}\./ ){
			if( -e "$$self{path}/$dir/temperature" ){
				my $temp_sensor = DS18S20->new(  path => $$self{path}, dirname => $dir, file => 'temperature', location => (defined $$self{sensor_map}{$dir}?$$self{sensor_map}{$dir}:$dir) );
				$temp_sensor->get_value();
				$temp_sensor->print_value();
			}
		}
	}
}

sub print_sensor_value{

}
1;
