#include <p18F45K50.inc>
    
CONFIG WDTEN=OFF; disable watchdog timer
CONFIG MCLRE = ON; MCLEAR Pin on
CONFIG DEBUG = ON; Enable Debug Mode
CONFIG LVP = ON; Low-Voltage programming
CONFIG PBADEN = OFF
CONFIG FOSC = INTOSCIO;Internal oscillator as primary OSC
org 0; start code at 0
Start:
    CLRF TRISA
    CLRF PORTA
    CLRF LATA
HERE:
    MOVLW 0x05; setting the prescalar to 64
    MOVWF T0CON
    MOVLW 0xF8; Loading hex F8 to the high registers
    MOVWF TMR0H
    MOVLW 0x08; Loading 08 to the Low registers
    MOVWF TMR0L
    BCF INTCON, TMR0IF; Clearing the timer flag
    BTG PORTA, RA7; Toggle the LED
    BSF T0CON, TMR0ON; Start the timer
AGAIN:
    BTFSS INTCON, TMR0IF; When the timer flag is raised skip next instruction
    BRA AGAIN
    BCF T0CON, TMR0ON; Reset the timers
    BRA HERE
end
    


