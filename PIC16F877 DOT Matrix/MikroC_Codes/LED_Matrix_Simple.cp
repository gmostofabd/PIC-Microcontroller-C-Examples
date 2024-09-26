#line 1 "C:/Users/Satellite/Desktop/Melab_Trainer_Board_17/Melab_Training_Simulations/Led_Matrix_Simple/MikroC_Codes/LED_Matrix_Simple.c"



int front_array[8] = {0b00111111,
 0b01001000,
 0b01001000,
 0b01001000,
 0b00111111,
 0b00000000,
 0b00000000,
 0b00000000};
unsigned short column[8] = {0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80};

void main(){
 int i;
 TRISB = 0X00;
 TRISC = 0X00;
 while(1){
 for(i = 0; i < 8; i ++){
 PORTC = 0X00;
 Delay_ms(2);
 PORTB =~ front_array[i];
 PORTC = column[i];
 Delay_ms(5);

 }
 }
 }
