# Assignment 4
# Q1
# Semester - 5
# Group No - 53
# Group Members - Umang Singla (20CS10068) , Sidharth Vishwakarma (20CS10082)

# This program computes the determinant of a matrix filled up by a Geometric Progression (GP) series with initial value a and common ratio r upto n x n terms,
# where 'n', 'a', 'r' and 'm' are entered by the user.
#

    .globl  main

    .data

# program output text constants
prompt:                                          # prompt for input
    .asciiz "Enter three positive integers (n, a, r and m) : "
result1:                                         # prompt for printing Matrix A
	.asciiz "Matrix A : "
result2:                                         # prompt for printing Determinant of Matrix A
    .asciiz "Final determinant of the matrix A is "
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
    addi    $v0, $sp, -4                          # get base address from stack
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
        jr     $ra                                # return to caller

Determinant:
    move    $t0, $ra                              # store return address in $t0 for later use
    jal     pushToStack                           # push 'n' to stack

    move    $a0, $a1                              # store MATRIX in $a0 to push into stack
    jal     pushToStack                           # push 'MATRIX' to stack

    move    $a0, $t0                              # store return address in $a0 to push into stack
    jal     pushToStack                           # push 'return address' to stack

    lw  $t1, 8($sp)                               # load 'n' from stack
    bgt $t1, 1, recursive_case                    # if n > 1, go to recursive case

    # base_case
    lw  $t1, 4($sp)                               # load 'MATRIX' from stack
    lw  $v0, 0($t1)                               # load 'MATRIX[0][0]' from stack
    lw  $ra, 0($sp)                               # load return address from stack
    addiu   $sp, $sp, 12                          # increment stack pointer by 12 - pop 3 elements from stack
    jr      $ra                                   # return to caller

    recursive_case:
        li  $v0, 0                                # initialize determinant to 0
        move    $a0, $v0                          # store 'determinant' in $a0 to push into stack
        jal     pushToStack                       # push 'determinant' to stack

        li  $t0, 1
        move  $a0, $t0                            # initialize sign to 1
        jal    pushToStack                        # push 'sign' to stack

        lw  $t2, 16($sp)                          # load 'n' from stack
        li  $t0, 0                                # initialize the j-iterator

        loopj2:
            beq $t0, $t2, endj2                   # end j-loop if j == n
            move    $t6, $t0                      # store 'j' in $a0 to push into stack
            move    $a0, $t0
            jal     pushToStack                   # push 'j' to stack

            lw  $t7, 16($sp)                      # load 'MATRIX' from stack
            move    $t1, $t2                      # store 'n' in $t1
            subu    $t1, $t1, 1                   # decrement 'n' by 1
            mul     $t1, $t1, $t1                 # memory required for the matrix of size (n-1) x (n-1)
            move    $a0, $t1                      # store 'memory required' in $a0 to push into stack
            jal    mallocInStack                  # allocate memory for the matrix of size (n-1) x (n-1)
            move    $t0, $t2
            move    $t1, $v0                      # store the address of the sub-matrix in $t1

            li  $t2,1                             # $t4 stores the row index
            li  $t3,0                             # $t5 stores the column index
            mul    $t8, $t0, -4                   # $t6 stores the number of bytes to be skipped in the row
            add $t7, $t7, $t8                     # $t2 stores the address of row index of the sub-matrix

            fill_submatrix_loopi:
                beq $t2, $t0, end_fill_submatrix_loopi         # end loop if i == n
                li  $t3, 0                                     # $t5 stores the column index
                fill_submatrix_loopj:
                    beq $t3, $t0, end_fill_submatrix_loopj     # end loop if j == n
                    beq $t6, $t3, increment_j                  # skip if j == j(i.e. column to be skipped)
                    lw  $t4, 0($t7)                            # load the element from the matrix[i][j]
                    sw  $t4, 0($t1)                            # store the element in the sub-matrix
                    addi    $t1, $t1, -4                       # decrement the address of the sub-matrix by 4
                    addi    $t7, $t7, -4                       # decrement the address of the matrix by 4
                    addi    $t3, $t3, 1                        # increment j-iterator
                    j   fill_submatrix_loopj                   # jump to loopj
                increment_j:
                    addi    $t3, $t3, 1          # increment j-iterator
                    addi    $t7, $t7, -4         # decrement the address of the matrix by 4
                    j   fill_submatrix_loopj     # jump to fill_submatrix_loopj

                end_fill_submatrix_loopj:
                    addi    $t2, $t2, 1          # increment i-iterator
                    j   fill_submatrix_loopi     # jump to fill_submatrix_loopi

            end_fill_submatrix_loopi:
                addi    $t0, $t0, -1             # decrement n by 1
                move    $a0, $t0                 # store 'n-1' in $a0 to push into stack
                jal     pushToStack              # push 'n-1' to stack
                move    $a0, $t0                 # store 'n-1' in $a0 to call the Determinant function
                move    $a1, $v0                 # store the address of the sub-matrix in $a1 to call Determinant
                jal     Determinant              # call Determinant with the sub-matrix and its size as arguments

                lw  $t2, 0($sp)                  # load 'n-1' from stack
                mul $t0,$t2,$t2                  # store (n-1)*(n-1) in $t0
                addiu   $sp, $sp, 4              # increment stack pointer by 4 - pop 1 element from stack

                mul $t0, $t0, 4                  # store 4*(n-1)*(n-1) in $t0
                addu   $sp, $sp, $t0             # increment stack pointer by 4*(n-1)*(n-1) pop the sub-matrix from stack

                lw  $t0, 0($sp)                  # load j(from the outermost-loop) from stack
                addiu   $sp, $sp, 4              # increment stack pointer by 4 - pop 1 element from stack

                lw  $t1, 0($sp)                  # load sign from stack
                addiu   $sp, $sp, 4              # increment stack pointer by 4 - pop 1 element from stack

                lw  $t3, 0($sp)                  # load determinant from stack
                addiu   $sp, $sp, 4              # increment stack pointer by 4 - pop 1 element from stack

                mul $t4, $t1, $v0                # store sign * determinant in $t4
                lw  $t5, 4($sp)                  # load 'MATRIX' from stack
                mul $t6, $t0,-4                  # store -4*j in $t6
                add $t5, $t5, $t6                # the address of jth element in the first row of the matrix is stored in $t5
                lw  $t5, 0($t5)                  # load the jth element in the first row of the matrix to $t5
                mul $t4, $t4, $t5                # store sign * determinant * matrix[0][j] in $t4
                add $t4, $t4, $t3                # store sign * determinant * matrix[0][j] + determinant in $t4
                move    $a0, $t4                 # store 'sign * determinant * matrix[0][j] + determinant' in $a0 to push into stack
                jal     pushToStack              # push 'sign * determinant * matrix[0][j] + determinant' to stack

                mul $t1, $t1, -1                 # store -sign in $t0
                move    $a0, $t1                 # store '-sign' in $a0 to push into stack
                jal     pushToStack              # push '-sign' to stack

                addi    $t2, $t2, 1              # increment 'n-1' to 'n'
                addi    $t0, $t0, 1              # increment j-iterator
                j   loopj2                       # jump to loopj2
        endj2:
            addiu   $sp, $sp, 4                  # increment stack pointer by 4 - pop sign element from stack
            lw  $v0, 0($sp)                      # load determinant from stack
            addiu   $sp, $sp, 4                  # increment stack pointer by 4 - pop determinant element from stack
            lw  $ra, 0($sp)                      # load return address from stack
            addiu   $sp, $sp, 12                 # increment stack pointer by 12 - pop 3 elements from stack
            jr  $ra                              # return to the caller


