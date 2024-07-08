.text
.globl branchy
branchy: 
	bgt $a0 $a1 t1 # se a è maggiore di b
	blt $a0 $a1 t2 # se a è minore di b
	# se a e b sono uguali
	addi $v0 $ra -8 # $ra -8 è l'indirizzo dell'istruzione precedente a quella che ha chiamato la procedura
	jr $ra # ritorna al chiamante

t1: # se a è maggiore di b
	move $v0 $a2 # carico t1 come output
	jr $ra # ritorna al chiamante

t2: # se a è minore di b
	move $v0 $a3 # carico t2 come output
	jr $ra # ritorna al chiamante