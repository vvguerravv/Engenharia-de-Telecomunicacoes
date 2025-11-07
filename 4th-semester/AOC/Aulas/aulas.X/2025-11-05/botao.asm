.INCLUDE "m328Pdef.inc"

.DEF temp = R16
.DEF leds = R17

; --- Inicialização ---
ldi temp, 0xFF
out DDRB, temp        ; Todos PBx como saída
ldi temp, 0b00000000
out DDRD, temp        ; Todos PDx inicialmente entrada

ldi temp, 0xFF
out PORTB, temp       ; LEDs inicialmente acesos

loop:
    in temp, PIND         ; Lê botões

    ; Testa ambos pressionados (bits 2 e 3 em 1)
    sbrc temp, 2
    rjmp testa_selecao    ; Se bit 2 não pressionado, pula pra selecao
    sbrc temp, 3
    rjmp acende           ; Se bit 3 não pressionado, acende tudo

    ; Ambos pressionados (bits 2 e 3 == 0 na lógica ativa baixa, ajustar se pull-up)
    ldi leds, 0x00
    rjmp atualiza

testa_selecao:
    sbrc temp, 3
    rjmp testa_ajuste     ; Se bit 3 não pressionado, testa ajuste
    ; Apenas SELEÇÃO pressionado
    ldi leds, 0x0F        ; 00001111 (LEDs 4 MSB apagados)
    rjmp atualiza

testa_ajuste:
    sbrc temp, 2
    rjmp acende           ; Se bit 2 não pressionado, acende tudo
    ; Apenas AJUSTE pressionado
    ldi leds, 0xF0        ; 11110000 (LEDs 4 LSB apagados)
    rjmp atualiza

acende:
    ldi leds, 0xFF        ; Todos acesos

atualiza:
    out PORTB, leds
    rjmp loop
