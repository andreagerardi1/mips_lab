.text
.globl main
T1:
	sll $zero $zero 0
T2:
	sll $zero $zero 0
	
main:
	li $a0 4
	li $a1 4
	la $a2 T1
	la $a3 T2
	jal branchy
	li $v0 10
	syscall