.data 
msg: .asciiz "codice operativo non valido"

.text
.globl Elaboratore
Elaboratore: 
li $t3 1
beq $a2 $t3 somma
li $t3 2
beq $a2 $t3 differenza
li $t3 3
beq $a2 $t3 moltiplicazione
li $t3 4
beq $a2 $t3 divisione
j errore

somma:
add $v0 $a0 $a1
addi $v1 $zero -1
jr $ra

differenza:
sub $v0 $a0 $a1
addi $v1 $zero -1
jr $ra

moltiplicazione:
mult $a0 $a1
addi $v1 $zero -1
mflo $v0
jr $ra

divisione:
div $a0 $a1
mflo $v0 
mfhi $v1
jr $ra

errore:
la $a0 msg
li $v0 4
syscall
addi $v0 $zero -1
addi $v1 $zero -1
jr $ra
