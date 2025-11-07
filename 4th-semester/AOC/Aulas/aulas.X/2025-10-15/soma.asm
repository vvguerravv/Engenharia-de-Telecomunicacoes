

.DSEG ; Segmento de memória RAM
.ORG SRAM_START ; 0X0100

    A: .BYTE 1
    B: .BYTE 1
    C: .BYTE 1

.CSEG

 ; Endereçamento indireto com deslocamento
    
    start:
	
	ldi YH, HIGH(A)
	ldi YL, LOW(A)
	
	ldd r0,Y+0
	ldd r1,Y+1
	add r0,r1
	std Y+2,r0
	    
 
 ; Endereçamento Indireto com pós incremento
;    start:
;	
;	ldi XH, HIGH(A)
;	ldi XL, LOW(A)
;	
;	ld r0,X+
;	ld r1,X+
;	add r0,r1
;	st X,r0
;	
;	rjmp start
	
	
	
; Endereçamento Indireto sem incrementar
 
;    start:
;	
;	ldi XH, HIGH(A)
;	ldi XL, LOW(A)
;	
;	ld r0,X
;	
;	adiw XL,1
;	
;	ld r1,X
;	add r0,r1
;	adiw XL,1
;	st X, r0
;	
;	rjmp start
 
 
; Endereçamento Direto
    
;    start:
;	
;	lds r0,A
;	lds r1,B
;	add r0,r1
;	
;	sts C,r0
;	
;	rjmp start
 