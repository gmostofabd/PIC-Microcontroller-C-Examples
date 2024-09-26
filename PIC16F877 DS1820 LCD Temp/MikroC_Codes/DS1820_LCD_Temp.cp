#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/DS1820_LCD_Temp/MikroC_Codes/DS1820_LCD_Temp.c"
#line 7 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/DS1820_LCD_Temp/MikroC_Codes/DS1820_LCD_Temp.c"
sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;
#line 37 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/DS1820_LCD_Temp/MikroC_Codes/DS1820_LCD_Temp.c"
const unsigned short TEMP_RESOLUTION = 12;
char SaveBank;
char *text = "000.00";
unsigned temp;

void Display_Temperature(unsigned int temp2write) {
 const unsigned short RES_SHIFT = TEMP_RESOLUTION - 8;
 char temp_whole;
 unsigned int temp_fraction;


 if (temp2write & 0x8000) {
 text[0] = '-';
 temp2write = ~temp2write + 1;
 }


 temp_whole = temp2write >> RES_SHIFT ;


 if (temp_whole/100)
 text[0] = temp_whole/100 + 48;
 else
 text[0] = '0';

 text[1] = (temp_whole/10)%10 + 48;
 text[2] = temp_whole%10 + 48;


 temp_fraction = temp2write << (4-RES_SHIFT);
 temp_fraction &= 0x000F;
 temp_fraction *= 625;


 text[4] = temp_fraction/1000 + 48;
 text[5] = (temp_fraction/100)%10 + 48;




 Lcd_Out(2, 5, text);
 }
#line 82 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/DS1820_LCD_Temp/MikroC_Codes/DS1820_LCD_Temp.c"
void main() {


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 1, " Temperature:   ");

 Lcd_Chr(2,13,0xdf);

 Lcd_Chr(2,14,'C');



 do {

 Ow_Reset(&PORTB, 0);
 Ow_Write(&PORTB, 0, 0xCC);
 Ow_Write(&PORTB, 0, 0x44);
 Delay_us(120);
 Ow_Reset(&PORTB, 0);
 Ow_Write(&PORTB, 0, 0xCC);
 Ow_Write(&PORTB, 0, 0xBE);
 Delay_ms(400);

 temp = Ow_Read(&PORTB, 0);
 temp = (Ow_Read(&PORTB, 0) << 8) + temp;


 Display_Temperature(temp);
 Delay_ms(500);
 }
 while (1);
 }
