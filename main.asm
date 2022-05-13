.text

main:
	la $s1, chain1
	la $t0, chain1
	la $t1, chain1
	addi $t1, $t1, 40
	addi $t7, $t7, 1
	addi $t8, $t8, 0
	addi $t9, $t9, 1
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	b nucleot

next:
	beq $t7, 10, save
	addi $t7, $t7, 1
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	b nucleot

rightchange:
	beq $t9, 4, leftchange
	addi $t9, $t9, 1
	addi $t7, $0, 1
	mul $t5,$t9, 40
	add $t1, $s1, $t5
	mul $t5,$t8,40
	add $t0, $s1, $t5
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	b nucleot

leftchange:
	beq $t8, 3, finish
	addi $t8, $t8, 1
	addi $t9, $t8, 1
	mul $t5,$t8,40
	add $t0, $s1, $t5
	mul $t5, $t9, 40
	add $t1, $s1, $t5
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	b nucleot

nucleot:
	beq $t2, 65, nucA
	beq $t2, 84, nucT
	beq $t2, 67, nucC
	beq $t2, 71, nucG
	b finish

nucA:
	beq $t3, 84, next
	b rightchange

nucT:
	beq $t3, 65, next
	b rightchange

nucC:
	beq $t3, 71, next
	b rightchange

nucG:
	beq $t3, 67, next
	b rightchange

save:
	addi $s4, $t8, 1
	addi $s5, $t9, 1
	jr $ra

finish:
	addi $s4, $s4, 0 
	addi $s5, $s5, 0
	jr $ra

.data

chain1: .word 'A', 'T', 'G', 'A', 'T', 'G', 'A', 'T', 'G', 'C'
chain2: .word 'T', 'C', 'G', 'C', 'G', 'C', 'T', 'A', 'G', 'C'
chain3: .word 'C', 'G', 'T', 'C', 'G', 'T', 'A', 'A', 'A', 'C'
chain4: .word 'T', 'A', 'T', 'T', 'T', 'A', 'C', 'G', 'A', 'A'
chain5: .word 'T', 'A', 'C', 'T', 'A', 'C', 'T', 'A', 'C', 'G'