error:
    addiu  $sp, $sp, 16                          # restore stack frame
    li     $v0, 4                                # print error message
    la     $a0, errorMsg
    syscall
    j      input                                 # jump to input for re-entering input

# main program
#
# program variables
#   n:   $s0
#   a:   $s1
#   r:   $s2
#   m:   $s3
#
main:
    jal    initStack                              # initialize stack frame

input:
    li      $v0, 4                                # issue prompt for the user
    la      $a0, prompt
    syscall

    li     $v0, 4                                 # print newline '\n'
    la     $a0, newline
    syscall

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

    li      $v0, 5                                # get m from user
    syscall
    move    $a0, $v0
    jal   pushToStack                             # push m to stack

    lw $s0,12($sp)                                # get n from stack
    lw $s1,8($sp)                                 # get a from stack
    lw $s2,4($sp)                                 # get r from stack
    lw $s3,0($sp)                                 # get m from stack

    blez    $s0, error                            # check if n <= 0
    blez    $s1, error                            # check if a <= 0
    blez    $s2, error                            # check if r <= 0
    blez    $s3, error                            # check if m <= 0

    mul    $a0,$s0,$s0                            # calculate n * n
    jal mallocInStack                             # allocate memory for matrix A
    move    $s4, $v0                              # store address of matrix A in $s4

    move $t0, $s4                                 # store address of matrix A in $t0
    li     $s6, 0                                 # initialize the i-iterator
loopi3:
    beq    $s6,$s0, endi3                         # end i-loop if i == n
    li      $s7, 0                                # initialize the j-iterator
    loopj3:
        beq    $s7, $s0, endj3                    # end j-loop if j == n
        div    $s1, $s3                           # calculate a * r ^ i / m
        mfhi   $s1                                # store remainder in $s1
        sw $s1, 0($t0)                            # store $s1 of geometric progression in matrix A[i][j]
        mul $s1,$s1,$s2                           # calculate next $s1 of geometric progression
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
    move $a1,$s0
    move $a2,$s4
    jal printMatrix

    move    $a0, $s0                              # function call to Determinant for calculating determinant of Matrix A
    move    $a1, $s4
    jal Determinant

    move    $s5, $v0                              # store determinant of Matrix A in $s5

    li     $v0, 4                                 # print result prompt for printing determinant of Matrix A
    la     $a0, result2
    syscall

    li     $v0, 1                                 # print determinant of Matrix A
    move    $a0, $s5
    syscall

    li     $v0, 4                                 # print newline '\n'
    la     $a0, newline
    syscall

    li     $v0, 10                                # exit program
    syscall