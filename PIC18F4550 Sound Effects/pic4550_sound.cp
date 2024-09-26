#line 1 "F:/C Codes 2013/TESTED_4550_PACK/ses/pic4550_sound.c"
void Tone1() {
 Sound_Play(659, 250);
}

void Tone2() {
 Sound_Play(698, 250);
}

void Tone3() {
 Sound_Play(784, 250);
}

void Melody() {
 Tone1(); Tone2(); Tone3(); Tone3();
 Tone1(); Tone2(); Tone3(); Tone3();
 Tone1(); Tone2(); Tone3();
 Tone1(); Tone2(); Tone3(); Tone3();
 Tone1(); Tone2(); Tone3();
 Tone3(); Tone3(); Tone2(); Tone2(); Tone1();
}

void ToneA() {
 Sound_Play( 880, 50);
}
void ToneC() {
 Sound_Play(1046, 50);
}
void ToneE() {
 Sound_Play(1318, 50);
}

void Melody2() {
 unsigned short i;
 for (i = 9; i > 0; i--) {
 ToneA(); ToneC(); ToneE();
 }
}

void main() {

 TRISD = 0xF8;

 Sound_Init(&PORTB, 7);
 Sound_Play(880, 1000);

 while (1) {
 if (Button(&PORTD,7,1,1))
 Tone1();
 while (RD7_bit) ;

 if (Button(&PORTD,6,1,1))
 Tone2();
 while (RD6_bit) ;

 if (Button(&PORTD,5,1,1))
 Tone3();
 while (RD5_bit) ;

 if (Button(&PORTD,4,1,1))
 Melody2();
 while (RD4_bit) ;

 if (Button(&PORTD,3,1,1))
 Melody();
 while (RD3_bit) ;
 }
}
