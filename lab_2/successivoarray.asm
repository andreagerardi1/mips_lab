.data 
arr: .space 8
msg: .asciiz "inserisci un numero: "
spazio: .asciiz " "

.text 
la $a0 msg # stampa il messaggio
li $v0 4
syscall

li $v0 5 # leggi l'intero
syscall


move $s1 $v0 # n e n+1, li salvo in memoria
addi $s2 $s1 1
la $s3 arr
sw $s1 ($s3)
sw $s2 4($s3)

move $a0 $s1 # stampa il primo
li $v0 1
syscall

la $a0 spazio # stampa spazio
li $v0 4
syscall

move $a0 $s2 # stampa il secondo
li $v0 1
syscall