
_ToggleEpinOfLCD:

;LCD_HD44780.c,8 :: 		void ToggleEpinOfLCD(void){
;LCD_HD44780.c,9 :: 		LCD_EN = 1;                // Give a pulse on E pin
	BSF        PORTC+0, 1
;LCD_HD44780.c,10 :: 		Delay_us(E_Delay);         // so that LCD can latch the
	MOVLW      33
	MOVWF      R13+0
L_ToggleEpinOfLCD0:
	DECFSZ     R13+0, 1
	GOTO       L_ToggleEpinOfLCD0
;LCD_HD44780.c,11 :: 		LCD_EN = 0;                // data from data bus
	BCF        PORTC+0, 1
;LCD_HD44780.c,12 :: 		Delay_us(E_Delay);
	MOVLW      33
	MOVWF      R13+0
L_ToggleEpinOfLCD1:
	DECFSZ     R13+0, 1
	GOTO       L_ToggleEpinOfLCD1
;LCD_HD44780.c,13 :: 		}
L_end_ToggleEpinOfLCD:
	RETURN
; end of _ToggleEpinOfLCD

_WriteCommandToLCD:

;LCD_HD44780.c,17 :: 		void WriteCommandToLCD(unsigned char Command){
;LCD_HD44780.c,18 :: 		LCD_RS = 0;                          // It is a command
	BCF        PORTC+0, 0
;LCD_HD44780.c,19 :: 		LCD_PORT &= 0x0F;                    // Make Data pins zero
	MOVLW      15
	ANDWF      PORTD+0, 1
;LCD_HD44780.c,20 :: 		LCD_PORT |= (Command&0xF0);          // Write Upper nibble of data
	MOVLW      240
	ANDWF      FARG_WriteCommandToLCD_Command+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTD+0, 1
;LCD_HD44780.c,21 :: 		ToggleEpinOfLCD();                   // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;LCD_HD44780.c,22 :: 		LCD_PORT &= 0x0F;                    // Make Data pins zero
	MOVLW      15
	ANDWF      PORTD+0, 1
;LCD_HD44780.c,23 :: 		LCD_PORT |= ((Command<<4)&0xF0);     // Write Lower nibble of data
	MOVF       FARG_WriteCommandToLCD_Command+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      240
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      PORTD+0, 1
;LCD_HD44780.c,24 :: 		ToggleEpinOfLCD();                   // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;LCD_HD44780.c,25 :: 		}
L_end_WriteCommandToLCD:
	RETURN
; end of _WriteCommandToLCD

_WriteDataToLCD:

;LCD_HD44780.c,30 :: 		void WriteDataToLCD(char LCDChar){
;LCD_HD44780.c,31 :: 		LCD_RS = 1;                           // It is data
	BSF        PORTC+0, 0
;LCD_HD44780.c,32 :: 		LCD_PORT &= 0x0F;                     // Make Data pins zero
	MOVLW      15
	ANDWF      PORTD+0, 1
;LCD_HD44780.c,33 :: 		LCD_PORT |= (LCDChar&0xF0);           // Write Upper nibble of data
	MOVLW      240
	ANDWF      FARG_WriteDataToLCD_LCDChar+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTD+0, 1
;LCD_HD44780.c,34 :: 		ToggleEpinOfLCD();                    // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;LCD_HD44780.c,35 :: 		LCD_PORT &= 0x0F;                     // Make Data pins zero
	MOVLW      15
	ANDWF      PORTD+0, 1
;LCD_HD44780.c,36 :: 		LCD_PORT |= ((LCDChar<<4)&0xF0);      // Write Lower nibble of data
	MOVF       FARG_WriteDataToLCD_LCDChar+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      240
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      PORTD+0, 1
;LCD_HD44780.c,37 :: 		ToggleEpinOfLCD();                    // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;LCD_HD44780.c,38 :: 		}
L_end_WriteDataToLCD:
	RETURN
; end of _WriteDataToLCD

_InitLCD:

;LCD_HD44780.c,43 :: 		void InitLCD(void){
;LCD_HD44780.c,45 :: 		LCD_EN            = 0;   // E  = 0
	BCF        PORTC+0, 1
;LCD_HD44780.c,46 :: 		LCD_RS            = 0;   // RS = 0
	BCF        PORTC+0, 0
;LCD_HD44780.c,48 :: 		Delay_ms(40);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_InitLCD2:
	DECFSZ     R13+0, 1
	GOTO       L_InitLCD2
	DECFSZ     R12+0, 1
	GOTO       L_InitLCD2
	NOP
	NOP
;LCD_HD44780.c,50 :: 		LCD_PORT &= 0x0F;                  // Make Data pins zero
	MOVLW      15
	ANDWF      PORTD+0, 1
;LCD_HD44780.c,51 :: 		LCD_PORT |= 0x30;                  // Write 0x3 value on data bus
	MOVLW      48
	IORWF      PORTD+0, 1
;LCD_HD44780.c,52 :: 		ToggleEpinOfLCD();                  // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;LCD_HD44780.c,54 :: 		Delay_ms(6);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_InitLCD3:
	DECFSZ     R13+0, 1
	GOTO       L_InitLCD3
	DECFSZ     R12+0, 1
	GOTO       L_InitLCD3
	NOP
	NOP
;LCD_HD44780.c,56 :: 		LCD_PORT &= 0x0F;                  // Make Data pins zero
	MOVLW      15
	ANDWF      PORTD+0, 1
;LCD_HD44780.c,57 :: 		LCD_PORT |= 0x30;                  // Write 0x3 value on data bus
	MOVLW      48
	IORWF      PORTD+0, 1
;LCD_HD44780.c,58 :: 		ToggleEpinOfLCD();                  // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;LCD_HD44780.c,60 :: 		Delay_us(300);
	MOVLW      99
	MOVWF      R13+0
L_InitLCD4:
	DECFSZ     R13+0, 1
	GOTO       L_InitLCD4
	NOP
	NOP
;LCD_HD44780.c,62 :: 		LCD_PORT &= 0x0F;                  // Make Data pins zero
	MOVLW      15
	ANDWF      PORTD+0, 1
;LCD_HD44780.c,63 :: 		LCD_PORT |= 0x30;                  // Write 0x3 value on data bus
	MOVLW      48
	IORWF      PORTD+0, 1
;LCD_HD44780.c,64 :: 		ToggleEpinOfLCD();                  // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;LCD_HD44780.c,66 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_InitLCD5:
	DECFSZ     R13+0, 1
	GOTO       L_InitLCD5
	DECFSZ     R12+0, 1
	GOTO       L_InitLCD5
	NOP
	NOP
;LCD_HD44780.c,68 :: 		LCD_PORT &= 0x0F;                  // Make Data pins zero
	MOVLW      15
	ANDWF      PORTD+0, 1
;LCD_HD44780.c,69 :: 		LCD_PORT |= 0x20;                  // Write 0x2 value on data bus
	BSF        PORTD+0, 5
;LCD_HD44780.c,70 :: 		ToggleEpinOfLCD();                  // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;LCD_HD44780.c,72 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_InitLCD6:
	DECFSZ     R13+0, 1
	GOTO       L_InitLCD6
	DECFSZ     R12+0, 1
	GOTO       L_InitLCD6
	NOP
	NOP
;LCD_HD44780.c,74 :: 		WriteCommandToLCD(0x28);    //function set
	MOVLW      40
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;LCD_HD44780.c,75 :: 		WriteCommandToLCD(0x0c);    //display on,cursor off,blink off
	MOVLW      12
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;LCD_HD44780.c,76 :: 		WriteCommandToLCD(0x01);    //clear display
	MOVLW      1
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;LCD_HD44780.c,77 :: 		WriteCommandToLCD(0x06);    //entry mode, set increment
	MOVLW      6
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;LCD_HD44780.c,78 :: 		}
L_end_InitLCD:
	RETURN
; end of _InitLCD

_WriteStringToLCD:

;LCD_HD44780.c,83 :: 		void WriteStringToLCD(const char *s){
;LCD_HD44780.c,84 :: 		while(*s) WriteDataToLCD(*s++);   // print first character on LCD
L_WriteStringToLCD7:
	MOVF       FARG_WriteStringToLCD_s+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_WriteStringToLCD_s+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_WriteStringToLCD8
	MOVF       FARG_WriteStringToLCD_s+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_WriteStringToLCD_s+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_WriteDataToLCD_LCDChar+0
	CALL       _WriteDataToLCD+0
	INCF       FARG_WriteStringToLCD_s+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_WriteStringToLCD_s+1, 1
	GOTO       L_WriteStringToLCD7
L_WriteStringToLCD8:
;LCD_HD44780.c,85 :: 		}
L_end_WriteStringToLCD:
	RETURN
; end of _WriteStringToLCD

_ClearLCDScreen:

;LCD_HD44780.c,90 :: 		void ClearLCDScreen(void)       // Clear the Screen and return cursor to zero position
;LCD_HD44780.c,92 :: 		WriteCommandToLCD(0x01);    // Clear the screen
	MOVLW      1
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;LCD_HD44780.c,93 :: 		Delay_ms(2);              // Delay for cursor to return at zero position
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_ClearLCDScreen9:
	DECFSZ     R13+0, 1
	GOTO       L_ClearLCDScreen9
	DECFSZ     R12+0, 1
	GOTO       L_ClearLCDScreen9
	NOP
	NOP
;LCD_HD44780.c,94 :: 		}
L_end_ClearLCDScreen:
	RETURN
; end of _ClearLCDScreen

_GotoYXPositionOnLCD:

;LCD_HD44780.c,99 :: 		void GotoYXPositionOnLCD(unsigned char LineNumber, unsigned char OFFSET)   // LineNumber can have two values, LCD_LINE1 and LCD_LINE2
;LCD_HD44780.c,101 :: 		WriteCommandToLCD(0x80|((LineNumber*0x40)+OFFSET));                    // Line1 is from 0x0 to 0x27 and Line2 is from 0x40 to 0x67
	MOVLW      6
	MOVWF      R1+0
	MOVF       FARG_GotoYXPositionOnLCD_LineNumber+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__GotoYXPositionOnLCD18:
	BTFSC      STATUS+0, 2
	GOTO       L__GotoYXPositionOnLCD19
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__GotoYXPositionOnLCD18
L__GotoYXPositionOnLCD19:
	MOVF       FARG_GotoYXPositionOnLCD_OFFSET+0, 0
	ADDWF      R0+0, 1
	MOVLW      128
	IORWF      R0+0, 0
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;LCD_HD44780.c,102 :: 		}
L_end_GotoYXPositionOnLCD:
	RETURN
