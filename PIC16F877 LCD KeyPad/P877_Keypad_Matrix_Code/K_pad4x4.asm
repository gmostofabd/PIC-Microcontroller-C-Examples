
_InitKeypad:

;K_pad4x4.c,8 :: 		void InitKeypad(void)
;K_pad4x4.c,10 :: 		Keypad_PORT = 0x00;        // Set Keypad port pin values zero
	CLRF       PORTB+0
;K_pad4x4.c,11 :: 		Keypad_PORT_Dir = 0xF0;        // Last 4 pins input, except first, remaining 3 pins output
	MOVLW      240
	MOVWF      TRISB+0
;K_pad4x4.c,12 :: 		OPTION_REG &= 0x7F;
	MOVLW      127
	ANDWF      OPTION_REG+0, 1
;K_pad4x4.c,13 :: 		}
L_end_InitKeypad:
	RETURN
; end of _InitKeypad

_READ_SWITCHES:

;K_pad4x4.c,20 :: 		char READ_SWITCHES(void)
;K_pad4x4.c,22 :: 		RowA = 0; RowB = 1; RowC = 1; RowD = 1;         //Test Row A
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;K_pad4x4.c,24 :: 		if (C1 == 0) { Delay_ms(250); while (C1==0); return '1'; }
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_READ_SWITCHES0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES1:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES1
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES1
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES1
	NOP
	NOP
L_READ_SWITCHES2:
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_READ_SWITCHES3
	GOTO       L_READ_SWITCHES2
L_READ_SWITCHES3:
	MOVLW      49
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES0:
;K_pad4x4.c,25 :: 		if (C2 == 0) { Delay_ms(250); while (C2==0); return '4'; }
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_READ_SWITCHES4
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES5:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES5
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES5
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES5
	NOP
	NOP
L_READ_SWITCHES6:
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_READ_SWITCHES7
	GOTO       L_READ_SWITCHES6
L_READ_SWITCHES7:
	MOVLW      52
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES4:
;K_pad4x4.c,26 :: 		if (C3 == 0) { Delay_ms(250); while (C3==0); return '7'; }
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_READ_SWITCHES8
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES9:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES9
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES9
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES9
	NOP
	NOP
L_READ_SWITCHES10:
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_READ_SWITCHES11
	GOTO       L_READ_SWITCHES10
L_READ_SWITCHES11:
	MOVLW      55
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES8:
;K_pad4x4.c,27 :: 		if (C4 == 0) { Delay_ms(250); while (C4==0); return 'C'; }
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_READ_SWITCHES12
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES13:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES13
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES13
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES13
	NOP
	NOP
L_READ_SWITCHES14:
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_READ_SWITCHES15
	GOTO       L_READ_SWITCHES14
L_READ_SWITCHES15:
	MOVLW      67
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES12:
;K_pad4x4.c,29 :: 		RowA = 1; RowB = 0; RowC = 1; RowD = 1;         //Test Row B
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;K_pad4x4.c,31 :: 		if (C1 == 0) { Delay_ms(250); while (C1==0); return '2'; }
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_READ_SWITCHES16
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES17:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES17
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES17
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES17
	NOP
	NOP
L_READ_SWITCHES18:
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_READ_SWITCHES19
	GOTO       L_READ_SWITCHES18
L_READ_SWITCHES19:
	MOVLW      50
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES16:
;K_pad4x4.c,32 :: 		if (C2 == 0) { Delay_ms(250); while (C2==0); return '5'; }
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_READ_SWITCHES20
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES21:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES21
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES21
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES21
	NOP
	NOP
L_READ_SWITCHES22:
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_READ_SWITCHES23
	GOTO       L_READ_SWITCHES22
L_READ_SWITCHES23:
	MOVLW      53
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES20:
;K_pad4x4.c,33 :: 		if (C3 == 0) { Delay_ms(250); while (C3==0); return '8'; }
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_READ_SWITCHES24
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES25:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES25
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES25
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES25
	NOP
	NOP
L_READ_SWITCHES26:
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_READ_SWITCHES27
	GOTO       L_READ_SWITCHES26
L_READ_SWITCHES27:
	MOVLW      56
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES24:
;K_pad4x4.c,34 :: 		if (C4 == 0) { Delay_ms(250); while (C4==0); return '0'; }
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_READ_SWITCHES28
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES29:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES29
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES29
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES29
	NOP
	NOP
L_READ_SWITCHES30:
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_READ_SWITCHES31
	GOTO       L_READ_SWITCHES30
L_READ_SWITCHES31:
	MOVLW      48
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES28:
;K_pad4x4.c,36 :: 		RowA = 1; RowB = 1; RowC = 0; RowD = 1;         //Test Row C
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;K_pad4x4.c,38 :: 		if (C1 == 0) { Delay_ms(250); while (C1==0); return '3'; }
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_READ_SWITCHES32
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES33:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES33
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES33
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES33
	NOP
	NOP
