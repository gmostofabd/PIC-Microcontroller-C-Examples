void main() {
    TRISB = 0;
    PORTB = 0;
    while(1){
         PORTB = 0B11000000; //for 0 CA [p g f e d c b a]
         Delay_ms(1000);

         PORTB = 0B11111001;  // for 1 CA
         Delay_ms(1000);

         PORTB = 0B10100100; // for 2 CA
         Delay_ms(1000);

         PORTB = 0B10110000;  // for 3 CA
         Delay_ms(1000);

         PORTB = 0B10011001;  // for 4 CA
         Delay_ms(1000);

         PORTB = 0B10010010;  // for 5 CA
         Delay_ms(1000);

         PORTB = 0B10000010;  // for 6 CA
         Delay_ms(1000);

         PORTB = 0B11111000;  // for 7 CA
         Delay_ms(1000);

         PORTB = 0B10000000;  // for 8 CA
         Delay_ms(1000);

         PORTB = 0B10010000;  // for 9 CA
         Delay_ms(1000);
       }
 }