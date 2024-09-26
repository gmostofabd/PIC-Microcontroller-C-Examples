#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/LED_PATTERNS/MikroC_Codes/Led_Patterns.c"
#line 14 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/LED_PATTERNS/MikroC_Codes/Led_Patterns.c"
void main() {
 int i;
 TRISB = 0X00 ;

 while(1){
 PORTB = 0b00000001;
 Delay_ms (1000);
 i = 7;
 while(i > 0){
 PORTB = PORTB << 1;
 Delay_ms (1000);
 i --;
 }
 }
 }
