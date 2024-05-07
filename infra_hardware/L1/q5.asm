.data
	nullTerminator: .asciiz "\n"
	str: .asciiz ""
.text


li $v0, 8
la $a0, str
li $a1, 1024
syscall

la $t0, nullTerminator
lb $s1, 0($t0)

move $s0, $a0
move $t0, $s0

move $s2, $gp

LOOP_0: lb $t1, 0($t0)
	beq $t1, $s1, FINISH
	bgt $t1, 90, SKIP
	
	sb $t1, 0($gp)
	addi $gp, $gp, 1
	
	SKIP: addi $t0, $t0, 1
	j LOOP_0
	
FINISH: sb $s1, 0($gp)
addi $gp, $gp, 1

li $v0, 4
move $a0, $s2
syscall

li $v0, 10
syscall