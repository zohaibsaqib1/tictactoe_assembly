.data
grid: .asciiz "0123456789"
header: .asciiz "Tic Tac Toe!\n"
line: .asciiz "\n"
space: .asciiz " "
vertical: .asciiz " | "
horizontal: .asciiz "__________\n"
extra: .asciiz " \n"

charSelect: .asciiz "Choose your character. X will go first, while O will go second. Enter 1 for X and 0 for O: "
xWin: .asciiz "X Wins!"
oWin: .asciiz "O Wins!"
draw: .asciiz "Draw!"

userMove: .asciiz "Select a spot on the board that hasn't been taken up yet (Accepted values: 1 - 9): "
compMove: .asciiz "Computer's turn ongoing...\n"
lessInvalidMsg: .asciiz "Cannot choose a number less than 1.\n"
greaterInvalidMsg: .asciiz "Cannot choose a number greater than 9.\n"
takenUpInvalid: .asciiz "This spot is taken. Choose a different spot.\n"
x: .byte 'X'
o: .byte 'O'

.text
# Below is the board setup
main:
# Below is the game being set up
li $v0, 4 # Prepare to output a string
la $a0, header # Load header to be output
syscall

li $v0, 4 # Prepare to output a string
la $a0, charSelect # Load charSelect to be output
syscall

li $v0, 5 # Prepare to read in an integer
syscall

move $t0, $v0
sgt $t1, $t0, $zero # If player chose X, t1 = 1; else, t1 = 0#
bne $t1, $zero, playerX
beq $t1, $zero, playerO

playerX:
# Keep looping through while game is continuing
#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

# User input
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal userInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t0, x
sb $t0, 0($v0)

# Computer input
li $v0, 4
la $a0, compMove
syscall
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal compInputO
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t1, o
sb $t1, 0($v0)

#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

# User input
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal userInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t0, x
sb $t0, 0($v0)

# Computer input
li $v0, 4
la $a0, compMove
syscall
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal compInputO
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t1, o
sb $t1, 0($v0)

#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

# User input
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal userInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t0, x
sb $t0, 0($v0)

#Check if user won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerX
lw $ra, 4($sp)
addiu $sp, $sp, 4

# Computer input
li $v0, 4
la $a0, compMove
syscall
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal compInputO
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t1, o
sb $t1, 0($v0)

#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

#Check if computer won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerO
lw $ra, 4($sp)
addiu $sp, $sp, 4

# User input
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal userInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t0, x
sb $t0, 0($v0)

#Check if user won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerX
lw $ra, 4($sp)
addiu $sp, $sp, 4

# Computer input
li $v0, 4
la $a0, compMove
syscall
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal compInputO
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t1, o
sb $t1, 0($v0)

#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

#Check if computer won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerO
lw $ra, 4($sp)
addiu $sp, $sp, 4

# User input
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal userInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t0, x
sb $t0, 0($v0)

#Check if user won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerX
lw $ra, 4($sp)
addiu $sp, $sp, 4

# If no one has won yet, its a tie
jal endGameDraw

#-----------------------------------------------------------------------------------------------------
#|                                                                                                    |
#-----------------------------------------------------------------------------------------------------
playerO:
# Keep looping through while game is continuing

# Computer input
li $v0, 4
la $a0, compMove
syscall
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal compInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t1, x
sb $t1, 0($v0)

#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

# User input
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal userInputO
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t0, o
sb $t0, 0($v0)

# Computer input
li $v0, 4
la $a0, compMove
syscall
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal compInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t1, x
sb $t1, 0($v0)

#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

 #User input
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal userInputO
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t0, o
sb $t0, 0($v0)

# Computer input
li $v0, 4
la $a0, compMove
syscall
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal compInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t1, x
sb $t1, 0($v0)

#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

#Check if computer won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerX
lw $ra, 4($sp)
addiu $sp, $sp, 4

# User input
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal userInputO
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t0, o
sb $t0, 0($v0)

