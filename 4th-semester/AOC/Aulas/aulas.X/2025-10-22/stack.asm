

;DEFINI¸C~OES
.equ LED = PB5 ;LED ´e o substituto de PB5

start:
    sbi DDRB, LED ;configura pino LED como sa´?da

main:
    sbi PORTB, LED ;coloca o pino PB5 em 5V
    rcall delay ;chama a sub-rotina de atraso
    cbi PORTB, LED ;coloca o pino PB5 em 0V
    rcall delay ;chama a sub-rotina de atraso
    rjmp main ;volta para main


delay: ;atraso de aprox. 200ms
    ldi R19,16
    
loop:
    dec R17 ;decrementa R17, come¸ca com 0x00
    brne loop ;enquanto R17 > 0 fica decrementando R17
    dec R18 ;decrementa R18, come¸ca com 0x00
    brne loop ;enquanto R18 > 0 volta decrementar R18
    dec R19 ;decrementa R19
    brne loop ;enquanto R19 > 0 vai para volta
    ret