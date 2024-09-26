
_main:

;4X7_Seg_595_Counter.c,13 :: 		void main(){
;4X7_Seg_595_Counter.c,15 :: 		TRISB = 0;
	CLRF       TRISB+0
;4X7_Seg_595_Counter.c,16 :: 		TRISC = 0;
	CLRF       TRISC+0
;4X7_Seg_595_Counter.c,17 :: 		PORTB = 0;
	CLRF       PORTB+0
;4X7_Seg_595_Counter.c,18 :: 		TRISA = 0;
	CLRF       TRISA+0
;4X7_Seg_595_Counter.c,19 :: 		PORTA = 0;
	CLRF       PORTA+0
;4X7_Seg_595_Counter.c,20 :: 		TRISD = 0;
	CLRF       TRISD+0
;4X7_Seg_595_Counter.c,21 :: 		PORTD = 0;
	CLRF       PORTD+0
;4X7_Seg_595_Counter.c,23 :: 		DIGIT0 = 0b00000001;   // 0b11111110
	MOVLW      1
	MOVWF      _DIGIT0+0
;4X7_Seg_595_Counter.c,24 :: 		DIGIT1 = 0b00000010;   // 0b11111101
	MOVLW      2
	MOVWF      _DIGIT1+0
;4X7_Seg_595_Counter.c,25 :: 		DIGIT2 = 0xFB;
	MOVLW      251
	MOVWF      _DIGIT2+0
;4X7_Seg_595_Counter.c,26 :: 		DIGIT3 = 0xF7;
	MOVLW      247
	MOVWF      _DIGIT3+0
;4X7_Seg_595_Counter.c,28 :: 		while(1){
L_main0:
;4X7_Seg_595_Counter.c,29 :: 		for(i=0; i<20; i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVLW      20
	SUBWF      main_i_L0+0, 0
L__main6:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;4X7_Seg_595_Counter.c,31 :: 		seperate_digit(i) ;
	MOVF       main_i_L0+0, 0
	MOVWF      FARG_seperate_digit_dt_byte+0
	CALL       _seperate_digit+0
;4X7_Seg_595_Counter.c,32 :: 		display_4_digit();
	CALL       _display_4_digit+0
;4X7_Seg_595_Counter.c,29 :: 		for(i=0; i<20; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;4X7_Seg_595_Counter.c,34 :: 		}
	GOTO       L_main2
L_main3:
;4X7_Seg_595_Counter.c,35 :: 		}
	GOTO       L_main0
;4X7_Seg_595_Counter.c,36 :: 		} // end main
L_end_main:
	GOTO       $+0
; end of _main
