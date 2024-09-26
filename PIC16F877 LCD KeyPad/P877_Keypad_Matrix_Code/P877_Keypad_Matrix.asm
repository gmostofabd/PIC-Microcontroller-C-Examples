
_init_main:

;P877_Keypad_Matrix.c,14 :: 		void  init_main(){
;P877_Keypad_Matrix.c,15 :: 		TRISB  = 0xF0;  TRISC = 0x00;  TRISE  = 0x00;  TRISA = 0x01;  TRISD = 0x00;
	MOVLW      240
	MOVWF      TRISB+0
	CLRF       TRISC+0
	CLRF       TRISE+0
	MOVLW      1
	MOVWF      TRISA+0
	CLRF       TRISD+0
;P877_Keypad_Matrix.c,16 :: 		PORTA     = 0;  PORTB       = 0;    PORTC       = 0;  PORTB = 0b11110000;
	CLRF       PORTA+0
	CLRF       PORTB+0
	CLRF       PORTC+0
	MOVLW      240
	MOVWF      PORTB+0
;P877_Keypad_Matrix.c,17 :: 		}
L_end_init_main:
	RETURN
; end of _init_main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;P877_Keypad_Matrix.c,22 :: 		void interrupt(){
;P877_Keypad_Matrix.c,25 :: 		if(INTCON.RBIF){
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt0
;P877_Keypad_Matrix.c,26 :: 		key_val = GetKey();
	CALL       _GetKey+0
	MOVF       R0+0, 0
	MOVWF      _key_val+0
;P877_Keypad_Matrix.c,27 :: 		PORTB = 0b11110000;
	MOVLW      240
	MOVWF      PORTB+0
;P877_Keypad_Matrix.c,28 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;P877_Keypad_Matrix.c,29 :: 		}
L_interrupt0:
;P877_Keypad_Matrix.c,30 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;P877_Keypad_Matrix.c,38 :: 		void main(){
;P877_Keypad_Matrix.c,40 :: 		init_main();
	CALL       _init_main+0
;P877_Keypad_Matrix.c,41 :: 		InitLCD();
	CALL       _InitLCD+0
;P877_Keypad_Matrix.c,43 :: 		welcome_msg();
	CALL       _welcome_msg+0
;P877_Keypad_Matrix.c,44 :: 		ClearLCDScreen();               // Clear display  +++++++++++++++++|||||
	CALL       _ClearLCDScreen+0
;P877_Keypad_Matrix.c,45 :: 		WriteLCDLine1("Key =");
	MOVLW      ?lstr_1_P877_Keypad_Matrix+0
	MOVWF      FARG_WriteLCDLine1+0
	MOVLW      hi_addr(?lstr_1_P877_Keypad_Matrix+0)
	MOVWF      FARG_WriteLCDLine1+1
	CALL       _WriteLCDLine1+0
;P877_Keypad_Matrix.c,47 :: 		INTCON = 0b10001000;
	MOVLW      136
	MOVWF      INTCON+0
;P877_Keypad_Matrix.c,48 :: 		InitKeypad();
	CALL       _InitKeypad+0
;P877_Keypad_Matrix.c,50 :: 		while(1){
L_main1:
;P877_Keypad_Matrix.c,51 :: 		GotoYXPositionOnLCD(0, 10);
	CLRF       FARG_GotoYXPositionOnLCD+0
	MOVLW      10
	MOVWF      FARG_GotoYXPositionOnLCD+0
	CALL       _GotoYXPositionOnLCD+0
;P877_Keypad_Matrix.c,52 :: 		WriteDataToLCD(key_val);
	MOVF       _key_val+0, 0
	MOVWF      FARG_WriteDataToLCD+0
	CALL       _WriteDataToLCD+0
;P877_Keypad_Matrix.c,53 :: 		}
	GOTO       L_main1
;P877_Keypad_Matrix.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
