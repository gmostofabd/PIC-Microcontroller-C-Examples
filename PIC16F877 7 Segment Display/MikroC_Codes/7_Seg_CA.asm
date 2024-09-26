
_main:

;7_Seg_CA.c,20 :: 		void main() {
;7_Seg_CA.c,23 :: 		TRISB = 0;
	CLRF       TRISB+0
;7_Seg_CA.c,24 :: 		PORTB = 0;
	CLRF       PORTB+0
;7_Seg_CA.c,26 :: 		while(1){
L_main0:
;7_Seg_CA.c,28 :: 		for(i = 0; i<10; i++){
	CLRF       R1+0
L_main2:
	MOVLW      10
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;7_Seg_CA.c,29 :: 		PORTB = cc_7_Seg[i];       // For 0 CC
	MOVF       R1+0, 0
	ADDLW      _cc_7_Seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;7_Seg_CA.c,30 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;7_Seg_CA.c,28 :: 		for(i = 0; i<10; i++){
	INCF       R1+0, 1
;7_Seg_CA.c,31 :: 		}
	GOTO       L_main2
L_main3:
;7_Seg_CA.c,32 :: 		}
	GOTO       L_main0
;7_Seg_CA.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
