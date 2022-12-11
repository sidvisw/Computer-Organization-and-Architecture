# Assignment 1
# Q2
# Semester - 5
# Group No - 53
# Group Members - Umang Singla (20CS10068) , Sidharth Vishwakarma (20CS10082)

# This program calculates the kth largest element in the array using the bubble sort algorithm

# globl will make main symbol accessible from outside the current file
    .globl main


# data declaration
    .data
array:
    .space 40 # 40 bytes of space for array (i.e array of 10 elements)
input:
    .asciiz "Enter 10 integers of array:\n"
prompt1:
    .asciiz "Enter the value of k: "
prompt2:
    .asciiz "The kth largest number is: "
error_message:
    .asciiz "Error: k should be less than or equal to 10"
new_line:
    .asciiz "\n"

    .text
# main function starts
main:
    # calling input array function to take array as input
    jal input_array

    # calling bubble sort function to sort the array
    la $a0, array                                               # $a0 = adress pf array
    jal sort_array                                              # calling sort_array function

    # calling find_k_largest function that returns the kth largest element
    jal find_k_largest

    move $s0, $v0                                               # $s0 = kth largest element

    # printing the kth largest element
    la $a0, prompt2                                             # $a0 = prompt2
    li $v0, 4                                                   # $v0 = 4 (for printing string)
    syscall

    # printing the kth largest element
    li $v0, 1
    move $a0, $s0
    syscall

    # exiting the program
    j exit

# function to take array as input
input_array:
    # printing the prompt (i.e instruction for user)
    li $v0, 4
    la $a0, input
    syscall

    li $t0, 0                                                   # i = 0
    li $t1, 0                                                   # pointer pointing to adress of ith element of array

    # for loop to take input of array
    FOR:
        # loop break condition
        beq $t0, 10, END_FOR                                    # if i == 10, then break the loop
        li $v0, 5                                               # syscall for reading integer
        syscall

        sw $v0, array($t1)                                      # storing the input in array (i.e array[i] = input)
        addi $t0, $t0, 1                                        # i++
        addi $t1, $t1, 4                                        # t1 = t1 + 4 (i.e pointer pointing to next element of array)

        j FOR                                                   # jump to for loop
    
    END_FOR:
        jr $ra                                                  # return to main function

# bubble sort function
sort_array:
    li $t2, 0                                                   # i = 0

    # outer for loop
    FOR1:
        # loop break condition
        beq $t2, 10, END_FOR1                                   # if i == 10, then break the loop
        li $t3, -1                                              # j = -1
        move $t5, $a0                                           # t5 = $a0 (i.e pointer pointing to first element of array)
        sub $t5, $t5, 4                                         # t5 = t5 - 4

        # inner for loop
        FOR2:
            addi $t3, $t3, 1                                    # j++
            addi $t5, $t5, 4                                    # t5 = t5 + 4 (i.e pointer pointing to next element of array)
            li $t4, 10                                          # $t4 = 10
            sub $t4, $t4, $t2                                   # $t4 = 10 - i

            # loop break condition
            beq $t3, $t4, END_FOR2                              # if j == 10 - i, then break the loop

            lw $t6, 0($t5)                                      # $t6 = array[j]
            lw $t7, 4($t5)                                      # $t7 = array[j + 1]

            # swapping condition
            ble $t6, $t7, FOR2                                  # if array[j] <= array[j + 1], then jump to for loop
            move $a1, $t5                                       # $a1 = adress of array[j] (i.e pointer pointing to jth element of array)
            addi $a2, $t5, 4                                    # $a2 = adress of array[j + 1] (i.e pointer pointing to (j + 1)th element of array)
            sub $sp, $sp, 4                                     # decrementing stack pointer
            sw $ra, 0($sp)                                      # storing return address in stack
            jal swap                                            # calling swap function (i.e swap(array[j], array[j + 1]))
            lw $ra, 0($sp)                                      # loading return address from stack
            addi $sp, $sp, 4                                    # incrementing stack pointer
            j FOR2                                              # jump to for2 loop


        END_FOR2:
            addi $t2, $t2, 1                                    # i++
            j FOR1                                              # jump to for1 loop

    END_FOR1:
        jr $ra                                                  # return to main function

find_k_largest:
    la $a0, prompt1                                             # $a0 = adress of prompt1
    li $v0, 4                                                   # syscall for printing string
    syscall

    li $v0, 5                                                   # syscall for reading integer
    syscall
    move $s0, $v0                                               # $s0 = k

    bge $s0, 11, error                                          # if k >= 11, then jump to error

    sub $s0, $s0, 1                                             # k = k - 1
    li $t0, 4                                                   # $t0 = 4
    mul $s0, $s0, $t0                                           # k = k * 4

    lw $v0, array($s0)                                          # $v0 = array[k]

    jr $ra                                                      # return to main function

error:
    la $a0, error_message                                       # $a0 = adress of error_message
    li $v0, 4                                                   # syscall for printing string
    syscall

    # printing new line
    la $a0, new_line                                            
    li $v0, 4
    syscall

    # printing new line
    la $a0, new_line
    li $v0, 4
    syscall

    j find_k_largest                                            # jump to find_k_largest function

# swap function that swaps to array elements
swap:
    lw $t0, 0($a1)                                              # $t0 = array[j]
    lw $t1, 0($a2)                                              # $t1 = array[j + 1]
    sw $t0, 0($a2)                                              # array[j + 1] = array[j]
    sw $t1, 0($a1)                                              # array[j] = array[j + 1]
    jr $ra                                                      # return to sort_array function

# exit function
exit:
    li $v0, 10                                                  # syscall for exit
    syscall                                                         