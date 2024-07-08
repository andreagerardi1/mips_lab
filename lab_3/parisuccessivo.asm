.data 
msg: .asciiz "inserisci un numero"

.text
la $a0 msg
li $v0 51
syscall

add $t0 $zero $a0 
li $t1 2
div $t0 $t1
mfhi $t1
addi $t0 $t0 1

bne $t1 $zero end
addi $t0 $t0 1

end:
move $a0 $t0
li $v0 1
syscall