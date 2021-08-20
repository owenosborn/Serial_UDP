#!/bin/bash

echo -e "\n~~ Acquiring SAMD21 USB Device Name ~~ \n"
source Get_USB_Dev.sh

echo -e "~~ Initializing Serial Ports ~~\n"
./main

