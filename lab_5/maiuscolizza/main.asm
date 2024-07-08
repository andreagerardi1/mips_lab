.data 
minusc: .asciiz "Hello World?"

.text 
.globl main
main:
	la $a0 minusc
	jal maiuscolizza
	
	la $a0 minusc
	li $v0 4
	syscall
	
	li $v0 10
	syscall
	
