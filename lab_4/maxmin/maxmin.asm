.text
.globl min max
min:
	move $t0 $a0 # $t0 contatore ciclo
	move $t1 $a1 # $t1 indirizzo di memoria corrente
	lw $t2 ($t1) # $t2 min relativo
	addi $t1 $t1 4
	addi $t0 $t0 -1
	j ciclomin
	
max:	
	move $t0 $a0 # $t0 contatore ciclo
	move $t1 $a1 # $t1 indirizzo di memoria corrente
	lw $t2 ($t1) # $t2 max relativo
	addi $t1 $t1 4
	j ciclomax


ciclomin:
	beq $t0 $zero fine
	lw $t3 ($t1) # $t3 nuovo elemento da confrontare
	addi $t1 $t1 4
	addi $t0 $t0 -1
	blt $t3 $t2 scambiamin
	j ciclomin

ciclomax:
	beq $t0 $zero fine
	lw $t3 ($t1) # $t3 nuovo elemento da confrontare
	addi $t1 $t1 4
	addi $t0 $t0 -1
	bgt $t3 $t2 scambiamax
	j ciclomax
	
scambiamin: 
	move $t2 $t3
	j ciclomin
	
scambiamax:
	move $t2 $t3 
	j ciclomax
	
fine: 
	move $v0 $t2
	jr $ra
