
.equ LED = PB5
.equ BUTTON = PD2
    
.DSEG
.ORG SRAM_START
    count: .BYTE 1
    intervalo: .BYTE 1
 
.CSEG
 
.ORG 0x0000 ; Reset vector
    rjmp setup
    
.ORG 0x0002 ; Vetor (endereço na Flash) da INT0
    rjmp isr_int0

.ORG 0x0020 ; Vetor (endereçoo na Flash) do estouro do T/C0
    rjmp isr_tc0b
    
.ORG 0x0034
    
setup:
    
    sbi DDRB, LED  ; Configurando PB5 como saída
    cbi PORTB, LED ; Desligando o led em PB5
    
    cbi DDRD, BUTTON; Configura PD2 como entrada
    sbi PORTD, BUTTON ; Ativa o pull-up do botão de entrada
    
    ldi R16, 31
    sts intervalo, R16 ; Iniciando o valor do intervalo com 31, indicando que o led ficará 500 ms aceso e 500 ms apagado
    
    ldi R16, 0b00000101 ; TC0 com prescaler de 1024, a 16 MHz gera
    out TCCR0B, R16 ; uma interrupção a cada 16,384 ms
    
    LDI R16, 1
    sts TIMSK0, R16 ; habilita int. do TC0B (TIMSK0(0)=TOIE0 <- 1)
    
    ldi R16, 0b00000010 ; Configura a INT0 para ser sensível a borda de descida
    sts EICRA, R16 ; ...
    sbi EIMSK, INT0 ; Habilita a interrupção INT0
    
    sei  ; Habilita a interrupções globais
    
main:
    
    rjmp main
    
 
;-------------------------------------------------
; Rotina de Interrupção (ISR) da INT0
;-------------------------------------------------    
    
isr_int0:
    
    ; Salve contexto
    PUSH R16
    IN R16, SREG
    PUSH R16
    
    ; Carrega intervalo
    lds R16, intervalo
    
    ; Subtrai 6
    subi R16, 6
    
    cpi R16, 7
    BRSH end
    ldi R16, 31
    
    end:
	
	; Atualiza a variável intervalo
	
	sts  intervalo, R16
	
	; Zera a contagem para não dar problema
	
	ldi R16, 0
	sts count, R16
    
	; Restaurar contexto 
	pop  R16
	out  SREG, r16
	pop  R16
	
	reti
    
    
;------------------------------------------------------
; Rotina de Interrupção (ISR) do Temporizador Contador
;------------------------------------------------------
    
isr_tc0b:

    ; Salva contexto
    PUSH R16
    PUSH R17
    IN R16, SREG
    PUSH R16
    
    lds R16, count
    lds R17, intervalo
    
    inc R16
    cp R16, R17
    BRNE end_tc0b
    
    sbi PINB,LED ; Inverte o estado do Led depois de entrar N vezes
    ldi R16, 0 ; Zera a contagem
    
    end_tc0b:
    
	sts count, R16
	
	; Restaura contexto
	
	POP R16
	OUT SREG, R16
	POP R17
	POP R16
    
	reti
	
    