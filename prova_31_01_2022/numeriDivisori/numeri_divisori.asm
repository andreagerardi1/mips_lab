.text
.globl numero_divisori
numero_divisori:
	blez $a0 zero # se n <= 0 restituisco 0
	li $t0 0 # c := 0
	li $t1 1 # i := 1
	
loop:	
	bgt $t1 $a0 restituisci # se i > n restituisco
	div $a0 $t1 # n / i
	mfhi $t2 # rem(n/i)
	addi $t1 $t1 1 # i += 1
	bnez $t2 loop # se n non è divisibile per i passo alla prossima iterazione
	addi $t0 $t0 1 # c += 1
	j loop # prossima iterazione

zero:
	li $v0 0 # carico 0 come output
	jr $ra # restituisco il controllo al chiamante


restituisci:
	move $v0 $t0
	jr $ra