#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/LCD_4_Bit/MikroC_Codes/Lcd_4_bit.c"
#line 20 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/LCD_4_Bit/MikroC_Codes/Lcd_4_bit.c"
char txt1[] = "mikroElektronika";
char txt2[] = "EasyPIC6";
char txt3[] = "Sarwar";
char txt4[] = "example";

char i;



void InitLCD(void);
void ToggleEpinOfLCD();
void WriteCommandToLCD(unsigned char Command);
void WriteDataToLCD(char LCDChar);
void welcome_msg();
void ClearLCDScreen(void);
void GotoYXPositionOnLCD(unsigned char LineNumber, unsigned char OFFSET);


void Move_Delay() {
 Delay_ms(500);
}





void main(){
 TRISB = 0;
 TRISC = 0;

 InitLCD();
 while(1){







 welcome_msg();

 }

}









void InitLCD(void)
{

  RC1_bit  = 0;
  RC0_bit  = 0;

 Delay_ms(40);

  PORTB  &= 0x0F;
  PORTB  |= 0x30;
 ToggleEpinOfLCD();

 Delay_ms(6);

  PORTB  &= 0x0F;
  PORTB  |= 0x30;
 ToggleEpinOfLCD();

 Delay_us(300);

  PORTB  &= 0x0F;
  PORTB  |= 0x30;
 ToggleEpinOfLCD();

 Delay_ms(2);

  PORTB  &= 0x0F;
  PORTB  |= 0x20;
 ToggleEpinOfLCD();

 Delay_ms(2);

 WriteCommandToLCD(0x28);
 WriteCommandToLCD(0x0c);
 WriteCommandToLCD(0x01);
 WriteCommandToLCD(0x06);
}



void ToggleEpinOfLCD(void)
{
  RC1_bit  = 1;
 Delay_us( 100 );
  RC1_bit  = 0;
 Delay_us( 100 );
}




void WriteCommandToLCD(unsigned char Command)
{
  RC0_bit  = 0;
  PORTB  &= 0x0F;
  PORTB  |= (Command&0xF0);
 ToggleEpinOfLCD();

  PORTB  &= 0x0F;
  PORTB  |= ((Command<<4)&0xF0);
 ToggleEpinOfLCD();
}




void WriteDataToLCD(char LCDChar)
{
  RC0_bit  = 1;
  PORTB  &= 0x0F;
  PORTB  |= (LCDChar&0xF0);
 ToggleEpinOfLCD();
  PORTB  &= 0x0F;
  PORTB  |= ((LCDChar<<4)&0xF0);
 ToggleEpinOfLCD();
}



void WriteStringToLCD(const char *s)
{
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
 WriteLCDLine1("* Hello  World *");
 WriteLCDLine2("**  MELAB-BD  **");


 Delay_ms(1000);


 }
