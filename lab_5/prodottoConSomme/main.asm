.data
msg: .asciiz "inserisci un numero"

.text
.globl main
main:
	la $a0 msg
	li $v0 51
	syscall
	move $s0 $a0 
	
	la $a0 msg
	li $v0 51
	syscall 
	move $a1 $s0
	jal prodotto_s
	
end:
	move $a0 $v0
	li $v0 1
	syscall
	li $v0 10 
	syscall