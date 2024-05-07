# 'a', 'n', 'r', 'l' e 'c' estão definidos em algum lugar da memória

.data
    a: .word 1, 4, 7, 9, 10, 15, 21 # pode alterar dependendo do teste
    n: .word 5
    l: .word 0
    r: .word 6 # indice maximo do array

.text
    la $a0, a # end base de 'a' em $a0
    lw $a1, n
    lw $s0, l
    lw $s2, r

    # ($s1) c = (l+r)//2 
    add $s1, $s2, $s0
    srl	$s1, $s1, 1 # 
    
# Definição da função bs
bs:
    addi $sp, $sp, -16   # Alocar espaço na pilha para armazenar os registros $ra, $s0 e $s1, $s2
    sw $ra, 12($sp)    # Salva o endereço de retorno 
    sw $s0, 8($sp)    # Salva 'l' 
    sw $s1, 4($sp)    # Salva 'c' 
    sw $s2, 0($sp)    # Salva 'r' 
    
    # Procedimento de bs 

    # if l>=c or r<=c: return 2
    bge $s0, $s1, return_2    # Se l >= c, retorne 2
    bge $s1, $s2, return_2    # Se r <= c, retorne 2

    return_2:
        li $v0, 2    # Retorna 2
        j done

    # if a[c] == n: return 1
    sll $t0, $s1, 2    # Multiplica c por 4 para obter o deslocamento no array
    add $t0, $a0, $t0    # Calcula o endereço de a[c]
    lw $t0, 0($t0)    # Carrega o valor de a[c] em $t0
    beq $t0, $a1, return_1    # Se a[c] == n ($a1) , retorne 1
    
    return_1:
        li $v0, 1    # Retornar 1
        move $v1, $s1
        j done

    # if a[c]<n: l = c+1
    slt	$t0, $t0, $a1		# Se n > a[c], vá para greater_than
    bne $t2, $t4, greater_than    
    addi $s2, $s1, -1    # r = c - 1
    j continue_bs    # próxima chamada
    
greater_than:
    addi $s0, $s1, 1    # l = c + 1
    j continue_bs    # próxima chamada

continue_bs:
    # c = (l + r) // 2
    add $s1, $s0, $s2    
    srl $s1, $s1, 1    # Right shift para dividir por 2
    jal bs    # Chamada recursiva para bs

    lw $ra, 12($sp)    # Restaura o endereço de retorno
    lw $s0, 8($sp)    # Restaura 'l'
    lw $s1, 4($sp)    # Restaura 'c'
    lw $s2, 0($sp)    # Restaura 'r'
    addi $sp, $sp, 16    
    jr $ra    # Retornar ao chamador

done: