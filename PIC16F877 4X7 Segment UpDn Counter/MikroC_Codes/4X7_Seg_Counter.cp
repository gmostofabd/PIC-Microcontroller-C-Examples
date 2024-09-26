#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/4X7_Segment_Up_Dn_Counter/MikroC_Codes/4X7_Seg_Counter.c"


char DSP_code[10]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

unsigned short digit_no[4]={ 0b00000001,0b00000010,0b00000100,0b00001000};

unsigned short bcd_val[3];



void seperate_digits(unsigned int _4_digit){
 bcd_val[3]= (int)(_4_digit / 1000) % 10;
 bcd_val[2]= (int) (_4_digit / 100) % 10;
 bcd_val[1]= (int)(_4_digit / 10) % 10;
 bcd_val[0]= (int) _4_digit % 10;
 }




void disp_4_digit(){
 char i;

 for(i = 0; i<5; i ++){

 PORTD = digit_no[0];
 PORTC = DSP_code[bcd_val[0]];
 Delay_ms(5);

 PORTD = digit_no[1];
 PORTC = DSP_code[bcd_val[1]];
 Delay_ms(5);

 PORTD = digit_no[2];
 PORTC = DSP_code[bcd_val[2]];
 Delay_ms(5);

 PORTD = digit_no[3];
 PORTC = DSP_code[bcd_val[3]];
 Delay_ms(5);
 }
 }






void main(){
 unsigned int i;
 ANSEL = 0;
 ANSELH = 0;
 TRISC = 0;
 PORTC = 0;
 TRISD = 0;
 PORTD = 0;
 TRISB = 0x03;
 PORTB = 0;
 i = 0;

 while(1){









 seperate_digits(i);
 disp_4_digit();

 }
 }
