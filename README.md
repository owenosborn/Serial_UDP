# Serial_UDP

receive packets from serial port, forward to a UDP socket

compile:

g++ -o main main.cpp Serial.cpp SLIPEncodedSerial.cpp UdpSocket.cpp Socket.cpp

kill any process using the serial port:

sudo fuser -k /dev/serial/by-id/usb-SparkFun_SFE_SAMD21_7600763950575035352E3120FF011F43-if00

also appears ModemManager is grabbing the port when USB first attached, so disable this:

sudo systemctl disable ModemManager.service
sudo systemctl stop ModemManager.service
