

#include <xc.h>
#include "KeyPad44.h"

#define KEY_PORT    PORTB
#define KEY_DIR     TRISB

#define row0        RB4
#define row1        RB5
#define row2        RB6
#define row3        RB7

unsigned char keypad[4][4]={{0x07,0x7F,0x6F,0x71},
                            {0x66,0x6D,0x7D,0x79},
                            {0x06,0x5B,0x4F,0x5E},
                            {0x77,0x3F,0x7C,0x39}};

unsigned char	output[4]={0xFE,0xFD,0xFB,0xF7};
unsigned row,col,key_value;
bit    found=0;

void keyInit(){
    TRISB=0xF0;
    PORTB=0xFF;
    OPTION_REGbits.nRBPU=0;
}
unsigned char getKey(){
    unsigned char i,j;
	for (i=0;i<4;i++){
            KEY_PORT=output[i];
            if((KEY_PORT&0xF0)!=0xF0)  
            {   col=i;
                found=1;
                break;
            }
        }

        if(row0==0) row=0;
        else if (row1==0)   row=1;
        else if (row2==0)   row=2;
        else if (row3==0)    row=3;

        if(found==1)
	return key_value=keypad[row][col];        
}

