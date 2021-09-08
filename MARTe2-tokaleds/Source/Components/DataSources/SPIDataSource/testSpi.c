
#include "spiSupport.h"
#include "gpioApi.h"
#include <poll.h>
#include <stdlib.h>
#include <fcntl.h>
  #include <sys/types.h>
       #include <unistd.h>

#define RDBUF_LEN 5
char spiBuffer[32];
int main(){

    int spiFd=-1;
    // Spi CS 	
    int device=0;
    int speed=150000;
    int mode=0; 
    int clockFd=-1;
    int clockPin=23;
    struct pollfd clockPfd;
    memset(&clockPfd,0,sizeof(struct pollfd));
    char rdbuf[5];

    spiFd = SpiSetup(device,speed,mode);

    gpio_export(clockPin);
    gpio_set_dir(clockPin, 0);
    gpio_set_edge(clockPin,"rising");
    clockFd = gpio_fd_open(clockPin,O_RDONLY | O_NONBLOCK);
    if(clockFd<0) return 1;
    int ret=0;
	
	clockPfd.fd = clockFd;
	clockPfd.events = POLLPRI;

	lseek(clockFd, 0, SEEK_SET);

	read(clockFd, rdbuf, RDBUF_LEN - 1);

  
	ret = poll(&clockPfd, 1,-1);

	     ret=-1;
	     if (clockPfd.revents & POLLPRI) {

		    lseek(clockFd, 0, SEEK_SET);
		    ret = read(clockFd, rdbuf, RDBUF_LEN - 1);

		//    printf("%d\n",ret);

		} //else goto POLLING;

	
    //copy from datasourceMem+sizeRead 
    //MemoryOperationsHelper::Copy( static_cast<void *>(spiBuffer),reinterpret_cast<void *>(&dataSourceMemory[offsets[numberOfTimeChannels]]+totSizeToRead), totSizeToWrite);	
    ret=SpiDataRW(device,(unsigned char*)spiBuffer,32);

    int count=*((short int*)(&spiBuffer));
    int time=*((short int*)(&spiBuffer+4));
    int sampl=*((short int*)(&spiBuffer+12));

    printf("ret %d count %d time %d sampl %d\n",ret,count,time,sampl);
    //copy to datasourceMem+TimeSize
    //MemoryOperationsHelper::Copy(reinterpret_cast<void *>(&dataSourceMemory[offsets[numberOfTimeChannels]]), static_cast<void *>(spiBuffer), totSizeToRead);	
    if(spiFd>0)
       close(spiFd);
 
       gpio_fd_close(clockFd);
        gpio_unexport(clockPin);

 return 0;

}
