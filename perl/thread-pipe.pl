#!/usr/bin/perl

use strict;
use threads;
use Time::HiRes qw(usleep nanosleep);
use Thread::Queue;

sub pipeCommand {
    my $cmd = shift;
    my $Q = new Thread::Queue;
    async{
        my $pid = open my $pipe, $cmd or die $!;
        $Q->enqueue( $_ ) while <$pipe>;
        $Q->enqueue( undef );
    }->detach;
    return $Q;
}

my $pipe = pipeCommand(
    'perl -le "$|++;print localtime().q[: some text] and sleep 1 for 1 .. 10" |'
) or die;

while( 1 ) {
    if( $pipe->pending ) {
        my $line = $pipe->dequeue or last;
        chomp( $line );
        ## Do stuff with $line
        printf "Got: '%s'\n", $line;
    }
    else {
        ## Do something else
        print "Tum te tum\n";
        usleep(100000);
    }
}
