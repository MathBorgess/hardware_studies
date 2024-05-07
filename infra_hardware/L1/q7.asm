.data 
n: .word 47
m: .word 7
RESULT: .word 0
REMAINDER: .word 0

.text 
lw $t0, n # t0 = 47
lw $t1, m # t1 = 7
li $t2, 0 #quociente
li $t3, 1 #sinal
li $t4, -1 
la $s0, RESULT
la $s1, REMAINDER

# se n for menor que zero, multiplicaremos por -1 o sinal e o número
# se m for menor que zero, multiplicaremos por -1 o sinal e o número
# pois a divisão nesse código deverá ser feita entre números positivos
# assim, se apenas um número for negativo, o sinal do resultado será negativo
# e se ambos forem negativos, o sinal voltará a ser positivo

bgt $t0, 0, if
mult $t3, $t4
mflo $t3
mult $t0, $t4
mflo $t0

if:

bgt $t1, 0, while
mult $t3, $t4
mflo $t3
mult $t1, $t4
mflo $t1

while: #faz sucessivas subtrações até o divisor ($t1) ficar menor que o dividendo ($t0) 
bgt $t1, $t0, out	# se $t1 > $t0 then goto out
sub $t0, $t0, $t1 
addi $t2, $t2, 1 # aumenta o quociente 
j while 

out:
mult $t2, $t3 #multiplicando o quociente pelo sinal
mflo $t2 #pegando da memória 
sw $t2, 0($s0) # armazena RESULT
sw $t0, 0($s1) # armazena REMAINDER (o que sobrou do dividendo)