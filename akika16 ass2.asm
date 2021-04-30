.data
.text
.globl reduce

reduce:
	jal 	readint
	move 	$t1, $v0	# Read t
	jal 	readint
	move 	$t2, $v0	# Read b
	li 	$t3, 1		# flag reduced = true
	
loopreduced:
	beqz 	$t3, printres	# if reduced == false return
	li 	$t3, 0		# flag reduced = true
	li	$t4, 2		# i = 2
	move 	$t5, $t1	# max = t
	
loop:
	bgt 	$t4, $t5, loopreduced	# if i >= max stop loop
	
	jal 	compareone			# 
	
	addi 	$t6, $t4, 1		#i++
	move	$t4, $t6
	
	j	loop		# Next iteration	

compareone: 			#if t % i == 0 then b % i == 0...
	div 	$t6, $t1, $t4	# t / i		
	mul 	$t7, $t4, $t6	# i * (b / i)
	bne 	$t7, $t1, return # if (i * (b / i)) != s return
	
	div 	$t7, $t2, $t4	# b / i		
	mul 	$t8, $t4, $t7	# i * (b / i)
	bne 	$t8, $t2, return # if (i * (b / i)) != s return
	
	move 	$t1, $t6 # t = t / i
	move 	$t2, $t7 # b = b / i
	
	li 	$t3, 1 # reduced  = true
	 
	j 	loopreduced		# Return
	
return: 
	jr $ra
	
printres:
	li 	$v0, 1		# Print res
	move	$a0, $t1	
	syscall
	
	li $a0, 32
	li $v0, 11  # syscall number for printing character
	syscall
	
	li 	$v0, 1		# Print res
	move	$a0, $t2	
	syscall
	
	li	$v0, 10		# Exit
	syscall
	
readint:
	li 	$v0, 5		# Read integer
	syscall
	
	jr 	$ra		# Return

