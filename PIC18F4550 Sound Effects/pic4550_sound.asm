
_Tone1:

;pic4550_sound.c,1 :: 		void Tone1() {
;pic4550_sound.c,2 :: 		Sound_Play(659, 250);   // Frekans = 659Hz, süre = 250ms
	MOVLW       147
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       2
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       250
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;pic4550_sound.c,3 :: 		}
L_end_Tone1:
	RETURN      0
; end of _Tone1

_Tone2:

;pic4550_sound.c,5 :: 		void Tone2() {
;pic4550_sound.c,6 :: 		Sound_Play(698, 250);   // Frekans = 698Hz, süre = 250ms
	MOVLW       186
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       2
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       250
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;pic4550_sound.c,7 :: 		}
L_end_Tone2:
	RETURN      0
; end of _Tone2

_Tone3:

;pic4550_sound.c,9 :: 		void Tone3() {
;pic4550_sound.c,10 :: 		Sound_Play(784, 250);   // Frekans = 784Hz, süre = 250ms
	MOVLW       16
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       3
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       250
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;pic4550_sound.c,11 :: 		}
L_end_Tone3:
	RETURN      0
; end of _Tone3

_Melody:

;pic4550_sound.c,13 :: 		void Melody() {           // "Yellow house" melodisi çalar
;pic4550_sound.c,14 :: 		Tone1(); Tone2(); Tone3(); Tone3();
	CALL        _Tone1+0, 0
	CALL        _Tone2+0, 0
	CALL        _Tone3+0, 0
	CALL        _Tone3+0, 0
;pic4550_sound.c,15 :: 		Tone1(); Tone2(); Tone3(); Tone3();
	CALL        _Tone1+0, 0
	CALL        _Tone2+0, 0
	CALL        _Tone3+0, 0
	CALL        _Tone3+0, 0
;pic4550_sound.c,16 :: 		Tone1(); Tone2(); Tone3();
	CALL        _Tone1+0, 0
	CALL        _Tone2+0, 0
	CALL        _Tone3+0, 0
;pic4550_sound.c,17 :: 		Tone1(); Tone2(); Tone3(); Tone3();
	CALL        _Tone1+0, 0
	CALL        _Tone2+0, 0
	CALL        _Tone3+0, 0
	CALL        _Tone3+0, 0
;pic4550_sound.c,18 :: 		Tone1(); Tone2(); Tone3();
	CALL        _Tone1+0, 0
	CALL        _Tone2+0, 0
	CALL        _Tone3+0, 0
;pic4550_sound.c,19 :: 		Tone3(); Tone3(); Tone2(); Tone2(); Tone1();
	CALL        _Tone3+0, 0
	CALL        _Tone3+0, 0
	CALL        _Tone2+0, 0
	CALL        _Tone2+0, 0
	CALL        _Tone1+0, 0
;pic4550_sound.c,20 :: 		}
L_end_Melody:
	RETURN      0
; end of _Melody

_ToneA:

;pic4550_sound.c,22 :: 		void ToneA() {
;pic4550_sound.c,23 :: 		Sound_Play( 880, 50);
	MOVLW       112
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       3
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       50
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;pic4550_sound.c,24 :: 		}
L_end_ToneA:
	RETURN      0
; end of _ToneA

_ToneC:

;pic4550_sound.c,25 :: 		void ToneC() {
;pic4550_sound.c,26 :: 		Sound_Play(1046, 50);
	MOVLW       22
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       4
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       50
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;pic4550_sound.c,27 :: 		}
L_end_ToneC:
	RETURN      0
; end of _ToneC

_ToneE:

;pic4550_sound.c,28 :: 		void ToneE() {
;pic4550_sound.c,29 :: 		Sound_Play(1318, 50);
	MOVLW       38
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       5
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       50
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;pic4550_sound.c,30 :: 		}
L_end_ToneE:
	RETURN      0
; end of _ToneE

_Melody2:

