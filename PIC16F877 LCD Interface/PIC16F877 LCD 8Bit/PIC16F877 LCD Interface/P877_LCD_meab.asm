
_init_main:

;P877_LCD_meab.c,28 :: 		void  init_main(){
;P877_LCD_meab.c,30 :: 		TRISB       = 0x00;
	CLRF       TRISB+0
;P877_LCD_meab.c,31 :: 		TRISC       = 0x00;
	CLRF       TRISC+0
;P877_LCD_meab.c,32 :: 		TRISE       = 0x00;
	CLRF       TRISE+0
;P877_LCD_meab.c,33 :: 		TRISA       = 0x01;
	MOVLW      1
	MOVWF      TRISA+0
;P877_LCD_meab.c,34 :: 		TRISD       = 0x00;
	CLRF       TRISD+0
;P877_LCD_meab.c,35 :: 		PORTA       = 0;  //
	CLRF       PORTA+0
;P877_LCD_meab.c,36 :: 		PORTB       = 0;
	CLRF       PORTB+0
;P877_LCD_meab.c,37 :: 		PORTC       = 0;
	CLRF       PORTC+0
;P877_LCD_meab.c,39 :: 		}
L_end_init_main:
	RETURN
; end of _init_main

_main:

;P877_LCD_meab.c,47 :: 		void main() {
;P877_LCD_meab.c,48 :: 		init_main();
	CALL       _init_main+0
;P877_LCD_meab.c,49 :: 		InitLCD();
	CALL       _InitLCD+0
;P877_LCD_meab.c,50 :: 		welcome_msg();
	CALL       _welcome_msg+0
;P877_LCD_meab.c,51 :: 		ClearLCDScreen();               // Clear display  +++++++++++++++++|||||
	CALL       _ClearLCDScreen+0
;P877_LCD_meab.c,53 :: 		WriteLCDLine1("Temp. C =");
	MOVLW      ?lstr_1_P877_LCD_meab+0
	MOVWF      FARG_WriteLCDLine1+0
	MOVLW      hi_addr(?lstr_1_P877_LCD_meab+0)
	MOVWF      FARG_WriteLCDLine1+1
	CALL       _WriteLCDLine1+0
;P877_LCD_meab.c,54 :: 		GotoYXPositionOnLCD(1, 10);
	MOVLW      1
	MOVWF      FARG_GotoYXPositionOnLCD+0
	MOVLW      10
	MOVWF      FARG_GotoYXPositionOnLCD+0
	CALL       _GotoYXPositionOnLCD+0
;P877_LCD_meab.c,55 :: 		WriteDataToLCD((temp_c/10)%10 + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _temp_c+0, 0
	MOVWF      R0+0
	MOVF       _temp_c+1, 0
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
	ADDWF      R0+0, 0
	MOVWF      FARG_WriteDataToLCD+0
	CALL       _WriteDataToLCD+0
;P877_LCD_meab.c,56 :: 		WriteDataToLCD(temp_c%10 + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _temp_c+0, 0
	MOVWF      R0+0
	MOVF       _temp_c+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_WriteDataToLCD+0
	CALL       _WriteDataToLCD+0
;P877_LCD_meab.c,59 :: 		while(1);
L_main0:
	GOTO       L_main0
;P877_LCD_meab.c,61 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
