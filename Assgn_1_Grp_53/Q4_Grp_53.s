# Assignment 1
# Q4
# Semester - 5
# Group No - 53
# Group Members - Umang Singla (20CS10068) , Sidharth Vishwakarma (20CS10082)

# This program computes whether 'n' is a perfect number or not,
# where n is entered by the user.

    .globl  main
 
    .data

# program output text constants
input: 
    .asciiz "Please Enter a positive integer: "

perfect: 
    .asciiz "Entered number is a perfect number\n"

notperfect: 
    .asciiz "Entered number is not a perfect number\n"

error_message:
    .asciiz "Please Enter the correct value\n"


    .text
# main program

# program variables
#   n:   $s0
#	i:	 $s2
#   sum: $s1
#   rem: $s3

main:   
    li $v0, 4            # input prompt
    la $a0, input
    syscall

    li $v0, 5           # taking input from user
    syscall
    move $s0, $v0

    blt $s0,1,error     # doing sanity checking

    li $s1, 0           # initializing factors sum to 0

    li $s2, 0           # setting iterator to 0

    j for               # entering for loop

yes:
    li $v0, 4           # printing that n is perfect
    la $a0, perfect
    syscall

    j end               # jump to end

answer:
    beq $s1,$s0,yes         # if sum == n, then yes
    li $v0, 4               # else printing that the number is not perfect
    la $a0, notperfect
    syscall

    j end                   # jump to end

for:
    addi $s2,$s2,1             # i = i + 1
    bge $s2,$s0,answer         # break if i >= n

    div $s0,$s2                 # n/i

    mfhi $s3                    # rem = n%i

    beq $s3,0,addval            # if rem == 0, addval
    j for                       # continue loop

addval:
    add $s1,$s1,$s2             # sum = sum + i
    j for                       # continue loop

end:
    li $v0, 10                  # end program
    syscall

error:
    li $v0, 4                   # print error error_message
    la $a0, error_message
    syscall

    j main                      # jump to main