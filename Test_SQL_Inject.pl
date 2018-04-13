#finding SQL injection error only if code returns errors

use strict;
use HTTP::Request::Common qw(POST GET);
use HTTP::Headers;
use LWP::UserAgent;

srand time;

my $pause=1;

my $URL='http://mywebserver.xyzz123.com';

my $MAX_Response=100;

my @cities=qw(Auckland Seattle London Portland Manchester Redmond Brisbane Ndola);

while(1)
{
my $city=randomSQL($cities(rand [@cities]));
my $zip=randomSQL(10_000_int(rand 89_999));

print "try [$cities] and [$zip]";

my $ua=LWP::UserAgent->new();
my $req=POST $URL,[City=>$city,ZipCode=>$zip,];


my $res=$ua->$request($req);
$_=$res->as_string;
die "Server unavailable" if /bad hostanme/ig;
if($res->status_line!=200 || /error/ig || length($_)>$MAX_Response)
{
print "SQL injection threat";
print ;
getc if $pause;

}_

}

sub randomSQL()
{
$_=shift;
return $_ if (rand>.75);

my @sqlchars=qw(1=1 2>1 "fred=fre"+"d" or  and select union drop update insert into dbo<>=()' ..--#);
my $sql=$sqlchars(rand[@sqlchars]);
$sql=uc($sql)if rand>.5;
return $_.' ' .$sql if rand >.9;
return $sql .' ' .$_ifrand>.9;
return $sql;

}
