# Assignment 1
# Q1
# Semester - 5
# Group No - 53
# Group Members - Umang Singla (20CS10068) , Sidharth Vishwakarma (20CS10082)

# This program calculates the product of two numbers using booth's multiplication algorithm

    .globl main

    .data
input_promt_1: .asciiz "Enter first number: "
input_promt_2: .asciiz "Enter second number: "
error_message: .asciiz "Error: Invalid input"
output_prompt: .asciiz "Product of the two numbers are: "
new_line: .asciiz "\n"

    .text
main:
    # asking input for M
    li $v0, 4                                                       # system call for printing string
    la $a0, input_promt_1                                           # loading address of input_promt_1 in $a0 
    syscall                                                        

    # reading input for M
    li $v0, 5                                                       # syscall for reading integer
    syscall                                                         
    move $s0, $v0                      

    li $t0, 32767                                                    # upperbound for 16 bit integer
    li $t1, -32768                                                   # lowerbound for 16 bit integer             

    # sanity checking if input is 16-bit number
    bgt $s0, $t0, error                                             # if $s0 > 32767 jump to error   
    blt $s0, $t1, error                                             # if $s0 < -32768 jump to error
    
    # asking input for Q
    li $v0, 4                                                       # system call for printing string
    la $a0, input_promt_2                                           # loading address of input_promt_2 in $a0 
    syscall                                                         

    # reading input for Q
    li $v0, 5                                                       # syscall for reading integer
    syscall                                                         # reading input for Q
    move $s1, $v0                                                   

    # sanity checking if input is 16-bit number
    bgt $s1, $t0, error                                             # if $s1 > 32767 jump to error
    blt $s1, $t1, error                                             # if $s1 < 32768 jump to error

    # calculating product of M and Q using Booth's algorithm
    move $a0, $s0                                                   # $a0 = $s0, 1st argument as $s0 = M
    move $a1, $s1                                                   # $a1 = $s1, 2nd argument as $s1 = Q
    j booth_algorithm

    # exiting the program
    j exit                                                          # jumpt to exit

# branch for printing warning after entering non 16-bit number
error:
    li $v0, 4                                                       # system call for printing string
    la $a0, error_message                                           # loading address of error_message in $a0
    syscall

    # printing new line
    li $v0, 4                                                       # system call for printing string                                                    
    la $a0, new_line                                                # loading address of new_line in $a0
    syscall

    # printing new line
    li $v0, 4                                                       # system call for printing string
    la $a0, new_line                                                # loading address of new_line in $a0
    syscall

    j main                                                          # jump to main

# branch to print product after calculation
print_output:
    move $s0, $v0                                                   # move product to $s0

    # print the promt before printing the product
    li $v0, 4                                                       # system call for printing string
    la $a0, output_prompt                                           # loading address of output_prompt in $a0
    syscall         

    # printing the product
    li $v0, 1                                                       # system call for printing integer
    move $a0, $s0                                                   # loading product in $a0
    syscall                                                         

    # printing new line
    li $v0, 4                                                       # system call for printing string
    la $a0, new_line                                                # loading address of new_line in $a0
    syscall

    # end of program
    j exit                                                          # jump to exit

# function to convert 32 bit number to 16 bit number
reduce_bit_from_32_to_16:
    # convert input to 16-bit form

    # storing MSB
    srl $s0, $a0, 31                                                # s0 stores sign bit of $a0             
    sll $s0, $s0, 15                                                # $s0 = $s0 << 15 
    
    # keeping only 1st 15 bits
    sll $a0, $a0, 17                                                # $a0 = a0 << 17 to remove left 17 bits
    srl $a0, $a0, 17                                                # $a0 = $a0 >> 17, now $a0 have right 15 bits only

    # $s0 is the sign bit at 16bit MSB
    add $a0, $a0, $s0                                               # now binary representation of $a0 is equivalent to 16 bit binary representation of input

    move $v0 , $a0                                                  # move $a0 to $v0
    jr $ra                                                          # return to booth_algorithm

