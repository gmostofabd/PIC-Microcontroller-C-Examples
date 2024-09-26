#line 1 "C:/PIC16F876A_LOWSPEED_FREQ/PIC16F876A_FREQ.c"


sbit LCD_RS at RB4_bit;
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




void main() {
 unsigned long freq=0;
 unsigned long i;
 unsigned char freq_data[12];
 TRISC=0xFF;
 PORTC=0x00;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,4,"PIC16F876A");
 Lcd_Out(2,2,"FREQUENCY METER");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"FREQUENCY (Hz)");
 while(1){
 for(i=0;i<55800;i++){
 if( PORTC.RC0 ==1){ while( PORTC.RC0 ==1); freq++;}
 }
 IntToStr(freq,freq_data);
 Lcd_Out(2,1,freq_data);
 freq=0;
 }
}
