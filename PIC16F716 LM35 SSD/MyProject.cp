#line 1 "E:/PIC MCU Programming and Projecs/MiKroC/16F716_LM35_SSD/MyProject.c"
#line 12 "E:/PIC MCU Programming and Projecs/MiKroC/16F716_LM35_SSD/MyProject.c"
unsigned short cnt=0;
unsigned temperature=0;
unsigned D1=0,D0=0;
bit read;
unsigned char SSD_MAP[10]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90} ;

unsigned short get_lm35(){
 ADCON0.GO_DONE=1;
 while(ADCON0.GO_DONE);
 return ADRES;
}

void SSD() {

 temperature=100*(ADRES)*2.5/256;
 D1=temperature/10;
 D0=temperature%10;
 PORTB=SSD_MAP[D1];
 PORTA=0x02;
 delay_ms(10);
 PORTA=0x00;

 PORTB=SSD_MAP[D0];
 PORTA=0x04;
 delay_ms(10);
 PORTA=0x00;

 PORTB=0x9C;
 PORTA=0x10;
 delay_ms(5);
 PORTA=0x00;

 PORTB=0xC6;
 PORTB|=0x80;
 delay_ms(5);
 PORTB&=0x7F;
}

void interrupt(){
 if(INTCON.T0IF) {
 cnt++;
 if(cnt==50)
 { cnt=0;
 get_lm35();
 }
 }
 INTCON.T0IF=0;
}


void main() {

 PORTB=0x00;
 PORTA=0x00;
 TRISA=0x09;
 TRISB=0x00;
 OPTION_REG.T0CS=0;
 OPTION_REG.PSA=0;
 OPTION_REG&=0x07;
 INTCON.GIE=1;
 INTCON.T0IE=1;
 ADCON1=0x05;
 ADCON0.ADCS0=1;
 ADCON0.ADCS1=1;
 ADCON0.CHS0=0;
 ADCON0.CHS1=0;
 ADCON0.CHS2=0;
 ADCON0.ADON=1;
 INTCON.T0IF=0;
 get_lm35();
 TMR0=0;
 while(1)
 SSD();

}
