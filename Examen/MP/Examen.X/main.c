#include <16f877.h>
#fuses xt,nowdt,HS,NOWDT,NOPROTECT,NOLVP,BROWNOUT
#device *=16
#device adc=10
#use delay(clock = 4M)
#define use_portb_kbd TRUE
#define use_portd_lcd TRUE
//#use standard_io(a)           //gestion de puertos
#include <lcd.c>
#include <kbd.c>
#include <stdio.h>
//#rom 0x2100={'1','2','3','4','5','6','7','8','9','0','#'}

float temperatura;
char keypad;
int i;
char keys_pressed[5];
char password[10];

void checkTemp(){
    if(temperatura<20)  {
        //Abre
        lcd_gotoxy(1,2);
        printf(lcd_putc,"\fpuerta abierta");
        output_high(PIN_B3);
        delay_ms(10000);
        output_low(PIN_B3);
        
        //Cierra
        lcd_gotoxy (1,2);
        printf(lcd_putc,"\fpuerta cerrada");
        output_high(PIN_D3);
        delay_ms(10000);
        output_low(PIN_D3);
    }
    else if(temperatura>=20&&temperatura<=35)  {         
        //Abre
        lcd_gotoxy(1,2);
        printf(lcd_putc,"\fpuerta abierta");
        output_high(PIN_B3);
        delay_ms(5000);
        output_low(PIN_B3);
        
        //Cierra
        lcd_gotoxy (1,2);
        printf(lcd_putc,"\fpuerta cerrada");
        output_high(PIN_D3);
        delay_ms(5000);
        output_low(PIN_D3);
    }
    else if(temperatura>35)  {
        printf(lcd_putc,"\fpuerta cerrada");
        set_pwm1_duty(228);
        output_low(49); // PIN B1 (BUZZER) 
        delay_ms(500);
        set_pwm1_duty(228);
        delay_ms(500);
    }
    keys_pressed[0]='*';
    keys_pressed[1]='*';
    keys_pressed[2]='*';
    keys_pressed[3]='*';
    keys_pressed[4]='*';
    
    
}

void main() {
    int checkPassword=0;
    int valid=1;
    
    setup_adc_ports (RA0_ANALOG); 
    setup_adc(ADC_CLOCK_INTERNAL);
    //set_adc_channel(0);
    
    kbd_init();
    lcd_init();                                  
    port_b_pullups(TRUE);   //habilitan las resistencias pull up para evitar resistencias en el teclado
    

    //setup_ccp1(0x0C);                            //configuracion modo pwm cpp_pwn
    //setup_timer_2(T2_DIV_BY_16,255,1);              //configuracion del timer 2 y postcaler
    // tambien printf(putc,(\f))  para borrar         
    i=0;
    for (i=0;i<10;i++){      //pasa los datos de eeprom a la matriz
        password[i]=read_eeprom(i);
    }

    while (TRUE)   {
        //Muestra Temperatura
        temperatura=(float)read_adc()/2;
        //lcd_gotoxy(1,1);           
        //printf(lcd_putc,"TEMP: %f ",temperatura);
        //lcd_gotoxy(12,1);
        //printf (lcd_putc,"C");
        //delay_ms(200);
        
        //lee teclado
        keypad=kbd_getc();           
        if(keypad!=0){
            printf(lcd_putc,"\f tecla No= %c",keypad);
            delay_ms(200);
            if(keypad=='#'){
                checkPassword=1;
            }
            else if(i>4){
                valid=0;
            }
            else{
                keys_pressed[i]=keypad;
                i++;   
            }
        }
        //Cuando digita contrasena
        if(checkPassword==1){
            if( keys_pressed[0]=='1' && 
                keys_pressed[1]=='2' && 
                keys_pressed[2]=='3' &&
                keys_pressed[3]=='4' &&
                keys_pressed[4]=='5' && valid==1){
                i=0;
                printf(lcd_putc,"\fPIN Correcto");
                delay_ms(2000);
                checkTemp();
            }
            else if(keys_pressed[0]=='6' && 
                    keys_pressed[1]=='7' && 
                    keys_pressed[2]=='8' &&
                    keys_pressed[3]=='9' &&
                    keys_pressed[4]=='0' && valid==1){
                i=0;
                printf(lcd_putc,"\fPIN Correcto");
                delay_ms(2000);
                checkTemp();
            }
            else {
                printf(lcd_putc,"\fPIN Incorrecto");
                i=0;
                delay_ms(2000);
            }
            checkPassword=0;
            valid=1;
        }
    }
}
