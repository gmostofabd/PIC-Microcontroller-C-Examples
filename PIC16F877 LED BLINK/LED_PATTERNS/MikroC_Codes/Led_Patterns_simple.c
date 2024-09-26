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
     TRISB = 0X00 ; // 0B11111110;     // Declaring all as Output of PORTB
     PORTB = 0x00;  // PORT Refreshing intensionally
       while(1){
          PORTB = 0b00000001;          // RB0 High
          Delay_ms (1000);             // Delay One Second
          PORTB = 0b00000010;          // RB1 High
          Delay_ms (1000);             // Delay One Second
          PORTB = 0b00000100;          // RB2 High
          Delay_ms (1000);             // Delay One Second
          PORTB = 0b00001000;          // RB3 High
          Delay_ms (1000);             // Delay One Second
          PORTB = 0b00010000;          // RB4 High
          Delay_ms (1000);             // Delay One Second
          PORTB = 0b00100000;          // RB5 High
          Delay_ms (1000);             // Delay One Second
          PORTB = 0b01000000;          // RB6 High
          Delay_ms (1000);             // Delay One Second
          PORTB = 0b10000000;          // RB7 High
          Delay_ms (1000);             // Delay One Second
        }
 }