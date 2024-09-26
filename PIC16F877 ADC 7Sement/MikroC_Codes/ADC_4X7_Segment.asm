
_AnalogInit:

;ADC_4X7_Segment.c,17 :: 		void AnalogInit(){ADCON1 = 0b10000000; ADCON0 = 0b11000001; }
	MOVLW      128
	MOVWF      ADCON1+0
	MOVLW      193
	MOVWF      ADCON0+0
L_end_AnalogInit:
	RETURN
; end of _AnalogInit

_Read_Ana:

;ADC_4X7_Segment.c,19 :: 		int Read_Ana(){
;ADC_4X7_Segment.c,20 :: 		Delay_us(5);
	NOP
	NOP
	NOP
	NOP
	NOP
;ADC_4X7_Segment.c,21 :: 		ADCON0.GO_DONE = 1;
	BSF        ADCON0+0, 1
;ADC_4X7_Segment.c,22 :: 		while(ADCON0.GO_DONE);
L_Read_Ana0:
	BTFSS      ADCON0+0, 1
	GOTO       L_Read_Ana1
	GOTO       L_Read_Ana0
L_Read_Ana1:
;ADC_4X7_Segment.c,23 :: 		return ((ADRESH<<8) + ADRESL);
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
;ADC_4X7_Segment.c,24 :: 		}
L_end_Read_Ana:
	RETURN
; end of _Read_Ana

_seperate_digits:

;ADC_4X7_Segment.c,26 :: 		void seperate_digits(){
;ADC_4X7_Segment.c,27 :: 		bcd_val[3]=  (int)(temp_c / 1000) % 10;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	MOVF       _temp_c+0, 0
	MOVWF      R0+0
	MOVF       _temp_c+1, 0
	MOVWF      R0+1
	MOVF       _temp_c+2, 0
	MOVWF      R0+2
	MOVF       _temp_c+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	CALL       _double2int+0
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
;ADC_4X7_Segment.c,28 :: 		bcd_val[2]= (int) (temp_c / 100) % 10;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	MOVF       _temp_c+0, 0
	MOVWF      R0+0
	MOVF       _temp_c+1, 0
	MOVWF      R0+1
	MOVF       _temp_c+2, 0
	MOVWF      R0+2
	MOVF       _temp_c+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	CALL       _double2int+0
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
;ADC_4X7_Segment.c,29 :: 		bcd_val[1]= (int)(temp_c / 10) % 10;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       _temp_c+0, 0
	MOVWF      R0+0
	MOVF       _temp_c+1, 0
	MOVWF      R0+1
	MOVF       _temp_c+2, 0
	MOVWF      R0+2
	MOVF       _temp_c+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	CALL       _double2int+0
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
;ADC_4X7_Segment.c,30 :: 		bcd_val[0]= (int) temp_c % 10;
	MOVF       _temp_c+0, 0
	MOVWF      R0+0
	MOVF       _temp_c+1, 0
	MOVWF      R0+1
	MOVF       _temp_c+2, 0
	MOVWF      R0+2
	MOVF       _temp_c+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
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
	MOVWF      _bcd_val+0
;ADC_4X7_Segment.c,31 :: 		}
L_end_seperate_digits:
	RETURN
; end of _seperate_digits

_disp_4_digit:

