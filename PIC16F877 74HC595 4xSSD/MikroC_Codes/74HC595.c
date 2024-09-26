/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
#define DT PORTC.B0   // data
#define SH PORTC.B1   // shift clock
#define ST PORTC.B2   // latch clock
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
char digit_1th,digit_10th, digit_100th, digit_1000th;
extern char DSP_code[];
extern char DIGIT0,DIGIT1,DIGIT2,DIGIT3;
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
void seperate_digit(char dt_byte){
   char i;
   i = dt_byte;
   digit_1th =  DSP_code[i%10u];
//   digit_10th =  DSP_code[(i/10)%10u];
 //  digit_100th =  DSP_code[(i/100)%10u];
 //  digit_1000th =  DSP_code[(i/1000)%10u];
  }
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
void display_8bit(char data_byte) {
               char i;

                for(i = 0; i < 8; i ++){
                        if(data_byte.B7){DT = 1;} else {DT = 0;}
                        SH = 1;
                        data_byte <<= 1;
                        SH = 0;
                 }
//*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
               ST = 1; //same as RC0=1; write the new bits to the register.
               Delay_ms(3);
               ST = 0; //same as RC1=0; enable write to shift register
  }
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
void display_4_digit(){

//=============Convert and Display the ones digit====================///////////
    PORTD = DIGIT0;  // RA.0 to RA3 Output
    display_8bit(digit_1th);
    delay_ms(500);
//=============Convert and Display the ones digit====================///////////
    PORTD = DIGIT1;  // RA.0 to RA3 Output
    display_8bit(digit_10th);
    delay_ms(500);
//=============Convert and Display the ones digit====================///////////
 //   PORTD = DIGIT2;  // RA.0 to RA3 Output
 //   display_8bit(digit_100th);
 //   delay_ms(500);
//=============Convert and Display the ones digit====================///////////
 //   PORTD = DIGIT3;  // RA.0 to RA3 Output
  //  display_8bit(digit_1000th);
  //  delay_ms(500);
//=============Convert and Display the tens digit====================///////////


  }
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/