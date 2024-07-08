.data
msg: .asciiz "inserisci il numero di elementi che avrà il tuo array"
msg2: .asciiz "inserire elemento"
stampamin: .asciiz "elemento minore: "
stampamax: .asciiz "\nelemento maggiore: "

.text
.globl main
main:
	la $a0 msg
	li $v0 51
	syscall
	move $s0 $a0
	li $s1 0
	li $s2 0x10010080
	li $s3 0x10010080
	
while:
	beq $s1 $s0 chiama
	la $a0 msg2
	li $v0 51
	syscall
	sw $a0 ($s3)
	addi $s3 $s3 4
	addi $s1 $s1 1
	j while
	
chiama:
	move $a0 $s0 #numero elementi
	move $a1 $s2 #posizione primo el
	jal min
	move $s4 $v0
	
	move $a0 $s0 #numero elementi
	move $a1 $s2 #posizione primo el
	jal max
	move $s5 $v0
	
end: 
	la $a0 stampamin
	li $v0 4
	syscall
	
	move $a0 $s4 
	li $v0 1
	syscall
	
	la $a0 stampamax
	li $v0 4
	syscall
	
	move $a0 $s5
	li $v0 1
	syscall
	
	li $v0 10
	syscall
