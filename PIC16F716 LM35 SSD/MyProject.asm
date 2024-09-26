
_get_lm35:

	BSF        ADCON0+0, 2
L_get_lm350:
	BTFSS      ADCON0+0, 2
	GOTO       L_get_lm351
	GOTO       L_get_lm350
L_get_lm351:
	MOVF       ADRES+0, 0
	MOVWF      R0+0
L_end_get_lm35:
	RETURN
; end of _get_lm35

_SSD:

	MOVLW      100
	MOVWF      R0+0
	MOVF       ADRES+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      135
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      FLOC__SSD+2
	MOVF       R0+1, 0
	MOVWF      FLOC__SSD+3
	MOVF       FLOC__SSD+2, 0
	MOVWF      _temperature+0
	MOVF       FLOC__SSD+3, 0
	MOVWF      _temperature+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__SSD+2, 0
	MOVWF      R0+0
	MOVF       FLOC__SSD+3, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__SSD+0
	MOVF       R0+1, 0
	MOVWF      FLOC__SSD+1
	MOVF       FLOC__SSD+0, 0
	MOVWF      _D1+0
	MOVF       FLOC__SSD+1, 0
	MOVWF      _D1+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__SSD+2, 0
	MOVWF      R0+0
	MOVF       FLOC__SSD+3, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _D0+0
	MOVF       R0+1, 0
	MOVWF      _D0+1
	MOVF       FLOC__SSD+0, 0
	ADDLW      _SSD_MAP+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	MOVLW      2
	MOVWF      PORTA+0
	MOVLW      36
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_SSD2:
	DECFSZ     R13+0, 1
	GOTO       L_SSD2
	DECFSZ     R12+0, 1
	GOTO       L_SSD2
	CLRF       PORTA+0
	MOVF       _D0+0, 0
	ADDLW      _SSD_MAP+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	MOVLW      4
	MOVWF      PORTA+0
	MOVLW      36
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_SSD3:
	DECFSZ     R13+0, 1
	GOTO       L_SSD3
	DECFSZ     R12+0, 1
	GOTO       L_SSD3
	CLRF       PORTA+0
	MOVLW      156
	MOVWF      PORTB+0
	MOVLW      16
	MOVWF      PORTA+0
	MOVLW      18
	MOVWF      R12+0
	MOVLW      243
	MOVWF      R13+0
L_SSD4:
	DECFSZ     R13+0, 1
	GOTO       L_SSD4
	DECFSZ     R12+0, 1
	GOTO       L_SSD4
	CLRF       PORTA+0
	MOVLW      198
	MOVWF      PORTB+0
	BSF        PORTB+0, 7
	MOVLW      18
	MOVWF      R12+0
	MOVLW      243
	MOVWF      R13+0
L_SSD5:
	DECFSZ     R13+0, 1
	GOTO       L_SSD5
	DECFSZ     R12+0, 1
	GOTO       L_SSD5
	MOVLW      127
	ANDWF      PORTB+0, 1
L_end_SSD:
	RETURN
; end of _SSD

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	BTFSS      INTCON+0, 2
	GOTO       L_interrupt6
	INCF       _cnt+0, 1
	MOVF       _cnt+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt7
	CLRF       _cnt+0
	CALL       _get_lm35+0
L_interrupt7:
L_interrupt6:
	BCF        INTCON+0, 2
L_end_interrupt:
L__interrupt13:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

	CLRF       PORTB+0
	CLRF       PORTA+0
	MOVLW      9
	MOVWF      TRISA+0
	CLRF       TRISB+0
	BCF        OPTION_REG+0, 5
	BCF        OPTION_REG+0, 3
	MOVLW      7
	ANDWF      OPTION_REG+0, 1
	BSF        INTCON+0, 7
	BSF        INTCON+0, 5
	MOVLW      5
	MOVWF      ADCON1+0
	BSF        ADCON0+0, 6
	BSF        ADCON0+0, 7
	BCF        ADCON0+0, 3
	BCF        ADCON0+0, 4
	BCF        ADCON0+0, 5
	BSF        ADCON0+0, 0
	BCF        INTCON+0, 2
	CALL       _get_lm35+0
	CLRF       TMR0+0
L_main8:
	CALL       _SSD+0
	GOTO       L_main8
L_end_main:
	GOTO       $+0
; end of _main
