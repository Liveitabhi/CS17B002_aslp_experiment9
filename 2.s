.data
	# Matrix 1
	a1: .float 7.6, 9.2
	a2: .float 13.6, 12.5

	# MAtrix 2
	b1: .float 17.2, 22.1
	b2: .float 4.8, 19.3

	#Matrix 3
	c1: .space 2
	c2: .space 2
.text

main: 	
	la $s0,a1
	la $s1,a2
	la $s2,b1
	la $s3,b2
	la $s4,c1
	la $s5,c2
	li $t0,2
	li $t1,2
	li $t2,2
	jal ROW_1					# first row addition

	li $v0,10
	syscall

# First row
ROW_1:
	beq $t0,$zero,L2			# condition for loop end
	l.s $f0,($s0)				# load word of first matrix
	l.s $f1,($s2)				# load word of second matrix
	add.s $f2,$f0,$f1			# performing addition
	s.s $f2,($s4)				# store word in third matrix
	
	addi $s0,$s0,4				# first matrix next element address 
	addi $s2,$s2,4				# second matrix next element address 
	addi $s4,$s4,4				# third matrix next address 

	addi $t0,$t0,-1				# update counter
	j ROW_1

# Second row
ROW_2: 
	beq $t1,$0,end				# condition for loop end
	l.s $f0,($s1)				# load word of first matrix
	l.s $f1,($s3)				# load word of second matrix
	add.s $f2,$f0,$f1			# performing addition
	s.s $f2,($s5)				# store word in third matrix

	addi $s5,$s5,4				# first matrix next element address 
	addi $s1,$s1,4				# second matrix next element address 
	addi $s3,$s3,4				# third matrix next address 
	
	addi $t1,$t1,-1				# update counter
	j ROW_2
end:
	j $ra