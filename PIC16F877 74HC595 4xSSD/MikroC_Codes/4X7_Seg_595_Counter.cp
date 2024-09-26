#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/4X7_Seg_595_Counter/MikroC_Codes/4X7_Seg_595_Counter.c"

char DIGIT0,DIGIT1,DIGIT2,DIGIT3;
char DSP_code[10]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};


void seperate_digit(char dt_byte);
void display_4_digit();
#line 13 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/4X7_Seg_595_Counter/MikroC_Codes/4X7_Seg_595_Counter.c"
void main(){
 int i;
 TRISB = 0;
 TRISC = 0;
 PORTB = 0;
 TRISA = 0;
 PORTA = 0;
 TRISD = 0;
 PORTD = 0;

 DIGIT0 = 0b00000001;
 DIGIT1 = 0b00000010;
 DIGIT2 = 0xFB;
 DIGIT3 = 0xF7;

 while(1){
 for(i=0; i<20; i++){

 seperate_digit(i) ;
 display_4_digit();

 }
 }
 }
