package DS18S20;
use strict;
use sensors;
use Data::Dumper;

sub new
{
	my $class = shift;
	my (%self) = @_;
	
	if( $self{sensor_path} ){
		$self{filename} = $self{sensor_path};
	}
	else{
		die "argument 'sensor_path' is missing\n"; 
	}
	if( $self{sensor_dirname} ){
		$self{filename} .= $self{sensor_dirname} . '/';
	}
	else{
		die "argument 'sensor_dirname' is missing\n"; 
	}
	if( $self{sensor_filename} ){
		$self{filename} .= $self{sensor_filename};
	}
	else{
		#die "argument 'sensor_filename' is missing\n"; 
		$self{sensor_filename} = 'temperature';
		$self{filename} .= $self{sensor_filename};
	}
	
	bless \%self, $class;
	return \%self;
}



1;
