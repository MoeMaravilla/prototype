#!/usr/bin/perl -w

use Insteon_PLM;
use Insteon::Lighting;

$myPLM = new Insteon_PLM('Insteon_PLM',);

$pantry_light = new Insteon::SwitchLinc('17.4F.14', $myPLM);

#$pantry_light->on();
sleep 5;
$pantry_light->level('off');
#sleep 5;
#$pantry_light->off();
sleep 5;
$pantry_light->level('on');
