package sensors;
use strict;
use Data::Dumper;

use Exporter;
use vars qw(@ISA @EXPORT @EXPORT_OK);
@ISA = qw(Exporter);
@EXPORT = qw( get_value print_value $foo );
our $foo = 1;

use DateTime;
DateTime::TimeZone->names_in_country( "SE" );


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
	$$self{sensor_value} = $value;
	my $dt = DateTime->now;
	$dt->set_time_zone( 'Europe/Stockholm' );
	$$self{date_time} = $dt->strftime('%Y-%m-%d %H:%M:%S');
}

sub print_value{
	my $self = shift;
	printf( "date: %s, sensor: %s, location: %s, value: %s\n", $$self{date_time}, $$self{sensor_filename}, $$self{location}, $$self{sensor_value} );
}

sub print_all_sensors{
	my $self = shift;
	print("Print sensors:\n");
	opendir( DIR, $$self{path} );
	while( my $dir = readdir(DIR) ){
		if( $dir =~ /^\d{2}\./ ){
			if( -e "$$self{path}/$dir/temperature" ){
				my $temp_sensor = DS18S20->new(  sensor_path => $$self{path}, sensor_dirname => $dir, sensor_filename => 'temperature', location => (defined $$self{sensor_map}{$dir}?$$self{sensor_map}{$dir}:$dir) );
				$temp_sensor->get_value();
				$temp_sensor->print_value();
			}
		}
	}
}

sub print_sensor_value{

}
1;
