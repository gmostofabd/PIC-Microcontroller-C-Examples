
/*##############################################################################
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
##############################################################################*/
// Define which port is being used for data bus
#define LCD_PORT      PORTD
#define LCD_RS        PORTD.B0
#define LCD_EN        PORTD.B1
// Constants
#define E_Delay       100
#define LCD_LINE1     0
#define LCD_LINE2     1
#define LCD_LINE3     2
#define LCD_LINE4     3
/*##############################################################################
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
##############################################################################*/



/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void ToggleEpinOfLCD(void){
        LCD_EN = 1;                // Give a pulse on E pin
        Delay_us(E_Delay);         // so that LCD can latch the
        LCD_EN = 0;                // data from data bus
        Delay_us(E_Delay);
  }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void WriteCommandToLCD(unsigned char Command){
        LCD_RS = 0;                          // It is a command
        LCD_PORT &= 0x0F;                    // Make Data pins zero
        LCD_PORT |= (Command&0xF0);          // Write Upper nibble of data
        ToggleEpinOfLCD();                   // Give pulse on E pin
        LCD_PORT &= 0x0F;                    // Make Data pins zero
        LCD_PORT |= ((Command<<4)&0xF0);     // Write Lower nibble of data
        ToggleEpinOfLCD();                   // Give pulse on E pin
  }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void WriteDataToLCD(char LCDChar){
        LCD_RS = 1;                           // It is data
        LCD_PORT &= 0x0F;                     // Make Data pins zero
        LCD_PORT |= (LCDChar&0xF0);           // Write Upper nibble of data
        ToggleEpinOfLCD();                    // Give pulse on E pin
        LCD_PORT &= 0x0F;                     // Make Data pins zero
        LCD_PORT |= ((LCDChar<<4)&0xF0);      // Write Lower nibble of data
        ToggleEpinOfLCD();                    // Give pulse on E pin
  }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void InitLCD(void){
        // Firstly make all pins output
        LCD_EN            = 0;   // E  = 0
        LCD_RS            = 0;   // RS = 0
  ///////////////// Reset process from datasheet //////////////
   Delay_ms(40);

        LCD_PORT &= 0x0F;                  // Make Data pins zero
        LCD_PORT |= 0x30;                  // Write 0x3 value on data bus
        ToggleEpinOfLCD();                  // Give pulse on E pin

   Delay_ms(6);

        LCD_PORT &= 0x0F;                  // Make Data pins zero
        LCD_PORT |= 0x30;                  // Write 0x3 value on data bus
        ToggleEpinOfLCD();                  // Give pulse on E pin

   Delay_us(300);

        LCD_PORT &= 0x0F;                  // Make Data pins zero
        LCD_PORT |= 0x30;                  // Write 0x3 value on data bus
        ToggleEpinOfLCD();                  // Give pulse on E pin

   Delay_ms(2);

        LCD_PORT &= 0x0F;                  // Make Data pins zero
        LCD_PORT |= 0x20;                  // Write 0x2 value on data bus
        ToggleEpinOfLCD();                  // Give pulse on E pin

        Delay_ms(2);
  /////////////// Reset Process End ////////////////
        WriteCommandToLCD(0x28);    //function set
        WriteCommandToLCD(0x0c);    //display on,cursor off,blink off
        WriteCommandToLCD(0x01);    //clear display
        WriteCommandToLCD(0x06);    //entry mode, set increment
  }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void WriteStringToLCD(const char *s){
        while(*s) WriteDataToLCD(*s++);   // print first character on LCD
  }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void ClearLCDScreen(void)       // Clear the Screen and return cursor to zero position
{
        WriteCommandToLCD(0x01);    // Clear the screen
        Delay_ms(2);              // Delay for cursor to return at zero position
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void GotoYXPositionOnLCD(unsigned char LineNumber, unsigned char OFFSET)   // LineNumber can have two values, LCD_LINE1 and LCD_LINE2
{                                                                          // OFFSET can have a value from 0 to 39 --> LCD DDRAM Range
        WriteCommandToLCD(0x80|((LineNumber*0x40)+OFFSET));                    // Line1 is from 0x0 to 0x27 and Line2 is from 0x40 to 0x67
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void WriteLCDLine1(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
{
        GotoYXPositionOnLCD(LCD_LINE1, 0);     // Goto 0,0 location
        WriteStringToLCD(s);
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void WriteLCDLine2(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
{
        GotoYXPositionOnLCD(LCD_LINE2, 0);     // Goto 1,0 location
        WriteStringToLCD(s);
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void WriteLCDLine3(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
{
        GotoYXPositionOnLCD(LCD_LINE3, 0);     // Goto 1,0 location
        WriteStringToLCD(s);
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void WriteLCDLine4(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
{
        GotoYXPositionOnLCD(LCD_LINE4, 0);     // Goto 1,0 location
        WriteStringToLCD(s);
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
void welcome_msg(){
//     unsigned char txt1[]="**  MELAB-BD  **";

     ClearLCDScreen();               // Clear display  +++++++++++++++++|||||
     WriteLCDLine1("* Hello  World *");
     WriteLCDLine2("**  MELAB-BD  **");

//     WriteLCDLine2  (txt1);
     Delay_ms(1000);


  }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

