# Assignment 1
# Q3
# Semester - 5
# Group No - 53
# Group Members - Umang Singla (20CS10068) , Sidharth Vishwakarma (20CS10082)

# This program computes Geometric Progression (GP) series with initial value a and common ratio r upto m x n terms,
# where 'm', 'n', 'a' and 'r' are entered by the user.
#

    .globl  main

    .data

# program output text constants
prompt:                                          # prompt for input
    .asciiz "Enter four positive integers m, n, a and r: "
result1:                                         # prompt for printing Matrix A
	.asciiz "Matrix A: "
result2:                                         # prompt for printing Matrix B
    .asciiz "Matrix B: "
errorMsg:                                        # error message for invalid input
    .asciiz "Error: Invalid input.\n"
whitespace:                                      # whitespace
    .asciiz " "
newline:                                         # newline
    .asciiz "\n"

    .text

initStack:
    subu    $sp, $sp, 32                          # stack frame is 32 bytes long
    sw      $ra, 20($sp)                          # save return address
    sw      $fp, 16($sp)                          # save frame pointer
    addiu   $fp, $sp, 28                          # set frame pointer
    jr      $ra                                   # return to caller

pushToStack:
    subu    $sp, $sp, 4                           # decrement stack pointer
    sw      $a0, 0($sp)                           # push argument to stack
    jr      $ra                                   # return to caller

mallocInStack:
    mul     $a0, $a0, 4                           # multiply by 4 to get size in bytes
    la      $v0, ($sp)                            # get base address from stack
    subu    $sp, $sp, $a0                         # decrement stack pointer
    jr      $ra                                   # return to caller

printMatrix:
    move    $t0, $a0                              # store 'm' in $t0
    move    $t1, $a1                              # store 'n' in $t1
    move    $t2, $a2                              # store 'MATRIX' in $t2
    li      $t3, 0                                # initialize the i-iterator
    loopi1:
        beq    $t3, $t0, endi1                    # end i-loop if i == m
        li      $t4, 0                            # initialize the j-iterator
        loopj1:
            beq    $t4, $t1, endj1                # end j-loop if j == n
            li     $v0, 1                         # print MATRIX[i][j]
            lw     $a0, 0($t2)
            syscall
            li     $v0, 4                         # print whitespace ' '
            la     $a0, whitespace
            syscall
            addiu   $t2, $t2, -4                  # decrement pointer by 4
            addiu  $t4, $t4, 1                    # increment j-iterator
            j      loopj1                         # jump to j-loop
        endj1:
            li     $v0, 4                         # print newline '\n'
            la     $a0, newline
            syscall
            addiu  $t3, $t3, 1                    # increment i-iterator
            j      loopi1                         # jump to i-loop
    endi1:
        li     $v0, 4                             # print newline '\n'
        la     $a0, newline
        syscall
        jr     $ra                                # return to caller

transposeMatrix:
    move    $t0, $a0                              # store 'm' in $t0
    move    $t1, $a1                              # store 'n' in $t1
    move    $t2, $a2                              # store 'MATRIX A' in $t2
    move    $t3, $a3                              # store 'MATRIX B' in $t3
    li      $t4, 0                                # initialize the i-iterator
    loopi2:
        beq    $t4, $t0, endi2                    # end i-loop if i == m
        li      $t5, 0                            # initialize the j-iterator
        loopj2:
            beq    $t5, $t1, endj2                # end j-loop if j == n
            lw     $t6, 0($t2)                    # store A[i][j] in $t6
            mul   $t7, $t5, $t0                   # calculate j * m
            addu    $t7, $t7, $t4                 # calculate i + j * m
            mul  $t7, $t7, -4                     # calculate (i + j * m) * -4 to get address
            addu    $t7, $t3, $t7                 # calculate address of B[i][j]
            sw     $t6, 0($t7)                    # store A[i][j] in B[i][j]
            addiu    $t2, $t2, -4                 # decrement pointer by 4
            addiu  $t5, $t5, 1                    # increment j-iterator
            j      loopj2                         # jump to j-loop
        endj2:
            addiu  $t4, $t4, 1                    # increment i-iterator
            j      loopi2                         # jump to i-loop
    endi2:
        jr     $ra                                # return to caller

