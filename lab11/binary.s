#===============================================================#
##################### Declare all variables #####################
#===============================================================#


    .data
    .align 2

    
msg_inputList:      .asciiz "Please enter positive numbers in ascending order and a 0 to terminate\n"
msg_searchList:     .asciiz "Please enter a number to initSearch for\n"
msg_YES:            .asciiz " - YES\n"
msg_NO:             .asciiz " - NO\n"


#===============================================================#
######################### Program Code ##########################
#===============================================================#


    .text
    .globl main
    
    
#===============================================================#

main:
    li          $v0, 4                  # syscall 4 (print_str)
    la          $a0, msg_inputList      # load the input message
    syscall                             # execute message print

    li          $v0, 9                  # syscall 9 (sbrk)
    la          $a0, 4                  # 4 bytes allocated for ints
    syscall                             # execute memory allocation
    move        $s1, $v0                # store the start address of heap

    li          $s4, 0                  # set list items counter to 0
    
#===============================================================#

inputList:
    li          $v0, 5                  # syscall 5 (read_int)
    syscall                             # execute int reading
    move        $t1, $v0                # store int in $t1
    blez        $v0, initSearchList     # start search items input if 0 is input

    li          $v0, 9                  # syscall 9 (sbrk)
    la          $a0, 4                  # 4 bytes allocated for ints
    syscall                             # execute memory allocation

    li          $t0, 4                  # 4 bytes for an int
    mul         $t0, $s4, $t0           # length of the input storage address space
    add         $t0, $t0, $s1           # calculate end of address space
    move        $s5, $t0                # store end of address space
    sw          $t1, ($t0)              # store the input on the heap
    addi        $s4  $s4, 1             # counter++
    
    j           inputList               # take next input
    
#===============================================================#

initSearchList:
    li          $v0, 4                  # syscall 4 (print_str)
    la          $a0, msg_searchList     # load the search items input message
    syscall                             # execute message print

    li          $s2, 0                  # set search items counter to 0
    
#===============================================================#

searchList:
    li          $v0, 5                  # syscall 5 (read_int)
    syscall                             # execute int reading
    move        $t1, $v0                # move int to $t1
    blez        $v0, initSearch         # start search if 0 was entered

    li          $v0, 9                  # syscall 4 (sbrk)
    la          $a0, 4                  # 4 bytes allocated for ints
    syscall                             # execute memory allocation

    li          $t0, 4                  # 4 bytes for an int
    add         $t2, $s4, $s2           # length of the list is counter1 + counter 2
    mul         $t0, $t2, $t0           # length of the input storage address space
    add         $t0, $t0, $s1           # calculate end of address spaces
    move        $s3, $t0                # store end of address space
    sw          $t1, ($t0)              # store input on the heap
    addi        $s2, $s2, 1             # counter++

    j           searchList              # take next input
    
#===============================================================#

initSearch:
    move        $t6, $s5                # store end address of input items
    move        $t7, $s3                # store end address of search items
    
#===============================================================#

search:                                                  
    move        $t5, $s5                # store end address of input items
    beq         $t7, $t6, exit          # if there's nothing to search, exit
    
#===============================================================#

splitStep:

    move        $s6, $s1                # min is the start address of the heap
    move        $s7, $s5                # max is the end address of the heap
    move        $t0, $s4                # store the input list counter
    move        $t9, $s4                # store the input list counter
    li          $v1, 2                  # store 2
    div         $t9, $v1                # divide the counter by 2
    mflo        $t9                     # move result of division to $t9
    add         $t9, $t9, $v1
    
#===============================================================#

checkHigher:
    li          $v1, 2                  # store 2
    div         $t0, $v1                # divide the counter by 2
    mflo        $v1                     # store the division result
    mflo        $t0                     # move the counter out

    blez        $t0, remainderStep      # counter is at 0, check remainer step
    
    j           loopCheck               # run the looping check
    
#===============================================================#

checkLower:
    li          $v1, 2                  # store 2
    div         $t0, $v1                # divide the counter by 2
    mflo        $v1                     # store the division result
    mflo        $t0                     # move the counter out
    mfhi        $t1                     # move Hi to $t1

    blez        $t0, failStep           # If the counter equals zero and so does the division remainder then print no
    
    j           loopCheck               # run the looping check
    
#===============================================================#

failStep:
    blez        $t1, no                 # failed, return no
    
#===============================================================#

loopCheck:
    beq         $s6, $s7, no            # max and min are now the same, didn't find the number
    blez        $t9, no                 # lower counter is 0, we didn't find the number

    mul         $v1, $t0, 4             # multiply counter by 4 to get the address space length
    add         $t4, $s6, $v1           # add the address space length to get the end address

    lw          $a1, ($t7)              # get value of $t7
    lw          $a2, ($t4)              # get value of $t4

    sub         $t9, $t9, 1             # counter--

    beq         $a2, $a1, yes           # we found it! yay
    sub         $t1, $a1, $a2           # is it greater than or less than the point?
    blez        $t1, searchLower        # it's less than, run the search on the lower segment
    bgez        $t1, searchHigher       # it's greater than, run the search on the higher segment
    
#===============================================================#

remainderStep:
    mfhi        $t8                     # store result
    bgtz        $t8, incrementCounter   # there's a remainder, move on to deal with it
    j           loopCheck               # no remainder, run the search
    
#===============================================================#

incrementCounter:
    add         $t0, $v1, $t8           # counter++
    
    j           loopCheck               # run the search
    
#===============================================================#

searchLower:
    move        $s7, $t4                # max point is now the old midpoint
    
    j           checkLower              # search lower segment
    
#===============================================================#

searchHigher:
    move        $s6, $t4                # min point is now the old max
    
    j           checkHigher             # search higher segment
    
#===============================================================#

restartSearch:
    sub         $t7, $t7, 4             # counter - 4
    
    j           search                  # run search
    
#===============================================================#

yes:
    li          $v0, 1                  # syscall 1 (print_int)
    lw          $a0, ($t4)              # load current int
    syscall                             # execute int printing

    li          $v0, 4                  # syscall 4 (print_str)
    la          $a0, msg_YES            # load yes message
    syscall                             # execute message printing

    j           restartSearch           # run search on the rest of the search items
    
#===============================================================#

no:
    li          $v0, 1                  # syscall 1 (print_int)
    lw          $a0, ($t7)              # load current int
    syscall                             # execute int printing

    li          $v0, 4                  # syscall 4 (print_str)
    la          $a0, msg_NO             # load no message
    syscall                             # execute message printing
    
    j           restartSearch           # run search on the rest of the search items
    
#===============================================================#

exit:
    li          $v0, 10                 # syscall 10 (exit)
    syscall                             # execute exit
