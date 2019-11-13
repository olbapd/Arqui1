/**
 * Costa Rica Institute of Technology
 * Computer Engineering
 * CE-4301 Computer Architecture I
 * 
 * Students: Andre Herrera
 *           Jose Rivera
 * 
 * Door system for PIC6F877 with CCS library. Simple door control,
 * open and close the door if the temperature is normal.  
 * 
*/

//16F877 Library, adds new functions to 16F877
#include<16f877.h>
//Fuses, allow system comm and pin control
#fuses HS,XT,NOWDT,PUT,NOPROTECT,NOLVP,BROWNOUT,NOCPD,NOWRT,NODEBUG
//Allows strings management
#device PASS_STRINGS = IN_RAM
//Indicates pic model
#device *=16
//ADC PIN 
#device adc=10
//Set 4hz clock 
#use delay(clock=4M)
//LCD ports
#define use_portd_lcd true
//Keypad KBD ports
#define use_portb_kbd true
//LCD library
#include<lcd.c>
//KBD Library
#include<kbd.c>
//Indicate ADC reading variables
#byte wpug = 0x95 
#byte option_reg = 0x81
#include<stdio.h>
#include <string.h>
//Set UART protocol 
#use rs232(baud=9600, xmit=pin_c6, rcv=pin_c7, bits=8)

float fridgeTemp; //Temperature 
char k; //Character 
char password[5] = "";//Password array
int doorFlag = 0; //Open & close flag
int userFlag = 0;// Managment Flag
void main()
{
    //Normalize output
    output_low(PIN_C2);
    output_low(PIN_C0);
    output_low(PIN_C1);
    
    setup_adc_ports(RA0_ANALOG);// LM35 entry
    setup_adc(ADC_CLOCK_INTERNAL);
    
    option_reg = 0; //Quit OPTION
    wpug= 0b11111111;//Set pullups
    
    lcd_init(); // Init LCD comm
    
    lcd_gotoxy(1,1);
    printf(lcd_putc,"Fridge Access");
    lcd_gotoxy(1,2);
    printf(lcd_putc,"Starting...");
    delay_ms(2000);
    printf(lcd_putc, "\f");
    printf(lcd_putc,"\f tecla No= %c",k);
    
    kbd_init(); //KBD init
    
    port_b_pullups(true);
    
   
    
    while(true)
    {
        fridgeTemp=(float)read_adc()/2; //Set temp from read_adc()
        
        lcd_gotoxy(1,1);
        printf(lcd_putc,"TEMP: %f C ",fridgeTemp);
        lcd_gotoxy(2,1);
        
        k=kbd_getc();//Get keypad action
        
        if(k!=0){
            lcd_gotoxy(1,1);
            printf(lcd_putc,"\f Insert");
            lcd_gotoxy(1,2);
            printf(lcd_putc,"Password");
            int counter=0;
            delay_ms(3000);
            printf(lcd_putc,"\f");
            
            while(true){
                k=0;
                k=kbd_getc();
                lcd_gotoxy(1,1);
                printf(lcd_putc,"Reading...");
                if(k!=0 && counter!=6){ 
                    if(k=='#'){
                        //Password logic with string library
                        if(strcmp(password,"12345")==0){
                           doorFlag=1;
                           break;
                        }
                        else if(strcmp(password,"67890")==0){
                           doorFlag=1;
                           break;
                        }
                        else{
                            lcd_gotoxy(1,1);
                            printf(lcd_putc,"\f Invalid");
                            lcd_gotoxy(1,2);
                            printf(lcd_putc,"Password");
                            delay_ms(2000);
                            break;
                        }
                    }
                    else{
                        printf(lcd_putc,"\f Key: %c",k);
                        delay_ms(1000);
                        strncat(password, &k, 1);     
                        counter++;
                    }
                }
                else if(counter==6){
                    printf(lcd_putc,"\f Password Error");
                    delay_ms(1500);
                    break;
                }
            }
             
        }
        if (doorFlag == 1){
            putc(13);//First column                                  
            printf("CODE %s TEMP: %f",password,fridgeTemp); //UART write                  
            putc(13);                                   
            putc(10);//New line
            password="";
            //Motor and sound logic with input/output 
            if (fridgeTemp > 35){
                lcd_putc("\f");
                printf(lcd_putc,"Wait, high temp");
                delay_ms(5000);
                lcd_putc("\f");
            }
            else if (35>fridgeTemp>20){ 
                output_high(PIN_C2);
                output_low(PIN_C1);
                output_high(PIN_C0);
                delay_ms(5000);
                output_low(PIN_C0);
                output_high(PIN_C1);
                delay_ms(5000);
                output_low(PIN_C1);
                output_low(PIN_C2);
                doorFlag=0;
            }
            else {
                output_high(PIN_C2);
                output_high(PIN_C0);
                delay_ms(10000);
                output_low(PIN_C0);
                output_high(PIN_C1);
                delay_ms(10000);
                output_low(PIN_C1);
                output_low(PIN_C2);
                doorFlag=0;
            }
        } 
        //Managment logic   
        if(~input(PIN_B0)){
            printf(lcd_putc,"\f Superuser Mode");
            delay_ms(3000);
            lcd_putc("\f");
            if(userFlag == 0){
                output_high(PIN_C2);
                userFlag = 1;
            }
            else{
                userFlag = 0;
                output_low(PIN_C2);
            }
            
        }
      
    }
    
    
    
}


