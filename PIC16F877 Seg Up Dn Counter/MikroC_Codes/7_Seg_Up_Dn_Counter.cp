#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/7_Seg_Up_Dn_Counter/MikroC_Codes/7_Seg_Up_Dn_Counter.c"
#line 23 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/7_Seg_Up_Dn_Counter/MikroC_Codes/7_Seg_Up_Dn_Counter.c"
unsigned short cc_7_Seg[10] = {0B11000000, 0B11111001, 0B10100100, 0B10110000,
 0B10011001, 0B10010010, 0B10000010, 0B11111000,
 0B10000000, 0B10010000
 };


void main() {
 unsigned short i;
 TRISB = 0;
 TRISC = 3;
 PORTB = 0;

 while(1){
 if(PORTC.B0 == 0){Delay_ms(100); i ++; if (i >= 9) i = 9;}
 if(PORTC.B1 == 0){Delay_ms(100); i --; if (i == 9) i = 0;}
 PORTB = cc_7_Seg[i];
 Delay_ms(1000);
 }
 }
