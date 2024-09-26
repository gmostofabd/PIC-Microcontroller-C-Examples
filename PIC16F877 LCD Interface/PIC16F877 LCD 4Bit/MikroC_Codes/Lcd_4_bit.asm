
_Move_Delay:

;Lcd_4_bit.c,38 :: 		void Move_Delay() {                  // Function used for text moving
;Lcd_4_bit.c,39 :: 		Delay_ms(500);                     // You can change the moving speed here
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;Lcd_4_bit.c,40 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;Lcd_4_bit.c,46 :: 		void main(){
;Lcd_4_bit.c,47 :: 		TRISB = 0;
	CLRF       TRISB+0
;Lcd_4_bit.c,48 :: 		TRISC = 0;
	CLRF       TRISC+0
;Lcd_4_bit.c,50 :: 		InitLCD();
	CALL       _InitLCD+0
;Lcd_4_bit.c,51 :: 		while(1){
L_main1:
;Lcd_4_bit.c,59 :: 		welcome_msg();
	CALL       _welcome_msg+0
;Lcd_4_bit.c,61 :: 		}
	GOTO       L_main1
;Lcd_4_bit.c,63 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_InitLCD:

;Lcd_4_bit.c,73 :: 		void InitLCD(void)
;Lcd_4_bit.c,76 :: 		LCD_EN            = 0;   // E  = 0
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;Lcd_4_bit.c,77 :: 		LCD_RS            = 0;   // RS = 0
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;Lcd_4_bit.c,79 :: 		Delay_ms(40);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_InitLCD3:
	DECFSZ     R13+0, 1
	GOTO       L_InitLCD3
	DECFSZ     R12+0, 1
	GOTO       L_InitLCD3
	NOP
	NOP
;Lcd_4_bit.c,81 :: 		LCD_PORT &= 0x0F;                  // Make Data pins zero
	MOVLW      15
	ANDWF      PORTB+0, 1
;Lcd_4_bit.c,82 :: 		LCD_PORT |= 0x30;                  // Write 0x3 value on data bus
	MOVLW      48
	IORWF      PORTB+0, 1
;Lcd_4_bit.c,83 :: 		ToggleEpinOfLCD();                  // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;Lcd_4_bit.c,85 :: 		Delay_ms(6);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_InitLCD4:
	DECFSZ     R13+0, 1
	GOTO       L_InitLCD4
	DECFSZ     R12+0, 1
	GOTO       L_InitLCD4
	NOP
	NOP
;Lcd_4_bit.c,87 :: 		LCD_PORT &= 0x0F;                  // Make Data pins zero
	MOVLW      15
	ANDWF      PORTB+0, 1
;Lcd_4_bit.c,88 :: 		LCD_PORT |= 0x30;                  // Write 0x3 value on data bus
	MOVLW      48
	IORWF      PORTB+0, 1
;Lcd_4_bit.c,89 :: 		ToggleEpinOfLCD();                  // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;Lcd_4_bit.c,91 :: 		Delay_us(300);
	MOVLW      99
	MOVWF      R13+0
L_InitLCD5:
	DECFSZ     R13+0, 1
	GOTO       L_InitLCD5
	NOP
	NOP
;Lcd_4_bit.c,93 :: 		LCD_PORT &= 0x0F;                  // Make Data pins zero
	MOVLW      15
	ANDWF      PORTB+0, 1
;Lcd_4_bit.c,94 :: 		LCD_PORT |= 0x30;                  // Write 0x3 value on data bus
	MOVLW      48
	IORWF      PORTB+0, 1
;Lcd_4_bit.c,95 :: 		ToggleEpinOfLCD();                  // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;Lcd_4_bit.c,97 :: 		Delay_ms(2);
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
;Lcd_4_bit.c,99 :: 		LCD_PORT &= 0x0F;                  // Make Data pins zero
	MOVLW      15
	ANDWF      PORTB+0, 1
;Lcd_4_bit.c,100 :: 		LCD_PORT |= 0x20;                  // Write 0x2 value on data bus
	BSF        PORTB+0, 5
;Lcd_4_bit.c,101 :: 		ToggleEpinOfLCD();                  // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;Lcd_4_bit.c,103 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_InitLCD7:
	DECFSZ     R13+0, 1
	GOTO       L_InitLCD7
	DECFSZ     R12+0, 1
	GOTO       L_InitLCD7
	NOP
	NOP
;Lcd_4_bit.c,105 :: 		WriteCommandToLCD(0x28);    //function set
	MOVLW      40
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;Lcd_4_bit.c,106 :: 		WriteCommandToLCD(0x0c);    //display on,cursor off,blink off
	MOVLW      12
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;Lcd_4_bit.c,107 :: 		WriteCommandToLCD(0x01);    //clear display
	MOVLW      1
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;Lcd_4_bit.c,108 :: 		WriteCommandToLCD(0x06);    //entry mode, set increment
	MOVLW      6
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;Lcd_4_bit.c,109 :: 		}
L_end_InitLCD:
	RETURN
; end of _InitLCD

_ToggleEpinOfLCD:

;Lcd_4_bit.c,113 :: 		void ToggleEpinOfLCD(void)
;Lcd_4_bit.c,115 :: 		LCD_EN = 1;                // Give a pulse on E pin
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
;Lcd_4_bit.c,116 :: 		Delay_us(E_Delay);      // so that LCD can latch the
	MOVLW      33
	MOVWF      R13+0
L_ToggleEpinOfLCD8:
	DECFSZ     R13+0, 1
	GOTO       L_ToggleEpinOfLCD8
;Lcd_4_bit.c,117 :: 		LCD_EN = 0;                // data from data bus
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;Lcd_4_bit.c,118 :: 		Delay_us(E_Delay);
	MOVLW      33
	MOVWF      R13+0
L_ToggleEpinOfLCD9:
	DECFSZ     R13+0, 1
	GOTO       L_ToggleEpinOfLCD9
;Lcd_4_bit.c,119 :: 		}
L_end_ToggleEpinOfLCD:
	RETURN
