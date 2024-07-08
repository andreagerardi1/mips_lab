.text
.globl emerge2
emerge2:
	blt $a0 $zero iob # i < 0 : index out of bounds
	blt $a1 $zero iob # j < 0 : index out of bounds
	addi $t0 $a3 -1 # k-1, ultimo indice dell'array
	bgt $a0 $t0 iob # i > k-1 : index out of bounds
	bgt $a1 $t0 iob # j > k-1 : index out of bounds
	
	beq $a0 $a1 azzera_i # se i = j allora "emerge" solo un elemento
	

scambia_i:
	beq $a0 $zero incrementa_i # quando i = 0 termino il ciclo e incremento i
	li $t0 4
	mul $t1 $a0 $t0 # offset per i in parole
	add $t2 $t1 $a2 # indirizzo del i-esimo elemento
	lw $t3 ($t2) # elemento i
	lw $t4 -4($t2) # elemento i-1
	sw $t3 -4($t2) # salvo elemento i in i-1
	sw $t4 ($t2) # salvo elemento i-1 in i
	addi $a0 $a0 -1 # deceremento i
	j scambia_i # nuova iterazione di scambia_i

incrementa_i:
	li $a0 1 # i = 1
	j scambia_j # non voglio che j arrivi fino alla posizione 0
	
azzera_i:
	li $a0 0 # i = 0, considero un indice unico

scambia_j:
	beq $a1 $a0 ritorna # quando j = 0 termino
	li $t0 4
	mul $t1 $a1 $t0 # offset per j in parole
	add $t2 $t1 $a2 # indirizzo del j-esimo elemento
	lw $t3 ($t2) # elemento j
	lw $t4 -4($t2) # elemento j-1
	sw $t3 -4($t2) # salvo elemento j in j-1
	sw $t4 ($t2) # salvo elemento j-1 in j
	addi $a1 $a1 -1 # deceremento j
	j scambia_j # nuova iterazione di scambia_j
	

ritorna:
	li $v0 1 # carico 1 come output
	jr $ra # ritorno al chiamante

	
iob:
	li $v0 0 # carico 0 come output
	jr $ra # ritorno al chiamante