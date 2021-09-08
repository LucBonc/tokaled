#ifndef sping_pong
#define sping_pong

#ifdef __cplusplus
extern "C" {
#endif
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <linux/spi/spidev.h>
const static  char *spiDev0 = "/dev/spidev0.0";
const static  char *spiDev1 = "/dev/spidev0.1";
static uint8_t spiMode = 0;
static uint8_t spiBPW = 8;
static uint16_t spiDelay = 0;

static uint32_t spiSpeeds [2];
static int spiFds [2];
//static struct spi_ioc_transfer spi;

int SpiSetup(int channel, int speed,int mode);
int SpiDataRW(int channel, unsigned char *data, int len);

/*
int SpiSetup(int channel, int speed,int mode) {
    int fd;

    channel &= 1;

    if ((fd = open(channel == 0 ? spiDev0 : spiDev1, O_RDWR)) < 0)
        return -1;

    spiSpeeds [channel] = speed;
    spiFds [channel] = fd;

    // Set SPI parameters.
    //      Why are we reading it afterwriting it? I've no idea, but for now I'm blindly
    //      copying example code I've seen online...

    if (ioctl(fd, SPI_IOC_WR_MODE, &spiMode) < 0) return -1;
    if (ioctl(fd, SPI_IOC_RD_MODE, &spiMode) < 0) return -1;

    if (ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &spiBPW) < 0) return -1;
    if (ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &spiBPW) < 0) return -1;



    if (ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed) < 0) return -1;
    if (ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed) < 0) return -1;

    printf("spi channel %d fd %d,  spi mode: %d\n",channel,fd , mode);
    printf("bits per word: %d\n", spiBPW);
    printf("max speed: %d Hz (%d KHz)\n", speed, speed/1000);

    return fd;
}


int SpiDataRW(int channel,  unsigned char *data, int len) {

   struct spi_ioc_transfer spi;

  //memset((void *)&spi, 0, sizeof(struct spi_ioc_transfer));
  
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
   
    ret= ioctl(spiFds [channel], SPI_IOC_MESSAGE(2), &spi);
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

int SpiDataRW2(int channel,unsigned char *data, int len);

int SpiDataRW3(int channel,unsigned char *data, int len);

#ifdef __cplusplus
}
#endif
#endif
