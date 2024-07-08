.data
msg1: .asciiz "tutti uguali"
msg2: .asciiz "tutti diversi"

.text
.globl main 
main:
	li $a0 2
	li $a1 23
	li $a2 2
	la $a3 testo1
	la $s0 testo2
	sw $s0 ($sp)
	addi $sp $sp -4
	jal branch3equal
	j end
	
testo1: 
	la $a0 msg1 
	li $v0 4
	syscall
	j end
	
testo2:
	la $a0 msg2 
	li $v0 4
	syscall
	j end
	
end:
	li $v0 10 
	syscall