
; ===========================================
; Parte 2 - Criação e execução de Sub-rotinas
; ===========================================

.DSEG  ; Data segment
.ORG SRAM_START ; Estou indicando que essa parte servirá para declaração dos dados e começará em 0x0100
    
    A0: .BYTE 4
    A1: .BYTE 4
    
.CSEG ; Code segment
 
main: ; Rótulo da parte principal do código
    
    LDI XL, LOW(A0)
    LDI XH, HIGH(A0)
    
    rcall inc_32bits
    
    LDI XL, LOW(A0)
    LDI XH, HIGH(A0)
    
    rcall dec_32bits
    
    LDI XL, LOW(A0)
    LDI XH, HIGH(A0)
    LDI YL, LOW(A1)
    LDI YH, HIGH(A1)
    
    LDI R16, 0XFF
    STS A0+0,R16
    STS A0+1,R16
    STS A0+2,R16
    STS A0+3,R16
    
    rcall mov_32bits
    
    rjmp main
 
    
mov_32bits:
    
    ; Salvamento de contexto
    PUSH R16
    PUSH R17
    IN R16, SREG
    PUSH R16
    
    ; Lógica principal
    
    LDI R17,4 ; Inicio R17 com 4 para fazer o controle do loop
    
    loop:
    
	LD R16, X+
	ST Y+, R16
	
	DEC R17
	BRNE loop
    
    ; Retorno do contexto
    
    POP R16
    OUT SREG, R16
    POP R17
    POP R16
    
    ret

inc_32bits:
    
    PUSH R16
    PUSH R17
    IN R16,SREG
    PUSH R16
    
    CLC
	
    LDI R16,1
    LD R17,X
    
    ADD R17, R16
    ST X+,R17
    
    CLR R16
    
    LD R17,X
    ADC R17,R16
    ST X+,R17
    
    LD R17,X
    ADC R17, R16
    ST X+, R17
    
    LD R17,X
    ADC R16,R17
    ST X+,R16
    
    POP R16
    OUT SREG, R16
    POP R16
    
    ret
    
dec_32bits:
    
    PUSH R16
    PUSH R17
    IN R16,SREG
    PUSH R16
    
    CLC
	
    LDI R16,1
    LD R17,X
    
    SUB R17, R16
    ST X+,R17
    
    CLR R16
    
    LD R17,X
    SBC R17,R16
    ST X+,R17
    
    LD R17,X
    SBC R17, R16
    ST X+, R17
    
    SBC R16,R17
    ST X+,R16
    
    POP R16
    OUT SREG, R16
    POP R16
    
    ret