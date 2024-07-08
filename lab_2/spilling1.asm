.text 
li $s0 1
li $t0 3
mult $s0 $t0 
mflo $s0

addi $sp $sp -4
sw $s0 ($sp)

li $s0 2
li $t0 3
mult $s0 $t0 
mflo $s0

addi $sp $sp -4
sw $s0 ($sp)

li $s0 3
li $t0 3
mult $s0 $t0 
mflo $s0

lw $t0 ($sp)
addi $sp $sp 4
add $s0 $s0 $t0

lw $t0 ($sp)
addi $sp $sp 4
add $s0 $s0 $t0