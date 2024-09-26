
_Move_Delay:

;Lcd8.c,55 :: 		void Move_Delay() {                  // Function used for text moving
;Lcd8.c,56 :: 		Delay_ms(500);                     // You can change the moving speed here
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Move_Delay0:
	DECFSZ     R13+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R12+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R11+0, 1
	GOTO       L_Move_Delay0
	NOP
	NOP
;Lcd8.c,57 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;Lcd8.c,59 :: 		void main(){
;Lcd8.c,60 :: 		ANSEL  = 0;                        // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;Lcd8.c,61 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Lcd8.c,62 :: 		C1ON_bit = 0;                      // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Lcd8.c,63 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Lcd8.c,65 :: 		Lcd8_Init();                       // Initialize Lcd8
	CALL       _Lcd8_Init+0
;Lcd8.c,67 :: 		Lcd8_Cmd(_LCD_CLEAR);              // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd8_Cmd_out_char+0
	CALL       _Lcd8_Cmd+0
;Lcd8.c,68 :: 		Lcd8_Cmd(_LCD_CURSOR_OFF);         // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd8_Cmd_out_char+0
	CALL       _Lcd8_Cmd+0
;Lcd8.c,69 :: 		Lcd8_Out(1,6,txt3);                // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd8_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd8_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd8_Out_text+0
	CALL       _Lcd8_Out+0
;Lcd8.c,71 :: 		Lcd8_Out(2,6,txt4);                // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd8_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd8_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd8_Out_text+0
	CALL       _Lcd8_Out+0
;Lcd8.c,72 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;Lcd8.c,73 :: 		Lcd8_Cmd(_LCD_CLEAR);              // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd8_Cmd_out_char+0
	CALL       _Lcd8_Cmd+0
;Lcd8.c,75 :: 		Lcd8_Out(1,1,txt1);                // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd8_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd8_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd8_Out_text+0
	CALL       _Lcd8_Out+0
;Lcd8.c,76 :: 		Lcd8_Out(2,5,txt2);                // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd8_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd8_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd8_Out_text+0
	CALL       _Lcd8_Out+0
;Lcd8.c,78 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;Lcd8.c,81 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	CLRF       _i+0
L_main3:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Lcd8.c,82 :: 		Lcd8_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd8_Cmd_out_char+0
	CALL       _Lcd8_Cmd+0
;Lcd8.c,83 :: 		Move_Delay();
	CALL       _Move_Delay+0
;Lcd8.c,81 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	INCF       _i+0, 1
;Lcd8.c,84 :: 		}
	GOTO       L_main3
L_main4:
;Lcd8.c,86 :: 		while(1) {                         // Endless loop
L_main6:
;Lcd8.c,87 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	CLRF       _i+0
L_main8:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Lcd8.c,88 :: 		Lcd8_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd8_Cmd_out_char+0
	CALL       _Lcd8_Cmd+0
;Lcd8.c,89 :: 		Move_Delay();
	CALL       _Move_Delay+0
;Lcd8.c,87 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	INCF       _i+0, 1
;Lcd8.c,90 :: 		}
	GOTO       L_main8
L_main9:
;Lcd8.c,92 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	CLRF       _i+0
L_main11:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;Lcd8.c,93 :: 		Lcd8_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd8_Cmd_out_char+0
	CALL       _Lcd8_Cmd+0
;Lcd8.c,94 :: 		Move_Delay();
	CALL       _Move_Delay+0
;Lcd8.c,92 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	INCF       _i+0, 1
;Lcd8.c,95 :: 		}
	GOTO       L_main11
L_main12:
;Lcd8.c,96 :: 		}
	GOTO       L_main6
;Lcd8.c,97 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