; end of _ToggleEpinOfLCD

_WriteCommandToLCD:

;Lcd_4_bit.c,124 :: 		void WriteCommandToLCD(unsigned char Command)
;Lcd_4_bit.c,126 :: 		LCD_RS = 0;                                              // It is a command
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;Lcd_4_bit.c,127 :: 		LCD_PORT &= 0x0F;                                   // Make Data pins zero
	MOVLW      15
	ANDWF      PORTB+0, 1
;Lcd_4_bit.c,128 :: 		LCD_PORT |= (Command&0xF0);                 // Write Upper nibble of data
	MOVLW      240
	ANDWF      FARG_WriteCommandToLCD_Command+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;Lcd_4_bit.c,129 :: 		ToggleEpinOfLCD();                                    // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;Lcd_4_bit.c,131 :: 		LCD_PORT &= 0x0F;                                    // Make Data pins zero
	MOVLW      15
	ANDWF      PORTB+0, 1
;Lcd_4_bit.c,132 :: 		LCD_PORT |= ((Command<<4)&0xF0); // Write Lower nibble of data
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
	IORWF      PORTB+0, 1
;Lcd_4_bit.c,133 :: 		ToggleEpinOfLCD();                                    // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;Lcd_4_bit.c,134 :: 		}
L_end_WriteCommandToLCD:
	RETURN
; end of _WriteCommandToLCD

_WriteDataToLCD:

;Lcd_4_bit.c,139 :: 		void WriteDataToLCD(char LCDChar)
;Lcd_4_bit.c,141 :: 		LCD_RS = 1;                           // It is data
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;Lcd_4_bit.c,142 :: 		LCD_PORT &= 0x0F;                     // Make Data pins zero
	MOVLW      15
	ANDWF      PORTB+0, 1
;Lcd_4_bit.c,143 :: 		LCD_PORT |= (LCDChar&0xF0);           // Write Upper nibble of data
	MOVLW      240
	ANDWF      FARG_WriteDataToLCD_LCDChar+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;Lcd_4_bit.c,144 :: 		ToggleEpinOfLCD();                    // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;Lcd_4_bit.c,145 :: 		LCD_PORT &= 0x0F;                     // Make Data pins zero
	MOVLW      15
	ANDWF      PORTB+0, 1
;Lcd_4_bit.c,146 :: 		LCD_PORT |= ((LCDChar<<4)&0xF0);      // Write Lower nibble of data
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
	IORWF      PORTB+0, 1
;Lcd_4_bit.c,147 :: 		ToggleEpinOfLCD();                    // Give pulse on E pin
	CALL       _ToggleEpinOfLCD+0
