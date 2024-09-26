
_main:

;Tested_P877_4X7_Counter.c,12 :: 		void main(){
;Tested_P877_4X7_Counter.c,15 :: 		TRISB = 0;
	CLRF       TRISB+0
;Tested_P877_4X7_Counter.c,16 :: 		PORTB = 0;
	CLRF       PORTB+0
;Tested_P877_4X7_Counter.c,17 :: 		TRISA = 0;
	CLRF       TRISA+0
;Tested_P877_4X7_Counter.c,18 :: 		PORTA = 0;
	CLRF       PORTA+0
;Tested_P877_4X7_Counter.c,19 :: 		TRISD = 0;
	CLRF       TRISD+0
;Tested_P877_4X7_Counter.c,20 :: 		PORTD = 0;
	CLRF       PORTD+0
;Tested_P877_4X7_Counter.c,22 :: 		DIGIT0 = 0xFE;   // 0b11111110
	MOVLW      254
	MOVWF      _DIGIT0+0
;Tested_P877_4X7_Counter.c,23 :: 		DIGIT1 = 0xFD;   // 0b11111101
	MOVLW      253
	MOVWF      _DIGIT1+0
;Tested_P877_4X7_Counter.c,24 :: 		DIGIT2 = 0xFB;
	MOVLW      251
	MOVWF      _DIGIT2+0
;Tested_P877_4X7_Counter.c,25 :: 		DIGIT3 = 0xF7;
	MOVLW      247
	MOVWF      _DIGIT3+0
;Tested_P877_4X7_Counter.c,30 :: 		while(1){
L_main0:
;Tested_P877_4X7_Counter.c,31 :: 		for(i=0; i<9999; i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      39
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      15
	SUBWF      main_i_L0+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Tested_P877_4X7_Counter.c,33 :: 		PORTD = DIGIT0;  // RA.0 to RA3 Output
	MOVF       _DIGIT0+0, 0
	MOVWF      PORTD+0
;Tested_P877_4X7_Counter.c,34 :: 		PORTB = DSP_code[i%10u];
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Tested_P877_4X7_Counter.c,35 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;Tested_P877_4X7_Counter.c,37 :: 		PORTD = DIGIT1;  // RA.0 to RA3 Output
	MOVF       _DIGIT1+0, 0
	MOVWF      PORTD+0
;Tested_P877_4X7_Counter.c,38 :: 		PORTB = DSP_code[(i/10)%10u];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Tested_P877_4X7_Counter.c,39 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;Tested_P877_4X7_Counter.c,41 :: 		PORTD = DIGIT2;  // RA.0 to RA3 Output
	MOVF       _DIGIT2+0, 0
	MOVWF      PORTD+0
;Tested_P877_4X7_Counter.c,42 :: 		PORTB = DSP_code[(i/100)%10u];
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Tested_P877_4X7_Counter.c,43 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;Tested_P877_4X7_Counter.c,45 :: 		PORTD = DIGIT3;  // RA.0 to RA3 Output
	MOVF       _DIGIT3+0, 0
	MOVWF      PORTD+0
;Tested_P877_4X7_Counter.c,47 :: 		PORTB = DSP_code[(i/1000)%10u];
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Tested_P877_4X7_Counter.c,48 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;Tested_P877_4X7_Counter.c,49 :: 		PORTB = 0;
	CLRF       PORTB+0
;Tested_P877_4X7_Counter.c,51 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Tested_P877_4X7_Counter.c,31 :: 		for(i=0; i<9999; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Tested_P877_4X7_Counter.c,52 :: 		}
	GOTO       L_main2
L_main3:
;Tested_P877_4X7_Counter.c,53 :: 		}
	GOTO       L_main0
;Tested_P877_4X7_Counter.c,54 :: 		} // end main
L_end_main:
	GOTO       $+0
; end of _main
