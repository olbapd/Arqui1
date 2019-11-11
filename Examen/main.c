
#include <16f877.h>                //llamamos la libreria del micro
#device *=16                        //definimos el dispositivo de medicion
#device adc=10                      //llamamos  el adcon1       registros adresh y adresl          
#use delay(clock = 4M)              //definimos la velocidad con la que vamos a trabajar
#include <lcd.c>                    //incluimos la libreria lcd para visualizar
#fuses xt,nowdt,HS,NOWDT,NOPROTECT,NOLVP,BROWNOUT
#use standard_io(a)           //gestion de puertos
#define use_portb_kbd TRUE
#include <kbd.c>          //libreria del teclado
//#include <stdlib.h>           //libreria para crear datos de memoria dinamica de datos aleatorios
//#rom 0x2100={'1','2','3','4','5','6','7','8','9','0'}   //posicion 0,1 y 2 de la eeprom con los datos

//#fuses XT, NOWDT, NOPROTECT, BROWNOUT, PUT, NOLVP


void checkTemp(){
    if(temperatura<20)  {
        set_pwm1_duty(115);
        output_high(49); // BUZZER  
        printf(lcd_putc,"\fpuerta abierta");   //compara los datos y la clave
        delay_ms(1000);
        set_pwm1_duty(115);
        printf(lcd_putc,"\fpuerta cerrada");   //compara los datos y la clave
        delay_ms(1000);
        output_high(PIN_A0);                   //Clave correcta pone en alto el pin RA0
        delay_ms(500);
        output_low(PIN_A0);                    //el alto en el pin rA0 esta durante 500ms luego se apaga   
    }
    else if(temperatura>=20&&temperatura<=35)  {
        set_pwm1_duty(171);
        output_low(49); // PIN B1 (BUZZER) 
        lcd_gotoxy(7,2);
        printf(lcd_putc,"\fpuerta abierta");   //compara los datos y la clave
        delay_ms(5000);
        lcd_gotoxy (1,2);
        printf(lcd_putc,"\fpuerta cerrada");   //compara los datos y la clave
        delay_ms(5000);
        output_high(PIN_A0);                   //Clave correcta pone en alto el pin RA0
        delay_ms(500);
        output_low(PIN_A0);                    //el alto en el pin rA0 esta durante 500ms luego se apaga   
    }
    else if(temperatura<35)  {
        set_pwm1_duty(228);
        output_low(49); // PIN B1 (BUZZER) 
        delay_ms(500);
        set_pwm1_duty(228);
        delay_ms(500);
    }

}

float temperatura;                  //declaramos una variable de tipo flotante,
/*
 * 
 */
int main(int argc, char** argv) {
    char keypad;
    int i;
    char keys_pressed[5];
    kbd_init();
    port_b_pullups(TRUE);   //habilitan las resistencias pull up para evitar resistencias en el teclado
    
    setup_ccp1(0x0C);                            //configuracion modo pwm cpp_pwn
    setup_timer_2(T2_DIV_BY_16,255,1);              //configuracion del timer 2 y postcaler
    setup_adc_ports (ALL_ANALOG);                  //configuramos todas las entradas analogas
    setup_adc(ADC_CLOCK_INTERNAL);                 //llamamos el convertidor analogo digital del pic que trabaja con el //reloj interno
    set_adc_channel(0);

    // Se configura el LCD e imprimer TEMP:
    lcd_init();                                  
    lcd_gotoxy(1,1);                             
    printf(lcd_putc,"TEMP: ");             
    delay_ms(300);
    lcd_init();                            
    // tambien printf(putc,(\f))  para borrar         
    i=0;
    while (TRUE)   {
        //Muestra Temperatura
        temperatura=(float)read_adc()/2;
        lcd_gotoxy(5,1);           
        printf(lcd_putc,"%f",temperatura);
        lcd_gotoxy(12,1);
        printf (lcd_putc,"C");
        delay_ms(200);
        k=kbd_getc();           //lee el treclado
        if(k!=0){                //si se pulsa alguna tecla
            data[i]=k;             //se guarda el dato en la posicion corres. de la matriz
            i++;   
        }

        if(i==5){
            if( data[0]=='1' && 
                data[1]=='2' && 
                data[2]=='3' &&
                data[3]=='4' &&
                data[4]=='5' ){
                i=0;
                checkTemp();
            }
            else if(data[0]=='6' && 
                    data[1]=='7' && 
                    data[2]=='8' &&
                    data[3]=='9' &&
                    data[4]=='0'){
                i=0;
                checkTemp();
            }
            else {
                printf(lcd_putc,"\fPIN Incorrecto"); //clave errada cuando la clave no es correcta
                i=0;
            }
        }
    }
    return 0;
}