;pic4550_sound.c,32 :: 		void Melody2() {
;pic4550_sound.c,34 :: 		for (i = 9; i > 0; i--) {
	MOVLW       9
	MOVWF       Melody2_i_L0+0 
L_Melody20:
	MOVF        Melody2_i_L0+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Melody21
;pic4550_sound.c,35 :: 		ToneA(); ToneC(); ToneE();
	CALL        _ToneA+0, 0
	CALL        _ToneC+0, 0
	CALL        _ToneE+0, 0
;pic4550_sound.c,34 :: 		for (i = 9; i > 0; i--) {
	DECF        Melody2_i_L0+0, 1 
;pic4550_sound.c,36 :: 		}
	GOTO        L_Melody20
L_Melody21:
;pic4550_sound.c,37 :: 		}
L_end_Melody2:
	RETURN      0
; end of _Melody2

_main:

;pic4550_sound.c,39 :: 		void main() {
;pic4550_sound.c,41 :: 		TRISD  = 0xF8;                     // RD7..RD3 pinleri giriþ olarak ayarlandý
	MOVLW       248
	MOVWF       TRISD+0 
;pic4550_sound.c,43 :: 		Sound_Init(&PORTB, 7);
	MOVLW       PORTB+0
	MOVWF       FARG_Sound_Init_snd_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Sound_Init_snd_port+1 
	MOVLW       7
	MOVWF       FARG_Sound_Init_snd_pin+0 
	CALL        _Sound_Init+0, 0
;pic4550_sound.c,44 :: 		Sound_Play(880, 1000);             // 1 saniye 880 Hz ses
	MOVLW       112
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       3
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       232
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       3
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;pic4550_sound.c,46 :: 		while (1) {
L_main3:
;pic4550_sound.c,47 :: 		if (Button(&PORTD,7,1,1))        // RD7 Tone1
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       7
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;pic4550_sound.c,48 :: 		Tone1();
	CALL        _Tone1+0, 0
L_main5:
;pic4550_sound.c,49 :: 		while (RD7_bit) ;                // butonun serbest býrakýlmasý beklenir
L_main6:
	BTFSS       RD7_bit+0, BitPos(RD7_bit+0) 
	GOTO        L_main7
	GOTO        L_main6
L_main7:
;pic4550_sound.c,51 :: 		if (Button(&PORTD,6,1,1))        // RD6 Tone2
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       6
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;pic4550_sound.c,52 :: 		Tone2();
	CALL        _Tone2+0, 0
L_main8:
;pic4550_sound.c,53 :: 		while (RD6_bit) ;                // butonun serbest býrakýlmasý beklenir
L_main9:
	BTFSS       RD6_bit+0, BitPos(RD6_bit+0) 
	GOTO        L_main10
	GOTO        L_main9
L_main10:
;pic4550_sound.c,55 :: 		if (Button(&PORTD,5,1,1))        // RD5 Tone3
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
;pic4550_sound.c,56 :: 		Tone3();
	CALL        _Tone3+0, 0
L_main11:
;pic4550_sound.c,57 :: 		while (RD5_bit) ;                // butonun serbest býrakýlmasý beklenir
L_main12:
	BTFSS       RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L_main13
	GOTO        L_main12
L_main13:
;pic4550_sound.c,59 :: 		if (Button(&PORTD,4,1,1))        // RD4 Melody2
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       4
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
;pic4550_sound.c,60 :: 		Melody2();
	CALL        _Melody2+0, 0
L_main14:
;pic4550_sound.c,61 :: 		while (RD4_bit) ;                // butonun serbest býrakýlmasý beklenir
L_main15:
	BTFSS       RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L_main16
	GOTO        L_main15
L_main16:
;pic4550_sound.c,63 :: 		if (Button(&PORTD,3,1,1))        // RD3 Melody
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main17
;pic4550_sound.c,64 :: 		Melody();
	CALL        _Melody+0, 0
L_main17:
;pic4550_sound.c,65 :: 		while (RD3_bit) ;                // butonun serbest býrakýlmasý beklenir
L_main18:
	BTFSS       RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_main19
	GOTO        L_main18
L_main19:
;pic4550_sound.c,66 :: 		}
	GOTO        L_main3
;pic4550_sound.c,67 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
