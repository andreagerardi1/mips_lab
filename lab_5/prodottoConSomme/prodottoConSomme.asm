.globl somma prodotto_s
somma:
	move $v0 $a0
	jr $ra

prodotto_s:
	move $t0 $a1
	
ciclo:
	beq $t0 $zero end
	sw $ra -4($sp)
	addi $sp $sp -4
	jal somma
	lw $ra ($sp)
	addi $sp $sp 4
	add $t1 $t1 $v0
	addi $t0 $t0 -1	
	j ciclo
	
end:
	move $v0 $t1
	jr $ra