


.DSEG
.ORG SRAM_START ; 0x0100
    
    A: .BYTE 2
    B: .BYTE 2
    C: .BYTE 2

 .CSEG
    
    start: 
	
	ldi XH, HIGH(A)
	ldi XL, LOW(A)
	
	ld r0,XL
	ld r1,XH
	
	rjmp start