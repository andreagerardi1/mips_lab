.text
.globl push pop print

push:
	# ricevo tre argomenti in input
	move $t0 $a0
	move $t1 $a1
	move $t2 $a2
	# alloco nello heap lo spazio per 4 parole
	li $a0 16
	li $v0 9
	syscall
	move $t3 $v0 # $t3 contiene l'indirizzo dei nuovi byte allocati
	# riempio con gli input le prime tre posizioni allocate 
	sw $t0 0($t3)
	sw $t1 4($t3)
	sw $t2 8($t3)
	# se "stack" ha un valore positivo, inizializzo la quarta posizione a *stack
	la $t0 stack
	lw $t1 ($t0)
	li $t2 -1
	sw $t2 12($t3)
	bltz $t1 primo_elemento
	sw $t1 12($t3)
primo_elemento:
	# aggiorno "stack" all'inidirizzo del nuovo elemento
	sw $t3 ($t0)
	jr $ra


pop:
	# se lo stack è vuoto restituisce 0
	la $t0 stack
	lw $t1 ($t0)
	bgtz $t1 non_vuoto
	li $v0 0
	li $v1 0
	sw $v0 ($sp)
	addi $sp $sp -4
	jr $ra
non_vuoto:	
	# se lo stack non è vuoto 
	# - salva le 3 informazioni necessarie
	lw $t2 ($t1) # $t2 contiene x
	lw $t3 4($t1) # $t3 contiene y
	lw $t4 8($t1) # $t4 contiene angle
	lw $t5 12($t1) # $t5 contiene *next
	# - aggiorna lo stack al *next dell'elemento
	sw $t5 ($t0)
	# - rimuovo con sbrk negativa 4 parole dallo heap
	li $a0 -16
	li $v0 9
	syscall
	# - restituisco i 3 elementi contenuti
	move $v0 $t2
	move $v1 $t3
	sw $t4 ($sp)
	addi $sp $sp -4
	jr $ra

print:
	jr $ra