;ADC_4X7_Segment.c,37 :: 		void disp_4_digit(){
;ADC_4X7_Segment.c,40 :: 		for(i = 0; i<5; i ++){
	CLRF       R1+0
L_disp_4_digit2:
	MOVLW      5
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_disp_4_digit3
;ADC_4X7_Segment.c,42 :: 		PORTD = digit_no[0];  //DIGIT0;  // RA.0 to RA3 Output
	MOVF       _digit_no+0, 0
	MOVWF      PORTD+0
;ADC_4X7_Segment.c,43 :: 		PORTC = DSP_code[bcd_val[0]];
	MOVF       _bcd_val+0, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;ADC_4X7_Segment.c,44 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_disp_4_digit5:
	DECFSZ     R13+0, 1
	GOTO       L_disp_4_digit5
	DECFSZ     R12+0, 1
	GOTO       L_disp_4_digit5
;ADC_4X7_Segment.c,46 :: 		PORTD = digit_no[1];  //DIGIT1;  // RA.0 to RA3 Output
	MOVF       _digit_no+1, 0
	MOVWF      PORTD+0
;ADC_4X7_Segment.c,47 :: 		PORTC = DSP_code[bcd_val[1]];
	MOVF       _bcd_val+1, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;ADC_4X7_Segment.c,48 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_disp_4_digit6:
	DECFSZ     R13+0, 1
	GOTO       L_disp_4_digit6
	DECFSZ     R12+0, 1
	GOTO       L_disp_4_digit6
;ADC_4X7_Segment.c,50 :: 		PORTD = digit_no[2];  //DIGIT2;  // RA.0 to RA3 Output
	MOVF       _digit_no+2, 0
	MOVWF      PORTD+0
;ADC_4X7_Segment.c,51 :: 		PORTC = DSP_code[bcd_val[2]];
	MOVF       _bcd_val+2, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;ADC_4X7_Segment.c,52 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_disp_4_digit7:
	DECFSZ     R13+0, 1
	GOTO       L_disp_4_digit7
	DECFSZ     R12+0, 1
	GOTO       L_disp_4_digit7
;ADC_4X7_Segment.c,54 :: 		PORTD = digit_no[3];  //DIGIT3;  // RA.0 to RA3 Output
	MOVF       _digit_no+3, 0
	MOVWF      PORTD+0
;ADC_4X7_Segment.c,55 :: 		PORTC = DSP_code[bcd_val[3]];
	MOVF       _bcd_val+3, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;ADC_4X7_Segment.c,56 :: 		PORTC.B7 = 1;
	BSF        PORTC+0, 7
;ADC_4X7_Segment.c,57 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_disp_4_digit8:
	DECFSZ     R13+0, 1
	GOTO       L_disp_4_digit8
	DECFSZ     R12+0, 1
	GOTO       L_disp_4_digit8
;ADC_4X7_Segment.c,40 :: 		for(i = 0; i<5; i ++){
	INCF       R1+0, 1
;ADC_4X7_Segment.c,59 :: 		}
	GOTO       L_disp_4_digit2
L_disp_4_digit3:
;ADC_4X7_Segment.c,60 :: 		}
L_end_disp_4_digit:
	RETURN
; end of _disp_4_digit

_main:

;ADC_4X7_Segment.c,69 :: 		void main(){
;ADC_4X7_Segment.c,71 :: 		TRISA = 1;
	MOVLW      1
	MOVWF      TRISA+0
;ADC_4X7_Segment.c,72 :: 		ANSEL  = 0x01;              // Configure AN2 pin as analog
	MOVLW      1
	MOVWF      ANSEL+0
;ADC_4X7_Segment.c,73 :: 		ANSELH = 0;                 // Configure other AN pins as digital I/O
	CLRF       ANSELH+0
;ADC_4X7_Segment.c,78 :: 		TRISC = 0;
	CLRF       TRISC+0
;ADC_4X7_Segment.c,79 :: 		PORTC = 0;
	CLRF       PORTC+0
;ADC_4X7_Segment.c,80 :: 		PORTA = 0;
	CLRF       PORTA+0
;ADC_4X7_Segment.c,81 :: 		TRISD = 0;
	CLRF       TRISD+0
;ADC_4X7_Segment.c,82 :: 		PORTD = 0;
	CLRF       PORTD+0
;ADC_4X7_Segment.c,87 :: 		AnalogInit();
	CALL       _AnalogInit+0
;ADC_4X7_Segment.c,89 :: 		while(1){
L_main9:
;ADC_4X7_Segment.c,91 :: 		adc_result = Read_Ana();   // Using own Library
	CALL       _Read_Ana+0
	MOVF       R0+0, 0
	MOVWF      _adc_result+0
	MOVF       R0+1, 0
	MOVWF      _adc_result+1
;ADC_4X7_Segment.c,97 :: 		temp_c = (4.89 * adc_result)/10;
	CALL       _word2double+0
	MOVLW      225
	MOVWF      R4+0
	MOVLW      122
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temp_c+0
	MOVF       R0+1, 0
	MOVWF      _temp_c+1
	MOVF       R0+2, 0
	MOVWF      _temp_c+2
	MOVF       R0+3, 0
	MOVWF      _temp_c+3
;ADC_4X7_Segment.c,99 :: 		seperate_digits();
	CALL       _seperate_digits+0
;ADC_4X7_Segment.c,100 :: 		disp_4_digit();
	CALL       _disp_4_digit+0
;ADC_4X7_Segment.c,102 :: 		}
	GOTO       L_main9
;ADC_4X7_Segment.c,103 :: 		} // end main
L_end_main:
	GOTO       $+0
; end of _main