#Check if user won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerO
lw $ra, 4($sp)
addiu $sp, $sp, 4

# Computer input
li $v0, 4
la $a0, compMove
syscall
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal compInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t1, x
sb $t1, 0($v0)

#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

#Check if computer won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerX
lw $ra, 4($sp)
addiu $sp, $sp, 4

#User input
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal userInputO#
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t0, o
sb $t0, 0($v0)

#Check if user won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerO
lw $ra, 4($sp)
addiu $sp, $sp, 4

# Computer input
addiu $sp, $sp, -4
lw $ra, 4($sp)
jal compInputX
lw $ra, 4($sp)
addiu $sp, $sp, 4
lb $t1, x
sb $t1, 0($v0)

#print board
addiu $sp $sp, -4
sw $ra, 4($sp)
jal Board
lw $ra, 4($sp)
addiu $sp, $sp, 4

#Check if computer won
addiu $sp, $sp, -4
sw $ra, 4($sp)
jal checkWinnerX
lw $ra, 4($sp)
addiu $sp, $sp, 4

# If no one has won yet, its a tie
jal endGameDraw


#----------------------------------------------------------------------------------------------------
#|                                                                                                   |
#----------------------------------------------------------------------------------------------------
Board:
	la $k0, grid 
	addi $s0, $zero, 1
	addi $s3, $zero, 88
	addi $s4, $zero, 79

	lb $t0, 1($k0)
	lb $t1, 2($k0)
	lb $t2, 3($k0)
	lb $t3, 4($k0)
	lb $t4, 5($k0)
	lb $t5, 6($k0)
	lb $t6, 7($k0)
	lb $t7, 8($k0)
	lb $t8, 9($k0)
# Below is grid stuff
Grid1:
	addi $a0, $t0, 0
	addi $v0, $zero, 11
	syscall
	la $a0, vertical
	addi $v0, $zero, 4
	syscall

Grid2:
	addi $a0, $t1, 0
	addi $v0, $zero, 11
	syscall
	la $a0, vertical
	addi $v0, $zero, 4
	syscall

Grid3:
	addi $a0, $t2, 0
	addi $v0, $zero, 11
	syscall
	la $a0, extra
	addi $v0, $zero, 4
	syscall
	la $a0, horizontal
	syscall
	la $a0, line
	syscall
	la $a0, space
	syscall

Grid4:
	addi $a0, $t3, 0
	addi $v0, $zero, 11
	syscall
	la $a0, vertical
	addi $v0, $zero, 4
	syscall

Grid5:
	addi $a0, $t4, 0
	addi $v0, $zero, 11
	syscall
	la $a0, vertical
	addi $v0, $zero, 4
	syscall

Grid6:
	addi $a0, $t5, 0
	addi $v0, $zero, 11
	syscall
	la $a0, extra
	addi $v0, $zero, 4
	syscall
	la $a0, horizontal
	syscall
	la $a0, line
	syscall
	la $a0, space
	syscall

Grid7:
	addi $a0, $t6, 0
	addi $v0, $zero, 11
	syscall
	la $a0, vertical
	addi $v0, $zero, 4
	syscall

Grid8:
	addi $a0, $t7, 0
	addi $v0, $zero, 11
	syscall
	la $a0, vertical
	addi $v0, $zero, 4
	syscall

Grid9:
	addi $a0, $t8, 0
	addi $v0, $zero, 11
	syscall
	la $a0, extra
	addi $v0, $zero, 4
	syscall
	la $a0, line
	syscall
	jr $ra

userInputX:
	la $a0, userMove
	li $v0, 4
	syscall

	li $v0, 5
	syscall

	li $t1, 1
	blt $v0, $t1, lessInvalidX
	li $t1, 9
	bgt $v0, $t1, greaterInvalidX

	la $t2, grid
	add $a0, $t2, $v0
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal invalidCheck
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	beqz $v0, userInputX
	jr $ra

