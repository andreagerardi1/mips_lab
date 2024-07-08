.data 
msg: .asciiz "insert a number"
msg2: .asciiz "break\n"

.text
la $a0 msg
li $v0 51
syscall
move $t0 $a0 # V

la $a0 msg
syscall
move $t1 $a0 # N

li $t2 1 # i
move $s1 $t0 # sum

loop:
beq $t2 $t1 stampasomma
mult $t2 $t2
mflo $t3 # i * i
div $t3 $t0 
mfhi $t4 # (i * i) % V
beq $t4 $zero interrompi
add $s1 $s1 $t3 # sum += i*i
addi $t2 $t2 1
j loop

interrompi:
la $a0 msg2
li $v0 4
syscall

stampasomma:
move $a0 $s1
li $v0 1
syscall