

.DSEG
.ORG SRAM_START ; 0x0100
    
    A1: .BYTE 4
    A2: .BYTE 4
    A3: .BYTE 4

.CSEG
 
 main:
    
    LDI XL,LOW(A1)
    LDI XH, HIGH(A1)
    
    LDI YL, LOW(A2)
    LDI YH, HIGH(A2)
    
    LDI ZL, LOW(A3)
    LDI ZH, HIGH(A3)
    
    rcall sum
    rjmp main
  
 
sum:
    ; salvar contexto
    PUSH R0
    PUSH R1
    PUSH R16
    IN R0,SREG
    PUSH R0
    
   
    clc
    LDI R16,4
loop:
    
    LD R0,X+
    LD R1,Y+    
    ADC R0,R1
    ST Z+,R0
    
    DEC R16
    BRNE loop
    
    ;Libera o contexto
    POP R0
    OUT SREG,R0
    POP R16
    POP R1
    POP R0
    
    ret
   
    
    
    
