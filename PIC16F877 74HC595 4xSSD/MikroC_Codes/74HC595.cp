#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/4X7_Seg_595_Counter/MikroC_Codes/74HC595.c"







char digit_1th,digit_10th, digit_100th, digit_1000th;
extern char DSP_code[];
extern char DIGIT0,DIGIT1,DIGIT2,DIGIT3;





void seperate_digit(char dt_byte){
 char i;
 i = dt_byte;
 digit_1th = DSP_code[i%10u];



 }





void display_8bit(char data_byte) {
 char i;

 for(i = 0; i < 8; i ++){
 if(data_byte.B7){ PORTC.B0  = 1;} else { PORTC.B0  = 0;}
  PORTC.B1  = 1;
 data_byte <<= 1;
  PORTC.B1  = 0;
 }

  PORTC.B2  = 1;
 Delay_ms(3);
  PORTC.B2  = 0;
 }





void display_4_digit(){


 PORTD = DIGIT0;
 display_8bit(digit_1th);
 delay_ms(500);

 PORTD = DIGIT1;
 display_8bit(digit_10th);
 delay_ms(500);
#line 69 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/4X7_Seg_595_Counter/MikroC_Codes/74HC595.c"
 }
