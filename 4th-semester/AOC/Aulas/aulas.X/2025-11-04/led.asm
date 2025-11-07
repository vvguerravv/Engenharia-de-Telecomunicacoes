.INCLUDE "m328Pdef.inc"

.EQU GPIOR0_ADDR = 0x1E      ; Endereço de GPIOR0
.DEF temp = R16
.DEF countL = R17            ; Parte baixa do contador
.DEF countH = R18            ; Parte alta do contador

; Inicialização
CLR countL
CLR countH

Loop:
    ; Leitura do valor do GPIOR0
    IN temp, GPIOR0_ADDR

    ; Teste do botão (bit 3)
    SBIC GPIOR0_ADDR, 3       ; Salta se botão NÃO está pressionado
    RJMP BotaoPressionado
    ; Botão não pressionado: zera contador
    CLR countL
    CLR countH

    ; Desliga LED2 (bit 1)
    CBI GPIOR0_ADDR, 1
    RJMP DelayAndRepeat

BotaoPressionado:
    ; Incrementa o contador
    INC countL
    BRNE NoOverflow
    INC countH
NoOverflow:
    ; Liga LED2 (bit 1)
    SBI GPIOR0_ADDR, 1

DelayAndRepeat:
   
    RCALL Delay200ms
    RJMP Loop

; Rotina de Delay de 200ms
Delay200ms:
    
    PUSH R19
    
    LDI temp, 250
D1: LDI R19, 250
D2: NOP
    NOP
    DEC R19
    BRNE D2
    DEC temp
    BRNE D1
    
    POP R19
    RET
