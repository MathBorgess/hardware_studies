.data
    a: .word 1, 4, 5, 7, 9, 10, 15, 21 
    n: .word 5
    l: .word 0
    r: .word 7

.text
    la $a0, a # end base de 'a' em $a0
    lw $a1, n
    lw $s0, l
    lw $s2, r

    # ($s1) c = (l+r)//2 
    add $s1, $s2, $s0
    srl	$s1, $s1, 1 

# chamada inicial    
main:
	jal bs
	j EXIT
	
# Definição da função bs
bs:
    addi $sp, $sp, -16   
    sw $ra, 12($sp)    # Salva o endereço de retorno 
    sw $s0, 8($sp)    # Salva 'l' 
    sw $s1, 4($sp)    # Salva 'c' 
    sw $s2, 0($sp)    # Salva 'r' 
    
    # Procedimento de bs 

    # (achou valor) if a[c] == n: return 1
    sll $t0, $s1, 2   # Multiplica c por 4 para obter o deslocamento no array
    add $t0, $a0, $t0    # Calcula o endereço de a[c]
    lw $t0, 0($t0)    # Carrega o valor de a[c] em $t0
    bne $t0, $a1, stop_cond    # Se a[c] == n ($a1) retorne 1, va para stop_cond caso contrario
    
    li $v0, 1    # Retorna 1
    move $v1, $s1 # carrega indice
    addi $sp, $sp, 16    
    jr $ra    

stop_cond:
    # if l>=c or r<=c: return 2
    slt	$t1, $s0, $s1 # Se l < c		
    slt $t2, $s1, $s2 # e se c < r
    beq $t1, $t2, greater_than # continua em greater_than, retorna 2 caso contrario
    
    li $v0, 2    # Retorna 2
    addi $sp, $sp, 16
    jr $ra
    
greater_than: # if a[c]<n: l = c+1
    blt	$a1, $t0, smaller_than # n<a[c] e nao executa as proximas duas linhas   
    addi $s0, $s1, 1    # l = c + 1 
    j continue_bs    # proximo passo

smaller_than:
    addi $s2, $s1, -1    # r = c - 1
    
continue_bs:
    # c = (l + r) // 2
    add $s1, $s0, $s2    
    srl $s1, $s1, 1   
    jal bs    # Chamada recursiva para bs
    lw $ra, 12($sp)    # Restaura o endereço de retorno
    lw $s0, 8($sp)    # Restaura 'l'
    lw $s1, 4($sp)    # Restaura 'c'
    lw $s2, 0($sp)    # Restaura 'r'
    addi $sp, $sp, 16    
    jr $ra    # Retornar ao chamador

EXIT: