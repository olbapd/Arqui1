#include <16f877.h>
#fuses xt,nowdt,HS,NOWDT,NOPROTECT,NOLVP,BROWNOUT
#device *=16
#device adc=10
#use delay(clock = 4M)
#define use_portb_kbd TRUE
#define use_portd_lcd TRUE
#include <lcd.c>
#include <kbd.c>
#include <stdio.h>
#use rs232(uart1, baud = 9600)                // Initialize UART module

float temperatura;
char keypad;
int i;
char keys_pressed[5];

void checkTemp(int value){
    if(temperatura<20)  {
        //Abre
        output_low(PIN_D3);
        lcd_gotoxy(1,2);
        set_pwm1_duty(150);
        printf(lcd_putc,"\fPuerta abierta");
        delay_ms(10000);
        set_pwm1_duty(0);
        
        //Cierra
        lcd_gotoxy (1,2);
        set_pwm2_duty(150);
        printf(lcd_putc,"\fPuerta cerrada");
        delay_ms(10000);
        output_high(PIN_D3);
        set_pwm2_duty(0);
    }
    else if(temperatura>=20&&temperatura<=35)  {         
        //Abre
        output_low(PIN_D3);
        lcd_gotoxy(1,2);
        set_pwm1_duty(150);
        printf(lcd_putc,"\fPuerta abierta");
        delay_ms(5000);
        set_pwm1_duty(0);

        //Cierra
        lcd_gotoxy (1,2);
        set_pwm2_duty(150);
        printf(lcd_putc,"\fPuerta cerrada");
        delay_ms(5000);
        set_pwm2_duty(0);
        output_high(PIN_D3);
    }
    else if(temperatura>35)  {
        printf(lcd_putc,"\fTemp alta,");
        lcd_gotoxy (1,2);
        printf(lcd_putc,"intentar despues.");
        delay_ms(500);
    }
    keys_pressed[0]='*';
    keys_pressed[1]='*';
    keys_pressed[2]='*';
    keys_pressed[3]='*';
    keys_pressed[4]='*';
    
    lcd_gotoxy(1,1);           
    printf(lcd_putc,"\fTEMP: %f ",temperatura);
    lcd_gotoxy(12,1);
    printf (lcd_putc,"C");
    
    putc(13);                                   // Go to first column
    putc(10);                                   // Start a new lin
    if(value==1){
        printf("Code:12345-Temp:%fC \n",temperatura );
    }
    else if(value==2){
        printf("Code:67890-Temp:%fC \n",temperatura );
    }
    
}

void main() {
    
    int checkPassword=0;
    int valid=1;
    int maintinaing=0;
    int buttonState=0;
    keys_pressed[0]='*';
    keys_pressed[1]='*';
    keys_pressed[2]='*';
    keys_pressed[3]='*';
    keys_pressed[4]='*';
    float previousTemp=0;
    
    setup_adc_ports(ALL_ANALOG); 
    setup_adc(ADC_CLOCK_INTERNAL);
    setup_ccp1(0x0C);
    setup_ccp2(0x0C);
    //setup_timer_2(T2_DIV_BY_16,255,2); //For 8MHz
    setup_timer_2(T2_DIV_BY_16,255,1); //For 4MHz
    output_high(PIN_D3);

    kbd_init();
    lcd_init();

    port_b_pullups(TRUE);   //habilitan las resistencias pull up para evitar resistencias en el teclado
    i=0;
    delay_ms(2000);
    printf("Examen Pablo Garcia Brenes y Marco Fernandez Granados.\n");
    
    
    while (TRUE)   {
        //Muestra Temperatura
        temperatura=(float)read_adc()/2;
        temperatura=temperatura-(float)1;
        buttonState=input_state(PIN_C5);
        if(buttonState==0){
            if(maintinaing==0){
                maintinaing=1;
            }
            else if(maintinaing==1){
                maintinaing=0;
            }
        }
        if(temperatura>previousTemp && temperatura-previousTemp>1){
            lcd_gotoxy(1,1);           
            printf(lcd_putc,"\fTEMP: %f ",temperatura);
            lcd_gotoxy(12,1);
            printf (lcd_putc,"C");
            previousTemp=temperatura;
        }
        else if( temperatura-previousTemp<-1){
            lcd_gotoxy(1,1);           
            printf(lcd_putc,"\fTEMP: %f ",temperatura);
            lcd_gotoxy(12,1);
            printf (lcd_putc,"C");
            previousTemp=temperatura;
        }

        if(maintinaing==0){
            output_high(PIN_D3);
            //lee teclado
            keypad=kbd_getc();           
            if(keypad!=0){
                printf(lcd_putc,"\f Tecla: %c",keypad);
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
                    checkTemp(1);
                }
                else if(keys_pressed[0]=='6' && 
                        keys_pressed[1]=='7' && 
                        keys_pressed[2]=='8' &&
                        keys_pressed[3]=='9' &&
                        keys_pressed[4]=='0' && valid==1){
                    i=0;
                    printf(lcd_putc,"\fPIN Correcto");
                    delay_ms(2000);
                    checkTemp(2);
                }
                else {
                    printf(lcd_putc,"\fPIN Incorrecto");
                    i=0;
                    delay_ms(2000);
                    lcd_gotoxy(1,1);           
                    printf(lcd_putc,"\fTEMP: %f ",temperatura);
                    lcd_gotoxy(12,1);
                    printf (lcd_putc,"C");
                }
                checkPassword=0;
                valid=1;
            }
        }
        else if(maintinaing==1){
            output_low(PIN_D3);
        }
        
    }
}