;Lcd_4_bit.c,148 :: 		}
L_end_WriteDataToLCD:
	RETURN
; end of _WriteDataToLCD

_WriteStringToLCD:

;Lcd_4_bit.c,152 :: 		void WriteStringToLCD(const char *s)
;Lcd_4_bit.c,154 :: 		while(*s) WriteDataToLCD(*s++);   // print first character on LCD
L_WriteStringToLCD10:
	MOVF       FARG_WriteStringToLCD_s+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_WriteStringToLCD_s+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_WriteStringToLCD11
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
	GOTO       L_WriteStringToLCD10
L_WriteStringToLCD11:
;Lcd_4_bit.c,155 :: 		}
L_end_WriteStringToLCD:
	RETURN
; end of _WriteStringToLCD

_ClearLCDScreen:

;Lcd_4_bit.c,160 :: 		void ClearLCDScreen(void)       // Clear the Screen and return cursor to zero position
;Lcd_4_bit.c,162 :: 		WriteCommandToLCD(0x01);    // Clear the screen
	MOVLW      1
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;Lcd_4_bit.c,163 :: 		Delay_ms(2);              // Delay for cursor to return at zero position
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_ClearLCDScreen12:
	DECFSZ     R13+0, 1
	GOTO       L_ClearLCDScreen12
	DECFSZ     R12+0, 1
	GOTO       L_ClearLCDScreen12
	NOP
	NOP
;Lcd_4_bit.c,164 :: 		}
L_end_ClearLCDScreen:
	RETURN
; end of _ClearLCDScreen

_GotoYXPositionOnLCD:

;Lcd_4_bit.c,169 :: 		void GotoYXPositionOnLCD(unsigned char LineNumber, unsigned char OFFSET)   // LineNumber can have two values, LCD_LINE1 and LCD_LINE2
;Lcd_4_bit.c,171 :: 		WriteCommandToLCD(0x80|((LineNumber*0x40)+OFFSET));                    // Line1 is from 0x0 to 0x27 and Line2 is from 0x40 to 0x67
	MOVLW      6
	MOVWF      R1+0
	MOVF       FARG_GotoYXPositionOnLCD_LineNumber+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__GotoYXPositionOnLCD23:
	BTFSC      STATUS+0, 2
	GOTO       L__GotoYXPositionOnLCD24
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__GotoYXPositionOnLCD23
L__GotoYXPositionOnLCD24:
	MOVF       FARG_GotoYXPositionOnLCD_OFFSET+0, 0
	ADDWF      R0+0, 1
	MOVLW      128
	IORWF      R0+0, 0
	MOVWF      FARG_WriteCommandToLCD_Command+0
	CALL       _WriteCommandToLCD+0
;Lcd_4_bit.c,172 :: 		}
L_end_GotoYXPositionOnLCD:
	RETURN
; end of _GotoYXPositionOnLCD

_WriteLCDLine1:

;Lcd_4_bit.c,177 :: 		void WriteLCDLine1(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
;Lcd_4_bit.c,179 :: 		GotoYXPositionOnLCD(LCD_LINE1, 0);     // Goto 0,0 location
	CLRF       FARG_GotoYXPositionOnLCD_LineNumber+0
	CLRF       FARG_GotoYXPositionOnLCD_OFFSET+0
	CALL       _GotoYXPositionOnLCD+0
;Lcd_4_bit.c,180 :: 		WriteStringToLCD(s);
	MOVF       FARG_WriteLCDLine1_s+0, 0
	MOVWF      FARG_WriteStringToLCD_s+0
	MOVF       FARG_WriteLCDLine1_s+1, 0
	MOVWF      FARG_WriteStringToLCD_s+1
	CALL       _WriteStringToLCD+0
;Lcd_4_bit.c,181 :: 		}
L_end_WriteLCDLine1:
	RETURN
; end of _WriteLCDLine1

_WriteLCDLine2:

