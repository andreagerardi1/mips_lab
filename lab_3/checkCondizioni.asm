.data 
msg: .asciiz "inserisci un numero"
msg2: .asciiz "risultato"
error: .asciiz "errore"

.text
la $a0 msg 
li $v0 51
syscall
move $t0 $a0 #a

la $a0 msg
li $v0 51
syscall
move $t1 $a0 #b

la $a0 msg
li $v0 51
syscall
move $t2 $a0 #c

blt $t0 $t1 errore
beq $t2 $zero errore
add $t0 $t0 $t1
mult $t2 $t0
mflo $a1

la $a0 msg2
li $v0 56
syscall
j end

errore:
la $a0 error
li $v0 4
syscall

end: