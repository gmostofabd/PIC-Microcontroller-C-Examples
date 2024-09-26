/* Using RE3/MCLR pin of PIC16F887 as an input
we don't use MCLR as Reset So it can run
without MCLR reset.
Author: ENG BUNTHA */

#define TACT PORTE.RE3     // use RE3 as digital input

void main() {
     char LED[10] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
     // seven segment map
     char i=0;
     
     // i/o port initialization
     PORTD=0x00;
     TRISD=0x00;               // SET PORTD AS DIGITAL OUTPUT
     PORTE=0x00;
     TRISE.TRISE3=1;           // SET RE3 AS AN INPUT
     
     // OSCILATOR CONFIGURATION
     OSCCON.IRCF0=1;
     OSCCON.IRCF1=1;
     OSCCON.IRCF2=1;           // IRCF=0b111 is SET TO 8MHz
     
     while(1) {
              if(TACT==0) {
                          while(TACT==0);    // WAIT UNTIL SWITCH IS RELEASE
                          i++;
                          if(i==10)          i=0;
                          }
              PORTD=LED[i];
              }
}