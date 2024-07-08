.globl maiuscolizza
maiuscolizza:
	move $t0 $a0
	li $t2 97
	li $t3 122 

ciclo:
	lb $t1 ($t0)
	addi $t0 $t0 1
	beq $t1 $zero end
	blt $t1 $t2 ciclo
	bgt $t1 $t3 ciclo
	addi $t1 $t1 -32
	sb $t1 -1($t0)
	j ciclo
	
end:
	jr $ra
