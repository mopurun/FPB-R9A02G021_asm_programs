
.equ PCNTR1_1, 0x40040020




main:
	LUI sp,0x20000
	ADDI sp,sp,0x700
	LUI gp,0x20000
	ADDI gp,gp,0x500

	#LED=P100,P107


	#reset register
	AND  s1,s1,x0

	LOOPS:
	ADDI s1,s1,0x01
	#R32_GPIOB_OUTDR=0x40010C0C=0x02
	LI t0,PCNTR1_1
	LI t1,0x00810001
	SW  t1,0(t0)
	AND  t0,t0,x0
	AND  t1,t1,x0


	JAL x1,TIMER

	ADDI s1,s1,0x01
	#R32_GPIOB_OUTDR=0x40010C0C=0x01
	LI t0,PCNTR1_1
	LI t1,0x00810080
	SW  t1,0(t0)
	AND  t0,t0,x0
	AND  t1,t1,x0

	JAL x1,TIMER

	#goto main loop
	JAL x1,LOOPS


	TIMER:
	ADDI sp,sp,-8
	SW ra,4(sp)
	AND  s1,s1,x0
	OR  s1,s1,1	
	LUI t2,0x00010
	ADDI t2,t2,0x700
	LOOP3:
	SUB t2,t2,s1
	BNEZ t2,LOOP3
	AND  s1,s1,x0
	LW ra,4(sp)
	ADDI sp,sp,8
	RET

