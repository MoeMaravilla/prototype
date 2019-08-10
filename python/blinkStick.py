#!/usr/bin/python

# This script requires a a USB "BlinkStick"

# Follow these steps:
# - sudo apt-get install python-pip
# - sudo pip install pyusb==1.0.0b1
# - sudo pip install blinkstick
#   # Test
# - sudo blinkstick --info
# - sudo blinkstick --add-udev-rule
# - sudo reboot
#   # Run without sudo
# - sudo blinkstick --info
# - # Run this script (watch BlinkStick change colors)

from blinkstick import blinkstick

led = blinkstick.find_first()
led.set_color(name="red")
led.pulse(name="blue")
