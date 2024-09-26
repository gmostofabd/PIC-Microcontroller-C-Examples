
/*##############################################################################
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
##############################################################################*/
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
// LCD module connections
sbit LCD_RS at RC0_bit;  // SETING RS BIT ON PORTC BIT 3||||||||||||||||||||||||
sbit LCD_EN at RC1_bit;  // SETING EN BIT ON PORTC BIT 1||||||||||||||||||||||||
sbit LCD_D4 at RB4_bit;  // SETING DATA BIT 4 ON PORTC BIT 4||||||||||||||||||||
sbit LCD_D5 at RB5_bit;  // SETING DATA BIT 5 ON PORTC BIT 5||||||||||||||||||||
sbit LCD_D6 at RB6_bit;  // SETING DATA BIT 6 ON PORTC BIT 6||||||||||||||||||||
sbit LCD_D7 at RB7_bit;  // SETING DATA BIT 7 ON PORTC BIT 7||||||||||||||||||||
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
sbit LCD_RS_Direction at TRISC0_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_EN_Direction at TRISC1_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_D4_Direction at TRISB4_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_D5_Direction at TRISB5_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_D6_Direction at TRISB6_bit;  // SETING DATA DIRECTION USING TRIS BITS||
sbit LCD_D7_Direction at TRISB7_bit;  // SETING DATA DIRECTION USING TRIS BITS||
// End LCD module connections
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
/*##############################################################################
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
##############################################################################*/





//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
//  Set TEMP_RESOLUTION to the corresponding resolution of used DS18x20 sensor:
//  18S20: 9  (default setting; can be 9,10,11,or 12)
//  18B20: 12
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
const unsigned short TEMP_RESOLUTION = 12;  // 0 - 4096
char  SaveBank;
char *text = "000.00";
unsigned temp;
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void Display_Temperature(unsigned int temp2write) {
  const unsigned short RES_SHIFT = TEMP_RESOLUTION - 8;
  char temp_whole;
  unsigned int temp_fraction;
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  // check if temperature is negative
  if (temp2write & 0x8000) {
     text[0] = '-';
     temp2write = ~temp2write + 1;
     }
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  // extract temp_whole
  temp_whole = temp2write >> RES_SHIFT ;
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  // convert temp_whole to characters
  if (temp_whole/100)
     text[0] = temp_whole/100  + 48;
  else
     text[0] = '0';
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  text[1] = (temp_whole/10)%10 + 48;             // Extract tens digit
  text[2] =  temp_whole%10     + 48;             // Extract ones digit
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  // extract temp_fraction and convert it to unsigned int
  temp_fraction  = temp2write << (4-RES_SHIFT);
  temp_fraction &= 0x000F;
  temp_fraction *= 625;
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  // convert temp_fraction to characters
  text[4] =  temp_fraction/1000    + 48;         // Extract thousands digit
  text[5] = (temp_fraction/100)%10 + 48;         // Extract hundreds digit
//  text[6] = (temp_fraction/10)%10  + 48;         // Extract tens digit
//  text[7] =  temp_fraction%10      + 48;         // Extract ones digit

  // print temperature on LCD
  Lcd_Out(2, 5, text);
  }
/*##############################################################################
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
##############################################################################*/
void main() {
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
// CALLING FOR LCD INITIALIZATION, CLEAR LCD AND CURSOR_OFF FUNC FROM LIBRARY ##
   Lcd_Init();                        // Initialize LCD as 4 Bit Data Mode |||||
   Lcd_Cmd(_LCD_CLEAR);               // Clear display  +++++++++++++++++++|||||
   Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off     +++++++++++++++++++|||||
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  Lcd_Out(1, 1, " Temperature:   ");
  // Print degree character, 'C' for Centigrades
  Lcd_Chr(2,13,0xdf);  // different LCD displays have different char code for degree
                      // if you see greek alpha letter try typing 178 instead of 223
  Lcd_Chr(2,14,'C');
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  //--- main loop
  do {
    //--- perform temperature reading
    Ow_Reset(&PORTB, 0);                         // Onewire reset signal
    Ow_Write(&PORTB, 0, 0xCC);                   // Issue command SKIP_ROM
    Ow_Write(&PORTB, 0, 0x44);                   // Issue command CONVERT_T
    Delay_us(120);
    Ow_Reset(&PORTB, 0);
    Ow_Write(&PORTB, 0, 0xCC);                   // Issue command SKIP_ROM
    Ow_Write(&PORTB, 0, 0xBE);                   // Issue command READ_SCRATCHPAD
    Delay_ms(400);
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    temp =  Ow_Read(&PORTB, 0);
    temp = (Ow_Read(&PORTB, 0) << 8) + temp;
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //--- Format and display result on Lcd
    Display_Temperature(temp);
    Delay_ms(500);
    }
    while (1);
 }