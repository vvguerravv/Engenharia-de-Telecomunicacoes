.equ ON = PD2
.equ OFF = PD3
.equ L0 = PB0
.equ L1 = PB1
.def AUX = R16
    

.ORG 0x0000 ; Reset vector
    rjmp setup

.ORG 0x0002 ; ; Vetor (endereço na Flash) da INT0
    rjmp isr_int0

.ORG 0x0004 ; Vetor (endereço na Flash) da INT1
    rjmp isr_int1

.ORG 0x0034
    
setup:
    
    ; Configura os pinos PB0 e PB1 como sáida
    sbi DDRB, L0
    sbi DDRB, L1
    
    ; Desliga os leds configurados em PB0/1 (L0 e L1)
    sbi PORTB, L0
    sbi PORTB, L1
    
    ; Configura os pinos PD2 e PD3 como entrada
    cbi DDRD, ON
    cbi DDRD, OFF
    
    ; Ativa o pull-up para os botões configurados nos pinos PD2/3
    sbi PORTD, ON
    sbi PORTD, OFF
    
    ldi AUX, 0b00001010
    sts EICRA, AUX ; Configura INT0 e INT1 sensível a borda de descida
    sbi EIMSK, INT0 ; Habilita da Interrupção 0 e 1
    sbi EIMSK, INT1 ; ...
    
    sei             ; habilita a interrupção global ... 

main:
   
    sbi PORTB, L0  ; desliga L0
    ldi r19, 80
    rcall delay    ; Delay de 1 segundo
    cbi PORTB, L0    ; liga L0
    ldi r19, 80
    rcall delay    ; Delay de 1 segundo
    
    rjmp main    

;-------------------------------------------------
; Rotina de Interrupção (ISR) da INT0
;-------------------------------------------------    
isr_int0:
    
    cbi PORTB, L1 ; Liga L1
    reti
    
;-------------------------------------------------
; Rotina de Interrupção (ISR) da INT1
;-------------------------------------------------
isr_int1:
    
    sbi PORTB, L1 ; Desliga L1
    reti
    
;------------------------------------------------------------
;SUB-ROTINA DE ATRASO Programável
;Depende do valor de R19 carregado antes da chamada.
;Exemplos: 
; - R19 = 16 --> 200ms 
; - R19 = 80 --> 1s 
;------------------------------------------------------------
delay:           
  push r17	     ; Salva os valores de r17,
  push r18	     ; ... r18,
  in r17,SREG    ; ...
  push r17       ; ... e SREG na pilha.

  ; Executa sub-rotina :
  clr r17
  clr r18
loop:            
  dec  R17       ;decrementa R17, começa com 0x00
  brne loop      ;enquanto R17 > 0 fica decrementando R17
  dec  R18       ;decrementa R18, começa com 0x00
  brne loop      ;enquanto R18 > 0 volta decrementar R18
  dec  R19       ;decrementa R19
  brne loop      ;enquanto R19 > 0 vai para volta

  pop r17         
  out SREG, r17  ; Restaura os valores de SREG,
  pop r18        ; ... r18
  pop r17        ; ... r17 da pilha

  ret