userInputO:
	li $v0, 4
	la $a0, userMove
	syscall

	li $v0, 5
	syscall

	li $t1, 1
	blt $v0, $t1, lessInvalidO
	li $t1, 9
	bgt $v0, $t1, greaterInvalidO

	la $t2, grid
	add $a0, $t2, $v0
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal invalidCheck
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	beqz $v0, userInputO
	jr $ra

compInputO: 
	la $t0, grid

	li $a1, 9  # Bound of random number is 0-8
	li $v0, 42 #Calling a random number and storing in $a0
	syscall
	
	add $a0, $a0, 1 #Adding 1 so it makes the random number 1-9
	
	move $t1, $a0 
	add $t0, $t0, $t1
	lb $t2, 0($t0) #The next 5 lines are going to test and see if there is already an X or O in that spot
	lb $t3, o      #If there is an X or O, then it will loop back to the top and try again with a
	beq $t3, $t2, compInputO #new random number
	lb $t3, x
	beq $t3, $t2, compInputO
	move $v0, $t0
	jr $ra

compInputX: 
	la $t0, grid

	li $a1, 9  # Bound of random number is 0-8
	li $v0, 42 #Calling a random number and storing in $a0
	syscall
	
	add $a0, $a0, 1 #Adding 1 so it makes the random number 1-9
	
	move $t1, $a0
	add $t0, $t0, $t1
	lb $t2, 0($t0)  #The next 5 lines are going to test and see if there is already an X or O in that spot
	lb $t3, o       #If there is an X or O, then it will loop back to the top and try again with a
	beq $t3, $t2, compInputX  #new random number
	lb $t3, x
	beq $t3, $t2, compInputX
	move $v0, $t0  	#Move the open spot back to v0
	jr $ra


lessInvalidX:
	li $v0, 4
	la $a0, lessInvalidMsg
	syscall
	j userInputX

greaterInvalidX:
	li $v0, 4
	la $a0, greaterInvalidMsg
	syscall
	j userInputX

lessInvalidO:
	li $v0, 4
	la $a0, lessInvalidMsg
	syscall
	j userInputO

greaterInvalidO:
	li $v0, 4
	la $a0, greaterInvalidMsg
	syscall
	j userInputO

invalidCheck:
	li $v0, 0
	lb $t0, x
	lb $t1, 0($a0)
	beq $t0, $t1, error
	lb $t0, o
	beq $t0, $t1, error
	move $v0, $a0
error:
	jr $ra	

checkWinnerO:
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal row1
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal row2
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal row3
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal col1
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal col2
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal col3
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal diag1
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal diag2
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	jr $ra
row1:
	li $v0, 0
	la $t0, grid
	lb $t1, 1($t0)
	lb $t2, 2($t0)
	beq $t1, $t2, checkRow1
	jr $ra
	checkRow1:
	lb $t3, 3($t0)
	beq $t1, $t3, endGameO
	jr $ra
	
row2:
	li $v0, 0
	la $t0, grid
	lb $t1, 4($t0)
	lb $t2, 5($t0)
	beq $t1, $t2, checkRow2
	jr $ra
	checkRow2:
	lb $t3, 6($t0)
	beq $t1, $t3, endGameO
	jr $ra
	
row3:
	li $v0, 0
	la $t0, grid
	lb $t1, 7($t0)
	lb $t2, 8($t0)
	beq $t1, $t2, checkRow3
	jr $ra
	checkRow3:
	lb $t3, 9($t0)
	beq $t1, $t3, endGameO
	jr $ra
	
col1:
	li $v0, 0
	la $t0, grid
	lb $t1, 1($t0)
	lb $t2, 4($t0)
	beq $t1, $t2, checkCol1
	jr $ra
	checkCol1:
	lb $t3, 7($t0)
	beq $t1, $t3, endGameO
	jr $ra
	
col2:
	li $v0, 0
	la $t0, grid
	lb $t1, 2($t0)
	lb $t2, 5($t0)
	beq $t1, $t2, checkCol2
	jr $ra
	checkCol2:
	lb $t3, 8($t0)
	beq $t1, $t3, endGameO
	jr $ra
	
