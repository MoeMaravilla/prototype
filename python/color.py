#!/usr/bin/python -u

import subprocess
import sys

bold = ''
normal = ''
black = ''
red = ''
green = ''
yellow = ''
blue = ''
magenta = ''
cyan = ''
white = ''

try:
    ncolors = subprocess.check_output('tput colors'.split(), stderr=subprocess.STDOUT)

    # check if stdout is a terminal and it supports colors...
    if sys.stdout.isatty() and int(ncolors) >= 8:
        # decode for compatability with python3
        bold = subprocess.check_output('tput bold'.split()).decode('utf-8')
        normal = subprocess.check_output('tput sgr0'.split()).decode('utf-8')
        black = subprocess.check_output('tput setaf 0'.split()).decode('utf-8')
        red = subprocess.check_output('tput setaf 1'.split()).decode('utf-8')
        green = subprocess.check_output('tput setaf 2'.split()).decode('utf-8')
        yellow = subprocess.check_output('tput setaf 3'.split()).decode('utf-8')
        blue = subprocess.check_output('tput setaf 4'.split()).decode('utf-8')
        magenta = subprocess.check_output('tput setaf 5'.split()).decode('utf-8')
        cyan = subprocess.check_output('tput setaf 6'.split()).decode('utf-8')
        white = subprocess.check_output('tput setaf 7'.split()).decode('utf-8')
except (subprocess.CalledProcessError, OSError):
    pass

print('{}Bold{}'.format(bold, normal))
print('{}Black{}'.format(black, normal))
print('{}Red{}'.format(red, normal))
print('{}Green{}'.format(green, normal))
print('{}Yellow{}'.format(yellow, normal))
print('{}Blue{}'.format(blue, normal))
print('{}Magenta{}'.format(magenta, normal))
print('{}Cyan{}'.format(cyan, normal))
print('{}White{}'.format(white, normal))
