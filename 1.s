.data
	a1 : .float 7.5
	a2 : .float 6.1
	b1 : .double 12.4
	b2 : .double 6.6

.text
	main:
	
l.s $f0, a1				# load ist float
l.s $f1, a2				# load sec float
add.s $f3,$f1,$f0 		# add float
sub.s $f4,$f1$f0 		# subtrac float
mul.s $f5,$f1$f0 		# multiply float
div.s $f6,$f1,$f0 		# divide float


l.d $f7,b1				# load ist double
l.d $f8,b2				# load sec double
add.d $f9,$f7,$f8		# add double
sub.d $f10,$f7,$f8		# subtact double
mul.d $f11,$f7,$f8		# multiply double
div.d $f12,$f7,$f8		# divide double
	

li $v0,10				# terminate
syscall