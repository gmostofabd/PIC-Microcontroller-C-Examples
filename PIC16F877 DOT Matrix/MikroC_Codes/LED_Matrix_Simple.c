
//int front_array[8] = {0x3F,0x48,0x48,0x48,0x3F,0X00,0X00,0X00}; // Data for A
//int front_array[8] = {0b00111111,0b01001000,0b01001000,0b01001000,0b00111111,0b00000000,0b00000000,0b00000000}; // Data for A
int front_array[8] = {0b00111111,
                      0b01001000,
                      0b01001000,
                      0b01001000,
                      0b00111111,
                      0b00000000,
                      0b00000000,
                      0b00000000}; // Data for A
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