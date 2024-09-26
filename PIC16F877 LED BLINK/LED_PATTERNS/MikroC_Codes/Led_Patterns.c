/*
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                            LED FLASH Program
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
This program flashes an LED connected with pin RBO of PORTB with
one second intervals.
Coded by        : Golam Mostofa
Date            : 18.03.2005
MCU             : 16F877A @ 4.00 MHz
Compiler        : MikroC pro for PIC (Vr. 6.0)
File name       : LED.c
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*/
void main() {
     int i;
     TRISB = 0X00 ; // 0B11111110;     // Declaring Input Output of PORTB

     while(1){
       PORTB = 0b00000001;          // PORT Refreshing intensionally
       Delay_ms (1000);             // Delay One Second
       i = 7;
       while(i > 0){
          PORTB = PORTB << 1;          // RB1 High
          Delay_ms (1000);             // Delay One Second
          i --;
        }
      }
 }