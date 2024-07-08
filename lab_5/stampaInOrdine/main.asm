.data
msg: .asciiz "inserisci un numero e invia, se invii senza nulla termini l'array"
spazio: .space 2
arr: .space 100
.text
.globl main
main: 
	la $s0 arr
	li $s1 -3
	
input:
	la $a0 msg
	li $v0 51
	syscall
	beq $a1 $s1 chiama
	sw $a0 ($s0)
	addi $s0 $s0 4
	j input
	
chiama:
	li $v0 10
	syscall
	
