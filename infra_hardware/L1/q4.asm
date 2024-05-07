.data 
   mult_const: .word 1013904223
   add_const: .word 1664525
   newline: .asciiz "\n"

.text
    li $v0, 41
    syscall
    move $s0, $a0

    la $t0, mult_const
    lw $s1, 0($t0)
    la $t0, add_const
    lw $s2, 0($t0)
    
    move $t0, $0
    addi $t1, $0, 10
    LOOP_0: blt $t0, $t1, LOOP_STATEMENT_0
    li $v0, 10
    syscall
    LOOP_STATEMENT_0:   mulu $t2, $s0, $s1
    			addu $s0, $t2, $s2
    			move $a0, $s0
    			
    			addi $t0, $t0, 1
    			li $v0, 36
    			syscall
    			li $v0, 4     	      # you can call it your way as well with addi 
			la $a0, newline       # load address of the string
			syscall
    			j LOOP_0
    