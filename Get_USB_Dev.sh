#!/bin/bash

export USB_DEV=$(ioreg -rbc IOUSBHostDevice -l -n "SFE SAMD21" | grep -o /dev/cu.usbmodem*) 
echo "The IO Callout ID for the SAMD21 Device is:" $USB_DEV
