# Assignment 4
# Q3
# Semester - 5
# Group No - 53
# Group Members - Umang Singla (20CS10068) , Sidharth Vishwakarma (20CS10082)

# This program sorts an array of 10 elements using recursive sort function and then search for a key in the sorted array using recursive ternary search algorithm

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
input_key:
    .asciiz "Enter the key to be searched: "
prompt2:
    .asciiz " is FOUND in the array at index "
prompt3:
    .asciiz " NOT FOUND in the array."
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
    li $a1, 0                                                   # $a1 = starting index of array
    li $a2, 36                                                  # $a2 = ending index of array
    jal recursive_sort                                          # calling recursive_sort function

    # calling print_array function to print the sorted array
    jal print_array

    li $v0, 4                                                   # syscall for printing string
    la $a0, new_line                                            # printing new line
    syscall

    li $v0, 4
    la $a0, input_key                                           # printing prompt for input of key
    syscall

    li $v0, 5                                                   # syscall for reading integer
    syscall


    la $a0, array                                               # $a0 = adress of array
    li $a1, 0                                                   # $a1 = starting index of array
    li $a2, 36                                                  # $a2 = ending index of array
    move $a3, $v0                                               # $a3 = element to be searched
    jal recursive_search                                        # calling recursive_search function

    move $s0, $v0                                               # $s0 = index of element to be searched

    beq $v0, -1, NOT_FOUND                                      # if v0 == 1, then element is not found 
    
    FOUND:
        move $a0, $a3                                           # $a0 = element to be searched
        li $v0, 1                                               # syscall for printing integer
        syscall

        li $v0, 4                                               # syscall for printing string
        la $a0, prompt2                                         # printing prompt2
        syscall

        move $a0, $s0                                           # $a0 = index of element to be searched
        li $v0, 1                                               # syscall for printing integer
        syscall

        li $v0, 4                                               # syscall for printing string
        la $a0, new_line                                        # printing new line
        syscall

        j exit                                                  # exiting the program
    
    NOT_FOUND:
        move $a0, $a3                                           # $a0 = element to be searched
        li $v0, 1                                               # syscall for printing integer
        syscall

        li $v0, 4                                               # syscall for printing string
        la $a0, prompt3                                         # printing prompt3
        syscall

        li $v0, 4                                               # syscall for printing string
        la $a0, new_line                                        # printing new line
        syscall

        j exit                                                  # exiting the program


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

recursive_search:
    WHILE:
        bgt $a1, $a2, END_WHILE                                 # if start > end, then break the loop
        li $t7, 4                                               # $t7 = 4   
        div $a1, $t7                                            # start / 4
        mflo $a1                                                # $a1 = start / 4
        div $a2, $t7                                            # end / 4   
        mflo $a2                                                # $a2 = end / 4
        move $t0, $a2                                           # $t0 (mid1) = end
        sub $t0, $t0, $a1                                       # $t0 (mid1) = end - start
        li $t7, 3                                               # $t7 = 3
        div $t0, $t7                                            # (end - start) / 3
        mflo $t0                                                # $t0 (mid1) = (end - start) / 3
        mflo $t1                                                # $t1 (mid2) = (end - start) / 3
        add $t0, $t0, $a1                                       # $t0 (mid1) = (end - start) / 3 + start
        sub $t1, $a2, $t1                                       # $t1 (mid2) = end - (end - start) / 3

        sll $t0, $t0, 2                                         # t0 = t0 * 4
        sll $t1, $t1, 2                                         # t1 = t1 * 4
        sll $a1, $a1, 2                                         # start = start * 4
        sll $a2, $a2, 2                                         # end = end * 4

        lw $t2, array($t0)                                      # $t2 = array[mid1]
        lw $t3, array($t1)                                      # $t3 = array[mid2]

        beq $t2, $a3, IF1                                       # if array[mid1] == key, then enter IF1 block
        beq $t3, $a3, ELIF1                                     # if array[mid2] == key, then enter ELIF1 block
        blt $a3, $t2, ELIF2                                     # if key < array[mid1], then enter ELIF2 block
        bgt $a3, $t3, ELIF3                                     # if key > array[mid2], then enter ELIF3 block
        j ELSE                                                  # else enter ELSE block


        IF1:
            move $v0, $t0                                       # v0 = mid1
            srl $v0, $v0, 2                                     # v0 = mid1 / 4 (index of key in array)
            jr $ra                                              # return to main function
        ELIF1:
            move $v0, $t1                                       # v = mid2
            srl $v0, $v0, 2                                     # v0 = mid2 / 4 (index of key in array)
            jr $ra                                              # return to main function
        ELIF2:
            sub $sp, $sp, 16                                    # allocating space for 4 variables on stack
            sw $a0, 12($sp)                                     # storing array in stack
            sw $a1, 8($sp)                                      # storing start in stack
            sw $a2, 4($sp)                                      # storing end in stack
            sw $ra, 0($sp)                                      # storing return address in stack

            move $a2, $t0                                       # end = mid1
            sub $a2, $a2, 4                                     # end = mid1 - 4

            jal recursive_search                                # calling recursive_search function as recursive_search(array, start, mid1 - 1, key)

            lw $ra, 0($sp)                                      # loading return address from stack
            lw $a0, 12($sp)                                     # loading array from stack
            lw $a1, 8($sp)                                      # loading start from stack
            lw $a2, 4($sp)                                      # loading end from stack
            addi $sp, $sp, 16                                   # freeing space for 4 variables on stack

            jr $ra                                              # return to main function
        ELIF3:
            sub $sp, $sp, 16                                    # allocating space for 4 variables on stack
            sw $a0, 12($sp)                                     # storing array in stack
            sw $a1, 8($sp)                                      # storing start in stack
            sw $a2, 4($sp)                                      # storing end in stack
            sw $ra, 0($sp)                                      # storing return address in stack

            move $a1, $t1                                       # start = mid2
            addi $a1, $a1, 4                                    # start = mid2 + 4

            jal recursive_search                                # calling recursive_search function as recursive_search(array, mid2 + 1, end, key)
            
            lw $ra, 0($sp)                                      # loading return address from stack
            lw $a0, 12($sp)                                     # loading array from stack
            lw $a1, 8($sp)                                      # loading start from stack
            lw $a2, 4($sp)                                      # loading end from stack
            addi $sp, $sp, 16                                   # freeing space for 4 variables on stack

            jr $ra                                              # return to main function
        ELSE:
            sub $sp, $sp, 16                                    # allocating space for 4 variables on stack
            sw $a0, 12($sp)                                     # storing array in stack
            sw $a1, 8($sp)                                      # storing start in stack
            sw $a2, 4($sp)                                      # storing end in stack
            sw $ra, 0($sp)                                      # storing return address in stack

            move $a1, $t0                                       # start = mid1
            addi $a1, $a1, 4                                    # start = mid1 + 4
            move $a2, $t1                                       # end = mid2
            sub $a2, $a2, 4                                     # end = mid2 - 4

            jal recursive_search                                # calling recursive_search function as recursive_search(array, mid1 + 1, mid2 - 1, key)
            
            lw $ra, 0($sp)                                      # loading return address from stack
            lw $a0, 12($sp)                                     # loading array from stack
            lw $a1, 8($sp)                                      # loading start from stack
            lw $a2, 4($sp)                                      # loading end from stack
            addi $sp, $sp, 16                                   # freeing space for 4 variables on stack

            jr $ra                                              # return to main function
    END_WHILE:
        li $v0, -1                                              # v0 = -1 (returning -1 if not found)
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