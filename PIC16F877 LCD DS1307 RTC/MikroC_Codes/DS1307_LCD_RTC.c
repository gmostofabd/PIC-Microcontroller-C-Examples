
char seconds, minutes, hours, day, date, month, year;    // Global date/time variables

// Software I2C connections
sbit Soft_I2C_Scl           at RC3_bit;
sbit Soft_I2C_Sda           at RC4_bit;
sbit Soft_I2C_Scl_Direction at TRISC3_bit;
sbit Soft_I2C_Sda_Direction at TRISC4_bit;
// End Software I2C connections

// LCD module connections
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
// End LCD module connections

//--------------------- Reads time and date information from RTC (PCF8583)
void Read_Time() {

  Soft_I2C_Start();               // Issue start signal
  Soft_I2C_Write(0xD0);           // Address DS1307, see PCF8583 datasheet
  Soft_I2C_Write(0);              // Start from address 2
  Soft_I2C_Start();               // Issue repeated start signal
  Soft_I2C_Write(0xD1);           // Address DS1307 for reading R/W=1

  seconds = Soft_I2C_Read(1);     // Read seconds byte
  minutes = Soft_I2C_Read(1);     // Read minutes byte
  hours = Soft_I2C_Read(1);       // Read hours byte
  day = Soft_I2C_Read(1);         // Read year/day byte
  date = Soft_I2C_Read(1);         // Read year/day byte

  month = Soft_I2C_Read(1);       // Read weekday/month byte

  year = Soft_I2C_Read(0);       // Read weekday/month byte

  Soft_I2C_Stop();                // Issue stop signal

}


/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
void Write_Time() {

   seconds = 0; minutes = 59; hours = 23; day = 1; date = 27; month = 11; year = 17;
   Soft_I2C_Start();                    // issue start signal
   Soft_I2C_Write(0xD0);                // address DS1307
   Soft_I2C_Write(0x00);                //
   Soft_I2C_Write(Dec2Bcd(seconds));    // REG 0
   Soft_I2C_Write(Dec2Bcd(minutes));    // REG 1
   Soft_I2C_Write(Dec2Bcd(hours));      // REG 2
   Soft_I2C_Write(Dec2Bcd(day));        // REG 3
   Soft_I2C_Write(Dec2Bcd(date));       // REG 4
   Soft_I2C_Write(Dec2Bcd(month));      // REG 5
   Soft_I2C_Write(Dec2Bcd(year));       // REG 6
   Soft_I2C_Write(0b00000000);          // REG 7 - Enable squarewave output pin
   Soft_I2C_Stop();                     // Issue stop signal
  }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/









//-------------------- Formats date and time
void Transform_Time() {
  seconds  =  ((seconds & 0xF0) >> 4)*10 + (seconds & 0x0F);  // Transform seconds
  minutes  =  ((minutes & 0xF0) >> 4)*10 + (minutes & 0x0F);  // Transform months
  hours    =  ((hours & 0xF0)  >> 4)*10  + (hours & 0x0F);    // Transform hours
  day      =  ((day & 0x30) >> 4)*10    + (day & 0x0F);       // Transform day
  date    =  ((date & 0xF0)  >> 4)*10 + (date & 0x0F);     // Transform month
  month    =  ((month & 0x10)  >> 4)*10 + (month & 0x0F);     // Transform month
  year     =   ((year & 0xF0) >> 4)*10 + (year & 0x0F);                             // Transform year
}

//-------------------- Output values to LCD
void Display_Time() {

   Lcd_Chr(1, 6, (date / 10)   + 48);    // Print tens digit of day variable
   Lcd_Chr(1, 7, (date % 10)   + 48);    // Print oness digit of day variable

   Lcd_Chr(1, 9, (month / 10) + 48);
   Lcd_Chr(1,10, (month % 10) + 48);

   Lcd_Chr(1, 14, (year / 10) + 48);
   Lcd_Chr(1,15, (year % 10) + 48);


   Lcd_Chr(2, 6, (hours / 10)   + 48);
   Lcd_Chr(2, 7, (hours % 10)   + 48);
   Lcd_Chr(2, 9, (minutes / 10) + 48);
   Lcd_Chr(2,10, (minutes % 10) + 48);
   Lcd_Chr(2,12, (seconds / 10) + 48);
   Lcd_Chr(2,13, (seconds % 10) + 48);
}


//------------------ Performs project-wide init
void Init_Main() {

  TRISB = 0;
  PORTB = 0xFF;
  TRISB = 0xff;

  Soft_I2C_Init();           // Initialize Soft I2C communication

  Lcd_Init();                // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
  Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off

  Lcd_Out(1,1,"Date:");      // Prepare and output static text on LCD
  Lcd_Chr(1,8,'.');
  Lcd_Chr(1,11,'.');
  Lcd_Out(2,1,"Time:");
  Lcd_Chr(2,8,':');
  Lcd_Chr(2,11,':');
  Lcd_Out(1,12,"20");       // start from year 2010
}



//----------------- Main procedure
void main() {
  Init_Main();               // Perform initialization
  Write_Time();

  while (1) {                // Endless loop
    Read_Time();             // Read time from RTC(PCF8583)
    Transform_Time();        // Format date and time
    Display_Time();          // Prepare and display on LCD
  }
}