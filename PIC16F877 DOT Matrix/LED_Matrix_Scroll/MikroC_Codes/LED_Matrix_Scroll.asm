
_main:

;LED_Matrix_Scroll.c,20 :: 		void main() {
;LED_Matrix_Scroll.c,21 :: 		TRISB = 0;
	CLRF       TRISB+0
;LED_Matrix_Scroll.c,22 :: 		TRISC = 0;
	CLRF       TRISC+0
;LED_Matrix_Scroll.c,23 :: 		PORTB = 0;
	CLRF       PORTB+0
;LED_Matrix_Scroll.c,24 :: 		PORTC = 0;
	CLRF       PORTC+0
;LED_Matrix_Scroll.c,25 :: 		while(1){
L_main0:
;LED_Matrix_Scroll.c,26 :: 		for(i=0; i<LENGTH; i++){
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      56
	SUBWF      _i+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;LED_Matrix_Scroll.c,27 :: 		for(x=i, j=0; x<i+8; x++, j++){
	MOVF       _i+0, 0
	MOVWF      _x+0
	MOVF       _i+1, 0
	MOVWF      _x+1
	CLRF       _j+0
	CLRF       _j+1
L_main5:
	MOVLW      8
	ADDWF      _i+0, 0
	MOVWF      R1+0
	MOVF       _i+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVLW      128
	XORWF      _x+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVF       R1+0, 0
	SUBWF      _x+0, 0
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;LED_Matrix_Scroll.c,28 :: 		dat[j] = str_data[x%LENGTH];
	MOVF       _j+0, 0
	ADDLW      _dat+0
	MOVWF      FLOC__main+0
	MOVLW      56
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _str_data+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LED_Matrix_Scroll.c,27 :: 		for(x=i, j=0; x<i+8; x++, j++){
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;LED_Matrix_Scroll.c,29 :: 		}
	GOTO       L_main5
L_main6:
;LED_Matrix_Scroll.c,30 :: 		for(k=0; k<10; k++){
	CLRF       _k+0
	CLRF       _k+1
L_main8:
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      10
	SUBWF      _k+0, 0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;LED_Matrix_Scroll.c,31 :: 		col = 0B00000001;
	MOVLW      1
	MOVWF      _col+0
	MOVLW      0
	MOVWF      _col+1
;LED_Matrix_Scroll.c,32 :: 		for(j=0; j<8; j++){
	CLRF       _j+0
	CLRF       _j+1
L_main11:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      8
	SUBWF      _j+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;LED_Matrix_Scroll.c,33 :: 		PORTC = ~col;
	COMF       _col+0, 0
	MOVWF      PORTC+0
;LED_Matrix_Scroll.c,34 :: 		PORTB = dat[j];
	MOVF       _j+0, 0
	ADDLW      _dat+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;LED_Matrix_Scroll.c,35 :: 		col <<= 1;
	RLF        _col+0, 1
	RLF        _col+1, 1
	BCF        _col+0, 0
;LED_Matrix_Scroll.c,36 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
	NOP
;LED_Matrix_Scroll.c,32 :: 		for(j=0; j<8; j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;LED_Matrix_Scroll.c,37 :: 		}
	GOTO       L_main11
L_main12:
;LED_Matrix_Scroll.c,30 :: 		for(k=0; k<10; k++){
	INCF       _k+0, 1
	BTFSC      STATUS+0, 2
	INCF       _k+1, 1
;LED_Matrix_Scroll.c,38 :: 		}
	GOTO       L_main8
L_main9:
;LED_Matrix_Scroll.c,26 :: 		for(i=0; i<LENGTH; i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;LED_Matrix_Scroll.c,39 :: 		}
	GOTO       L_main2
L_main3:
;LED_Matrix_Scroll.c,40 :: 		}
	GOTO       L_main0
;LED_Matrix_Scroll.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
