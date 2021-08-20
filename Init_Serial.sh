#!/bin/bash

echo -e "\n~~ Acquiring SAMD21 USB Device Name ~~ \n"

if [[ "$OSTYPE" == "linux-gnu"* ]] ## Prefix for Linux kernels
then
    export USB_DEV=$(ioreg -rbc IOUSBHostDevice -l -n "SFE SAMD21" | grep -o /dev/tty.usbmodem*) 
     echo -e "The IO Dial In ID for the SAMD21 Device is:" $USB_DEV
    
elif [[ "$OSTYPE" == "darwin"* ]] ## Prefix for Mac OSX kernels
then
    export USB_DEV=$(ioreg -rbc IOUSBHostDevice -l -n "SFE SAMD21" | grep -o /dev/cu.usbmodem*)
    echo -e "The IO Callout ID for the SAMD21 Device is:" $USB_DEV

else
    echo -e "Native OS not found!\n"
fi 



echo -e "\n"
echo -e "~~ Initializing Serial Ports ~~\n"
./main