error:
    addiu  $sp, $sp, 16                           # restore stack frame
    li     $v0, 4                                 # print error message
    la     $a0, errorMsg
    syscall
    j      input                                  # jump to input for re-entering input

# main program
#
# program variables
#   m:   $s0
#   n:   $s1
#   a:   $s2
#   r:   $s3
#
main:
    jal    initStack                              # initialize stack frame

input:
    li      $v0, 4                                # issue prompt for the user
    la      $a0, prompt
    syscall

    li     $v0, 4                             # print newline '\n'
    la     $a0, newline
    syscall

    li      $v0, 5                                # get m from user
    syscall
    move    $a0, $v0
    jal   pushToStack                             # push m to stack

    li      $v0, 5                                # get n from user
    syscall
    move    $a0, $v0
    jal   pushToStack                             # push n to stack

    li      $v0, 5                                # get a from user
    syscall
    move    $a0, $v0
    jal   pushToStack                             # push a to stack

    li      $v0, 5                                # get r from user
    syscall
    move    $a0, $v0
    jal   pushToStack                             # push r to stack

    lw $s0,12($sp)                                # get m from stack
    lw $s1,8($sp)                                 # get n from stack
    lw $s2,4($sp)                                 # get a from stack
    lw $s3,0($sp)                                 # get r from stack

    blez    $s0, error                            # check if m <= 0
    blez    $s1, error                            # check if n <= 0
    blez    $s2, error                            # check if a <= 0
    blez    $s3, error                            # check if r <= 0

    mul    $a0,$s0,$s1                            # calculate m * n
    jal mallocInStack                             # allocate memory for matrix A
    move    $s4, $v0                              # store address of matrix A in $s4
    jal mallocInStack                             # allocate memory for matrix B
    move    $s5, $v0                              # store address of matrix B in $s5

    move $t0, $s4                                 # store address of matrix A in $t0
    li     $s6, 0                                 # initialize the i-iterator
loopi3:
    beq    $s6,$s0, endi3                         # end i-loop if i == n
    li      $s7, 0                                # initialize the j-iterator
    loopj3:
        beq    $s7, $s1, endj3                    # end j-loop if j == m
        sw $s2, 0($t0)                            # store $s2 of geometric progression in matrix A[i][j]
        mul $s2,$s2,$s3                           # calculate next $s2 of geometric progression
        addiu $t0,$t0,-4                          # decrement pointer by 4 
        addiu $s7,$s7,1                           # increment j-iterator
        j      loopj3                             # jump to j-loop
    endj3:
        addiu  $s6, $s6, 1                        # increment i-iterator
        j      loopi3                             # jump to i-loop
endi3:
    li     $v0, 4                                 # print result prompt for printing Matrix A
    la     $a0, result1
    syscall

    li     $v0, 4                                 # print newline '\n'
    la     $a0, newline
    syscall
    
    move $a0,$s0                                  # function call to printMatrix for printing Matrix A
    move $a1,$s1
    move $a2,$s4
    jal printMatrix

    move $a0,$s0                                  # function call to transposeMatrix for transposing Matrix A and storing in Matrix B
    move $a1,$s1
    move $a2,$s4
    move $a3,$s5
    jal transposeMatrix

    li     $v0, 4                                 # print result prompt for printing Matrix B
    la     $a0, result2
    syscall

    li     $v0, 4                                 # print newline '\n'
    la     $a0, newline
    syscall

    move $a0,$s1                                  # function call to printMatrix for printing Matrix B
    move $a1,$s0
    move $a2,$s5
    jal printMatrix

    li     $v0, 10                                # exit program
    syscall