col3:
	li $v0, 0
	la $t0, grid
	lb $t1, 3($t0)
	lb $t2, 6($t0)
	beq $t1, $t2, checkCol3
	jr $ra
	checkCol3:
	lb $t3, 9($t0)
	beq $t1, $t3, endGameO
	jr $ra

diag1:
	li $v0, 0
	la $t0, grid
	lb $t1, 1($t0)
	lb $t2, 5($t0)
	beq $t1, $t2, checkDiag1
	jr $ra
	checkDiag1:
	lb $t3, 9($t0)
	beq $t1, $t3, endGameO
	jr $ra
	
diag2:
	li $v0, 0
	la $t0, grid
	lb $t1, 3($t0)
	lb $t2, 5($t0)
	beq $t1, $t2, checkDiag2
	jr $ra
	checkDiag2:
	lb $t3, 7($t0)
	beq $t1, $t3, endGameO
	jr $ra
	
checkWinnerX:
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal rowX1
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal rowX2
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal rowX3
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal colX1
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal colX2
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal colX3
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal diagX1
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	jal diagX2
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	
	jr $ra
rowX1:
	li $v0, 0
	la $t0, grid
	lb $t1, 1($t0)
	lb $t2, 2($t0)
	beq $t1, $t2, checkRowX1
	jr $ra
	checkRowX1:
	lb $t3, 3($t0)
	beq $t1, $t3, endGameX
	jr $ra
	
rowX2:
	li $v0, 0
	la $t0, grid
	lb $t1, 4($t0)
	lb $t2, 5($t0)
	beq $t1, $t2, checkRowX2
	jr $ra
	checkRowX2:
	lb $t3, 6($t0)
	beq $t1, $t3, endGameX
	jr $ra
	
rowX3:
	li $v0, 0
	la $t0, grid
	lb $t1, 7($t0)
	lb $t2, 8($t0)
	beq $t1, $t2, checkRowX3
	jr $ra
	checkRowX3:
	lb $t3, 9($t0)
	beq $t1, $t3, endGameX
	jr $ra
	
colX1:
	li $v0, 0
	la $t0, grid
	lb $t1, 1($t0)
	lb $t2, 4($t0)
	beq $t1, $t2, checkColX1
	jr $ra
	checkColX1:
	lb $t3, 7($t0)
	beq $t1, $t3, endGameX
	jr $ra
	
colX2:
	li $v0, 0
	la $t0, grid
	lb $t1, 2($t0)
	lb $t2, 5($t0)
	beq $t1, $t2, checkColX2
	jr $ra
	checkColX2:
	lb $t3, 8($t0)
	beq $t1, $t3, endGameX
	jr $ra
	
colX3:
	li $v0, 0
	la $t0, grid
	lb $t1, 3($t0)
	lb $t2, 6($t0)
	beq $t1, $t2, checkColX3
	jr $ra
	checkColX3:
	lb $t3, 9($t0)
	beq $t1, $t3, endGameX
	jr $ra

diagX1:
	li $v0, 0
	la $t0, grid
	lb $t1, 1($t0)
	lb $t2, 5($t0)
	beq $t1, $t2, checkDiagX1
	jr $ra
	checkDiagX1:
	lb $t3, 9($t0)
	beq $t1, $t3, endGameX
	jr $ra
	
diagX2:
	li $v0, 0
	la $t0, grid
	lb $t1, 3($t0)
	lb $t2, 5($t0)
	beq $t1, $t2, checkDiagX2
	jr $ra
	checkDiagX2:
	lb $t3, 7($t0)
	beq $t1, $t3, endGameX
	jr $ra
	
endGameX:
	li $v0, 4
	la $a0, xWin
	syscall
	j terminate

endGameO:
	li $v0, 4
	la $a0, oWin
	syscall
	j terminate

endGameDraw:
	li $v0, 4
	la $a0, draw
	syscall
	j terminate

terminate:
	li $v0, 10
	syscall
