#line 1 "C:/Users/Satellite/Desktop/Melab_KeyPad_Matrix/P877_Keypad_Matrix_Code/K_pad4x4.c"
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
#line 8 "C:/Users/Satellite/Desktop/Melab_KeyPad_Matrix/P877_Keypad_Matrix_Code/K_pad4x4.c"
void InitKeypad(void)
 {
  PORTB  = 0x00;
  TRISB  = 0xF0;
 OPTION_REG &= 0x7F;
 }






char READ_SWITCHES(void)
{
 RowA = 0; RowB = 1; RowC = 1; RowD = 1;

 if (C1 == 0) { Delay_ms(250); while (C1==0); return '1'; }
 if (C2 == 0) { Delay_ms(250); while (C2==0); return '4'; }
 if (C3 == 0) { Delay_ms(250); while (C3==0); return '7'; }
 if (C4 == 0) { Delay_ms(250); while (C4==0); return 'C'; }

 RowA = 1; RowB = 0; RowC = 1; RowD = 1;

 if (C1 == 0) { Delay_ms(250); while (C1==0); return '2'; }
 if (C2 == 0) { Delay_ms(250); while (C2==0); return '5'; }
 if (C3 == 0) { Delay_ms(250); while (C3==0); return '8'; }
 if (C4 == 0) { Delay_ms(250); while (C4==0); return '0'; }

 RowA = 1; RowB = 1; RowC = 0; RowD = 1;

 if (C1 == 0) { Delay_ms(250); while (C1==0); return '3'; }
 if (C2 == 0) { Delay_ms(250); while (C2==0); return '6'; }
 if (C3 == 0) { Delay_ms(250); while (C3==0); return '9'; }
 if (C4 == 0) { Delay_ms(250); while (C4==0); return '='; }

 RowA = 1; RowB = 1; RowC = 1; RowD = 0;

 if (C1 == 0) { Delay_ms(250); while (C1==0); return '-'; }
 if (C2 == 0) { Delay_ms(250); while (C2==0); return 'X'; }
 if (C3 == 0) { Delay_ms(250); while (C3==0); return '/'; }
 if (C4 == 0) { Delay_ms(250); while (C4==0); return '+'; }

 return 'n';
 }






char GetKey(){
 char key = 'n';
 while(key=='n')
 key = READ_SWITCHES();
 return key;
 }
