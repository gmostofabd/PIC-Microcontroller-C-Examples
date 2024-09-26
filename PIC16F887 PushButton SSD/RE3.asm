
_main:

	MOVLW      63
	MOVWF      main_LED_L0+0
	MOVLW      6
	MOVWF      main_LED_L0+1
	MOVLW      91
	MOVWF      main_LED_L0+2
	MOVLW      79
	MOVWF      main_LED_L0+3
	MOVLW      102
	MOVWF      main_LED_L0+4
	MOVLW      109
	MOVWF      main_LED_L0+5
	MOVLW      125
	MOVWF      main_LED_L0+6
	MOVLW      7
	MOVWF      main_LED_L0+7
	MOVLW      127
	MOVWF      main_LED_L0+8
	MOVLW      111
	MOVWF      main_LED_L0+9
	CLRF       main_i_L0+0
	CLRF       PORTD+0
	CLRF       TRISD+0
	CLRF       PORTE+0
	BSF        TRISE+0, 3
	BSF        OSCCON+0, 4
	BSF        OSCCON+0, 5
	BSF        OSCCON+0, 6
L_main0:
	BTFSC      PORTE+0, 3
	GOTO       L_main2
L_main3:
	BTFSC      PORTE+0, 3
	GOTO       L_main4
	GOTO       L_main3
L_main4:
	INCF       main_i_L0+0, 1
	MOVF       main_i_L0+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main5
	CLRF       main_i_L0+0
L_main5:
L_main2:
	MOVF       main_i_L0+0, 0
	ADDLW      main_LED_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
