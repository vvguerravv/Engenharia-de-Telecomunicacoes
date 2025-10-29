; =====================================
;   Declare três vetores com 8 posições de 8 bits (A1, A2 e A3) 
;    e um vetor de 3 posições de 8 bits (A4)
; =====================================
    
    .DSEG
    .ORG SRAM_START
    
	A1: .BYTE 8
	A2: .BYTE 8
	A3: .BYTE 8
	A4: .BYTE 3

    .CSEG
    
    

    
    main:
    
	LDI XL, LOW(A2)
	LDI XH, HIGH(A2)
	LDI YL, LOW(A3)
	LDI YH, HIGH(A3)
	
	LDI R16, 1
	LDI R17,8
	
	;   Inicialize os vetores A2 e A3 com os valores de 1 até 8.
	
	init_a2_a3:
    
	    ST X+,R16
	    ST Y+,R16
	    
	    INC R16
	    DEC R17
	    BRNE init_a2_a3
	    
; Some a primeira posição do A2 com a última do A3 e armazene na primeira do A1. Faça isso sucessivamente até que todas as posições sejam operadas.
	LDI XL, LOW(A2)
	LDI XH, HIGH(A2)
	LDI YL, LOW(A3+8)
	LDI YH, HIGH(A3+8)
	LDI ZL, LOW(A1)
	LDI ZH, HIGH(A1)
	
	LDI R16, 8
	
	sum_a2_a3:
	    
	    LD R17, X+
	    LD R18, -Y
	    
	    ADD R17,R18
	    ST Z+,R17
	    
	    DEC R18
	    BRNE sum_a2_a3
	  
;	Some A2(1) e A3(4), A2(2) e A3(3), A2(6) e A3(7) e salve consecutivamente no A4.

	LDI XL, LOW(A4)    
	LDI XH, HIGH(A4)   
	LDI YL, LOW(A2)   
	LDI YH, HIGH(A2)   
	LDI ZL, LOW(A3)    
	LDI ZH, HIGH(A3)   
	
	LDD R18,Y+0
	LDD R19,Z+3
	ADD R18,R19
	ST X+,R18
	
	LDD R18, Y+1
	LDD R19, Z+2
	ADD R18,R19
	ST X+, R18
	
	LDD R18, Y+5
	LDD R19, Z+6
	ADD R18,R19
	ST X+, R18
	
	rjmp main