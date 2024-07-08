# richiedere l'inserimento di un intero NUM

# estrarre un numero casuale R nel range [-NUM,NUM]

# fai la somma tra NUM e R

# mostrare attraverso una finestra di dialogo il nuovo credito

.data
msg1: .asciiz "inserisci un numero intero"
msg2: .asciiz "credito aggiornato"

.text 

la $a0 msg1
li $v0 51
syscall

move $a1 $a0
sub $a0 $zero $a0

li $v0 42
syscall
