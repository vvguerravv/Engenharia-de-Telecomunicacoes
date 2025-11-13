

; ================================
; Parte 1 ? Manipulação de vetores
; ================================
    

; Declare dois vetores com 8 posições de 8 bits (V0, V1) e um vetor com 4 posições (V2).
    
.DSEG  ; Data segment
.ORG SRAM_START ; Estou indicando que essa parte servirá para declaração dos dados e começará em 0x0100
    
    V0: .BYTE 8  ; Vetor 1 com 8 posições de 8 bits
    V1: .BYTE 8  ; Vetor 2 com 8 posições de 8 bits
    V2: .BYTE 4  ; Vetor com 4 posições de 8 bits
 
 .CSEG   ; Code segment
 
 
 main:
    
; ===========================================
; Inicialize o V0 com os valores de 8 até 15.
; ===========================================
    
    LDI XL, LOW(V0) ; Parte baixa de X apontando para a parte baixa de V0
    LDI XH, HIGH(V0) ; Parte alta de X apontando para a parte alta de V0
    
    LDI R16, 8  ; Iniciando o registrador R16 com o valor 8 para poder salvar dentro do V0[0] e ir incrementando e fazer o controle do loop
    
    init_v0: ; Rótulo para o loop de inicialização
	
	ST X+, R16
	
	INC R16
	CPI R16,16
	BRNE init_v0 ; Controle de loop
    
; =======================================	
; Copie de trás para frente o V0 para V1.
; =======================================
	
    LDI YL,LOW(V0 + 8)  ; Parte baixa do Y apontando para a parte baixa final de V0
    LDI YH,HIGH(V0 + 8) ; Parte alta do Y apontando para a parte alta final de V0
    LDI XL, LOW(V1) ; Parte baixa de X apontando para a parte baixa de V1
    LDI XH, HIGH(V1) ; Parte alta de X apontando para a parte alta de V1
    
    LDI R16,8 ; Inicio o registrador R16 com 8 para fazer controle do loop
    
    copy_v0_to_v1:
	
	LD R17, -Y ; Carrego o valor de de V0 de trás para frente utilizando endereçamento indireto com pré decremento 
	ST X+, R17 ; Salvo o valor carregado em V1
	
	DEC R16   
	BRNE copy_v0_to_v1 ; Controle de loop
    
; ====================================================================================================================
; Some as posições pares do V0 com as ímpares do V1, colocando o resultado no V2. Exemplo: V2(0) = V0(0) + V1(1), etc.
; ====================================================================================================================
    
    LDI YL, LOW(V0)  ; Faço Y apontar para o vetor V0
    LDI YH, HIGH(V0)
    
    LDI ZL, LOW(V1) ; Faço Z apontar para o vetor V1
    LDI ZH, HIGH(V1)
    
    LDI XL, LOW(V2) ; Faço X apontar para o vetor V2
    LDI XH, HIGH(V2)
    
    LDD R16, Y+0 ; Utilizo carregamento indireto com deslocamento para acessar as posições pares de V0, que está sendo apontado por Y
    LDD R17, Z+1 ; Utilizo carregamento indireto com deslocamente para acessar as posições ímpares de V1, que está sendo apontado por Z
    ADD R16,R17 ; Faço a soma desses valores carregados
    ST X+, R16 ; Salvo o resultado desta soma no vetor V2, que está sendo apontado por X, utilizando pós-incremento
    
    ; Repito esse passo a passo para todas as posições pares de V0 e ímpares de V1
    
    LDD R16, Y+2
    LDD R17, Z+3
    ADD R16,R17
    ST X+, R16
    
    LDD R16, Y+4
    LDD R17, Z+5
    ADD R16,R17
    ST X+, R16
    
    
    LDD R16, Y+6
    LDD R17, Z+7
    ADD R16,R17
    ST X+, R16
    
    rjmp main 
	