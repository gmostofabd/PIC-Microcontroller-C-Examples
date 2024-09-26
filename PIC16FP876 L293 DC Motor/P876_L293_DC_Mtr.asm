
_main:

;P876_L293_DC_Mtr.c,1 :: 		void main()
;P876_L293_DC_Mtr.c,3 :: 		short duty  = 0; //initial value for duty
	CLRF       main_duty_L0+0
;P876_L293_DC_Mtr.c,6 :: 		TRISC = 0xc0; //PORTC as output
	MOVLW      192
	MOVWF      TRISC+0
;P876_L293_DC_Mtr.c,7 :: 		TRISB = 0x00; //PORTB as output
	CLRF       TRISB+0
;P876_L293_DC_Mtr.c,8 :: 		PORTB = 0x02; //Run motor in anticlock wise
	MOVLW      2
	MOVWF      PORTB+0
;P876_L293_DC_Mtr.c,10 :: 		PWM1_Init(1000);  //Initialize PWM1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;P876_L293_DC_Mtr.c,11 :: 		PWM1_Start();  //start PWM1
	CALL       _PWM1_Start+0
;P876_L293_DC_Mtr.c,12 :: 		PWM1_Set_Duty(duty); //Set current duty for PWM1
	MOVF       main_duty_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;P876_L293_DC_Mtr.c,14 :: 		while (1)        // endless loop
L_main0:
;P876_L293_DC_Mtr.c,16 :: 		if (!RC6_bit && duty<250) //if button on RD0 pressed
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_main4
	MOVLW      128
	BTFSC      main_duty_L0+0, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      250
	SUBWF      main_duty_L0+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main12:
;P876_L293_DC_Mtr.c,18 :: 		Delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;P876_L293_DC_Mtr.c,19 :: 		duty = duty + 10;  //increment current_duty
	MOVLW      10
	ADDWF      main_duty_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_duty_L0+0
;P876_L293_DC_Mtr.c,20 :: 		PWM1_Set_Duty(duty);  //Change the duty cycle
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;P876_L293_DC_Mtr.c,21 :: 		}
L_main4:
;P876_L293_DC_Mtr.c,22 :: 		if (!RC7_bit && duty >0) //button on RD1 pressed
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_main8
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_duty_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
L__main11:
;P876_L293_DC_Mtr.c,24 :: 		Delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
;P876_L293_DC_Mtr.c,25 :: 		duty = duty - 10;  //decrement duty
	MOVLW      10
	SUBWF      main_duty_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_duty_L0+0
;P876_L293_DC_Mtr.c,26 :: 		PWM1_Set_Duty(duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;P876_L293_DC_Mtr.c,27 :: 		}
L_main8:
;P876_L293_DC_Mtr.c,28 :: 		Delay_ms(10);      // slow down change pace a little
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
;P876_L293_DC_Mtr.c,29 :: 		}
	GOTO       L_main0
;P876_L293_DC_Mtr.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
