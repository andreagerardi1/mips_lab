.data
arr: .word 2 4 6 8 10 12 14 16 18 20 22 24 26
msg: .asciiz "inserisci un numero"
err: .asciiz "comando non riconosciuto"

.text 
la $a0 msg
li $v0 51
syscall
move $t0 $a0 

la $a0 msg
li $v0 51
syscall
move $t1 $a0 

la $a0 msg
li $v0 51
syscall
move $t2 $a0 
la $s1 arr

beq $t2 $zero zero
li $t3 1
beq $t2 $t3 uno
li $t3 -1
beq $t2 $t3 meno
j errore

zero:
li $t3 4
mult $t0 $t3
mflo $t3 
add $t3 $t3 $s1 # in $t3 indirizzo a-esima parola dell'array
lw $s2 ($t3)

li $t4 4
mult $t1 $t4
mflo $t4 
add $t4 $t4 $s1 # in $t4 indirizzo della b-esima parola
lw $s3 ($t4)

sw $s2 ($t4)
sw $s3 ($t3)
j end

uno:
li $t3 4
mult $t0 $t3
mflo $t3 
add $t3 $t3 $s1 # in $t3 indirizzo a-esima parola dell'array
lw $s2 ($t3)

li $t4 4
mult $t1 $t4
mflo $t4 
add $t4 $t4 $s1 # in $t4 indirizzo della b-esima parola
sw $s2 ($t4)
j end

meno:
li $t3 4
mult $t0 $t3
mflo $t3 
add $t3 $t3 $s1 # in $t3 indirizzo a-esima parola dell'array

li $t4 4
mult $t1 $t4
mflo $t4 
add $t4 $t4 $s1 # in $t4 indirizzo della b-esima parola
lw $s2 ($t4)
sw $s2 ($t3)
j end

errore:
la $a0 err
li $v0 4
syscall

end: