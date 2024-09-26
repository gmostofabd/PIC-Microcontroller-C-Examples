#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/LED_BLINK/MikroC_Codes/Led_Blink.c"
#line 14 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/LED_BLINK/MikroC_Codes/Led_Blink.c"
void main() {
 TRISB = 0b00000000;
 PORTB = 0x00;
 TRISD = 0b00000000;
 while(1){

 PORTB = 0b00000001;
 Delay_ms (1000);
 PORTB = 0b00000000;
 Delay_ms (1000);

 PORTD = 0b00100000;
 Delay_ms (1000);
 PORTD = 0b00000000;
 Delay_ms (1000);

 }
 }
