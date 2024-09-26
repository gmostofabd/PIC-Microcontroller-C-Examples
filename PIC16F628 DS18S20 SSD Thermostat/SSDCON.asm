
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

	CLRWDT
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt0
	INCF       _T0Cnt+0, 1
	BCF        INTCON+0, 2
L_interrupt0:
L_end_interrupt:
L__interrupt31:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

	CALL       _ioInit+0
	CALL       _dataRead+0
	CALL       _gettemp+0
	MOVF       R0+0, 0
	MOVWF      main_tempData_L0+0
	MOVF       R0+1, 0
	MOVWF      main_tempData_L0+1
	CLRF       main_tempData_L0+0
	CLRF       main_tempData_L0+1
	MOVLW      24
	MOVWF      R12+0
	MOVLW      60
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
L_main2:
	BTFSS      _ssdOn+0, BitPos(_ssdOn+0)
	GOTO       L_main4
	MOVLW      0
	SUBWF      _Cnt1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      75
	SUBWF      _Cnt1+0, 0
L__main33:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
	CALL       _gettemp+0
	MOVF       R0+0, 0
	MOVWF      main_tempData_L0+0
	MOVF       R0+1, 0
	MOVWF      main_tempData_L0+1
	CALL       _gettemp+0
	MOVF       R0+0, 0
	MOVWF      main_tempData_L0+0
	MOVF       R0+1, 0
	MOVWF      main_tempData_L0+1
	CLRF       _Cnt1+0
	CLRF       _Cnt1+1
L_main5:
	MOVF       main_tempData_L0+0, 0
	MOVWF      FARG_ssdOut_temp+0
	MOVF       main_tempData_L0+1, 0
	MOVWF      FARG_ssdOut_temp+1
	CALL       _ssdOut+0
	GOTO       L_main6
L_main4:
	MOVF       _setTemp+0, 0
	MOVWF      FARG_ssdOut_temp+0
	CLRF       FARG_ssdOut_temp+1
	CALL       _ssdOut+0
L_main6:
	CALL       _tempSet+0
	MOVLW      0
	SUBWF      _Cnt4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      50
	SUBWF      _Cnt4+0, 0
L__main34:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
	MOVLW      0
	SUBWF      main_tempData_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVF       _setTemp+0, 0
	SUBWF      main_tempData_L0+0, 0
L__main35:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
	BSF        PORTA+0, 3
	CLRF       _Cnt4+0
	CLRF       _Cnt4+1
	GOTO       L_main9
L_main8:
	BCF        PORTA+0, 3
	CLRF       _Cnt4+0
	CLRF       _Cnt4+1
L_main9:
L_main7:
	GOTO       L_main2
L_end_main:
	GOTO       $+0
; end of _main

_ssdOut:

	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_ssdOut_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_ssdOut_temp+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      ssdOut_d1_L0+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_ssdOut_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_ssdOut_temp+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      ssdOut_d2_L0+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_ssdOut_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_ssdOut_temp+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ssdOut_d3_L0+0
	GOTO       L_ssdOut10
L_ssdOut12:
	CLRF       PORTB+0
	MOVLW      15
	ANDWF      ssdOut_d1_L0+0, 0
	MOVWF      PORTB+0
	BSF        PORTB+0, 5
	GOTO       L_ssdOut11
L_ssdOut13:
	CLRF       PORTB+0
	MOVLW      15
	ANDWF      ssdOut_d2_L0+0, 0
	MOVWF      PORTB+0
	BSF        PORTB+0, 6
	GOTO       L_ssdOut11
L_ssdOut14:
	CLRF       PORTB+0
	MOVLW      15
	ANDWF      ssdOut_d3_L0+0, 0
	MOVWF      PORTB+0
	BSF        PORTB+0, 7
	GOTO       L_ssdOut11
L_ssdOut15:
	INCF       _Cnt1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Cnt1+1, 1
	INCF       _Cnt2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Cnt2+1, 1
	INCF       _Cnt3+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Cnt3+1, 1
	INCF       _Cnt4+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Cnt4+1, 1
	CLRF       _T0Cnt+0
	GOTO       L_ssdOut11
L_ssdOut10:
	MOVF       _T0Cnt+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_ssdOut12
	MOVF       _T0Cnt+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_ssdOut13
	MOVF       _T0Cnt+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_ssdOut14
	MOVF       _T0Cnt+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_ssdOut15
L_ssdOut11:
L_end_ssdOut:
	RETURN
; end of _ssdOut

