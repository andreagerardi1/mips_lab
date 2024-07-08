.data 
A: .word 2 3 0 2 7
n: .word 5

.text
.globl main A n
main:
	la $s0 A # indirizzo primo ele dell'array
	la $s1 n # indirizzo variabile n
	lw $s1 ($s1) # contenuto di n
	addi $s1 $s1 -1 # ultimo indice possibile dell'array
	li $s2 0 # i := 0
	
loop:	
	beq $s1 $s2 fine # termina se i = n-2
	lw $a0 ($s0) # i-esimo elemento
	lw $a1 4($s0) # (i+1)-esimo elemento
	jal pippo # chiamata a pippo
	sw $v0 ($s0) # carico nell'i-esimo el il risultato di pippo
	addi $s0 $s0 4 # elemento successivo dell'array
	addi $s2 $s2 1 # i += 1
	j loop # loop

fine:
	li $v0 10
	syscall