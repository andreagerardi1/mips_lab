.text
.globl fattoriale fibonacci

fattoriale:
	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $ra -4($fp)
	sw $sp -8($fp)
	sw $s0 -12($fp)
	addi $sp $fp -12

	
	move $s0 $a0
	#caso base
	beqz $s0 baseFatt
	
	#caso ricorsivo
	addi $a0 $s0 -1
	jal fattoriale
	mult $v0 $s0
	mflo $v0
	j epilogo
baseFatt:
	li $v0 1
	
epilogo:
	lw $t0 0($fp)
	lw $ra -4($fp)
	lw $sp -8($fp)
	lw $s0 -12($fp)
	move $fp $t0
	jr $ra
	

fibonacci:
	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $ra -4($fp)
	sw $sp -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	addi $sp $fp -16
	
	move $s0 $a0
	beqz $s0 base0
	li $t0 1
	beq $s0 $t0 base1
	
	#ricorsivo
	# fib(n-1)
	addi $a0 $s0 -1
	jal fibonacci 
	move $s1 $v0
	
	#fib(n-2)
	addi $a0 $s0 -2
	jal fibonacci
	add $v0 $v0 $s1
	j return_fibonacci	
	
base0:
	li $v0 1
	j return_fibonacci
	
base1:
	li $v0 1

return_fibonacci:
	lw $t0 0($fp)
	lw $ra -4($fp)
	lw $sp -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	jr $ra