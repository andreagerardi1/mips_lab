.data
acapo: .asciiz"\n"

.text
.globl main
main:
	li $a0 5
	jal fattoriale
	move $a0 $v0 
	li $v0 1
	syscall
	la $a0 acapo
	li $v0 4
	syscall
	li $a0 6
	jal fibonacci
	move $a0 $v0 
	li $v0 1
	syscall
	li $v0 10
	syscall
