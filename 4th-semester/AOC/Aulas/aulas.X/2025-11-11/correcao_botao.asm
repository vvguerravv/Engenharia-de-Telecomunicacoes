.equ SEL = PB1 ; Controla leds mais significativos
.equ AJU = PB0 ; Controla leds menos significativos
    
setup:

    CBI DDRB,SEL
    CBI DDRB, AJU
    SBI PORTB, SEL
    SBI PORTB, AJU

    ; Configurando todos os pinos da porta D como saída

    SER R16 ;	Equivalente a: LDI R16,0XFF
    OUT DDRD, R16

loop:
    
    sbic PINB, SEL ; Utilizamos o PIN sempre para fazer a verificação de entrada
    rjmp on_high
    
    off_high:

	sbi PORTD,7
	sbi PORTD,6
	sbi PORTD,5
	sbi PORTD,4

	rjmp cont

    on_high:

	cbi PORTD,7
	cbi PORTD,6
	cbi PORTD,5
	cbi PORTD,4
    
    cont:
	sbic PINB,AJU
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

    rjmp loop