; end of _GotoYXPositionOnLCD

_WriteLCDLine1:

;LCD_HD44780.c,107 :: 		void WriteLCDLine1(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
;LCD_HD44780.c,109 :: 		GotoYXPositionOnLCD(LCD_LINE1, 0);     // Goto 0,0 location
	CLRF       FARG_GotoYXPositionOnLCD_LineNumber+0
	CLRF       FARG_GotoYXPositionOnLCD_OFFSET+0
	CALL       _GotoYXPositionOnLCD+0
;LCD_HD44780.c,110 :: 		WriteStringToLCD(s);
	MOVF       FARG_WriteLCDLine1_s+0, 0
	MOVWF      FARG_WriteStringToLCD_s+0
	MOVF       FARG_WriteLCDLine1_s+1, 0
	MOVWF      FARG_WriteStringToLCD_s+1
	CALL       _WriteStringToLCD+0
;LCD_HD44780.c,111 :: 		}
L_end_WriteLCDLine1:
	RETURN
; end of _WriteLCDLine1

_WriteLCDLine2:

;LCD_HD44780.c,116 :: 		void WriteLCDLine2(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
;LCD_HD44780.c,118 :: 		GotoYXPositionOnLCD(LCD_LINE2, 0);     // Goto 1,0 location
	MOVLW      1
	MOVWF      FARG_GotoYXPositionOnLCD_LineNumber+0
	CLRF       FARG_GotoYXPositionOnLCD_OFFSET+0
	CALL       _GotoYXPositionOnLCD+0
;LCD_HD44780.c,119 :: 		WriteStringToLCD(s);
	MOVF       FARG_WriteLCDLine2_s+0, 0
	MOVWF      FARG_WriteStringToLCD_s+0
	MOVF       FARG_WriteLCDLine2_s+1, 0
	MOVWF      FARG_WriteStringToLCD_s+1
	CALL       _WriteStringToLCD+0
;LCD_HD44780.c,120 :: 		}
L_end_WriteLCDLine2:
	RETURN
