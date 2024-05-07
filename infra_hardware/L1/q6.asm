.data 
	msgA: .asciiz "Valor a: "
	msgB: .asciiz "Valor b: "
 	msgMod: .asciiz "O valor de a mod b é "
 	msgDivZero: .asciiz "Não é possível fazer divisão por 0. Programa finalizado."
.text  
	
	.main:
		la $a0, msgA
		jal printMsg
		jal leituraValor
		
		move $t0, $v0
		
		la $a0, msgB
		jal printMsg
		jal leituraValor
		
		move $a0, $t0
		move $a1, $v0
		move $a2, $a0
		
		jal retornaMod
		jal encerrarPrograma
		
	printMsg: #recebe string em $a0
		li $v0, 4
		syscall 
		jr $ra
		
	imprimeInteiro:
		li $v0, 1
		syscall
		jr $ra
	
	leituraValor: #armazena em $v0
		li $v0, 5
		syscall
		jr $ra

	encerrarPrograma:
		li $v0, 10
		syscall 
	#função da condição de a ser negativo
	printMod:
		move $t1, $a0
		add $t2, $t1, $a1
		la $a0, msgMod
		jal printMsg
		move $a0, $t2
		jal imprimeInteiro
		jal encerrarPrograma

	erroZero: #divisao por zero
		la $a0, msgDivZero
		jal printMsg
		jal encerrarPrograma
	recebeResultado:
		li $v1, -1
		jal encerrarPrograma	
	retornaMod: #retorna o mod em $v0
		blt $a2, $zero, recebeResultado
		beq $a1, $zero, erroZero
		blt $a0, $zero, printMod
		sub $t0, $a0, $a1
		move $a0, $t0
		jal retornaMod
		jr $ra