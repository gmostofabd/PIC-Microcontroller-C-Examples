#define LENGTH 8


unsigned short dat[10][8]={
 { 0x00, 0x00, 0x00, 0xFC, 0x12, 0x12, 0x12, 0xFC}, //A
 { 0x00, 0x00, 0x00, 0xFE, 0x92, 0x92, 0x92, 0x6C}, //B
 { 0x00, 0x00, 0x00, 0x7C, 0x82, 0x82, 0x82, 0x82}, //C
 { 0x00, 0x00, 0x00, 0xFE, 0x82, 0x82, 0x82, 0x7C}, //D
 { 0x00, 0x00, 0x00, 0x7C, 0x92, 0x92, 0x92, 0x92}, //E
 { 0x00, 0x00, 0x00, 0xFC, 0x12, 0x12, 0x12, 0x02}, //F
 { 0x00, 0x00, 0x00, 0x7C, 0x82, 0x92, 0x92, 0x72}, //G
 { 0x00, 0x00, 0x00, 0xFE, 0x10, 0x10, 0x10, 0xFE}, //H
 { 0x00, 0x00, 0x00, 0x00, 0x82, 0xFE, 0x82, 0x00}, //I
 { 0x00, 0x00, 0x00, 0x42, 0x82, 0x82, 0x7E, 0x02}, //J
// { 0x00, 0x00, 0x00, 0xFE, 0x10, 0x28, 0x44, 0x82}, //K
// { 0x00, 0x00, 0x00, 0x7E, 0x80, 0x80, 0x80, 0x80}, //L
// { 0x00, 0x00, 0x00, 0xFE, 0x04, 0x08, 0x04, 0xFE}, //M
// { 0x00, 0x00, 0x00, 0xFE, 0x04, 0x08, 0x10, 0xFE}, //N
// { 0x00, 0x00, 0x00, 0x7C, 0x82, 0x82, 0x82, 0x7C}, //O
// { 0x00, 0x00, 0x00, 0xFE, 0x12, 0x12, 0x12, 0x0C}, //P
// { 0x00, 0x00, 0x00, 0x7C, 0x82, 0xA2, 0xC2, 0xFC}, //Q
// { 0x00, 0x00, 0x00, 0xFE, 0x12, 0x32, 0x52, 0x8C}, //R
// { 0x00, 0x00, 0x00, 0x8C, 0x92, 0x92, 0x92, 0x62}, //S
// { 0x00, 0x00, 0x00, 0x02, 0x02, 0xFE, 0x02, 0x02}, //T
// { 0x00, 0x00, 0x00, 0x7E, 0x80, 0x80, 0x80, 0x7E}, //U
// { 0x00, 0x00, 0x00, 0x3E, 0x40, 0x80, 0x40, 0x3E}, //V
// { 0x00, 0x00, 0x00, 0x7E, 0x80, 0x70, 0x80, 0x7E}, //W
// { 0x00, 0x00, 0x00, 0x82, 0x44, 0x38, 0x44, 0x82}, //X
// { 0x00, 0x00, 0x00, 0x02, 0x04, 0xF8, 0x04, 0x02}, //Y
// { 0x00, 0x00, 0x00, 0xC2, 0xA2, 0x92, 0x8A, 0x86}  //Z
};

short i, j, k, x, col;

void main() {
     //int scroll = 0;
     TRISB = 0;
     TRISC = 0;
     PORTB = 0;
     PORTC = 0;

     while(1){
         for(i=0; i<10; i++){            // outer loop selection char from array
             for(k=0; k<20; k++){        // middle loop to repeat same display
                 col = 0B00000001;       // Defining start position on matrix
                 for(j=0; j<8; j++){     // 8 byte character row
                    PORTC =~ col;        // colum activation
                    PORTB = dat[i][j];   // PortB reciving row data
                    col <<= 1;           // shifting from last column
                    delay_ms(5);         //
                  }
              }
          }
      }


/*
     while(scroll){
     for(i=0; i<LENGTH; i++){
      for(x=i, j=0; x<i+8; x++, j++){
       //dat[j] = dat[x%LENGTH];
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
*/

 }