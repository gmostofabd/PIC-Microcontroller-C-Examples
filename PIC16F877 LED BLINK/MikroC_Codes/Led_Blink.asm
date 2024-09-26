
_main:

;Led_Blink.c,14 :: 		void main() {
;Led_Blink.c,15 :: 		TRISB = 0b00000000; // 0B11111110;     // Declaring Input Output of PORTB
	CLRF       TRISB+0
;Led_Blink.c,16 :: 		PORTB = 0x00;  // PORT Refreshing intensionally
	CLRF       PORTB+0
;Led_Blink.c,17 :: 		TRISD = 0b00000000;
	CLRF       TRISD+0
;Led_Blink.c,18 :: 		while(1){
L_main0:
;Led_Blink.c,20 :: 		PORTB = 0b00000001;          // RB0 High
	MOVLW      1
	MOVWF      PORTB+0
;Led_Blink.c,21 :: 		Delay_ms (1000);             // Delay One Second
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;Led_Blink.c,22 :: 		PORTB = 0b00000000;          // RB0 Low
	CLRF       PORTB+0
;Led_Blink.c,23 :: 		Delay_ms (1000);             // Delay One Second
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;Led_Blink.c,25 :: 		PORTD = 0b00100000;          // RB0 High
	MOVLW      32
	MOVWF      PORTD+0
;Led_Blink.c,26 :: 		Delay_ms (1000);             // Delay One Second
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Led_Blink.c,27 :: 		PORTD = 0b00000000;          // RB0 Low
	CLRF       PORTD+0
;Led_Blink.c,28 :: 		Delay_ms (1000);             // Delay One Second
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;Led_Blink.c,30 :: 		}
	GOTO       L_main0
;Led_Blink.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
