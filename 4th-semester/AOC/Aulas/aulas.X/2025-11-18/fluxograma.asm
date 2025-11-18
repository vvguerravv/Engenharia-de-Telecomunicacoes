.INCLUDE "m328Pdef.inc"

.EQU GPIOR0_ADDR = 0x1E
.DEF temp  = R16
.DEF count = R20
.DEF loops = R19          ; para o delay

main:
    ; lê GPIOR0
    in temp, GPIOR0_ADDR

    ; Teste do botão (bit 3)
    sbic GPIOR0_ADDR,3    ; se bit3 == 0, pula o RJMP
    rjmp button_press     ; se bit3 == 1 (pressionado) vem pra cá

button_not_press:
    clr count             ; zera contador
    cbi GPIOR0_ADDR,1     ; LED2=0
    rjmp do_delay         ; vai pro delay e depois volta ao main

button_press:
    inc count             ; incrementa contador
    sbi GPIOR0_ADDR,1     ; LED2=1

do_delay:
    ldi loops, 16         ; por exemplo: 16 ? ~200 ms (conforme comentário)
    rcall delay
    rjmp main             ; repete o loop principal
    
;------------------------------------------------------------
;SUB-ROTINA DE ATRASO Programável
;Depende do valor de R19 carregado antes da chamada.
;Exemplos: 
; - R19 = 16 --> 200ms 
; - R19 = 80 --> 1s 
;------------------------------------------------------------
delay:           
  push r17	     ; Salva os valores de r17,
  push r18	     ; ... r18,
  in r17,SREG    ; ...
  push r17       ; ... e SREG na pilha.

  ; Executa sub-rotina :
  clr r17
  clr r18
loop:            
  dec  R17       ;decrementa R17, começa com 0x00
  brne loop      ;enquanto R17 > 0 fica decrementando R17
  dec  R18       ;decrementa R18, começa com 0x00
  brne loop      ;enquanto R18 > 0 volta decrementar R18
  dec  R19       ;decrementa R19
  brne loop      ;enquanto R19 > 0 vai para volta

  pop r17         
  out SREG, r17  ; Restaura os valores de SREG,
  pop r18        ; ... r18
  pop r17        ; ... r17 da pilha

  ret    