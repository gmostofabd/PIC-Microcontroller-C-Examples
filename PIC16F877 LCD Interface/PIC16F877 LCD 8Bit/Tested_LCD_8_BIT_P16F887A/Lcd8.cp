#line 1 "F:/C Codes 2013/Tested Codes/Tested_LCD_8_BIT_P16F887A/Lcd8.c"
#line 23 "F:/C Codes 2013/Tested Codes/Tested_LCD_8_BIT_P16F887A/Lcd8.c"
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


char txt1[] = "mikroElektronika";
char txt2[] = "EasyPIC5";
char txt3[] = "Lcd8bit";
char txt4[] = "example";

char i;

void Move_Delay() {
 Delay_ms(500);
}

void main(){
 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;

 Lcd8_Init();

 Lcd8_Cmd(_LCD_CLEAR);
 Lcd8_Cmd(_LCD_CURSOR_OFF);
 Lcd8_Out(1,6,txt3);

 Lcd8_Out(2,6,txt4);
 Delay_ms(2000);
 Lcd8_Cmd(_LCD_CLEAR);

 Lcd8_Out(1,1,txt1);
 Lcd8_Out(2,5,txt2);

 Delay_ms(2000);


 for(i=0; i<4; i++) {
 Lcd8_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }

 while(1) {
 for(i=0; i<8; i++) {
 Lcd8_Cmd(_LCD_SHIFT_LEFT);
 Move_Delay();
 }

 for(i=0; i<8; i++) {
 Lcd8_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }
 }
}
