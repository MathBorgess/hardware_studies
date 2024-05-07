.data
s: .asciiz "not" # string contem resultado previo ("not")
eq: .asciiz "eq"
iso: .asciiz "iso"
esc: .asciiz "esc"
l1: .word 9
l2: .word 10
l3: .word 9

.text 
lw $s0, s
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

xor $t0, $s1, $s2 # xor bit a bit -> $t0 = 0 se l1 == l2; um numero qualquer caso contrario
xor $t1, $s1, $s3
xor $t2, $s2, $s3

beq $t0, $t2, EQ # equilatero se:  l1 = l2 ($t0 = 0) e l2 == l3 ($t2 = 0)

or $t3, $t1, $t2 # isosceles se: l1 == l2 ou l1 == l3 ou l2 == l3 
or $t3, $t3, $t0
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
    li	$v0, 10		
    syscall