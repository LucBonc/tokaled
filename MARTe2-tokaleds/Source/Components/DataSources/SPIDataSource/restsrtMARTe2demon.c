#include "stdio.h"
#include <string.h>
#include "gpioApi.h"
#include <poll.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <unistd.h>

#define RDBUF_LEN 5

int main(int argc ,char** argv){
    char rdbuf[ RDBUF_LEN];
    int clockFd=-1;
    int clockPin=4;
    if(argc>1)
	clockPin=atoi(argv[1]);
    struct pollfd clockPfd;
    memset(&clockPfd,0,sizeof(struct pollfd));

    printf("Restart Button Linked to GPIO %d\n",clockPin);   
    gpio_export(clockPin);
    gpio_set_dir(clockPin, 0);
    gpio_set_edge(clockPin,"rising");
    clockFd = gpio_fd_open(clockPin,O_RDONLY | O_NONBLOCK);
    if(clockFd<0) return 1;
    int ret=0;
    while(1){    	
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

	

        printf("Restart Button Pressed!!");   

	system(" echo -e \"Destination=StateMachine\nFunction=GOTOSTATE1\" | nc localhost 8001");
	sleep(10);
	system("killall MARTeApp.ex");
	system("cd /home/pi/MARTe2-F4E/tokaleds/MARTe2-tokaleds/Startup && ./MARTeApp.sh -l RealTimeLoader -m StateMachine:START -f ../Configurations/RTApp-SPI_GPIOSync_MDSReaderNS_Picam_2T.cfg &");
	sleep(10);
        system(" echo -e \"Destination=StateMachine\nFunction=GOTOSTATE2\" | nc localhost 8001");
    //copy to datasourceMem+TimeSize
    //MemoryOperationsHelper::Copy(reinterpret_cast<void *>(&dataSourceMemory[offsets[numberOfTimeChannels]]), static_cast<void *>(spiBuffer), totSizeToRead);	
    }

       gpio_fd_close(clockFd);
        gpio_unexport(clockPin);

 return 0;

}
