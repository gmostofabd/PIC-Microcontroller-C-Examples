void Tone1() {
  Sound_Play(659, 250);   // Frekans = 659Hz, süre = 250ms
}

void Tone2() {
  Sound_Play(698, 250);   // Frekans = 698Hz, süre = 250ms
}

void Tone3() {
  Sound_Play(784, 250);   // Frekans = 784Hz, süre = 250ms
}

void Melody() {           // "Yellow house" melodisi çalar
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

  TRISD  = 0xF8;                     // RD7..RD3 pinleri giriþ olarak ayarlandý

  Sound_Init(&PORTB, 7);
  Sound_Play(880, 1000);             // 1 saniye 880 Hz ses

  while (1) {
    if (Button(&PORTD,7,1,1))        // RD7 Tone1
      Tone1();
    while (RD7_bit) ;                // butonun serbest býrakýlmasý beklenir

    if (Button(&PORTD,6,1,1))        // RD6 Tone2
      Tone2();
    while (RD6_bit) ;                // butonun serbest býrakýlmasý beklenir

    if (Button(&PORTD,5,1,1))        // RD5 Tone3
      Tone3();
    while (RD5_bit) ;                // butonun serbest býrakýlmasý beklenir

    if (Button(&PORTD,4,1,1))        // RD4 Melody2
      Melody2();
    while (RD4_bit) ;                // butonun serbest býrakýlmasý beklenir

    if (Button(&PORTD,3,1,1))        // RD3 Melody
      Melody();
    while (RD3_bit) ;                // butonun serbest býrakýlmasý beklenir
  }
}