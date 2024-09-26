#line 1 "C:/Users/Satellite/Desktop/Melab_KeyPad_Matrix/P877_Keypad_Matrix_Code/LCD_HD44780.c"
#line 1 "c:/users/satellite/desktop/melab_keypad_matrix/p877_keypad_matrix_code/lcd_hd44780.h"
#line 27 "c:/users/satellite/desktop/melab_keypad_matrix/p877_keypad_matrix_code/lcd_hd44780.h"
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
void ToggleEpinOfLCD(void);
#line 8 "C:/Users/Satellite/Desktop/Melab_KeyPad_Matrix/P877_Keypad_Matrix_Code/LCD_HD44780.c"
void ToggleEpinOfLCD(void){
  PORTC.B1  = 1;
 Delay_us( 100 );
  PORTC.B1  = 0;
 Delay_us( 100 );
 }



void WriteCommandToLCD(unsigned char Command){
  PORTC.B0  = 0;
  PORTD  &= 0x0F;
  PORTD  |= (Command&0xF0);
 ToggleEpinOfLCD();
  PORTD  &= 0x0F;
  PORTD  |= ((Command<<4)&0xF0);
 ToggleEpinOfLCD();
 }




void WriteDataToLCD(char LCDChar){
  PORTC.B0  = 1;
  PORTD  &= 0x0F;
  PORTD  |= (LCDChar&0xF0);
 ToggleEpinOfLCD();
  PORTD  &= 0x0F;
  PORTD  |= ((LCDChar<<4)&0xF0);
 ToggleEpinOfLCD();
 }




void InitLCD(void){

  PORTC.B1  = 0;
  PORTC.B0  = 0;

 Delay_ms(40);

  PORTD  &= 0x0F;
  PORTD  |= 0x30;
 ToggleEpinOfLCD();

 Delay_ms(6);

  PORTD  &= 0x0F;
  PORTD  |= 0x30;
 ToggleEpinOfLCD();

 Delay_us(300);

  PORTD  &= 0x0F;
  PORTD  |= 0x30;
 ToggleEpinOfLCD();

 Delay_ms(2);

  PORTD  &= 0x0F;
  PORTD  |= 0x20;
 ToggleEpinOfLCD();

 Delay_ms(2);

 WriteCommandToLCD(0x28);
 WriteCommandToLCD(0x0c);
 WriteCommandToLCD(0x01);
 WriteCommandToLCD(0x06);
 }




void WriteStringToLCD(const char *s){
 while(*s) WriteDataToLCD(*s++);
 }




void ClearLCDScreen(void)
{
 WriteCommandToLCD(0x01);
 Delay_ms(2);
}




void GotoYXPositionOnLCD(unsigned char LineNumber, unsigned char OFFSET)
{
 WriteCommandToLCD(0x80|((LineNumber*0x40)+OFFSET));
}




void WriteLCDLine1(const char *s)
{
 GotoYXPositionOnLCD( 0 , 0);
 WriteStringToLCD(s);
}




void WriteLCDLine2(const char *s)
{
 GotoYXPositionOnLCD( 1 , 0);
 WriteStringToLCD(s);
}




void WriteLCDLine3(const char *s)
{
 GotoYXPositionOnLCD( 2 , 0);
 WriteStringToLCD(s);
}




void WriteLCDLine4(const char *s)
{
 GotoYXPositionOnLCD( 3 , 0);
 WriteStringToLCD(s);
}




void welcome_msg(){
 ClearLCDScreen();
 WriteLCDLine1("* 4X4 Key Pad *");
 WriteLCDLine2("**  MELAB-BD  **");
 Delay_ms(1000);
 }
