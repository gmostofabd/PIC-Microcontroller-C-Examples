
_Read_Time:

;DS1307_LCD_RTC.c,28 :: 		void Read_Time() {
;DS1307_LCD_RTC.c,30 :: 		Soft_I2C_Start();               // Issue start signal
	CALL       _Soft_I2C_Start+0
;DS1307_LCD_RTC.c,31 :: 		Soft_I2C_Write(0xD0);           // Address DS1307, see PCF8583 datasheet
	MOVLW      208
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,32 :: 		Soft_I2C_Write(0);              // Start from address 2
	CLRF       FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,33 :: 		Soft_I2C_Start();               // Issue repeated start signal
	CALL       _Soft_I2C_Start+0
;DS1307_LCD_RTC.c,34 :: 		Soft_I2C_Write(0xD1);           // Address DS1307 for reading R/W=1
	MOVLW      209
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,36 :: 		seconds = Soft_I2C_Read(1);     // Read seconds byte
	MOVLW      1
	MOVWF      FARG_Soft_I2C_Read_ack+0
	MOVLW      0
	MOVWF      FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      _seconds+0
;DS1307_LCD_RTC.c,37 :: 		minutes = Soft_I2C_Read(1);     // Read minutes byte
	MOVLW      1
	MOVWF      FARG_Soft_I2C_Read_ack+0
	MOVLW      0
	MOVWF      FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      _minutes+0
;DS1307_LCD_RTC.c,38 :: 		hours = Soft_I2C_Read(1);       // Read hours byte
	MOVLW      1
	MOVWF      FARG_Soft_I2C_Read_ack+0
	MOVLW      0
	MOVWF      FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      _hours+0
;DS1307_LCD_RTC.c,39 :: 		day = Soft_I2C_Read(1);         // Read year/day byte
	MOVLW      1
	MOVWF      FARG_Soft_I2C_Read_ack+0
	MOVLW      0
	MOVWF      FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      _day+0
;DS1307_LCD_RTC.c,40 :: 		date = Soft_I2C_Read(1);         // Read year/day byte
	MOVLW      1
	MOVWF      FARG_Soft_I2C_Read_ack+0
	MOVLW      0
	MOVWF      FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      _date+0
;DS1307_LCD_RTC.c,42 :: 		month = Soft_I2C_Read(1);       // Read weekday/month byte
	MOVLW      1
	MOVWF      FARG_Soft_I2C_Read_ack+0
	MOVLW      0
	MOVWF      FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      _month+0
;DS1307_LCD_RTC.c,44 :: 		year = Soft_I2C_Read(0);       // Read weekday/month byte
	CLRF       FARG_Soft_I2C_Read_ack+0
	CLRF       FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      _year+0
;DS1307_LCD_RTC.c,46 :: 		Soft_I2C_Stop();                // Issue stop signal
	CALL       _Soft_I2C_Stop+0
;DS1307_LCD_RTC.c,48 :: 		}
L_end_Read_Time:
	RETURN
; end of _Read_Time

_Write_Time:

;DS1307_LCD_RTC.c,53 :: 		void Write_Time() {
;DS1307_LCD_RTC.c,55 :: 		seconds = 0; minutes = 59; hours = 23; day = 1; date = 27; month = 11; year = 17;
	CLRF       _seconds+0
	MOVLW      59
	MOVWF      _minutes+0
	MOVLW      23
	MOVWF      _hours+0
	MOVLW      1
	MOVWF      _day+0
	MOVLW      27
	MOVWF      _date+0
	MOVLW      11
	MOVWF      _month+0
	MOVLW      17
	MOVWF      _year+0
;DS1307_LCD_RTC.c,56 :: 		Soft_I2C_Start();                    // issue start signal
	CALL       _Soft_I2C_Start+0
;DS1307_LCD_RTC.c,57 :: 		Soft_I2C_Write(0xD0);                // address DS1307
	MOVLW      208
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,58 :: 		Soft_I2C_Write(0x00);                //
	CLRF       FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,59 :: 		Soft_I2C_Write(Dec2Bcd(seconds));    // REG 0
	MOVF       _seconds+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,60 :: 		Soft_I2C_Write(Dec2Bcd(minutes));    // REG 1
	MOVF       _minutes+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,61 :: 		Soft_I2C_Write(Dec2Bcd(hours));      // REG 2
	MOVF       _hours+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,62 :: 		Soft_I2C_Write(Dec2Bcd(day));        // REG 3
	MOVF       _day+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,63 :: 		Soft_I2C_Write(Dec2Bcd(date));       // REG 4
	MOVF       _date+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,64 :: 		Soft_I2C_Write(Dec2Bcd(month));      // REG 5
	MOVF       _month+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,65 :: 		Soft_I2C_Write(Dec2Bcd(year));       // REG 6
	MOVF       _year+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,66 :: 		Soft_I2C_Write(0b00000000);          // REG 7 - Enable squarewave output pin
	CLRF       FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;DS1307_LCD_RTC.c,67 :: 		Soft_I2C_Stop();                     // Issue stop signal
	CALL       _Soft_I2C_Stop+0
;DS1307_LCD_RTC.c,68 :: 		}
L_end_Write_Time:
	RETURN
; end of _Write_Time

_Transform_Time:

