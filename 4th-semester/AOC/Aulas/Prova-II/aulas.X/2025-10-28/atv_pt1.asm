


.DSEG
.ORG SRAM_START
    
    A1: .BYTE 4
    A2: .BYTE 4
    A3: .BYTE 4
 
 .CSEG
 
 main:
    
    LDI XL,LOW(A1)
    LDI XH, HIGH(A1)
    rcall init_32bits
    
    LDI XL,LOW(A1)
    LDI XH, HIGH(A1)
    rcall zera_32bits 
    
    LDI XL,LOW(A1)
    LDI XH, HIGH(A1)
    LDI YL,LOW(A2)
    LDI YH, HIGH(A2)
    LDI ZL, LOW(A3)
    LDI ZH, HIGH(A3)
    rcall sub_32bits
    
    rjmp main
    
 
sub_32bits:
    
    ; salvar contexto
    PUSH R0
    PUSH R1
    PUSH R16
    IN R0,SREG
    PUSH R0
    
    CLC
    LD R0, X+
    LD R1, Y+
    SUB R0, R1
    ST Z+, R0

    LDI R16, 3

    repeat:
	LD R0, X+
	LD R1, Y+
	SBC R0, R1
	ST Z+, R0
	DEC R16
	BRNE repeat
    
    
    POP R0
    OUT SREG, R0
    POP R16
    POP R1
    POP R0
    
    ret
	
    
zera_32bits:
    
    ; salvar contexto
    
    PUSH R16
    PUSH R17
    IN R17, SREG
    PUSH R17
    
    LDI R16,0
    LDI R17,4
    
    loop:
	
	ST X+, R16
	DEC R17
	BRNE loop
	
	
    POP R17
    OUT SREG, R17
    POP R17
    POP R16
    
    ret
	
    
init_32bits:
    
    ; salvar contexto
    
    PUSH R16
    PUSH R17
    PUSH R18
    PUSH R19
    PUSH R20
    IN R20, SREG
    PUSH R20
    
    ST X+, R16
    ST X+, R17
    ST X+, R18
    ST X+, R19
    
    POP R20
    OUT SREG,R20
    POP R20
    POP R19
    POP R18
    POP R17
    POP R16
    
    ret