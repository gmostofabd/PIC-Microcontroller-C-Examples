

sbit LCD_RS at  RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

int value;
char value1 [15];
void main (){

TRISA.RA0=1;
ADC_Init ();
LCD_Init ();
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
Lcd_out (1,1,"Sarowar");
delay_ms (2000);
Lcd_Cmd(_LCD_CLEAR);
Lcd_out(1,1,"temperature");

while (1) {
value=adc_read(0);
value=value*0.488;
floattostr(value,value1);
Lcd_chr(2,9,39);
Lcd_out(2,10,"C");
Lcd_out(2,1,value1);
delay_ms(500);
}
}