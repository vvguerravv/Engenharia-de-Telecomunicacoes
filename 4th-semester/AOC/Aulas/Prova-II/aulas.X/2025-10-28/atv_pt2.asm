

.DSEG
.ORG SRAM_START
   
    V0: .BYTE 10
    V1: .BYTE 10
    VR: .BYTE 10
 
 .CSEG
 
 main:
 

    rcall init_pointers
    rcall init_vectors
    
    rcall init_pointers
    rcall sum_vectors
    
    rcall init_pointers
    rcall clear_vectors
    
    rjmp main
    
init_pointers:
    
    LDI XL, LOW(V0)
    LDI XH, HIGH(V0)
    
    LDI YL, LOW(V1)
    LDI YH, HIGH(V1)
    
    LDI ZL, LOW(VR)
    LDI ZH, HIGH(VR)    
    
    ret
    
clear_vectors:
    
    ; salvar contexto
    PUSH R16
    PUSH R17
    IN R16, SREG
    PUSH R16
    
    LDI R16,0
    LDI R17,10
    
    clear:
	
	ST X+,R16
	ST Y+,R16
	DEC R17
	BRNE clear
	
    POP R16
    OUT SREG,R16
    POP R17
    POP R16
	
    ret
    
    
sum_vectors:
    
    ; salvar contexto
    
    PUSH R16
    PUSH R17
    PUSH R18
    IN R16,SREG
    PUSH R16
    
    LDI R16, 10
    
    CLC
    loop:
	
	LD R17,X+
	LD R18,Y+
	ADC R17,R18
	ST Z+,R17
	DEC R16
	BRNE loop
	
    POP R16
    OUT SREG, R16
    POP R18
    POP R17
    POP R16
	
    ret    
    
init_vectors:
    
    ; salvar contexto
    PUSH R16
    PUSH R17
    IN R16, SREG
    PUSH R16
    
    
    LDI R16, 10
    LDI R17,10
    
    init_v0:
	
	ST X+, R16
	INC R16
	DEC R17
	BRNE init_v0
	
    LDI R17,10
    
    init_v1:
	
	ST Y+,R16
	INC R16
	DEC R17
	BRNE init_v1
    
    POP R16
    OUT SREG,R16
    POP R17
    POP R16
    
    ret
	
    
    
    