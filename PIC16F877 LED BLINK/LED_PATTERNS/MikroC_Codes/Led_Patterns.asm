
_main:

;Led_Patterns.c,14 :: 		void main() {
;Led_Patterns.c,16 :: 		TRISB = 0X00 ; // 0B11111110;     // Declaring Input Output of PORTB
	CLRF       TRISB+0
;Led_Patterns.c,18 :: 		while(1){
L_main0:
;Led_Patterns.c,19 :: 		PORTB = 0b00000001;          // PORT Refreshing intensionally
	MOVLW      1
	MOVWF      PORTB+0
;Led_Patterns.c,20 :: 		Delay_ms (1000);             // Delay One Second
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Led_Patterns.c,21 :: 		i = 7;
	MOVLW      7
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
;Led_Patterns.c,22 :: 		while(i > 0){
L_main3:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       R2+0, 0
	SUBLW      0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Led_Patterns.c,23 :: 		PORTB = PORTB << 1;          // RB1 High
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Led_Patterns.c,24 :: 		Delay_ms (1000);             // Delay One Second
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Led_Patterns.c,25 :: 		i --;
	MOVLW      1
	SUBWF      R2+0, 1
	BTFSS      STATUS+0, 0
	DECF       R2+1, 1
;Led_Patterns.c,26 :: 		}
	GOTO       L_main3
L_main4:
;Led_Patterns.c,27 :: 		}
	GOTO       L_main0
;Led_Patterns.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
