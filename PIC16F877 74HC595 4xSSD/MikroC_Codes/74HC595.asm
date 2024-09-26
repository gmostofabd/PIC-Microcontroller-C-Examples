
_seperate_digit:

;74HC595.c,16 :: 		void seperate_digit(char dt_byte){
;74HC595.c,19 :: 		digit_1th =  DSP_code[i%10u];
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_seperate_digit_dt_byte+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _DSP_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _digit_1th+0
;74HC595.c,23 :: 		}
L_end_seperate_digit:
	RETURN
; end of _seperate_digit

_display_8bit:

;74HC595.c,29 :: 		void display_8bit(char data_byte) {
;74HC595.c,32 :: 		for(i = 0; i < 8; i ++){
	CLRF       R1+0
L_display_8bit0:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_8bit1
;74HC595.c,33 :: 		if(data_byte.B7){DT = 1;} else {DT = 0;}
	BTFSS      FARG_display_8bit_data_byte+0, 7
	GOTO       L_display_8bit3
	BSF        PORTC+0, 0
	GOTO       L_display_8bit4
L_display_8bit3:
	BCF        PORTC+0, 0
L_display_8bit4:
;74HC595.c,34 :: 		SH = 1;
	BSF        PORTC+0, 1
;74HC595.c,35 :: 		data_byte <<= 1;
	RLF        FARG_display_8bit_data_byte+0, 1
	BCF        FARG_display_8bit_data_byte+0, 0
;74HC595.c,36 :: 		SH = 0;
	BCF        PORTC+0, 1
;74HC595.c,32 :: 		for(i = 0; i < 8; i ++){
	INCF       R1+0, 1
;74HC595.c,37 :: 		}
	GOTO       L_display_8bit0
L_display_8bit1:
;74HC595.c,39 :: 		ST = 1; //same as RC0=1; write the new bits to the register.
	BSF        PORTC+0, 2
;74HC595.c,40 :: 		Delay_ms(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_display_8bit5:
	DECFSZ     R13+0, 1
	GOTO       L_display_8bit5
	DECFSZ     R12+0, 1
	GOTO       L_display_8bit5
	NOP
;74HC595.c,41 :: 		ST = 0; //same as RC1=0; enable write to shift register
	BCF        PORTC+0, 2
;74HC595.c,42 :: 		}
L_end_display_8bit:
	RETURN
; end of _display_8bit

_display_4_digit:

;74HC595.c,48 :: 		void display_4_digit(){
;74HC595.c,51 :: 		PORTD = DIGIT0;  // RA.0 to RA3 Output
	MOVF       _DIGIT0+0, 0
	MOVWF      PORTD+0
;74HC595.c,52 :: 		display_8bit(digit_1th);
	MOVF       _digit_1th+0, 0
	MOVWF      FARG_display_8bit_data_byte+0
	CALL       _display_8bit+0
;74HC595.c,53 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_display_4_digit6:
	DECFSZ     R13+0, 1
	GOTO       L_display_4_digit6
	DECFSZ     R12+0, 1
	GOTO       L_display_4_digit6
	DECFSZ     R11+0, 1
	GOTO       L_display_4_digit6
	NOP
	NOP
;74HC595.c,55 :: 		PORTD = DIGIT1;  // RA.0 to RA3 Output
	MOVF       _DIGIT1+0, 0
	MOVWF      PORTD+0
;74HC595.c,56 :: 		display_8bit(digit_10th);
	MOVF       _digit_10th+0, 0
	MOVWF      FARG_display_8bit_data_byte+0
	CALL       _display_8bit+0
;74HC595.c,57 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_display_4_digit7:
	DECFSZ     R13+0, 1
	GOTO       L_display_4_digit7
	DECFSZ     R12+0, 1
	GOTO       L_display_4_digit7
	DECFSZ     R11+0, 1
	GOTO       L_display_4_digit7
	NOP
	NOP
;74HC595.c,69 :: 		}
L_end_display_4_digit:
	RETURN
; end of _display_4_digit
