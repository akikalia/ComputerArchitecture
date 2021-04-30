.data
.text
.globl rects

rects:
	jal 	readint
	move 	$t1, $v0	# Read S
	li	$t2, 0		# res = 0
	li 	$t3, 1		# i = 1
	move	$t4, $t1        # max = s
	
	
loop:
	bge 	$t3, $t4, printres	# if i >= max stop loop
	
	jal 	compare			# 
	
	addi 	$t5, $t3, 1		#i++
	move	$t3, $t5
	
	j	loop		# Next iteration	

compare: 			#if s % i == 0 then res++; max = s / i
	div 	$t5, $t1, $t3	# s / i		
	mul 	$t6, $t3, $t5	# i * (s / i)
	bne 	$t6, $t1, return # if (i * (s / i)) != s return
	addi	$t7, $t2, 1	# res++
	move 	$t2, $t7	# res++
	move 	$t4, $t5 	# max = s/i
	jr 	$ra		# Return
	
return: 
	jr $ra
	
printres:
	li 	$v0, 1		# Print res
	move	$a0, $t2	
	syscall
	
	li	$v0, 10		# Exit
	syscall
	
readint:
	li 	$v0, 5		# Read integer
	syscall
	
	jr 	$ra		# Return

