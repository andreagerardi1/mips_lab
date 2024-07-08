.text
.globl maiuscole
maiuscole:
	move $t0 $a0
loop:
	lb $t1 ($t0)
	beq $t1 $zero ritorna
	

ritorna:
		