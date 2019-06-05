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
    MOVLW 0x05
    MOVWF T0CON
    MOVLW 0xF8
    MOVWF TMR0H
    MOVLW 0x08
    MOVWF TMR0L
    BCF INTCON, TMR0IF
    BTG PORTA, RA7
    BSF T0CON, TMR0ON
AGAIN:
    BTFSS INTCON, TMR0IF
    BRA AGAIN
    BCF T0CON, TMR0ON
    BRA HERE
end
    


