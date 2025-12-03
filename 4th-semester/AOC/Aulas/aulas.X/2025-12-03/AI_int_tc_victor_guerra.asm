; Pressionado com 0

.equ BUTTON = PD2
    
.DSEG
.ORG SRAM_START
    
    display_value: .BYTE 1
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
    ; Configura a PD2 como entrada com o pull-up ativo
    cbi DDRD, BUTTON
    sbi PORTD, BUTTON

    ; Inicializa o SSD ---------------------------------------------------
    sbi DDRC, PC4	    ; Configura PC5 (segmento G) como saida ...
    sbi PORTC, PC4	    ; ... e apaga 
    sbi DDRC, PC5	    ; Configura PC6 (DP) como saida ...
    sbi PORTc, PC5	    ; ... e apaga 
    ldi R17,0xFF	  
    out DDRB, R17	    ; configura PBx como saida ...
    out PORTB, R17	    ; ... e apaga os segmentos do display
    ; --------------------------------------------------------------------
    
    clr r16
    clr r17
    
    ldi R16, 123  ; Iniciando o valor da variável intervalo que será responsável ...
    sts intervalo, R16 ;... por controlar o tempo para entrar na interrupção do temporizador contador.
    
    ldi R16, 0 ; Iniciando o valor da variável count, que será responsável por verificar ...
    sts count, R16 ; se o já entrou na interrupção do temporizado contador as 123 vezes necessárias
    
    ldi R16, 0 ; Iniciando o valor da variável display_value que será responsável por ...
    sts display_value, R16 ; ... armazenar o valor que será apresentado no display
    
    ; Inicia o display chamando o ssd_decode no setup
    lds R16, display_value
    rcall ssd_decode
    
    ldi R16, 0b00000101 ; TC0 com prescaler de 1024, a 16 MHz gera
    out TCCR0B, R16 ; uma interrupção a cada 16,384 ms
		    ; 16,384 * 123 = 2015,232 ms 
		    
    ldi R16, 1
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
    
    ; Salva contexto
    
    PUSH R16
    IN R16, SREG
    PUSH R16
  
    ; Zera o r16 e salva na variável display_value
    clr R16
    sts display_value, R16
    
    ; Zeramos a variável count também, pois ao pressionar o botão contagem dos 2 segundos reinicia
    sts count, R16
    
    ; Faz a chamada do ssd_decode para escrever esse valor (0) no display de 7 segmentos
    lds R16, display_value
    rcall ssd_decode
    
    ; Recupera o contexto
    
    POP R16
    OUT SREG, R16
    POP R16
    
    reti
 
    
;------------------------------------------------------
; Rotina de Interrupção (ISR) do Temporizador Contador
;------------------------------------------------------
    
isr_tc0b:
    
    ; Salva contexto
    PUSH R16
    PUSH R17
    PUSH R18
    IN R16, SREG
    PUSH R16
    
    ; Recuperamos as variáveis count e intervalo e fazemos a comparação para verificar se chegamos aos 2 segundos
    
    lds R16, count
    lds R17, intervalo
    lds R18, display_value ; Recuperamos também o valor na variável display_value
    
    inc R16
    cp R16, R17  ; Caso count e intervalo sejam iguais, incrementamos display_value e zeramos a variável count
    BRNE end_tc0b 
    
    clr R16 ; Zeramos o count
   
    ; Incremento r18, onde recuperei a variável display_value
    inc R18
    
    cpi R18,10 ; Se o valor for > 9, zeramos display_value
    BRNE end_tc0b ; ... Se não, salvamos o valor de R18 em display_value 
    
    clr R18
    
    end_tc0b:
	
	sts count, R16 ; Salva o valor de R16 em count
	sts display_value, R18 ; Salva o valor de R18 em display_value
	
	lds R16, display_value ; Carrega o R16 com o valor de display value 
	rcall ssd_decode ; E faz a chamada da sub-rotina para o display de 7 segmentos
	
	;Recupera contexto
	POP R16
	OUT SREG, R16
	POP R18
	POP R17
	POP R16

	reti
    
    
;---------------------------------------------------------------------------
; SUB-ROTINA: Decodifica um valor de 0 a 15 passado como parametro no R16 e 
;             escreve em um display anodo comum com a seguinte ligacao:
; Seguimento:  G   F  ...  A
; Pino:       PB2 PC5 ... PC0
;---------------------------------------------------------------------------
ssd_decode:
  push ZH            
  push ZL        
  push r0    
  in r0,SREG   
  push r0      
  
  ldi  ZH,HIGH(Tabela<<1) 
  ldi  ZL,LOW(Tabela<<1)  
  add  ZL,R16             
  brcc le_tab             
  inc  ZH    

le_tab:     
  lpm  R0,Z      ; Le tabela de decoficacao

  sbi PORTC, PC4 ; Escreve G
  sbrs R0, 6
  cbi PORTC, PC4

  out PORTB, R0  ; Escreve A .. F      

  pop r0         ; Recupera contexto
  out SREG, r0
  pop r0
  pop ZL
  pop ZH  

  ret

;---------------------------------------------------------------------------
;   Tabela p/ decodificar o display: como cada endereco da memoria flash e 
; de 16 bits, acessa-se a parte baixa e alta na decodificacao
;---------------------------------------------------------------------------
Tabela: .dw 0x7940, 0x3024, 0x1219, 0x7802, 0x1800, 0x0308, 0x2146, 0x0E06
;             1 0     3 2     5 4     7 6     9 8     B A     D C     F E  
;===========================================================================