;Lcd_4_bit.c,186 :: 		void WriteLCDLine2(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
;Lcd_4_bit.c,188 :: 		GotoYXPositionOnLCD(LCD_LINE2, 0);     // Goto 1,0 location
	MOVLW      1
	MOVWF      FARG_GotoYXPositionOnLCD_LineNumber+0
	CLRF       FARG_GotoYXPositionOnLCD_OFFSET+0
	CALL       _GotoYXPositionOnLCD+0
;Lcd_4_bit.c,189 :: 		WriteStringToLCD(s);
	MOVF       FARG_WriteLCDLine2_s+0, 0
	MOVWF      FARG_WriteStringToLCD_s+0
	MOVF       FARG_WriteLCDLine2_s+1, 0
	MOVWF      FARG_WriteStringToLCD_s+1
	CALL       _WriteStringToLCD+0
;Lcd_4_bit.c,190 :: 		}
L_end_WriteLCDLine2:
	RETURN
; end of _WriteLCDLine2

_WriteLCDLine3:

;Lcd_4_bit.c,197 :: 		void WriteLCDLine3(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
;Lcd_4_bit.c,199 :: 		GotoYXPositionOnLCD(LCD_LINE3, 0);     // Goto 1,0 location
	MOVLW      2
	MOVWF      FARG_GotoYXPositionOnLCD_LineNumber+0
	CLRF       FARG_GotoYXPositionOnLCD_OFFSET+0
	CALL       _GotoYXPositionOnLCD+0
;Lcd_4_bit.c,200 :: 		WriteStringToLCD(s);
	MOVF       FARG_WriteLCDLine3_s+0, 0
	MOVWF      FARG_WriteStringToLCD_s+0
	MOVF       FARG_WriteLCDLine3_s+1, 0
	MOVWF      FARG_WriteStringToLCD_s+1
	CALL       _WriteStringToLCD+0
;Lcd_4_bit.c,201 :: 		}
L_end_WriteLCDLine3:
	RETURN
; end of _WriteLCDLine3

_WriteLCDLine4:

;Lcd_4_bit.c,206 :: 		void WriteLCDLine4(const char *s)    // length of s should be 16 for 16x2 LCD and 20 for 20x2 LCD
;Lcd_4_bit.c,208 :: 		GotoYXPositionOnLCD(LCD_LINE4, 0);     // Goto 1,0 location
	MOVLW      3
	MOVWF      FARG_GotoYXPositionOnLCD_LineNumber+0
	CLRF       FARG_GotoYXPositionOnLCD_OFFSET+0
	CALL       _GotoYXPositionOnLCD+0
;Lcd_4_bit.c,209 :: 		WriteStringToLCD(s);
	MOVF       FARG_WriteLCDLine4_s+0, 0
	MOVWF      FARG_WriteStringToLCD_s+0
	MOVF       FARG_WriteLCDLine4_s+1, 0
	MOVWF      FARG_WriteStringToLCD_s+1
	CALL       _WriteStringToLCD+0
;Lcd_4_bit.c,210 :: 		}
L_end_WriteLCDLine4:
	RETURN
; end of _WriteLCDLine4

_welcome_msg:

;Lcd_4_bit.c,213 :: 		void welcome_msg(){
;Lcd_4_bit.c,216 :: 		ClearLCDScreen();               // Clear display  +++++++++++++++++|||||
	CALL       _ClearLCDScreen+0
;Lcd_4_bit.c,217 :: 		WriteLCDLine1("* Hello  World *");
	MOVLW      ?lstr_1_Lcd_4_bit+0
	MOVWF      FARG_WriteLCDLine1_s+0
	MOVLW      hi_addr(?lstr_1_Lcd_4_bit+0)
	MOVWF      FARG_WriteLCDLine1_s+1
	CALL       _WriteLCDLine1+0
;Lcd_4_bit.c,218 :: 		WriteLCDLine2("**  MELAB-BD  **");
	MOVLW      ?lstr_2_Lcd_4_bit+0
	MOVWF      FARG_WriteLCDLine2_s+0
	MOVLW      hi_addr(?lstr_2_Lcd_4_bit+0)
	MOVWF      FARG_WriteLCDLine2_s+1
	CALL       _WriteLCDLine2+0
;Lcd_4_bit.c,221 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_welcome_msg13:
	DECFSZ     R13+0, 1
	GOTO       L_welcome_msg13
	DECFSZ     R12+0, 1
	GOTO       L_welcome_msg13
	DECFSZ     R11+0, 1
	GOTO       L_welcome_msg13
	NOP
	NOP
;Lcd_4_bit.c,224 :: 		}
L_end_welcome_msg:
	RETURN
; end of _welcome_msg
