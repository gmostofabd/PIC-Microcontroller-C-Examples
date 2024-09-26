#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/ADC_7_Sement_4_Digit/MikroC_Codes/ADC_4X7_Segment.c"



char DSP_code[10]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

unsigned short digit_no[4]={ 0b00000001,0b00000010,0b00000100,0b00001000};


unsigned short bcd_val[3];
unsigned int adc_result;
float temp_c;





 void AnalogInit(){ADCON1 = 0b10000000; ADCON0 = 0b11000001; }

int Read_Ana(){
 Delay_us(5);
 ADCON0.GO_DONE = 1;
 while(ADCON0.GO_DONE);
 return ((ADRESH<<8) + ADRESL);
 }

void seperate_digits(){
 bcd_val[3]= (int)(temp_c / 1000) % 10;
 bcd_val[2]= (int) (temp_c / 100) % 10;
 bcd_val[1]= (int)(temp_c / 10) % 10;
 bcd_val[0]= (int) temp_c % 10;
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
 PORTC.B7 = 1;
 Delay_ms(5);

 }
 }








void main(){

 TRISA = 1;
 ANSEL = 0x01;
 ANSELH = 0;




 TRISC = 0;
 PORTC = 0;
 PORTA = 0;
 TRISD = 0;
 PORTD = 0;




 AnalogInit();

 while(1){

 adc_result = Read_Ana();





 temp_c = (4.89 * adc_result)/10;

 seperate_digits();
 disp_4_digit();

 }
 }
