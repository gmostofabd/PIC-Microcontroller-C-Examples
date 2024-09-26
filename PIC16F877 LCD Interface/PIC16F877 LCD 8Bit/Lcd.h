
// Function Declarations for Generic Functions.c

#ifndef __Lcd
#define __Lcd

/*##############################################################################
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
##############################################################################*/
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
// LCD module connections
sbit LCD_RS at RD1_bit;  // SETING RS BIT ON PORTC BIT 3||||||||||||||||||||||||
sbit LCD_EN at RD0_bit;  // SETING EN BIT ON PORTC BIT 1||||||||||||||||||||||||
sbit LCD_D4 at RD4_bit;  // SETING DATA BIT 4 ON PORTC BIT 4||||||||||||||||||||
sbit LCD_D5 at RD5_bit;  // SETING DATA BIT 5 ON PORTC BIT 5||||||||||||||||||||
sbit LCD_D6 at RD6_bit;  // SETING DATA BIT 6 ON PORTC BIT 6||||||||||||||||||||
sbit LCD_D7 at RD7_bit;  // SETING DATA BIT 7 ON PORTC BIT 7||||||||||||||||||||
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
sbit LCD_RS_Direction at TRISD1_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_EN_Direction at TRISD0_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_D4_Direction at TRISD4_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_D5_Direction at TRISD5_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_D6_Direction at TRISD6_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_D7_Direction at TRISD7_bit;  // SETING DATA DIRECTION USING TRIS BITS||
// End LCD module connections
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
/*##############################################################################
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
##############################################################################*/

// Function Declarations
void WriteCommandToLCD(unsigned char);
void WriteDataToLCD(char);
void InitLCD(void);
void WriteStringToLCD(const char*);
void ClearLCDScreen(void);
void GotoYXPositionOnLCD(unsigned char,unsigned char);
void WriteLCDLine1(const char*);
void WriteLCDLine2(const char*);
void WriteLCDLine3(const char*);
void WriteLCDLine4(const char*);

#endif