L_READ_SWITCHES34:
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_READ_SWITCHES35
	GOTO       L_READ_SWITCHES34
L_READ_SWITCHES35:
	MOVLW      51
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES32:
;K_pad4x4.c,39 :: 		if (C2 == 0) { Delay_ms(250); while (C2==0); return '6'; }
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_READ_SWITCHES36
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES37:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES37
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES37
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES37
	NOP
	NOP
L_READ_SWITCHES38:
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_READ_SWITCHES39
	GOTO       L_READ_SWITCHES38
L_READ_SWITCHES39:
	MOVLW      54
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES36:
;K_pad4x4.c,40 :: 		if (C3 == 0) { Delay_ms(250); while (C3==0); return '9'; }
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_READ_SWITCHES40
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES41:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES41
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES41
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES41
	NOP
	NOP
L_READ_SWITCHES42:
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_READ_SWITCHES43
	GOTO       L_READ_SWITCHES42
L_READ_SWITCHES43:
	MOVLW      57
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES40:
;K_pad4x4.c,41 :: 		if (C4 == 0) { Delay_ms(250); while (C4==0); return '='; }
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_READ_SWITCHES44
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES45:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES45
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES45
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES45
	NOP
	NOP
L_READ_SWITCHES46:
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_READ_SWITCHES47
	GOTO       L_READ_SWITCHES46
L_READ_SWITCHES47:
	MOVLW      61
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES44:
;K_pad4x4.c,43 :: 		RowA = 1; RowB = 1; RowC = 1; RowD = 0;         //Test Row D
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;K_pad4x4.c,45 :: 		if (C1 == 0) { Delay_ms(250); while (C1==0); return '-'; }
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_READ_SWITCHES48
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES49:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES49
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES49
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES49
	NOP
	NOP
L_READ_SWITCHES50:
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_READ_SWITCHES51
	GOTO       L_READ_SWITCHES50
L_READ_SWITCHES51:
	MOVLW      45
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES48:
;K_pad4x4.c,46 :: 		if (C2 == 0) { Delay_ms(250); while (C2==0); return 'X'; }
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_READ_SWITCHES52
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES53:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES53
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES53
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES53
	NOP
	NOP
L_READ_SWITCHES54:
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_READ_SWITCHES55
	GOTO       L_READ_SWITCHES54
L_READ_SWITCHES55:
	MOVLW      88
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES52:
;K_pad4x4.c,47 :: 		if (C3 == 0) { Delay_ms(250); while (C3==0); return '/'; }
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_READ_SWITCHES56
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES57:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES57
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES57
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES57
	NOP
	NOP
L_READ_SWITCHES58:
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_READ_SWITCHES59
	GOTO       L_READ_SWITCHES58
L_READ_SWITCHES59:
	MOVLW      47
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES56:
;K_pad4x4.c,48 :: 		if (C4 == 0) { Delay_ms(250); while (C4==0); return '+'; }
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_READ_SWITCHES60
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_READ_SWITCHES61:
	DECFSZ     R13+0, 1
	GOTO       L_READ_SWITCHES61
	DECFSZ     R12+0, 1
	GOTO       L_READ_SWITCHES61
	DECFSZ     R11+0, 1
	GOTO       L_READ_SWITCHES61
	NOP
	NOP
L_READ_SWITCHES62:
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_READ_SWITCHES63
	GOTO       L_READ_SWITCHES62
L_READ_SWITCHES63:
	MOVLW      43
	MOVWF      R0+0
	GOTO       L_end_READ_SWITCHES
L_READ_SWITCHES60:
;K_pad4x4.c,50 :: 		return 'n';                   // Means no key has been pressed
	MOVLW      110
	MOVWF      R0+0
;K_pad4x4.c,51 :: 		}
L_end_READ_SWITCHES:
	RETURN
; end of _READ_SWITCHES

_GetKey:

;K_pad4x4.c,58 :: 		char GetKey(){
;K_pad4x4.c,59 :: 		char key = 'n';              // Assume no key pressed
	MOVLW      110
	MOVWF      GetKey_key_L0+0
;K_pad4x4.c,60 :: 		while(key=='n')              // Wait until a key is pressed
L_GetKey64:
	MOVF       GetKey_key_L0+0, 0
	XORLW      110
	BTFSS      STATUS+0, 2
	GOTO       L_GetKey65
;K_pad4x4.c,61 :: 		key = READ_SWITCHES();   // Scan the keys again and again
	CALL       _READ_SWITCHES+0
	MOVF       R0+0, 0
	MOVWF      GetKey_key_L0+0
	GOTO       L_GetKey64
L_GetKey65:
;K_pad4x4.c,62 :: 		return key;                  //when key pressed then return its value
	MOVF       GetKey_key_L0+0, 0
	MOVWF      R0+0
;K_pad4x4.c,63 :: 		}
L_end_GetKey:
	RETURN
; end of _GetKey
