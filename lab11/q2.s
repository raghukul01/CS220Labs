# I am assuming that a0 is the first input given the and so on
# if it the convention is different, just negate the final result
    
    .text
    .globl main

main:
    li $v0, 5
    syscall
    addi $s1, $v0, 0
    add $s0, $0, $0
    addi $s2, $0, 1
    j loop


    jr $ra

loop: 
    li $v0, 6
    syscall
    addi $s0, $s0, 1
    beq $s2, $0 diff
    add.s $f1, $f1, $f0
    addi $s2, $0, 0
    bne $s0, $s1, loop
    beq $s0, $s1, print
    jr $ra

diff:
    sub.s $f0 $f2 $f0
    add.s $f1, $f1, $f0
    addi $s2, $0, 1
    bne $s0, $s1, loop

print:
    li $v0, 2
    add.s $f12, $f3, $f1
    syscall

    jr $ra