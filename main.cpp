#include <unistd.h>
#include "Serial.h"
#include "SLIPEncodedSerial.h"
#include "UdpSocket.h"

Serial serial; 
SLIPEncodedSerial slip;

// listen for incoming messages on 5000
UdpSocket udpSock(5000);

uint8_t buf[4096];
int len;

int main() {

    // send messages to 5001
    udpSock.setDestination(5001, "localhost");

    while (1) {

        // poll interval
        usleep(5000);

        // serial in, UDP out
        if (slip.recvMessage(serial)) {
            //printf("got one \n");
            udpSock.writeBuffer(slip.decodedBuf, slip.decodedLength);
        }
    
        // UDP in, serial out
        len = udpSock.readBuffer(buf, 2048, 0);
        if (len > 0) {
            //printf("got one\n"); for (int i = 0; i < len; i++) { printf("%d", buf[i]); } printf("\n");
            slip.sendMessage(buf, len, serial);
        }
    }
    //printf("error %d reading: %s", errno, strerror (errno));
}

