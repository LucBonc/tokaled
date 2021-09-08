  
#include <stdint.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include "spiSupport.h"
#include <errno.h>
/*
static char *spiDev0 = "/dev/spidev0.0";
static char *spiDev1 = "/dev/spidev0.1";
static uint8_t spiMode = 0;
static uint8_t spiBPW = 8;
static uint16_t spiDelay = 0;

static uint32_t spiSpeeds [2];
static int spiFds [2];
*/
int SpiSetup(int channel, int speed,int mode) {
    int fd;

    channel &= 1;

    if ((fd = open(channel == 0 ? spiDev0 : spiDev1, O_RDWR)) < 0)
        return -1;

    spiSpeeds [channel] = speed;
    spiFds [channel] = fd;
    spiMode|=mode;
//    spiDelay=5;
    // Set SPI parameters.
    //      Why are we reading it afterwriting it? I've no idea, but for now I'm blindly
    //      copying example code I've seen online...

    if (ioctl(fd, SPI_IOC_WR_MODE, &spiMode) < 0) return -1;
    if (ioctl(fd, SPI_IOC_RD_MODE, &spiMode) < 0) return -1;

    if (ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &spiBPW) < 0) return -1;
    if (ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &spiBPW) < 0) return -1;

    if (ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed) < 0) return -1;
    if (ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed) < 0) return -1;

    printf("spi channel %d fd %d,  spi mode: %d\n",channel,fd , spiMode);
//    printf("bits per word: %d\n", spiBPW);
    printf("max speed: %d Hz (%d KHz)\n", speed, speed/1000);
    spiDelay=1;
    return fd;
}
//static struct spi_ioc_transfer spi;


/*
int SpiDataRW(int channel, unsigned char *data, int len) {

  
  struct spi_ioc_transfer spi = {
                .tx_buf = (unsigned long)data,
                .rx_buf = (unsigned long)data,
                .len = len,
                .delay_usecs = spiDelay,
                .speed_hz = spiSpeeds [channel],
                .bits_per_word = spiBPW,
//              .cs_change = 1,
        };

//  memset((void *)&spi, 0, sizeof(struct spi_ioc_transfer));
  
  int ret=0; 

  channel &= 1;

    spi.tx_buf = (unsigned long)data;
    spi.rx_buf = (unsigned long)data;
    spi.len = len;
    spi.delay_usecs = spiDelay;
    spi.speed_hz = spiSpeeds [channel];
    spi.bits_per_word = spiBPW;
//    spi.cs_change=1;

      printf("spiDataRW channel %d fd %d\n",channel,spiFds [channel]);
     for (ret = 0; ret < len; ret++) {
                if (!(ret % 40))
                        puts("");
                printf("%c ", data[ret]);
        }
   
    ret= ioctl(spiFds [channel], SPI_IOC_MESSAGE(1), &spi);
    if (ret < 1){
        	printf("%s\n",strerror(errno));
	        printf("can't send spi message\n");
	}
    else
     for (ret = 0; ret < len; ret++) {
                if (!(ret % 40))
                        puts("");
                printf("%c ", data[ret]);
        }


    return ret;

}
*/

int SpiDataRW(int channel, unsigned char *data, int len) {

  
  int ret=0; 
    
    struct spi_ioc_transfer spi;
    memset((void *)&spi, 0, sizeof(struct spi_ioc_transfer));
// for( i=0;i<len;i++){
    spi.tx_buf = (unsigned long) ((char*)data);
    spi.rx_buf = (unsigned long) ((char*)data);
    spi.len = len;
    spi.delay_usecs = spiDelay;
    spi.speed_hz = spiSpeeds [channel];
    spi.bits_per_word = spiBPW;

    channel &= 1;

    ret= ioctl(spiFds [channel], SPI_IOC_MESSAGE(1), &spi);
  //  usleep(5);
//}

  // for( i=0;i<len;i+=8){	
/*  while(ret!=len){

    int rest=len%8;
    spi.tx_buf=(unsigned long)&data[i];
    spi.rx_buf = (unsigned long)&data[i];
    
    spi.len = 8;
    if(i+8>len)
	 spi.len=rest;	
//    printf("%d\n",spi.len);

    channel &= 1;

  //  int sent=ioctl(spiFds [channel], SPI_IOC_MESSAGE(1), &spi);
//    if(sent==0)
    int sent=	ioctl(spiFds [channel], SPI_IOC_MESSAGE(1), &spi);
    if(sent!=spi.len)
	printf("error sent=%d!=%d\n",sent,spi.len);
    ret+=sent; 
    i+=spi.len;
    usleep(1);
   }

    if (ret < 1){
        	printf("%s\n",strerror(errno));
	        printf("can't send spi message\n");
	}
    else
     for (ret = 0; ret < len; ret++) {
                if (!(ret % 40))
                        puts("");
                printf("%c ", data[ret]);
        }
 */
//   printf("%d\n",ret);
    return ret;

}

 int SpiDataRW3(int channel, unsigned char *data, int len) {
    struct spi_ioc_transfer spi;
     memset((void *)&spi, 0, sizeof(struct spi_ioc_transfer));
   
     channel &= 1;

    spi.tx_buf = (unsigned long) data;
    spi.rx_buf = (unsigned long) data;
    spi.len = len;
    spi.delay_usecs = spiDelay;
    spi.speed_hz = spiSpeeds [channel];
    spi.bits_per_word = spiBPW;
    //spi.cs_change=1;

    return ioctl(spiFds [channel], SPI_IOC_MESSAGE(1), &spi);
}

 int SpiDataRW2(int channel, unsigned char *data, int len) {
    struct spi_ioc_transfer spi;

     channel &= 1;

    spi.tx_buf = (unsigned long) data;
    spi.rx_buf = (unsigned long) data;
    spi.len = len;
    spi.delay_usecs = spiDelay;
    spi.speed_hz = spiSpeeds [channel];
    spi.bits_per_word = spiBPW;
    spi.cs_change=1;

    return ioctl(spiFds [channel], SPI_IOC_MESSAGE(2), &spi);
}
