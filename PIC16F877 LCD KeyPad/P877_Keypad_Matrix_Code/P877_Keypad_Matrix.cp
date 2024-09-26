#line 1 "C:/Users/Satellite/Desktop/Melab_KeyPad_Matrix/P877_Keypad_Matrix_Code/P877_Keypad_Matrix.c"
#line 1 "c:/users/satellite/desktop/melab_keypad_matrix/p877_keypad_matrix_code/lcd_hd44780.h"
#line 27 "c:/users/satellite/desktop/melab_keypad_matrix/p877_keypad_matrix_code/lcd_hd44780.h"
void WriteCommandToLCD(unsigned char);
void WriteDataToLCD(char);
void InitLCD(void);
void WriteStringToLCD(const char*);
void ClearLCDScreen(void);
void GotoYXPositionOnLCD(unsigned char,unsigned char);
void WriteLCDLine1(const char*);
void WriteLCDLine2(const char*);
void WriteLCDLine3(const char*);
void WriteLCDLine4(const char*);
void ToggleEpinOfLCD(void);
#line 1 "c:/users/satellite/desktop/melab_keypad_matrix/p877_keypad_matrix_code/keypad.h"




sbit RowA at RB0_bit;
sbit RowB at RB1_bit;
sbit RowC at RB2_bit;
sbit RowD at RB3_bit;

sbit C1 at RB4_bit;
sbit C2 at RB5_bit;
sbit C3 at RB6_bit;
sbit C4 at RB7_bit;






void InitKeypad(void);
char GetKey();
char READ_SWITCHES(void);
char GetKey_With_Timeout(void);
#line 8 "C:/Users/Satellite/Desktop/Melab_KeyPad_Matrix/P877_Keypad_Matrix_Code/P877_Keypad_Matrix.c"
char key_val;

void welcome_msg(void);



void init_main(){
 TRISB = 0xF0; TRISC = 0x00; TRISE = 0x00; TRISA = 0x01; TRISD = 0x00;
 PORTA = 0; PORTB = 0; PORTC = 0; PORTB = 0b11110000;
 }




void interrupt(){


 if(INTCON.RBIF){
 key_val = GetKey();
 PORTB = 0b11110000;
 INTCON.RBIF = 0;
 }
 }







void main(){

 init_main();
 InitLCD();

 welcome_msg();
 ClearLCDScreen();
 WriteLCDLine1("Key =");

 INTCON = 0b10001000;
 InitKeypad();

 while(1){
 GotoYXPositionOnLCD(0, 10);
 WriteDataToLCD(key_val);
 }

 }
