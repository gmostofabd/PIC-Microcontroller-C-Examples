
_main:

	CLRF       main_freq_L0+0
	CLRF       main_freq_L0+1
	CLRF       main_freq_L0+2
	CLRF       main_freq_L0+3
	MOVLW      255
	MOVWF      TRISC+0
	CLRF       PORTC+0
	CALL       _Lcd_Init+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_PIC16F876A_FREQ+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_PIC16F876A_FREQ+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_PIC16F876A_FREQ+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main1:
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	CLRF       main_i_L0+2
	CLRF       main_i_L0+3
L_main3:
	MOVLW      0
	SUBWF      main_i_L0+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      0
	SUBWF      main_i_L0+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      217
	SUBWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      248
	SUBWF      main_i_L0+0, 0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	BTFSS      PORTC+0, 0
	GOTO       L_main6
L_main7:
	BTFSS      PORTC+0, 0
	GOTO       L_main8
	GOTO       L_main7
L_main8:
	MOVF       main_freq_L0+0, 0
	MOVWF      R0+0
	MOVF       main_freq_L0+1, 0
	MOVWF      R0+1
	MOVF       main_freq_L0+2, 0
	MOVWF      R0+2
	MOVF       main_freq_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      main_freq_L0+0
	MOVF       R0+1, 0
	MOVWF      main_freq_L0+1
	MOVF       R0+2, 0
	MOVWF      main_freq_L0+2
	MOVF       R0+3, 0
	MOVWF      main_freq_L0+3
L_main6:
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       main_i_L0+2, 0
	MOVWF      R0+2
	MOVF       main_i_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
	MOVF       R0+1, 0
	MOVWF      main_i_L0+1
	MOVF       R0+2, 0
	MOVWF      main_i_L0+2
	MOVF       R0+3, 0
	MOVWF      main_i_L0+3
	GOTO       L_main3
L_main4:
	MOVF       main_freq_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_freq_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_freq_data_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_freq_data_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       main_freq_L0+0
	CLRF       main_freq_L0+1
	CLRF       main_freq_L0+2
	CLRF       main_freq_L0+3
	GOTO       L_main1
L_end_main:
	GOTO       $+0
; end of _main
