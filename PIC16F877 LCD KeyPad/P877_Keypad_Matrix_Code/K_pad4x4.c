
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
#include "keypad.h"

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
// Function name: InitKeypad
void InitKeypad(void)
 {
    Keypad_PORT = 0x00;        // Set Keypad port pin values zero
    Keypad_PORT_Dir = 0xF0;        // Last 4 pins input, except first, remaining 3 pins output
    OPTION_REG &= 0x7F;
 }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
// Function name: READ_SWITCHES
// Scan all the keypad keys to detect any pressed key.
char READ_SWITCHES(void)
{
        RowA = 0; RowB = 1; RowC = 1; RowD = 1;         //Test Row A

        if (C1 == 0) { Delay_ms(250); while (C1==0); return '1'; }
        if (C2 == 0) { Delay_ms(250); while (C2==0); return '4'; }
        if (C3 == 0) { Delay_ms(250); while (C3==0); return '7'; }
        if (C4 == 0) { Delay_ms(250); while (C4==0); return 'C'; }

        RowA = 1; RowB = 0; RowC = 1; RowD = 1;         //Test Row B

        if (C1 == 0) { Delay_ms(250); while (C1==0); return '2'; }
        if (C2 == 0) { Delay_ms(250); while (C2==0); return '5'; }
        if (C3 == 0) { Delay_ms(250); while (C3==0); return '8'; }
        if (C4 == 0) { Delay_ms(250); while (C4==0); return '0'; }

        RowA = 1; RowB = 1; RowC = 0; RowD = 1;         //Test Row C

        if (C1 == 0) { Delay_ms(250); while (C1==0); return '3'; }
        if (C2 == 0) { Delay_ms(250); while (C2==0); return '6'; }
        if (C3 == 0) { Delay_ms(250); while (C3==0); return '9'; }
        if (C4 == 0) { Delay_ms(250); while (C4==0); return '='; }

        RowA = 1; RowB = 1; RowC = 1; RowD = 0;         //Test Row D

        if (C1 == 0) { Delay_ms(250); while (C1==0); return '-'; }
        if (C2 == 0) { Delay_ms(250); while (C2==0); return 'X'; }
        if (C3 == 0) { Delay_ms(250); while (C3==0); return '/'; }
        if (C4 == 0) { Delay_ms(250); while (C4==0); return '+'; }
//        PORTB = 0b11110000;
        return 'n';                   // Means no key has been pressed
 }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
// Function name: GetKey
// Read pressed key value from keypad and return its value
char GetKey(){
        char key = 'n';              // Assume no key pressed
        while(key=='n')              // Wait until a key is pressed
              key = READ_SWITCHES();   // Scan the keys again and again
        return key;                  //when key pressed then return its value
 }
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/



