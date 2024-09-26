
_main:

;7_Seg_Up_Dn_Counter.c,29 :: 		void main() {
;7_Seg_Up_Dn_Counter.c,31 :: 		TRISB = 0;
	CLRF       TRISB+0
;7_Seg_Up_Dn_Counter.c,32 :: 		TRISC = 3;   // 0b00000011
	MOVLW      3
	MOVWF      TRISC+0
;7_Seg_Up_Dn_Counter.c,33 :: 		PORTB = 0;
	CLRF       PORTB+0
;7_Seg_Up_Dn_Counter.c,35 :: 		while(1){
L_main0:
;7_Seg_Up_Dn_Counter.c,36 :: 		if(PORTC.B0 == 0){Delay_ms(100); i ++; if (i >= 9) i = 9;}
	BTFSC      PORTC+0, 0
	GOTO       L_main2
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
	INCF       R1+0, 1
	MOVLW      9
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main4
	MOVLW      9
	MOVWF      R1+0
L_main4:
L_main2:
;7_Seg_Up_Dn_Counter.c,37 :: 		if(PORTC.B1 == 0){Delay_ms(100); i --; if (i == 9) i = 0;}
	BTFSC      PORTC+0, 1
	GOTO       L_main5
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
	DECF       R1+0, 1
	MOVF       R1+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	CLRF       R1+0
L_main7:
L_main5:
;7_Seg_Up_Dn_Counter.c,38 :: 		PORTB = cc_7_Seg[i];       // For 0 CC
	MOVF       R1+0, 0
	ADDLW      _cc_7_Seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;7_Seg_Up_Dn_Counter.c,39 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;7_Seg_Up_Dn_Counter.c,40 :: 		}
	GOTO       L_main0
;7_Seg_Up_Dn_Counter.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
