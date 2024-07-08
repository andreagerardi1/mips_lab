.data
a: .word 7
s: .asciiz "Fine"
V: .word 1 1 1 1 1

.text
main: 
	la $s0 a # indirizzo di a
	lw $s2 ($s0) # contenuto di a
	li $s0 0 # i inizializzato a 0
	li $s1 4 # valore finale di i
	la $s3 V # inidirizzo del primo elemento dell'array
	
loop:
	bgt $s0 $s1 fine # se i è maggiore di quattro termina
	add $s4 $s2 $s0 # somma il contenuto di a con i
	sw $s4 ($s3) # salva la somma nell'i-esima posizia dell'array
	addi $s3 $s3 4 # next elemento dell'array
	addi $s0 $s0 1 # i = i+1
	j loop

fine: 
	la $s0 a # indirizzo di a
	addi $s3 $s3 -8 # indirizzo penultimo elemento array
	sw $s3 ($s0) # salva nella variabile l'indirizzo del penultimo el
	la $a0 s # indirizzo stringa s
	li $v0 4 # syscall stampa stringa
	syscall
	li $v0 10 # syscall termina programma
	syscall