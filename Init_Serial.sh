#!/bin/bash

echo -e "\n~~ Acquiring SAMD21 USB Device Name ~~ \n"

if [[ "$OSTYPE" == "linux-gnu"* ]] ## Prefix for Linux kernels
then
     #export USB_DEV=$(ioreg -rbc IOUSBHostDevice -l -n "SFE SAMD21" | grep -o /dev/tty.usbmodem*) 
     for sysdevpath in $(find /sys/bus/usb/devices/usb*/ -name dev); do
    (
        syspath="${sysdevpath%/dev}"
        devname="$(udevadm info -q name -p $syspath)"
        [[ "$devname" == "bus/"* ]] && exit
        eval "$(udevadm info -q property --export -p $syspath)"
        [[ -z "$ID_SERIAL" ]] && exit


        if [[ $(echo "/dev/$devname - $ID_SERIAL" | grep SAMD) ]]; then
                echo "USB_DEV=/dev/$devname" >> temp.txt
                exit
        fi
    )
    done

    source temp.txt
    export USB_DEV
    rm temp.txt
     
     
     echo -e "The IO Dial-In ID for the SAMD21 Device is:" $USB_DEV
    
elif [[ "$OSTYPE" == "darwin"* ]] ## Prefix for Mac OSX kernels
then
    export USB_DEV=$(ioreg -rbc IOUSBHostDevice -l -n "SFE SAMD21" | grep -o /dev/cu.usbmodem*)
    echo -e "The IO Call-Out ID for the SAMD21 Device is:" $USB_DEV

else
    echo -e "Native OS not found!\n"
fi 



echo -e "\n"
echo -e "~~ Initializing Serial Ports ~~\n"
./main

