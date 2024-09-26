/*
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                            7 Segment Program
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
This program increase and display digit 0 to 9 on a common Anode SSD with
one second intervals.
Coded by        : Golam Mostofa
Date            : 20.03.2005
MCU             : 16F877A @ 4.00 MHz
Compiler        : MikroC pro for PIC (Vr. 6.0)
File name       : 7_Seg_CA.c
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*/

unsigned short cc_7_Seg[10] = {0B01000000, 0B01111001, 0B00100100, 0B00110000,
                               0B00011001, 0B00010010, 0B00000010, 0B01111000,
                               0B00000000, 0B00010000
                              }; // Data Patterns for the Common Anode SSD

void main() {
     unsigned short i;

     TRISB = 0;
     PORTB = 0;

  while(1){

    for(i = 0; i<10; i++){
       PORTB = cc_7_Seg[i];       // For 0 CC
       Delay_ms(1000);
      }
   }
 }