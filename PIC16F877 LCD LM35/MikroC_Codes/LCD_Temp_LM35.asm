
_main:

;LCD_Temp_LM35.c,19 :: 		void main (){
;LCD_Temp_LM35.c,21 :: 		TRISA.RA0=1;
	BSF        TRISA+0, 0
;LCD_Temp_LM35.c,22 :: 		ADC_Init ();
	CALL       _ADC_Init+0
;LCD_Temp_LM35.c,23 :: 		LCD_Init ();
	CALL       _Lcd_Init+0
;LCD_Temp_LM35.c,24 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Temp_LM35.c,25 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Temp_LM35.c,26 :: 		Lcd_out (1,1,"Sarowar");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD_Temp_LM35+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_Temp_LM35.c,27 :: 		delay_ms (2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;LCD_Temp_LM35.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Temp_LM35.c,29 :: 		Lcd_out(1,1,"temperature");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCD_Temp_LM35+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_Temp_LM35.c,31 :: 		while (1) {
L_main1:
;LCD_Temp_LM35.c,32 :: 		value=adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _value+0
	MOVF       R0+1, 0
	MOVWF      _value+1
;LCD_Temp_LM35.c,33 :: 		value=value*0.488;
	CALL       _Int2Double+0
	MOVLW      35
	MOVWF      R4+0
	MOVLW      219
	MOVWF      R4+1
	MOVLW      121
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _value+0
	MOVF       R0+1, 0
	MOVWF      _value+1
;LCD_Temp_LM35.c,34 :: 		floattostr(value,value1);
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _value1+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;LCD_Temp_LM35.c,35 :: 		Lcd_chr(2,9,39);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      39
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD_Temp_LM35.c,36 :: 		Lcd_out(2,10,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_LCD_Temp_LM35+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_Temp_LM35.c,37 :: 		Lcd_out(2,1,value1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _value1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_Temp_LM35.c,38 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;LCD_Temp_LM35.c,39 :: 		}
	GOTO       L_main1
;LCD_Temp_LM35.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
