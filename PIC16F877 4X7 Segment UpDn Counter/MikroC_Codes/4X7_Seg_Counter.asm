
_seperate_digits:

;4X7_Seg_Counter.c,11 :: 		void seperate_digits(unsigned int _4_digit){
;4X7_Seg_Counter.c,12 :: 		bcd_val[3]=  (int)(_4_digit / 1000) % 10;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_seperate_digits__4_digit+0, 0
	MOVWF      R0+0
	MOVF       FARG_seperate_digits__4_digit+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _bcd_val+3
;4X7_Seg_Counter.c,13 :: 		bcd_val[2]= (int) (_4_digit / 100) % 10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_seperate_digits__4_digit+0, 0
	MOVWF      R0+0
	MOVF       FARG_seperate_digits__4_digit+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _bcd_val+2
;4X7_Seg_Counter.c,14 :: 		bcd_val[1]= (int)(_4_digit / 10) % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_seperate_digits__4_digit+0, 0
	MOVWF      R0+0
	MOVF       FARG_seperate_digits__4_digit+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _bcd_val+1
;4X7_Seg_Counter.c,15 :: 		bcd_val[0]= (int) _4_digit % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_seperate_digits__4_digit+0, 0
	MOVWF      R0+0
	MOVF       FARG_seperate_digits__4_digit+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _bcd_val+0
;4X7_Seg_Counter.c,16 :: 		}
L_end_seperate_digits:
	RETURN
; end of _seperate_digits

_disp_4_digit:

;4X7_Seg_Counter.c,21 :: 		void disp_4_digit(){
;4X7_Seg_Counter.c,24 :: 		for(i = 0; i<5; i ++){
	CLRF       R1+0
L_disp_4_digit0:
	MOVLW      5
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_disp_4_digit1
;4X7_Seg_Counter.c,26 :: 		PORTD = digit_no[0];  //DIGIT0;  // RA.0 to RA3 Output
	MOVF       _digit_no+0, 0
	MOVWF      PORTD+0
;4X7_Seg_Counter.c,27 :: 		PORTC = DSP_code[bcd_val[0]];
	MOVF       _bcd_val+0, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4X7_Seg_Counter.c,28 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_disp_4_digit3:
	DECFSZ     R13+0, 1
	GOTO       L_disp_4_digit3
	DECFSZ     R12+0, 1
	GOTO       L_disp_4_digit3
;4X7_Seg_Counter.c,30 :: 		PORTD = digit_no[1];  //DIGIT1;  // RA.0 to RA3 Output
	MOVF       _digit_no+1, 0
	MOVWF      PORTD+0
;4X7_Seg_Counter.c,31 :: 		PORTC = DSP_code[bcd_val[1]];
	MOVF       _bcd_val+1, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4X7_Seg_Counter.c,32 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_disp_4_digit4:
	DECFSZ     R13+0, 1
	GOTO       L_disp_4_digit4
	DECFSZ     R12+0, 1
	GOTO       L_disp_4_digit4
;4X7_Seg_Counter.c,34 :: 		PORTD = digit_no[2];  //DIGIT2;  // RA.0 to RA3 Output
	MOVF       _digit_no+2, 0
	MOVWF      PORTD+0
;4X7_Seg_Counter.c,35 :: 		PORTC = DSP_code[bcd_val[2]];
	MOVF       _bcd_val+2, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4X7_Seg_Counter.c,36 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_disp_4_digit5:
	DECFSZ     R13+0, 1
	GOTO       L_disp_4_digit5
	DECFSZ     R12+0, 1
	GOTO       L_disp_4_digit5
;4X7_Seg_Counter.c,38 :: 		PORTD = digit_no[3];  //DIGIT3;  // RA.0 to RA3 Output
	MOVF       _digit_no+3, 0
	MOVWF      PORTD+0
;4X7_Seg_Counter.c,39 :: 		PORTC = DSP_code[bcd_val[3]];
	MOVF       _bcd_val+3, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4X7_Seg_Counter.c,40 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_disp_4_digit6:
	DECFSZ     R13+0, 1
	GOTO       L_disp_4_digit6
	DECFSZ     R12+0, 1
	GOTO       L_disp_4_digit6
;4X7_Seg_Counter.c,24 :: 		for(i = 0; i<5; i ++){
	INCF       R1+0, 1
;4X7_Seg_Counter.c,41 :: 		}
	GOTO       L_disp_4_digit0
L_disp_4_digit1:
;4X7_Seg_Counter.c,42 :: 		}
L_end_disp_4_digit:
	RETURN
; end of _disp_4_digit

_main:

;4X7_Seg_Counter.c,49 :: 		void main(){
;4X7_Seg_Counter.c,51 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;4X7_Seg_Counter.c,52 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;4X7_Seg_Counter.c,53 :: 		TRISC = 0;
	CLRF       TRISC+0
;4X7_Seg_Counter.c,54 :: 		PORTC = 0;
	CLRF       PORTC+0
;4X7_Seg_Counter.c,55 :: 		TRISD = 0;
	CLRF       TRISD+0
;4X7_Seg_Counter.c,56 :: 		PORTD = 0;
	CLRF       PORTD+0
;4X7_Seg_Counter.c,57 :: 		TRISB = 0x03;
	MOVLW      3
	MOVWF      TRISB+0
;4X7_Seg_Counter.c,58 :: 		PORTB = 0;
	CLRF       PORTB+0
;4X7_Seg_Counter.c,59 :: 		i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;4X7_Seg_Counter.c,61 :: 		while(1){
L_main7:
;4X7_Seg_Counter.c,71 :: 		seperate_digits(i);
	MOVF       main_i_L0+0, 0
	MOVWF      FARG_seperate_digits__4_digit+0
	MOVF       main_i_L0+1, 0
	MOVWF      FARG_seperate_digits__4_digit+1
	CALL       _seperate_digits+0
;4X7_Seg_Counter.c,72 :: 		disp_4_digit();
	CALL       _disp_4_digit+0
;4X7_Seg_Counter.c,74 :: 		}
	GOTO       L_main7
;4X7_Seg_Counter.c,75 :: 		} // end main
L_end_main:
	GOTO       $+0
; end of _main