;DS1307_LCD_RTC.c,80 :: 		void Transform_Time() {
;DS1307_LCD_RTC.c,81 :: 		seconds  =  ((seconds & 0xF0) >> 4)*10 + (seconds & 0x0F);  // Transform seconds
	MOVLW      240
	ANDWF      _seconds+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _seconds+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _seconds+0
;DS1307_LCD_RTC.c,82 :: 		minutes  =  ((minutes & 0xF0) >> 4)*10 + (minutes & 0x0F);  // Transform months
	MOVLW      240
	ANDWF      _minutes+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _minutes+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _minutes+0
;DS1307_LCD_RTC.c,83 :: 		hours    =  ((hours & 0xF0)  >> 4)*10  + (hours & 0x0F);    // Transform hours
	MOVLW      240
	ANDWF      _hours+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _hours+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _hours+0
;DS1307_LCD_RTC.c,84 :: 		day      =  ((day & 0x30) >> 4)*10    + (day & 0x0F);       // Transform day
	MOVLW      48
	ANDWF      _day+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _day+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _day+0
;DS1307_LCD_RTC.c,85 :: 		date    =  ((date & 0xF0)  >> 4)*10 + (date & 0x0F);     // Transform month
	MOVLW      240
	ANDWF      _date+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _date+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _date+0
;DS1307_LCD_RTC.c,86 :: 		month    =  ((month & 0x10)  >> 4)*10 + (month & 0x0F);     // Transform month
	MOVLW      16
	ANDWF      _month+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _month+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _month+0
;DS1307_LCD_RTC.c,87 :: 		year     =   ((year & 0xF0) >> 4)*10 + (year & 0x0F);                             // Transform year
	MOVLW      240
	ANDWF      _year+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      _year+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _year+0
;DS1307_LCD_RTC.c,88 :: 		}
L_end_Transform_Time:
	RETURN
; end of _Transform_Time

_Display_Time:

;DS1307_LCD_RTC.c,91 :: 		void Display_Time() {
;DS1307_LCD_RTC.c,93 :: 		Lcd_Chr(1, 6, (date / 10)   + 48);    // Print tens digit of day variable
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _date+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,94 :: 		Lcd_Chr(1, 7, (date % 10)   + 48);    // Print oness digit of day variable
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _date+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,96 :: 		Lcd_Chr(1, 9, (month / 10) + 48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _month+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,97 :: 		Lcd_Chr(1,10, (month % 10) + 48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _month+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,99 :: 		Lcd_Chr(1, 14, (year / 10) + 48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _year+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,100 :: 		Lcd_Chr(1,15, (year % 10) + 48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _year+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,103 :: 		Lcd_Chr(2, 6, (hours / 10)   + 48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,104 :: 		Lcd_Chr(2, 7, (hours % 10)   + 48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,105 :: 		Lcd_Chr(2, 9, (minutes / 10) + 48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,106 :: 		Lcd_Chr(2,10, (minutes % 10) + 48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,107 :: 		Lcd_Chr(2,12, (seconds / 10) + 48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,108 :: 		Lcd_Chr(2,13, (seconds % 10) + 48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,109 :: 		}
L_end_Display_Time:
	RETURN
; end of _Display_Time

_Init_Main:

;DS1307_LCD_RTC.c,113 :: 		void Init_Main() {
;DS1307_LCD_RTC.c,115 :: 		TRISB = 0;
	CLRF       TRISB+0
;DS1307_LCD_RTC.c,116 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;DS1307_LCD_RTC.c,117 :: 		TRISB = 0xff;
	MOVLW      255
	MOVWF      TRISB+0
;DS1307_LCD_RTC.c,119 :: 		Soft_I2C_Init();           // Initialize Soft I2C communication
	CALL       _Soft_I2C_Init+0
;DS1307_LCD_RTC.c,121 :: 		Lcd_Init();                // Initialize LCD
	CALL       _Lcd_Init+0
;DS1307_LCD_RTC.c,122 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DS1307_LCD_RTC.c,123 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DS1307_LCD_RTC.c,125 :: 		Lcd_Out(1,1,"Date:");      // Prepare and output static text on LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_DS1307_LCD_RTC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DS1307_LCD_RTC.c,126 :: 		Lcd_Chr(1,8,'.');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,127 :: 		Lcd_Chr(1,11,'.');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,128 :: 		Lcd_Out(2,1,"Time:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_DS1307_LCD_RTC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DS1307_LCD_RTC.c,129 :: 		Lcd_Chr(2,8,':');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,130 :: 		Lcd_Chr(2,11,':');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1307_LCD_RTC.c,131 :: 		Lcd_Out(1,12,"20");       // start from year 2010
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_DS1307_LCD_RTC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DS1307_LCD_RTC.c,132 :: 		}
L_end_Init_Main:
	RETURN
; end of _Init_Main

_main:

;DS1307_LCD_RTC.c,137 :: 		void main() {
;DS1307_LCD_RTC.c,138 :: 		Init_Main();               // Perform initialization
	CALL       _Init_Main+0
;DS1307_LCD_RTC.c,139 :: 		Write_Time();
	CALL       _Write_Time+0
;DS1307_LCD_RTC.c,141 :: 		while (1) {                // Endless loop
L_main0:
;DS1307_LCD_RTC.c,142 :: 		Read_Time();             // Read time from RTC(PCF8583)
	CALL       _Read_Time+0
;DS1307_LCD_RTC.c,143 :: 		Transform_Time();        // Format date and time
	CALL       _Transform_Time+0
;DS1307_LCD_RTC.c,144 :: 		Display_Time();          // Prepare and display on LCD
	CALL       _Display_Time+0
;DS1307_LCD_RTC.c,145 :: 		}
	GOTO       L_main0
;DS1307_LCD_RTC.c,146 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
