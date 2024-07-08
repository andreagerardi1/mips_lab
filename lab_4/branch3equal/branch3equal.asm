.text
.globl branch3equal 
branch3equal:
	move $t0 $a0 
	move $t1 $a1 
	move $t2 $a2 
	move $t3 $a3
	addi $sp $sp 4
	lw $t4 ($sp)
	
	bne $t0 $t1 notequal
	bne $t0 $t2 no
	jr $t3
	
notequal:
	beq $t0 $t2 no
	beq $t1 $t2 no
	jr $t4
	
no:
	jr $ra