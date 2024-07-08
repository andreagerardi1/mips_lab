.data
V: .word 1 2 3 4 5 6 7

.text
.globl main
main:
	li $a0 3
	li $a1 5
	la $a2 V
	li $a3 7
	jal emerge2
	move $s0 $v0
	li $v0 10
	syscall