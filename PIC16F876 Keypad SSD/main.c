

#include <xc.h>
#include "config.h"
#include "KeyPad44.h"

#define _XTAL_FREQ 20e6

int main(void){

    PORTC=0x00;
    TRISC=0x00;
    keyInit();
    
    while(1){
        PORTC=getKey();
        __delay_ms(2);
    }
}
