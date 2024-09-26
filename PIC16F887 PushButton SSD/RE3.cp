#line 1 "D:/MikroC_Protues/PIC16F887_USING_RE3/RE3.c"
#line 8 "D:/MikroC_Protues/PIC16F887_USING_RE3/RE3.c"
void main() {
 char LED[10] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

 char i=0;


 PORTD=0x00;
 TRISD=0x00;
 PORTE=0x00;
 TRISE.TRISE3=1;


 OSCCON.IRCF0=1;
 OSCCON.IRCF1=1;
 OSCCON.IRCF2=1;

 while(1) {
 if( PORTE.RE3 ==0) {
 while( PORTE.RE3 ==0);
 i++;
 if(i==10) i=0;
 }
 PORTD=LED[i];
 }
}