# branch to calculate product using Booth's algorithm
booth_algorithm:                               

    # convert input to 16-bit form

    sub $sp, $sp, 4                                                 # decrement stack pointer by 4
    sw $ra, 0($sp)                                                  # store return address in stack

    # converting $a0 to 16-bit form
    jal reduce_bit_from_32_to_16                                    # call reduce_bit_from_32_to_16

    move $a0, $v0                                                   # move $v0 to $a0

    sub $sp, $sp, 4                                                 # decrement stack pointer by 4
    sw $a0, 0($sp)                                                  # store $a0 in stack

    move $a0, $a1                                                   # move $a1 to $a0

    # converting $a1 to 16-bit form
    jal reduce_bit_from_32_to_16                                    # call reduce_bit_from_32_to_16
    move $a1, $v0                                                   # move $v0 to $a1

    # restoring state of the function
    lw $a0, 0($sp)                                                  # load $a0 from stack
    addi $sp, $sp, 4                                                # increment stack pointer by 4
    lw $ra, 0($sp)                                                  # load return address from stack
    addi $sp, $sp, 4                                                # increment stack pointer by 4

    # move bits of M to left by 16 bits
    sll $a1, $a1, 16                                                # $a1 = $a1 << 16, this will make multiplicand at 1st 16 bits

    # $t0 to store counts
    # $t1 to store previous LSB
    # $t2 to store current LSB
    li $t0, 1                                                       # $t0 is the count of iterations (count = 1)
    li $t1, 0                                                       # previous LSB (M_-1) set to 0

    # set product to $v0
    move $v0, $a0                                                   # $v0 = $a0, store integere in $v0 ($v0 = M)

    # for loop for 16 iterations
    FOR:
        # loop break condition
        bgt $t0, 16, print_output                                  # if count is greater than 16, then print_output
        addi $t0, $t0, 1                                             # else add 1 to $t0 (count++)

        and $t2, $v0, 1                                             # $t2 = $v0 & 1, this will give us the LSB of $v0

        # now we have previous LSB stored in $t1 and current LSB stored in $t2

        move $t3, $t2
        sll $t3, $t3, 1                                             # $t3 = 2*$t3
        add $t3, $t3, $t1                                           # $t3 = 2*$t3 + $t1 => $t3 = M_0.M_-1

        # check for cases 00,01,10,11
        beq $t3, 1, add_block                                       # if $t3 is equal to 1, then jump to add_block
        beq $t3, 2, sub_block                                       # else if $t3 is equal to 2, then jump to sub_block
        j arithmetic_right_shift                                    # else jump to arithmetic_right_shift

    # branch for case "10"
    sub_block:
        sub $v0, $v0, $a1                                           # subtract $a1 from $v0 (A <-- A - M)
        j arithmetic_right_shift                                    # jump to arithmetic_right_shift 

    
    # branch for case "01"
    add_block:
        add $v0, $v0, $a1                                           # add $a1 to $a0, (A <-- A + M)
        j arithmetic_right_shift                                    # jump to arithmetic_right_shift


    # Arithmetic right shift operation
    arithmetic_right_shift:
        # $t3 = MSB of $v0
        li $t3, 1                                                   # $t3 = 1
        sll $t3, $t3, 31                                            # $t3 = $t3 << 31, $t3 = 1000...000
        and $t3, $t3, $v0                                           # $t3 = $t3 & $v0, $t3 = MSB of $v0

        srl $v0, $v0, 1                                             # shift $v0 to the right by 1 bit
        add $v0, $v0, $t3                                           # add $t3 to $a0 (as in arithmetic shift doesn't change end bits)

        # update previous LSB
        move $t1, $t2                                               # $t1(M_-1) = $t2 (M_0)

        j FOR                                                       # jump to FOR loop

exit:
    # end of program
    li      $v0, 10                                                 # terminate the program
    syscall