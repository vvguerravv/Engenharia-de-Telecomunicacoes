

;start:
;
;    inc r0
;    clr r0
;    inc r1
;
;    ldi R16, 52 //opcode = 1110 0001 0000 0100
;
;    rjmp start

;part2:
;    
;    inc r0
;    mov r1, r0
;    inc r0
;    movw r2,r0
;    
;    rjmp part2
    
   
;.DEF temp=r16
;.EQU valor=0x23+16
;    start:
;	ldi temp, valor ; inicialize o reg. temp com valor
;	inc temp ; incrementa o reg. temp
;	rjmp start
    
    
// ATIVIDADE DO DIA
   
    .EQU var1 = 4
    .EQU var2 = 6
    .EQU var3 = 22
    start: 
	ldi r16,var1
	ldi r17,var2
	add r16,r17
	ldi r17,var3
	add r16,r17
	mov r18, r16
	
	rjmp start