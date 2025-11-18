; Definições

.equ SELECAO = PB1
.equ AJUSTE = PB0
    
setup:
    
    ; Configurando PB0/1 como entrada e ativando Pull-UP
    cbi DDRB, AJUSTE
    cbi DDRB, SELECAO
    
    sbi PORTB, AJUSTE
    sbi PORTB, SELECAO
    
    ; Configurando todos os pinos da porta D como saída
    SER R16
    OUT DDRD,R16
    
    ; Liga todos os leds
    CLR R16
    OUT PORTD, R16

main:
    
    sbic PINB, SELECAO
    rjmp on_high
    
    off_high:
	
	sbi PORTD,7
	sbi PORTD,6
	sbi PORTD,5
	sbi PORTD,4
	
	rjmp verify_low
	
    on_high:
    
	cbi PORTD,7
	cbi PORTD,6
	cbi PORTD,5
	cbi PORTD,4
    
    verify_low:
    
	sbic PINB, AJUSTE
	rjmp on_low
    
	off_low:

	    sbi PORTD,3
	    sbi PORTD,2
	    sbi PORTD,1
	    sbi PORTD,0

	    rjmp end

	on_low:

	    cbi PORTD,3
	    cbi PORTD,2
	    cbi PORTD,1
	    cbi PORTD,0
    
    end:
    
	rjmp main