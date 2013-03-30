package sql;
use strict;

use DBI;
use DBD::mysql;
use DBI qw(:sql_types);
use Data::Dumper;

sub new
{
	my $class = shift;
	my (%in) = @_;
	my $self = \%in;
	bless $self, $class;
	$$self{access_db} = '/home/' . $ENV{USER} . '/accessDB' if !defined $$self{access_db};
	$$self{dbh} = $self->connectDB();
	return $self;
}

sub add_to_table{
	my $self = shift;
	my $sensor = shift;
	my $table = $$sensor{location};
	my $date_time = $$sensor{date_time};
	my $value = sprintf("%.1f", $$sensor{sensor_value} );
	my $sth = $$self{dbh}->prepare( "INSERT INTO $table VALUES (DEFAULT,\"$date_time\",$value );");
	$sth->execute();
	
}

sub disconnect{
	my $self = shift;
	$$self{dbh}->disconnect();
}
sub connectDB {
	my $self = shift;
	print "access_db: $$self{access_db}\n";
        open( ACCESS_INFO, "<" . $$self{access_db} ) || die "Can't access login credentials";
        my $database = <ACCESS_INFO>;
        my $host = <ACCESS_INFO>;
        my $userid = <ACCESS_INFO>;
        my $passwd = <ACCESS_INFO>;
        close (ACCESS_INFO);
        chomp $database;
        chomp $host;
        chomp $userid;
        chomp $passwd;
        my $dbh = DBI->connect(
                "DBI:mysql:database=$database;host=$host",
                "$userid",
                "$passwd",
                { RaiseError => 1, AutoCommit => 1 },
        ) or die "Could not connect to database: $DBI::errstr";;

        return $dbh;
}

1;
