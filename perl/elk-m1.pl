#!/usr/bin/perl -w

use ElkM1::Control;

# Flush STDOUT
$| = 1;

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

# Arm disarm
#$elk->armAway(code => $code);
#$elk->disarm(code => $code);

# Disconnect
#$elk->disconnect();

# Monitors events
while (1) {  # Loop forever
  while (my $msg = $elk->readMessage) { # Read the M1's messages
    print $msg->toString . "\n";  # Print the messages
  }
}

# Speak the time
$elk->speakPhrase(phrase => 238);
