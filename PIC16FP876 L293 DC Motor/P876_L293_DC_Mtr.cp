#line 1 "F:/C Codes 2013/TESTED_4550_PACK/TSTD_P876_L293_DC_Motor/P876_L293_DC_Mtr.c"
void main()
{
 short duty = 0;


 TRISC = 0xc0;
 TRISB = 0x00;
 PORTB = 0x02;

 PWM1_Init(1000);
 PWM1_Start();
 PWM1_Set_Duty(duty);

 while (1)
 {
 if (!RC6_bit && duty<250)
 {
 Delay_ms(40);
 duty = duty + 10;
 PWM1_Set_Duty(duty);
 }
 if (!RC7_bit && duty >0)
 {
 Delay_ms(40);
 duty = duty - 10;
 PWM1_Set_Duty(duty);
 }
 Delay_ms(10);
 }
}
