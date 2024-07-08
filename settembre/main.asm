.data
str: .asciiz "stringa"
a: .word 4

.text
.globl main
main:
	la $a0 str
	jal maiuscole
	li $v0 10
	syscall