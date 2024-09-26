/*
 * Project name:
     Lcd8_Test (Demonstration of the Lcd8 library routines)
 * Copyright:
     (c) Mikroelektronika, 2008.
 * Revision History:
     20080930:
       - initial release;
 * Description:
     This code demonstrates how to use Lcd 8-bit library. Lcd is first
     initialized, then some text is written, then the text is moved.
 * Test configuration:
     MCU:             PIC16F887
     Dev.Board:       EasyPIC5
     Oscillator:      HS, 08.0000 MHz
     Ext. Modules:    Lcd 2x16
     SW:              mikroC PRO for PIC
 * NOTES:
     - None.
*/

// Lcd8 module connections
sbit LCD8_RS at RB2_bit;
sbit LCD8_RW at RB3_bit;
sbit LCD8_EN at RB4_bit;
sbit LCD8_D7 at RD7_bit;
sbit LCD8_D6 at RD6_bit;
sbit LCD8_D5 at RD5_bit;
sbit LCD8_D4 at RD4_bit;
sbit LCD8_D3 at RD3_bit;
sbit LCD8_D2 at RD2_bit;
sbit LCD8_D1 at RD1_bit;
sbit LCD8_D0 at RD0_bit;

sbit LCD8_RS_Direction at TRISB2_bit;
sbit LCD8_RW_Direction at TRISB3_bit;
sbit LCD8_EN_Direction at TRISB4_bit;
sbit LCD8_D7_Direction at TRISD7_bit;
sbit LCD8_D6_Direction at TRISD6_bit;
sbit LCD8_D5_Direction at TRISD5_bit;
sbit LCD8_D4_Direction at TRISD4_bit;
sbit LCD8_D3_Direction at TRISD3_bit;
sbit LCD8_D2_Direction at TRISD2_bit;
sbit LCD8_D1_Direction at TRISD1_bit;
sbit LCD8_D0_Direction at TRISD0_bit;
// End Lcd8 module connections

char txt1[] = "mikroElektronika";    
char txt2[] = "EasyPIC5";
char txt3[] = "Lcd8bit";
char txt4[] = "example";

char i;                              // Loop variable

void Move_Delay() {                  // Function used for text moving
  Delay_ms(500);                     // You can change the moving speed here
}

void main(){
  ANSEL  = 0;                        // Configure AN pins as digital I/O
  ANSELH = 0;
  C1ON_bit = 0;                      // Disable comparators
  C2ON_bit = 0;
  
  Lcd8_Init();                       // Initialize Lcd8

  Lcd8_Cmd(_LCD_CLEAR);              // Clear display
  Lcd8_Cmd(_LCD_CURSOR_OFF);         // Cursor off
  Lcd8_Out(1,6,txt3);                // Write text in first row

  Lcd8_Out(2,6,txt4);                // Write text in second row
  Delay_ms(2000);
  Lcd8_Cmd(_LCD_CLEAR);              // Clear display

  Lcd8_Out(1,1,txt1);                // Write text in first row
  Lcd8_Out(2,5,txt2);                // Write text in second row

  Delay_ms(2000);

  // Moving text
  for(i=0; i<4; i++) {               // Move text to the right 4 times
    Lcd8_Cmd(_LCD_SHIFT_RIGHT);
    Move_Delay();
  }

  while(1) {                         // Endless loop
    for(i=0; i<8; i++) {             // Move text to the left 7 times
      Lcd8_Cmd(_LCD_SHIFT_LEFT);
      Move_Delay();
    }

    for(i=0; i<8; i++) {             // Move text to the right 7 times
      Lcd8_Cmd(_LCD_SHIFT_RIGHT);
      Move_Delay();
    }
  }
}
