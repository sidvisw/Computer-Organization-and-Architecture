# Assignment 4
# Q2
# Semester - 5
# Group No - 53
# Group Members - Umang Singla (20CS10068) , Sidharth Vishwakarma (20CS10082)

# This program sorts an array of 10 elements using recursive sort function

# globl will make main symbol accessible from outside the current file
    .globl main


# data declaration
    .data
array:
    .space 40 # 40 bytes of space for array (i.e array of 10 elements)
input:
    .asciiz "Enter 10 integers of array:\n"
prompt1:
    .asciiz "Sorted array: "
ws:
    .asciiz " "
new_line:
    .asciiz "\n"

    .text
# main function starts
main:
    # calling input array function to take array as input
    jal input_array

    # calling recursive sort function to sort the array
    la $a0, array                                               # $a0 = adress of array
    li $a1, 0
    li $a2, 36
    jal recursive_sort                                          # calling recursive_sort function

    # calling print_array function to print the sorted array
    jal print_array

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

print_array:
    li $t0, 0                                                   # i = 0
    li $t1, 0                                                   # pointer pointing to adress of ith element of array

    li $v0, 4
    la $a0, prompt1
    syscall
    
    # for loop to take input of array
    FOR1:
        # loop break condition
        beq $t0, 10, END_FOR1                                   # if i == 10, then break the loop

        li $v0, 1                                               # syscall for reading integer
        lw $a0, array($t1)                                      # printing array[i]
        syscall

        li $v0, 4                                               # syscall for printing string
        la $a0, ws                                              # printing space
        syscall

        addi $t0, $t0, 1                                        # i++
        addi $t1, $t1, 4                                        # t1 = t1 + 4 (i.e pointer pointing to next element of array)

        j FOR1                                                  # jump to for loop
    
    END_FOR1:
        jr $ra                                                  # return to main function

# recursive sort function
recursive_sort:
    move $t0, $a1                                               # $t0 (l) = left
    move $t1, $a2                                               # $t1 (r) = right
    move $t2, $a1                                               # $t2 (p) = left
    WHILE1:
        bge $t0, $t1, END_WHILE1                                # if l >= r, then break the loop
        WHILE2:
            lw $t3, array($t0)                                  # $t3 = array[l]
            lw $t4, array($t2)                                  # $t4 = array[p]
            bgt $t3, $t4, END_WHILE2                            # if array[l] > array[p], then break the loop
            bge $t0, $a2, END_WHILE2                            # if l >= right, then break the loop
            addi $t0, $t0, 4                                    # l = l + 4
            jr WHILE2                                           # jump to while2 loop
        END_WHILE2:
        WHILE3:
            lw $t3, array($t1)                                  # $t3 = array[r]
            lw $t4, array($t2)                                  # $t4 = array[p]
            blt $t3, $t4, END_WHILE3                            # if array[r] < array[p], then break the loop
            bge $a1, $t1, END_WHILE3                            # if r <= left, then break the loop
            sub $t1, $t1, 4                                     # r = r - 4
            jr WHILE3                                           # jump to while3 loop
        END_WHILE3:

        bge $t0, $t1, IF                                        # if l >= r, enter IF block

        sub $sp, $sp, 24                                        # allocating space for 6 variables on stack
        sw $a0, 16($sp)                                         # storing array in stack
        sw $a1, 12($sp)                                         # storing left in stack
        sw $a2, 8($sp)                                          # storing right in stack
        sw $t0, 4($sp)                                          # storing l in stack
        sw $t1, 0($sp)                                          # storing r in stack
        sw $ra, 20($sp)                                         # storing return address in stack
        
        # swapping array[l] and array[r]
        la $a1, array
        add $a1, $a1, $t0                                       # passing array[l] as first argument
        la $a2, array
        add $a2, $a2, $t1                                       # passing array[r] as second argument
        jal swap                                                # calling swap function

        lw $a0, 16($sp)                                         # loading array from stack
        lw $a1, 12($sp)                                         # loading left from stack
        lw $a2, 8($sp)                                          # loading right from stack
        lw $t0, 4($sp)                                          # loading l from stack
        lw $t1, 0($sp)                                          # loading r from stack
        lw $ra, 20($sp)                                         # loading return address from stack
        addi $sp, $sp, 24                                       # freeing space for 6 variables from stack

        j WHILE1                                                # jump to while1 loop

        IF:
            sub $sp, $sp, 24                                    # allocating space for 6 variables on stack
            sw $a0, 16($sp)                                     # storing array in stack
            sw $a1, 12($sp)                                     # storing left in stack
            sw $a2, 8($sp)                                      # storing right in stack
            sw $t0, 4($sp)                                      # storing l in stack
            sw $t1, 0($sp)                                      # storing r in stack
            sw $ra, 20($sp)                                     # storing return address in stack

            # swapping array[p] and array[r]
            la $a1, array
            add $a1, $a1, $t2                                   # passing array[p] as first argument
            la $a2, array
            add $a2, $a2, $t1                                   # passing array[r] as second argument
            jal swap                                            # calling swap function

            lw $ra, 20($sp)                                     # loading return address from stack
            lw $a0, 16($sp)                                     # loading array from stack
            lw $a1, 12($sp)                                     # loading left from stack
            lw $a2, 0($sp)                                      # loading r from stack
            sub $a2, $a2, 4                                     # r = r - 4   
            jal recursive_sort                                  # calling recursive_sort function as recursive_sort(array, left, r - 1)
            
            lw $ra, 20($sp)                                     # loading return address from stack
            lw $a0, 16($sp)                                     # loading array from stack
            lw $a1, 0($sp)                                      # loading r from stack
            addi $a1, $a1, 4                                    # r = r + 4
            lw $a2, 8($sp)                                      # loading right from stack
            jal recursive_sort                                  # calling recursive_sort function as recursive_sort(array, r + 1, right)

            lw $ra, 20($sp)                                     # loading return address from stack
            addi $sp, $sp, 24                                   # freeing space for 6 variables on stack
            jr $ra                                              # return to main function
    END_WHILE1:
        jr $ra                                                  # return to main function

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