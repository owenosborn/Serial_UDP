#include <unistd.h>
#include "Serial.h"
#include "SLIPEncodedSerial.h"
#include "UdpSocket.h"

Serial serial; 
SLIPEncodedSerial slipdec;
UdpSocket udpSock(5000);

uint8_t buf[4096];

int main() {
    udpSock.setDestination(5001, "localhost");
    
    while (1) {
        usleep(10000);

        if (slipdec.recvMessage(serial)) {
            udpSock.writeBuffer(slipdec.decodedBuf, slipdec.decodedLength);
            //printf("got one \n");
        }
    }
    //printf("error %d reading: %s", errno, strerror (errno));
}

