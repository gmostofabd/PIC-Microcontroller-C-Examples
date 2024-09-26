#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/4X7_Segment_Up_Dn_Counter/MikroC_Codes/Tested_P877_4X7_Counter.c"



char DIGIT0,DIGIT1,DIGIT2,DIGIT3;
char DSP_code[10]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};






void main(){
int i;

TRISB = 0;
PORTB = 0;
TRISA = 0;
PORTA = 0;
TRISD = 0;
PORTD = 0;

DIGIT0 = 0xFE;
DIGIT1 = 0xFD;
DIGIT2 = 0xFB;
DIGIT3 = 0xF7;




while(1){
for(i=0; i<9999; i++){

PORTD = DIGIT0;
PORTB = DSP_code[i%10u];
delay_ms(10);

PORTD = DIGIT1;
PORTB = DSP_code[(i/10)%10u];
delay_ms(10);

PORTD = DIGIT2;
PORTB = DSP_code[(i/100)%10u];
delay_ms(10);

PORTD = DIGIT3;

PORTB = DSP_code[(i/1000)%10u];
delay_ms(10);
PORTB = 0;

delay_ms(10);
}
}
}
