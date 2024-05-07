.data
s: .asciiz "not" # string contem resultado previo ("not")
.align 2
eq: .asciiz "eq"
.align 2
iso: .asciiz "iso"
.align 2
esc: .asciiz "esc"
.align 2
l1: .word 9
l2: .word 7
l3: .word 9

.text 
la $s0, s
lw $s1, l1
lw $s2, l2
lw $s3, l3

add $t0, $s1, $s2
add $t1, $s1, $s3
add $t2, $s2, $s3

slt	$t0, $s3, $t0  # $t0 = (l3 < l1+l2) ? 1 : 0
slt	$t1, $s2, $t1  # $t1 = (l2 < l1+l3) ? 1 : 0
slt	$t2, $s1, $t2  # $t0 = (l1 < l2+l3) ? 1 : 0

and	$t1, $t1, $t2	# $t1 = l2<l1+l3 & l1<l2+l3
and $t0, $t1, $t0   # $t0 = $t1 & l3<l2+l3
beq	$t0, $zero, END	# s = not

seq $t0, $s1, $s2 # $t0 = 1 se l1 == l2; 0 caso contrario
seq $t1, $s1, $s3
seq $t2, $s2, $s3

and $t3, $t0, $t1
and $t3, $t3, $t2
bne $t3, $zero, EQ # equilatero se: ($t3 = 1) l1 == l2 e l1 == l3 e l2 == l3

or $t3, $t0, $t1 # isosceles se: ($t3 = 1) l1 == l2 ou l1 == l3 ou l2 == l3 
or $t3, $t3, $t2
bne $t3, $zero, ISO

lw $s0, esc # escaleno
sw $s0, s 
j END

EQ:
    lw $s0, eq
    sw $s0, s
    j END
ISO:
    lw $s0, iso
    sw $s0, s
    j END
END:
    li $v0, 4
    la $a0, s
    syscall
    li	$v0, 10		
    syscall