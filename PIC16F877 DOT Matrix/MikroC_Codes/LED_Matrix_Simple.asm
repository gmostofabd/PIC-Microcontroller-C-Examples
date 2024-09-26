
_main:

;LED_Matrix_Simple.c,14 :: 		void main(){
;LED_Matrix_Simple.c,16 :: 		TRISB = 0X00;
	CLRF       TRISB+0
;LED_Matrix_Simple.c,17 :: 		TRISC = 0X00;
	CLRF       TRISC+0
;LED_Matrix_Simple.c,18 :: 		while(1){
L_main0:
;LED_Matrix_Simple.c,19 :: 		for(i = 0; i < 8; i ++){
	CLRF       R3+0
	CLRF       R3+1
L_main2:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      8
	SUBWF      R3+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;LED_Matrix_Simple.c,20 :: 		PORTC = 0X00;
	CLRF       PORTC+0
;LED_Matrix_Simple.c,21 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;LED_Matrix_Simple.c,22 :: 		PORTB =~ front_array[i];
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _front_array+0
	MOVWF      FSR
	COMF       INDF+0, 0
	MOVWF      PORTB+0
;LED_Matrix_Simple.c,23 :: 		PORTC = column[i];
	MOVF       R3+0, 0
	ADDLW      _column+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;LED_Matrix_Simple.c,24 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
;LED_Matrix_Simple.c,19 :: 		for(i = 0; i < 8; i ++){
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;LED_Matrix_Simple.c,26 :: 		}
	GOTO       L_main2
L_main3:
;LED_Matrix_Simple.c,27 :: 		}
	GOTO       L_main0
;LED_Matrix_Simple.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
