; Declaração dos vetores
.DSEG
A1: .BYTE 8      ; Vetor de 8 posições
A2: .BYTE 8      ; Vetor de 8 posições
A3: .BYTE 8      ; Vetor de 8 posições
A4: .BYTE 3      ; Vetor de 3 posições

.CSEG
.ORG 0x00

; Inicialização dos vetores A2 e A3 com valores de 1 a 8
; Usando endereçamento indireto com pós incremento
LDI R26, LOW(A2)   ; XL
LDI R27, HIGH(A2)  ; XH
LDI R28, LOW(A3)   ; YL
LDI R29, HIGH(A3)  ; YH
LDI R16, 1         ; Valor inicial

LDI R17, 8         ; Contador do loop
InitLoop:
    ST X+, R16     ; A2[i] = i+1 (pós incremento)
    ST Y+, R16     ; A3[i] = i+1 (pós incremento)
    INC R16
    DEC R17
    BRNE InitLoop

MainLoop:
    ; Soma A2[0] + A3[7], A2[1] + A3[6], ..., A2[7] + A3[0] e salva em A1
    LDI R26, LOW(A1)    ; XL - ponteiro para A1
    LDI R27, HIGH(A1)   ; XH
    LDI R28, LOW(A2)    ; YL - ponteiro para A2
    LDI R29, HIGH(A2)   ; YH
    LDI R30, LOW(A3+8)  ; ZL - ponteiro para fim de A3
    LDI R31, HIGH(A3+8) ; ZH
    LDI R17, 8          ; Contador do loop

SumLoop:
    LD R18, Y+     ; R18 = A2[i] (pós incremento)
    LD R19, -Z     ; R19 = A3[7-i] (pré decremento)
    ADD R18, R19   ; Soma
    ST X+, R18     ; Salva em A1[i] (pós incremento)
    DEC R17
    BRNE SumLoop

    ; Soma A2(1) + A3(4), A2(2) + A3(3), A2(6) + A3(7) e salva em A4
    ; Usando endereçamento indireto com deslocamento
    LDI R26, LOW(A4)    ; XL - ponteiro para A4
    LDI R27, HIGH(A4)   ; XH
    LDI R28, LOW(A2)    ; YL - ponteiro para A2
    LDI R29, HIGH(A2)   ; YH
    LDI R30, LOW(A3)    ; ZL - ponteiro para A3
    LDI R31, HIGH(A3)   ; ZH

    ; A2(1) + A3(4) - Índices 0 e 3
    LDD R18, Y+0   ; A2[0]
    LDD R19, Z+3   ; A3[3]
    ADD R18, R19
    ST X+, R18     ; Salva em A4[0]

    ; A2(2) + A3(3) - Índices 1 e 2
    LDD R18, Y+1   ; A2[1]
    LDD R19, Z+2   ; A3[2]
    ADD R18, R19
    ST X+, R18     ; Salva em A4[1]

    ; A2(6) + A3(7) - Índices 5 e 6
    LDD R18, Y+5   ; A2[5]
    LDD R19, Z+6   ; A3[6]
    ADD R18, R19
    ST X+, R18     ; Salva em A4[2]

    RJMP MainLoop 