_ioInit:

	BSF        PCON+0, 3
	CLRF       TRISB+0
	MOVLW      3
	MOVWF      TRISA+0
	MOVLW      7
	MOVWF      CMCON+0
	CLRF       PORTA+0
	MOVLW      3
	MOVWF      OPTION_REG+0
	BSF        INTCON+0, 7
	BSF        INTCON+0, 5
	BCF        INTCON+0, 2
	CLRF       PORTB+0
	CLRF       _T0Cnt+0
	CLRF       _Cnt1+0
	CLRF       _Cnt1+1
	CLRF       _Cnt2+0
	CLRF       _Cnt2+1
	CLRF       _Cnt3+0
	CLRF       _Cnt3+1
	CLRF       _Cnt4+0
	CLRF       _Cnt4+1
	BCF        _minus+0, BitPos(_minus+0)
	BSF        _ssdOn+0, BitPos(_ssdOn+0)
L_end_ioInit:
	RETURN
; end of _ioInit

_gettemp:

	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
	MOVLW      35
	MOVWF      R13+0
L_gettemp16:
	DECFSZ     R13+0, 1
	GOTO       L_gettemp16
	NOP
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      gettemp_temp_L0+0
	CLRF       gettemp_temp_L0+1
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      R4+1
	CLRF       R4+0
	MOVF       gettemp_temp_L0+0, 0
	ADDWF      R4+0, 0
	MOVWF      R2+0
	MOVF       R4+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      gettemp_temp_L0+1, 0
	MOVWF      R2+1
	MOVF       R2+0, 0
	MOVWF      gettemp_temp_L0+0
	MOVF       R2+1, 0
	MOVWF      gettemp_temp_L0+1
	BTFSS      R2+1, 7
	GOTO       L_gettemp17
	BSF        _minus+0, BitPos(_minus+0)
	COMF       gettemp_temp_L0+0, 1
	COMF       gettemp_temp_L0+1, 1
	GOTO       L_gettemp18
L_gettemp17:
	BCF        _minus+0, BitPos(_minus+0)
L_gettemp18:
	MOVF       gettemp_temp_L0+0, 0
	MOVWF      R0+0
	MOVF       gettemp_temp_L0+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      gettemp_temp_L0+0
	MOVF       R0+1, 0
	MOVWF      gettemp_temp_L0+1
L_end_gettemp:
	RETURN
; end of _gettemp

_tempSet:

	BTFSC      PORTA+0, 1
	GOTO       L_tempSet21
	MOVLW      0
	SUBWF      _Cnt2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__tempSet40
	MOVLW      10
	SUBWF      _Cnt2+0, 0
L__tempSet40:
	BTFSS      STATUS+0, 0
	GOTO       L_tempSet21
L__tempSet29:
	BCF        _ssdOn+0, BitPos(_ssdOn+0)
	MOVLW      120
	SUBWF      _setTemp+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_tempSet22
	INCF       _setTemp+0, 1
L_tempSet22:
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _setTemp+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	CLRF       _Cnt3+0
	CLRF       _Cnt3+1
	CLRF       _Cnt2+0
	CLRF       _Cnt2+1
L_tempSet21:
	BTFSC      PORTA+0, 0
	GOTO       L_tempSet25
	MOVLW      0
	SUBWF      _Cnt2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__tempSet41
	MOVLW      10
	SUBWF      _Cnt2+0, 0
L__tempSet41:
	BTFSS      STATUS+0, 0
	GOTO       L_tempSet25
L__tempSet28:
	BCF        _ssdOn+0, BitPos(_ssdOn+0)
	MOVLW      120
	SUBWF      _setTemp+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_tempSet26
	DECF       _setTemp+0, 1
L_tempSet26:
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _setTemp+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	CLRF       _Cnt3+0
	CLRF       _Cnt3+1
	CLRF       _Cnt2+0
	CLRF       _Cnt2+1
L_tempSet25:
	MOVF       _setTemp+0, 0
	MOVWF      _setRead+0
	MOVLW      0
	SUBWF      _Cnt3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__tempSet42
	MOVLW      150
	SUBWF      _Cnt3+0, 0
L__tempSet42:
	BTFSS      STATUS+0, 0
	GOTO       L_tempSet27
	BSF        _ssdOn+0, BitPos(_ssdOn+0)
	CLRF       _Cnt3+0
	CLRF       _Cnt3+1
L_tempSet27:
L_end_tempSet:
	RETURN
; end of _tempSet

_dataRead:

	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _setTemp+0
L_end_dataRead:
	RETURN
; end of _dataRead
