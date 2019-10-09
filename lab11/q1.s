                .data
msg1:           .asciiz "Please input the size of the sorted Array: "
msg2:           .asciiz "Please input the elements of sorted Array: "
msg3:           .asciiz "Found element at index "
msg4:           .asciiz "Element was not found\n"
msg5:           .asciiz "What Element to search?:"
msg6:           .asciiz "\n"
arr:            .word 0 0 0 0 0 0 0 0 0 0 0 0

                .text
                .globl main

main:           li $v0, 4
                la $a0, msg1
                syscall

                li $v0, 5
                syscall

                move $a2, $v0
                addi $v0, $0, 4
                mult $a2, $v0
                mflo $t0
                addiu $s0, $t0, 0

                la $t1, arr

                li $v0, 4
                la $a0, msg2
                syscall

                move $t2, $0

loop1:          li $v0, 5
                syscall

                sw $v0, 0($t1)
                addi $t1, $t1, 4
                addiu $t2, $t2, 4
                slt $v0, $t2, $t0
                bne $v0, $0, loop1

                li $v0, 4
                la $a0, msg5
                syscall

                li $v0, 5
                syscall

                move $s1, $v0
                move $t0, $0
                addi $t1, $s0, -4

binarysearch:   slt $v0, $t1, $t0
                bne $v0, $0, notfound

                sra $t1, $t1, 2
                sra $t0, $t0, 2
                add $t2, $t0, $t1
                sra $t2, $t2, 1
                sll $t2, $t2, 2
                addiu $s2, $t2, 0
                sll $t1, $t1, 2
                sll $t0, $t0, 2
                la $t3, arr
                add $t3, $t3, $t2

                lw $t2, 0($t3)
                beq $t2, $s1, found

                slt $v0, $t2, $s1
                bne $v0, $0, mvright
                beq $v0, $0, mvleft

mvleft:         addi $t1, $s2, -4
                j binarysearch

mvright:        addi $t0, $s2, 4
                j binarysearch

found:          li $v0, 4
                la $a0, msg3
                syscall

                li $v0, 1
                add $a0, $s2, $0
                sra $a0, $a0, 2
                addiu $a0, $a0, 1
                syscall

                li $v0, 4
                la $a0, msg6
                syscall

                j exit

notfound:       li $v0, 4
                la $a0, msg4
                syscall

                # j exit

exit:           li $v0, 10
                syscall

#          la $t1, arr
#          move $t2, $0
#
#loop2:    li $v0, 1
#          lw $a0, 0($t1)
#          syscall
#
#          li $v0, 4
#          la $a0, msg5
#          syscall
#
#          addi $t1, $t1, 4
#          addiu $t2, $t2, 4
#          slt $v0, $t2, $t0
#          bne $v0, $0, loop2
#