; end of _WriteLCDLine2

_WriteLCDLine3:

;LCD_HD44780.c,125 :: 		void WriteLCDLine3(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
;LCD_HD44780.c,127 :: 		GotoYXPositionOnLCD(LCD_LINE3, 0);     // Goto 1,0 location
	MOVLW      2
	MOVWF      FARG_GotoYXPositionOnLCD_LineNumber+0
	CLRF       FARG_GotoYXPositionOnLCD_OFFSET+0
	CALL       _GotoYXPositionOnLCD+0
;LCD_HD44780.c,128 :: 		WriteStringToLCD(s);
	MOVF       FARG_WriteLCDLine3_s+0, 0
	MOVWF      FARG_WriteStringToLCD_s+0
	MOVF       FARG_WriteLCDLine3_s+1, 0
	MOVWF      FARG_WriteStringToLCD_s+1
	CALL       _WriteStringToLCD+0
;LCD_HD44780.c,129 :: 		}
L_end_WriteLCDLine3:
	RETURN
; end of _WriteLCDLine3

_WriteLCDLine4:

;LCD_HD44780.c,134 :: 		void WriteLCDLine4(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
;LCD_HD44780.c,136 :: 		GotoYXPositionOnLCD(LCD_LINE4, 0);     // Goto 1,0 location
	MOVLW      3
	MOVWF      FARG_GotoYXPositionOnLCD_LineNumber+0
	CLRF       FARG_GotoYXPositionOnLCD_OFFSET+0
	CALL       _GotoYXPositionOnLCD+0
;LCD_HD44780.c,137 :: 		WriteStringToLCD(s);
	MOVF       FARG_WriteLCDLine4_s+0, 0
	MOVWF      FARG_WriteStringToLCD_s+0
	MOVF       FARG_WriteLCDLine4_s+1, 0
	MOVWF      FARG_WriteStringToLCD_s+1
	CALL       _WriteStringToLCD+0
;LCD_HD44780.c,138 :: 		}
L_end_WriteLCDLine4:
	RETURN
