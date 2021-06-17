# Serial_UDP

a bridge between UDP and serial port (SLIP encoded): 

* serial in -> SLIP deocode -> UDP out
* UDP in -> SLIP encode -> serial out

compile:

g++ -o main main.cpp Serial.cpp SLIPEncodedSerial.cpp UdpSocket.cpp Socket.cpp

to kill any process using the serial port:

sudo fuser -k /dev/name of port

also in Linux ModemManager is grabbing the port when USB serial device is first attached, so disable this:

sudo systemctl disable ModemManager.service
sudo systemctl stop ModemManager.service
