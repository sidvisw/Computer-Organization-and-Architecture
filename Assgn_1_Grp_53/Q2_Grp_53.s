# Assignment 1
# Q2
# Semester - 5
# Group No - 53
# Group Members - Umang Singla (20CS10068) , Sidharth Vishwakarma (20CS10082)

# This program computes and displays the GCD of two numbers 'a' and 'b',
# where 'a' and 'b' are entered by the user.
#

    .globl  main

    .data

# program output text constants
prompt1:
    .asciiz "Enter the first positive integer: "
prompt2:
	.asciiz "Enter the second positive integer: "
result:
    .asciiz "GCD of the two integers is: "
newline:
    .asciiz "\n"
error_message:
    .asciiz "Please Enter the correct value\n"

    .text

# main program
#
# program variables
#   a:   $s0
#   b:   $s1
#   gcd: $s2
#
main:
    li      $v0, 4          # issue prompt for first integer
    la      $a0, prompt1
    syscall

    li      $v0, 5          # get a from user
    syscall
    move    $s0, $v0

    li      $v0, 4          # issue prompt for second integer
    la      $a0, prompt2
    syscall

	li      $v0, 5          # get b from user
    syscall
    move    $s1, $v0

    blt $s0,1,error     # doing sanity checking
    blt $s1,1,error     # doing sanity checking

	beq     $s0, 0, end     # if a is 0, end program

for:
    beq     $s1, 0, endf        # exit loop if b == 0
	bgt	    $s0, $s1, subtract1  # exit loop if a > b
	bge	    $s1, $s0, subtract2  # exit loop if b >= a
subtract1:
	sub     $s0, $s0, $s1  # subtract b from a
	j       for
subtract2:
	sub     $s1, $s1, $s0  # subtract a from b
	j       for
    
endf:
	move	$s2, $s0        # set gcd to a
	j   	print

end:
	move	$s2, $s1       # set gcd to b
	j   	print

print:
    li      $v0, 4          # print "GCD of the two integers is: "
    la      $a0, result
    syscall

    li      $v0, 1          # print gcd
    move    $a0, $s2
    syscall

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
