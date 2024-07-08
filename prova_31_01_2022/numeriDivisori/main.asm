.text
.globl main
main:
	li $a0 -1
	jal numero_divisori
	move $s0 $v0
	li $v0 10
	syscall