; end of _WriteLCDLine4

_welcome_msg:

;LCD_HD44780.c,143 :: 		void welcome_msg(){
;LCD_HD44780.c,144 :: 		ClearLCDScreen();               // Clear display  +++++++++++++++++|||||
	CALL       _ClearLCDScreen+0
;LCD_HD44780.c,145 :: 		WriteLCDLine1("* 4X4 Key Pad *");
	MOVLW      ?lstr_1_LCD_HD44780+0
	MOVWF      FARG_WriteLCDLine1_s+0
	MOVLW      hi_addr(?lstr_1_LCD_HD44780+0)
	MOVWF      FARG_WriteLCDLine1_s+1
	CALL       _WriteLCDLine1+0
;LCD_HD44780.c,146 :: 		WriteLCDLine2("**  MELAB-BD  **");
	MOVLW      ?lstr_2_LCD_HD44780+0
	MOVWF      FARG_WriteLCDLine2_s+0
	MOVLW      hi_addr(?lstr_2_LCD_HD44780+0)
	MOVWF      FARG_WriteLCDLine2_s+1
	CALL       _WriteLCDLine2+0
;LCD_HD44780.c,147 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_welcome_msg10:
	DECFSZ     R13+0, 1
	GOTO       L_welcome_msg10
	DECFSZ     R12+0, 1
	GOTO       L_welcome_msg10
	DECFSZ     R11+0, 1
	GOTO       L_welcome_msg10
	NOP
	NOP
;LCD_HD44780.c,148 :: 		}
L_end_welcome_msg:
	RETURN
; end of _welcome_msg
