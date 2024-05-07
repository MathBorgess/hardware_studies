

.data
	
	
.text    #t0 guardará o resultado
	move $t0, $zero
	
	li $v0,5
	syscall 
	move $a0, $v0 
	
	li $v0,5
	syscall 
	move $a1, $v0
	
	beq $a1,$a0, else
	# se a < b, t0 = 1
	slt $t0, $a0, $a1
	beq $t0, $zero, amaiorb

	add $t0, $a0, $zero

	li $v0, 1
	move $a0, $t0
	syscall 
	
	j end
	
amaiorb:
	 add $t0, $a1, $zero
	 
	 li $v0, 1
	 move $a0,$t0
	 syscall 
	 
	 j end

else:
	add $t0, $a0, $a1
	
	li $v0, 1
	move $a0, $t0
	syscall 
	
	j end

end:
	#encerra o programa
	li $v0, 10          
	syscall