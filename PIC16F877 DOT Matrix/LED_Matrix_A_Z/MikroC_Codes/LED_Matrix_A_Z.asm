
_main:

;LED_Matrix_A_Z.c,35 :: 		void main() {
;LED_Matrix_A_Z.c,37 :: 		TRISB = 0;
	CLRF       TRISB+0
;LED_Matrix_A_Z.c,38 :: 		TRISC = 0;
	CLRF       TRISC+0
;LED_Matrix_A_Z.c,39 :: 		PORTB = 0;
	CLRF       PORTB+0
;LED_Matrix_A_Z.c,40 :: 		PORTC = 0;
	CLRF       PORTC+0
;LED_Matrix_A_Z.c,42 :: 		while(1){
L_main0:
;LED_Matrix_A_Z.c,43 :: 		for(i=0; i<10; i++){            // outer loop selection char from array
	CLRF       _i+0
L_main2:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      10
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;LED_Matrix_A_Z.c,44 :: 		for(k=0; k<20; k++){        // middle loop to repeat same display
	CLRF       _k+0
L_main5:
	MOVLW      128
	XORWF      _k+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      20
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;LED_Matrix_A_Z.c,45 :: 		col = 0B00000001;       // Defining start position on matrix
	MOVLW      1
	MOVWF      _col+0
;LED_Matrix_A_Z.c,46 :: 		for(j=0; j<8; j++){     // 8 byte character row
	CLRF       _j+0
L_main8:
	MOVLW      128
	XORWF      _j+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      8
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;LED_Matrix_A_Z.c,47 :: 		PORTC =~ col;        // colum activation
	COMF       _col+0, 0
	MOVWF      PORTC+0
;LED_Matrix_A_Z.c,48 :: 		PORTB = dat[i][j];   // PortB reciving row data
	MOVLW      3
	MOVWF      R1+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main13:
	BTFSC      STATUS+0, 2
	GOTO       L__main14
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main13
L__main14:
	MOVLW      _dat+0
	ADDWF      R0+0, 1
	MOVF       _j+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;LED_Matrix_A_Z.c,49 :: 		col <<= 1;           // shifting from last column
	RLF        _col+0, 1
	BCF        _col+0, 0
;LED_Matrix_A_Z.c,50 :: 		delay_ms(5);         //
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
;LED_Matrix_A_Z.c,46 :: 		for(j=0; j<8; j++){     // 8 byte character row
	INCF       _j+0, 1
;LED_Matrix_A_Z.c,51 :: 		}
	GOTO       L_main8
L_main9:
;LED_Matrix_A_Z.c,44 :: 		for(k=0; k<20; k++){        // middle loop to repeat same display
	INCF       _k+0, 1
;LED_Matrix_A_Z.c,52 :: 		}
	GOTO       L_main5
L_main6:
;LED_Matrix_A_Z.c,43 :: 		for(i=0; i<10; i++){            // outer loop selection char from array
	INCF       _i+0, 1
;LED_Matrix_A_Z.c,53 :: 		}
	GOTO       L_main2
L_main3:
;LED_Matrix_A_Z.c,54 :: 		}
	GOTO       L_main0
;LED_Matrix_A_Z.c,76 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
