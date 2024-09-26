#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/DS1307_LCD_RTC/MikroC_Codes/DS1307_LCD_RTC.c"

char seconds, minutes, hours, day, date, month, year;


sbit Soft_I2C_Scl at RC3_bit;
sbit Soft_I2C_Sda at RC4_bit;
sbit Soft_I2C_Scl_Direction at TRISC3_bit;
sbit Soft_I2C_Sda_Direction at TRISC4_bit;



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



void Read_Time() {

 Soft_I2C_Start();
 Soft_I2C_Write(0xD0);
 Soft_I2C_Write(0);
 Soft_I2C_Start();
 Soft_I2C_Write(0xD1);

 seconds = Soft_I2C_Read(1);
 minutes = Soft_I2C_Read(1);
 hours = Soft_I2C_Read(1);
 day = Soft_I2C_Read(1);
 date = Soft_I2C_Read(1);

 month = Soft_I2C_Read(1);

 year = Soft_I2C_Read(0);

 Soft_I2C_Stop();

}




void Write_Time() {

 seconds = 0; minutes = 59; hours = 23; day = 1; date = 27; month = 11; year = 17;
 Soft_I2C_Start();
 Soft_I2C_Write(0xD0);
 Soft_I2C_Write(0x00);
 Soft_I2C_Write(Dec2Bcd(seconds));
 Soft_I2C_Write(Dec2Bcd(minutes));
 Soft_I2C_Write(Dec2Bcd(hours));
 Soft_I2C_Write(Dec2Bcd(day));
 Soft_I2C_Write(Dec2Bcd(date));
 Soft_I2C_Write(Dec2Bcd(month));
 Soft_I2C_Write(Dec2Bcd(year));
 Soft_I2C_Write(0b00000000);
 Soft_I2C_Stop();
 }
#line 80 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/DS1307_LCD_RTC/MikroC_Codes/DS1307_LCD_RTC.c"
void Transform_Time() {
 seconds = ((seconds & 0xF0) >> 4)*10 + (seconds & 0x0F);
 minutes = ((minutes & 0xF0) >> 4)*10 + (minutes & 0x0F);
 hours = ((hours & 0xF0) >> 4)*10 + (hours & 0x0F);
 day = ((day & 0x30) >> 4)*10 + (day & 0x0F);
 date = ((date & 0xF0) >> 4)*10 + (date & 0x0F);
 month = ((month & 0x10) >> 4)*10 + (month & 0x0F);
 year = ((year & 0xF0) >> 4)*10 + (year & 0x0F);
}


void Display_Time() {

 Lcd_Chr(1, 6, (date / 10) + 48);
 Lcd_Chr(1, 7, (date % 10) + 48);

 Lcd_Chr(1, 9, (month / 10) + 48);
 Lcd_Chr(1,10, (month % 10) + 48);

 Lcd_Chr(1, 14, (year / 10) + 48);
 Lcd_Chr(1,15, (year % 10) + 48);


 Lcd_Chr(2, 6, (hours / 10) + 48);
 Lcd_Chr(2, 7, (hours % 10) + 48);
 Lcd_Chr(2, 9, (minutes / 10) + 48);
 Lcd_Chr(2,10, (minutes % 10) + 48);
 Lcd_Chr(2,12, (seconds / 10) + 48);
 Lcd_Chr(2,13, (seconds % 10) + 48);
}



void Init_Main() {

 TRISB = 0;
 PORTB = 0xFF;
 TRISB = 0xff;

 Soft_I2C_Init();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1,1,"Date:");
 Lcd_Chr(1,8,'.');
 Lcd_Chr(1,11,'.');
 Lcd_Out(2,1,"Time:");
 Lcd_Chr(2,8,':');
 Lcd_Chr(2,11,':');
 Lcd_Out(1,12,"20");
}




void main() {
 Init_Main();
 Write_Time();

 while (1) {
 Read_Time();
 Transform_Time();
 Display_Time();
 }
}
