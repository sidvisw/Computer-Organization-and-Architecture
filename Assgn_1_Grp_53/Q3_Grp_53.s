# Assignment 1
# Q3
# Semester - 5
# Group No - 53
# Group Members - Umang Singla (20CS10068) , Sidharth Vishwakarma (20CS10082)

# This program computes whether 'n' is a prime number or not,
# where n is entered by the user.
#

    .globl  main

    .data

# program output text constants
prompt:
    .asciiz "Enter a positive integer greater than equals to 10: "
result1:
    .asciiz "Entered number is a PRIME number."
result2:
    .asciiz "Entered number is COMPOSITE number."
newline:
    .asciiz "\n"
error_message:
    .asciiz "Please Enter the correct value\n"

    .text

# main program
#
# program variables
#   n:   $s0
#	i:	 $s1
#   rem: $s2
#
main:
    li      $v0, 4          # issue prompt
    la      $a0, prompt
    syscall

    li      $v0, 5          # get n from user
    syscall
    move    $s0, $v0

    blt $s0,10,error     # doing sanity checking

    li      $s1, 2          # i = 0
for:
    ble     $s0, $s1, endf      # exit loop if n <= i
    div		$s0, $s1		    # dividing n by i
    mfhi    $s2                 # rem = n % i
	beq		$s2, 0, composite   # if rem == 0, then COMPOSITE
    add     $s1, $s1, 1         # i++
    b       for                 # continue loop
endf:

    li      $v0, 4          # print "Entered number is a PRIME number."
    la      $a0, result1
    syscall
    j       end

composite:
    li      $v0, 4          # print "Entered number is a COMPOSITE number."
    la      $a0, result2
    syscall

end:
    li      $v0, 4          # print two newlines
    la      $a0, newline
    syscall
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10         # terminate the program
    syscall

error:
    li $v0, 4                   # print error error_message
    la $a0, error_message
    syscall

    j main                      # jump to main