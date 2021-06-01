# Serial_UDP

receive packets from serial port, forward to a UDP socket

compile:

g++ -o main main.cpp Serial.cpp SLIPEncodedSerial.cpp UdpSocket.cpp Socket.cpp

to kill any process using the serial port:

sudo fuser -k /dev/name of port

also in Linux ModemManager is grabbing the port when USB first attached, so disable this:

sudo systemctl disable ModemManager.service
sudo systemctl stop ModemManager.service
