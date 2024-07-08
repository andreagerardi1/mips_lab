.data
msg1: .asciiz "Inserisci un numero intero:"

.text
# stampa il messaggio
la $a0 msg1
li $v0 4
syscall

# leggi l'intero
li $v0 5
syscall

# sposta l'intero nel registro e somma
move $a0 $v0
addi $a0 $a0 1

# stampa l'intero
li $v0 1
syscall