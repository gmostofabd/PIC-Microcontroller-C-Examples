
_Display_Temperature:

;DS1820_LCD_Temp.c,42 :: 		void Display_Temperature(unsigned int temp2write) {
;DS1820_LCD_Temp.c,48 :: 		if (temp2write & 0x8000) {
	BTFSS      FARG_Display_Temperature_temp2write+1, 7
	GOTO       L_Display_Temperature0
;DS1820_LCD_Temp.c,49 :: 		text[0] = '-';
	MOVF       _text+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
;DS1820_LCD_Temp.c,50 :: 		temp2write = ~temp2write + 1;
	COMF       FARG_Display_Temperature_temp2write+0, 1
	COMF       FARG_Display_Temperature_temp2write+1, 1
	INCF       FARG_Display_Temperature_temp2write+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_Display_Temperature_temp2write+1, 1
;DS1820_LCD_Temp.c,51 :: 		}
L_Display_Temperature0:
;DS1820_LCD_Temp.c,54 :: 		temp_whole = temp2write >> RES_SHIFT ;
	MOVF       FARG_Display_Temperature_temp2write+0, 0
	MOVWF      R0+0
	MOVF       FARG_Display_Temperature_temp2write+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      Display_Temperature_temp_whole_L0+0
;DS1820_LCD_Temp.c,57 :: 		if (temp_whole/100)
	MOVLW      100
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Display_Temperature1
;DS1820_LCD_Temp.c,58 :: 		text[0] = temp_whole/100  + 48;
	MOVF       _text+0, 0
	MOVWF      FLOC__Display_Temperature+0
	MOVLW      100
	MOVWF      R4+0
	MOVF       Display_Temperature_temp_whole_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Display_Temperature+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	GOTO       L_Display_Temperature2
L_Display_Temperature1:
;DS1820_LCD_Temp.c,60 :: 		text[0] = '0';
	MOVF       _text+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
L_Display_Temperature2:
;DS1820_LCD_Temp.c,62 :: 		text[1] = (temp_whole/10)%10 + 48;             // Extract tens digit
	INCF       _text+0, 0
	MOVWF      FLOC__Display_Temperature+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       Display_Temperature_temp_whole_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Display_Temperature+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;DS1820_LCD_Temp.c,63 :: 		text[2] =  temp_whole%10     + 48;             // Extract ones digit
	MOVLW      2
	ADDWF      _text+0, 0
	MOVWF      FLOC__Display_Temperature+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       Display_Temperature_temp_whole_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Display_Temperature+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;DS1820_LCD_Temp.c,66 :: 		temp_fraction  = temp2write << (4-RES_SHIFT);
	MOVF       FARG_Display_Temperature_temp2write+0, 0
	MOVWF      Display_Temperature_temp_fraction_L0+0
	MOVF       FARG_Display_Temperature_temp2write+1, 0
	MOVWF      Display_Temperature_temp_fraction_L0+1
;DS1820_LCD_Temp.c,67 :: 		temp_fraction &= 0x000F;
	MOVLW      15
	ANDWF      FARG_Display_Temperature_temp2write+0, 0
	MOVWF      R0+0
	MOVF       FARG_Display_Temperature_temp2write+1, 0
	MOVWF      R0+1
	MOVLW      0
	ANDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      Display_Temperature_temp_fraction_L0+0
	MOVF       R0+1, 0
	MOVWF      Display_Temperature_temp_fraction_L0+1
;DS1820_LCD_Temp.c,68 :: 		temp_fraction *= 625;
	MOVLW      113
	MOVWF      R4+0
	MOVLW      2
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      Display_Temperature_temp_fraction_L0+0
	MOVF       R0+1, 0
	MOVWF      Display_Temperature_temp_fraction_L0+1
;DS1820_LCD_Temp.c,71 :: 		text[4] =  temp_fraction/1000    + 48;         // Extract thousands digit
	MOVLW      4
	ADDWF      _text+0, 0
	MOVWF      FLOC__Display_Temperature+0
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Display_Temperature+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;DS1820_LCD_Temp.c,72 :: 		text[5] = (temp_fraction/100)%10 + 48;         // Extract hundreds digit
	MOVLW      5
	ADDWF      _text+0, 0
	MOVWF      FLOC__Display_Temperature+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       Display_Temperature_temp_fraction_L0+0, 0
	MOVWF      R0+0
	MOVF       Display_Temperature_temp_fraction_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Display_Temperature+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;DS1820_LCD_Temp.c,77 :: 		Lcd_Out(2, 5, text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DS1820_LCD_Temp.c,78 :: 		}
L_end_Display_Temperature:
	RETURN
; end of _Display_Temperature

_main:

;DS1820_LCD_Temp.c,82 :: 		void main() {
;DS1820_LCD_Temp.c,85 :: 		Lcd_Init();                        // Initialize LCD as 4 Bit Data Mode |||||
	CALL       _Lcd_Init+0
;DS1820_LCD_Temp.c,86 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display  +++++++++++++++++++|||||
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DS1820_LCD_Temp.c,87 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off     +++++++++++++++++++|||||
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DS1820_LCD_Temp.c,89 :: 		Lcd_Out(1, 1, " Temperature:   ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_DS1820_LCD_Temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DS1820_LCD_Temp.c,91 :: 		Lcd_Chr(2,13,0xdf);  // different LCD displays have different char code for degree
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1820_LCD_Temp.c,93 :: 		Lcd_Chr(2,14,'C');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DS1820_LCD_Temp.c,97 :: 		do {
L_main3:
;DS1820_LCD_Temp.c,99 :: 		Ow_Reset(&PORTB, 0);                         // Onewire reset signal
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	CLRF       FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;DS1820_LCD_Temp.c,100 :: 		Ow_Write(&PORTB, 0, 0xCC);                   // Issue command SKIP_ROM
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;DS1820_LCD_Temp.c,101 :: 		Ow_Write(&PORTB, 0, 0x44);                   // Issue command CONVERT_T
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;DS1820_LCD_Temp.c,102 :: 		Delay_us(120);
	MOVLW      39
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	NOP
	NOP
;DS1820_LCD_Temp.c,103 :: 		Ow_Reset(&PORTB, 0);
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	CLRF       FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;DS1820_LCD_Temp.c,104 :: 		Ow_Write(&PORTB, 0, 0xCC);                   // Issue command SKIP_ROM
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;DS1820_LCD_Temp.c,105 :: 		Ow_Write(&PORTB, 0, 0xBE);                   // Issue command READ_SCRATCHPAD
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;DS1820_LCD_Temp.c,106 :: 		Delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
;DS1820_LCD_Temp.c,108 :: 		temp =  Ow_Read(&PORTB, 0);
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	CLRF       _temp+1
;DS1820_LCD_Temp.c,109 :: 		temp = (Ow_Read(&PORTB, 0) << 8) + temp;
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+1
	CLRF       R2+0
	MOVF       _temp+0, 0
	ADDWF      R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _temp+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;DS1820_LCD_Temp.c,112 :: 		Display_Temperature(temp);
	MOVF       R0+0, 0
	MOVWF      FARG_Display_Temperature_temp2write+0
	MOVF       R0+1, 0
	MOVWF      FARG_Display_Temperature_temp2write+1
	CALL       _Display_Temperature+0
;DS1820_LCD_Temp.c,113 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;DS1820_LCD_Temp.c,115 :: 		while (1);
	GOTO       L_main3
;DS1820_LCD_Temp.c,116 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
