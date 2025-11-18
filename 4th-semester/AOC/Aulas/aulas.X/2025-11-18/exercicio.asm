.INCLUDE "m328Pdef.inc"

.equ L0 = PB0
.equ BUTTON = PD2
    
.DSEG
.ORG SRAM_START
    
    count: .BYTE 1
 
 .CSEG
 
 .ORG 0x0000
    rjmp setup

.ORG 0x0002
    rjmp isr_int0

.ORG 0x0034

setup:
    
    sbi DDRB,L0 ; Configura PB0 como saída
    sbi PORTB, L0 ; Desliga o LED de PB0
    
    cbi DDRD, BUTTON; Configura PD2 como entrada
    sbi PORTD, BUTTON ; Ativa o pull-up do botão de entrada
   
    
    ldi R16, 0b00000010
    sts EICRA, R16
    sbi EIMSK, INT0 ; Habilita a interrupção 0
    
    sei  ; Habilita a interrupção global

main:
    
    lds r16, count
    cpi r16, 10
    BREQ turn_on_led
    rjmp end
    
turn_on_led:
   cbi PORTB,L0 ; Liga o LED
   
end:
    rjmp main
    
;-------------------------------------------------
; Rotina de Interrupção (ISR) da INT0
;-------------------------------------------------       
isr_int0:
  
    PUSH R16
    IN R16, SREG
    PUSH R16
    
    lds r16,count
    inc r16
    sts count,r16
    
    pop R16
    out SREG, R16 
    pop r16
    reti