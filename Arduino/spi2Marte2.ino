
#include <SPI.h>

struct output {
  int32_t counter;
  int32_t cycle_t;
  int32_t exec_t;
  uint16_t adc[8];
  uint32_t dummy;
};

struct input {
  int32_t pwm[5];
};


volatile int SIZEOFSPI = -1;
#define MAXSPISIZE 64
volatile char recvbuf [MAXSPISIZE];
volatile char sendbuf [MAXSPISIZE];
volatile byte pos;
volatile boolean process_it;


int adcCh[8] = {A0, A1, A2, A3, A4, A5, A6, A7};
int pwmPins[4] = {3, 5, 6,9 };

#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif
#define  clkPin  8
//#define  Apin 2
//#define  Bpin 4
//int digio[5] = {2, 4, 7, 8, 12};

void  initSPI_Slave()  {
  DDRB  &=  ~((1 << 2) | (1 << 3) | (1 << 5)); //  SCK,  MOSI  dan  SS  menjadi  input
  DDRB  |=  (1 << 4); //  MISO  menjadi  output
  SPCR  &=  ~(1 << MSTR);                                 //  SPI  sebagai  slave
  SPCR  |=  (0 << SPR0);//| (1 << SPR1);         //  Pembagi  clock  =  128
  SPCR  |=  (1 << SPE);                                     //  Aktifkan  SPI
  SPCR |= bit(SPIE);
}


/**
   Divides a given PWM pin frequency by a divisor.

   The resulting frequency is equal to the base frequency divided by
   the given divisor:
     - Base frequencies:
        o The base frequency for pins 3, 9, 10, and 11 is 31250 Hz.
        o The base frequency for pins 5 and 6 is 62500 Hz.
     - Divisors:
        o The divisors available on pins 5, 6, 9 and 10 are: 1, 8, 64,
          256, and 1024.
        o The divisors available on pins 3 and 11 are: 1, 8, 32, 64,
          128, 256, and 1024.

   PWM frequencies are tied together in pairs of pins. If one in a
   pair is changed, the other is also changed to match:
     - Pins 5 and 6 are paired on timer0
     - Pins 9 and 10 are paired on timer1
     - Pins 3 and 11 are paired on timer2

   Note that this function will have side effects on anything else
   that uses timers:
     - Changes on pins 3, 5, 6, or 11 may cause the delay() and
       millis() functions to stop working. Other timing-related
       functions may also be affected.
     - Changes on pins 9 or 10 will cause the Servo library to function
       incorrectly.

   Thanks to macegr of the Arduino forums for his documentation of the
   PWM frequency divisors. His post can be viewed at:
     http://forum.arduino.cc/index.php?topic=16612#msg121031
*/
void setPwmFrequency(int pin, int divisor) {
  byte mode;
  if (pin == 5 || pin == 6 || pin == 9 || pin == 10) {
    switch (divisor) {
      case 1: mode = 0x01; break;
      case 8: mode = 0x02; break;
      case 64: mode = 0x03; break;
      case 256: mode = 0x04; break;
      case 1024: mode = 0x05; break;
      default: return;
    }
    if (pin == 5 || pin == 6) {
      TCCR0B = TCCR0B & 0b11111000 | mode;
    } else {
      TCCR1B = TCCR1B & 0b11111000 | mode;
    }
  } else if (pin == 3 || pin == 11) {
    switch (divisor) {
      case 1: mode = 0x01; break;
      case 8: mode = 0x02; break;
      case 32: mode = 0x03; break;
      case 64: mode = 0x04; break;
      case 128: mode = 0x05; break;
      case 256: mode = 0x06; break;
      case 1024: mode = 0x07; break;
      default: return;
    }
    TCCR2B = TCCR2B & 0b11111000 | mode;
  }
}

void setup (void)
{

  SIZEOFSPI = sizeof(struct input) > sizeof(struct output) ? sizeof(struct input) : sizeof(struct output); //32BIT COUNTER +STAT TIME+EXEC TIME + floatadc to send  // recv 1 byte pwm recv ...

  Serial.begin (115200); // debugging
  Serial.println(SIZEOFSPI);
  process_it = false;
  pos = 0;
  memset((void*)sendbuf, 0, SIZEOFSPI);
  memset((void*)recvbuf, 0, SIZEOFSPI);

  pinMode(clkPin, OUTPUT);   // sets the pin as output


  for (int i = 0; i < 4; i++) {
    pinMode(pwmPins[i], OUTPUT);   // sets the pin as output

  }

 /* pinMode(Apin, OUTPUT);   // sets the pin as output

  pinMode(Bpin, OUTPUT);   // sets the pin as output
  digitalWrite(Apin, LOW);
  digitalWrite(Bpin, HIGH);
  */      
  analogReference(DEFAULT);
  // turn on interrupts
  //
  initSPI_Slave();
  //setPwmFrequency(5, 8);//affects delay and pin 11
  //example 1: Set ADC prescaler to 16 (= 77MHz) (1-0-0)
  sbi(ADCSRA, ADPS2) ; //Sets ADPS2 to 1
  cbi(ADCSRA, ADPS1) ; //Sets ADPS1 to 0
  cbi(ADCSRA, ADPS0) ; //Sets ADPS0 to 0

}  // end of setup

