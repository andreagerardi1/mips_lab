.data
msg: .asciiz "inserisci un numero"
punto: .asciiz " resto "

.text 
.globl main
main:
la $a0 msg #inserimento del primo numero dall'utente
li $v0 51
syscall
move $s0 $a0

la $a0 msg #inserimento del secondo numero dall'utente
syscall
move $s1 $a0

la $a0 msg #inserimento dell'operatore dall'utente
syscall
move $s2 $a0

move $a0 $s0
move $a1 $s1 #setto i parametri come argomenti della funzione
move $a2 $s2

jal Elaboratore

move $a0 $v0
li $v0 1
syscall

bltz $v1 end
la $a0 punto
li $v0 4
syscall
move $a0 $v1
li $v0 1
syscall

end:
li $v0 10 
syscall