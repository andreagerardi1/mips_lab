.data
stack: .word -1
msg1: .asciiz "Che operazione vuoi svolgere? 1 = push, 2 = pop, 3 = print, 0 = exit"
msg2: .asciiz "Elenca uno alla volta gli argomenti: x,y,angle"
x: .asciiz "x"
y: .asciiz "y"
angle: .asciiz "angle"

.text
.globl main stack
main:
	la $a0 msg1
	li $v0 51
	syscall # ricevo il tipo di operazione che vuole svolgere
	beqz $a0 end # 0 -> fine
	li $s0 1
	beq $s0 $a0 pushmain # 1 -> push
	li $s0 2
	beq $s0 $a0 popmain # 2 -> pop
	li $s0 3
	beq $s0 $a0 printmain # 3 -> print
	j main # torna al loop infinito


pushmain:
	la $a0 msg2
	li $v0 55
	syscall
	la $a0 x
	li $v0 51
	syscall
	move $s1 $a0 # x -> $s1
	la $a0 y
	li $v0 51
	syscall
	move $s2 $a0 # y -> $s2 
	la $a0 angle
	li $v0 51
	syscall
	move $s3 $a0 # angle -> $s3
	
	move $a0 $s1
	move $a1 $s2
	move $a2 $s3
	jal push
	j main # finita la push
	
	
popmain:
	jal pop
	move $a0 $v0
	move $s0 $v1
	lw $s1 4($sp)
	addi $sp $sp 4
	li $v0 1
	syscall
	move $a0 $s0
	li $v0 1
	syscall
	move $a0 $s1
	li $v0 1
	syscall
	j main
	

printmain:
	jal print
	j main


end: 
	li $v0 10
	syscall
