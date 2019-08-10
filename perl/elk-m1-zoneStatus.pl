#!/usr/bin/perl -w

use ElkM1::Control;

my $code;
my $host;
my $port = 2101;

if ( $#ARGV >= 1  and $#ARGV <= 2 )
{
  $code = shift;
  $host = shift;

  if ( $#ARGV == 2 )
  {
    $port = shift;
  }
}
else
{
  print "Usage: $0 <code> <host> [<port>]";
  exit 1;
}

# Connect
my $elk = ElkM1::Control->new(host => $host, port => $port);

$msg = $elk->requestZoneStatus;
#print $msg->toString;
print "zone 47 is physically " . $msg->getPhysicalStatusName(47);
