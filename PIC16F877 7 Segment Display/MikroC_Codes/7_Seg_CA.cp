#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/7_Seg_Simple/MikroC_Codes/7_Seg_CA.c"
#line 15 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/7_Seg_Simple/MikroC_Codes/7_Seg_CA.c"
unsigned short cc_7_Seg[10] = {0B01000000, 0B01111001, 0B00100100, 0B00110000,
 0B00011001, 0B00010010, 0B00000010, 0B01111000,
 0B00000000, 0B00010000
 };

void main() {
 unsigned short i;

 TRISB = 0;
 PORTB = 0;

 while(1){

 for(i = 0; i<10; i++){
 PORTB = cc_7_Seg[i];
 Delay_ms(1000);
 }
 }
 }
