#define LENGTH 56

unsigned short str_data[] = {                // 5x7 dot matrix string
        0x00, 0x00, 0x82, 0xfe, 0x82, 0x00,  // I
        0x00, 0x8c, 0x92, 0x92, 0x92, 0x62,  // S
        0x00, 0xfe, 0x80, 0x80, 0x80, 0x80,  // L
        0x00, 0xfc, 0x12, 0x12, 0x12, 0xfc,  // A
        0x00, 0xfe, 0x04, 0x08, 0x04, 0xfe,  // M
        0x00, 0x00, 0x82, 0xfe, 0x82, 0x00,  // I
        0x00, 0x7c, 0x82, 0x82, 0x82, 0x82,  // C
        0x00,                                // space
};                                           // length: 178



unsigned short dat[8];

int i, j, k, x, col;

void main() {
     TRISB = 0;
     TRISC = 0;
     PORTB = 0;
     PORTC = 0;
     while(1){
     for(i=0; i<LENGTH; i++){
      for(x=i, j=0; x<i+8; x++, j++){
       dat[j] = str_data[x%LENGTH];
      }
      for(k=0; k<10; k++){
       col = 0B00000001;
       for(j=0; j<8; j++){
        PORTC = ~col;
        PORTB = dat[j];
        col <<= 1;
        delay_ms(2);
       }
      }
     }
     }
}