uint64_t smt = 0;
volatile static int16_t spitime;
// SPI interrupt routine
ISR (SPI_STC_vect)
{
  byte c = SPDR; // grab byte from SPI Data Register
  // add to buffer if room
  if (pos == 0) smt = micros();
  if (pos < SIZEOFSPI)
  {
    SPDR = sendbuf[pos];
    recvbuf [pos] = c;
    pos++;
    // example: newline means time to process buffer
    if (/*c == '\n'*/ pos == SIZEOFSPI) {
      process_it = true;
      pos = 0;
      spitime = micros() - smt;
    }

  } // end of room available


} // end of interrupt routine SPI_STC_vect




// main loop - wait for flag set in interrupt routine
void loop (void)
{
  // char loc_recvbuf [MAXSPISIZE];
  //char loc_sendbuf [MAXSPISIZE];
  //char defvals [MAXSPISIZE];

  //memset((void*)loc_sendbuf, 0, SIZEOFSPI);
  //memset((void*)loc_recvbuf, 0, SIZEOFSPI);
  // memset((void*)defvals, 0, SIZEOFSPI);

  struct output * out = (struct output *)sendbuf;
  struct input * in = (struct input *) (recvbuf);
  uint64_t t = 0;
  uint64_t oldt = 0;
  int ext = 0;
  int numberofProcess = 0;
  do {
    oldt = t;
    t = micros();
    if (oldt > 0)
      out->cycle_t = (int)(t - oldt);
    else oldt = 0;

    out->counter++;

    out->exec_t = ext + spitime;

    //   while(!process_it && ((micros()-t)< 500));
    digitalWrite(clkPin, HIGH);
    delayMicroseconds(50);
    digitalWrite(clkPin, LOW);
 /*   process_it = false;
    while (pos < SIZEOFSPI  )
    {
      while (!(SPSR & (1 << SPIF))); // wait until all data is received
      recvbuf [pos] = SPDR;
      SPDR = sendbuf[pos];
      pos++;
      //data = SPDR;                   // hurray, we now have our data

      process_it = true;

    }

    pos = 0;*/

    if (process_it)
    {
      process_it = false;
      numberofProcess++;

      //memcpy(loc_recvbuf, recvbuf, SIZEOFSPI);



      for (int i = 0; i < 8; i++){
        out->adc[i] = /*(5./1023.)*/ analogRead(adcCh[i]);
    //    Serial.print(out->adc[i]);
      //  Serial.print(" ");
      }
       //Serial.println();
      // out->adc = (float)adcVal * 5. / 1023.;



      //int16_t p = in->pwm[1];
     /* if (p < 0) {
        p = p * -1;
        digitalWrite(Apin, HIGH);
        digitalWrite(Bpin, LOW);
      } else if (p > 0) {
        digitalWrite(Apin, LOW);
        digitalWrite(Bpin, HIGH);
      }else if (p == 0) {
        digitalWrite(Apin, LOW);
        digitalWrite(Bpin, LOW);
      }*/
      //memcpy(sendbuf, loc_sendbuf, SIZEOFSPI);
      /*if(numberofProcess==1){
          memcpy(defvals, loc_sendbuf, SIZEOFSPI);
        }*/
      for (int i = 0; i < 4; i++){
        //in->pwm[i]=100;
        analogWrite(pwmPins[i], abs(in->pwm[i]));
        
        }
      // Serial.print((int)out->counter);
      // Serial.println();
       // Serial.print(in->pwm[2]);

        // Serial.println(" ");

      /*   Serial.print((int)out->counter);
         Serial.print(" ");
         Serial.print(out->cycle_t);
         Serial.print(" ");
         Serial.print(out->exec_t);
         //Serial.print(" ");
         //Serial.print((int)out->adc);*/
        // Serial.println();
     


      //out->dummy=spitime;//,sizeof(uint16_t));
    }

    ext =  (micros() - t);
   
    while(micros()-t<4000);
    //delayMicroseconds(1000 - (int)ext );
  } while (true);

} // end of loop
