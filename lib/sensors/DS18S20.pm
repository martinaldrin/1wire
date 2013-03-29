package DS18S20;
use strict;
use sensors;
use Data::Dumper;

sub new
{
	my $class = shift;
	my (%self) = @_;
	
	if( $self{path} ){
		$self{filename} = $self{path};
	}
	else{
		die "argument 'path' is missing\n"; 
	}
	if( $self{dirname} ){
		$self{filename} .= $self{dirname} . '/';
	}
	else{
		die "argument 'dirname' is missing\n"; 
	}
	if( $self{file} ){
		$self{filename} .= $self{file};
	}
	else{
		die "argument 'file' is missing\n"; 
	}
	
	bless \%self, $class;
	return \%self;
}



1;
