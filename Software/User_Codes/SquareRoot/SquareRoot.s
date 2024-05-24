# # Calculate floor(sqrt(x))

# .data
# x:        .word 2147483647

# .text
# main:
#         # call floor(squrt(x))
#         lw  a0 ,x             # load argument x
#         jal ra, floor_sqrt    # call floor_sqrt(x)
        
#         # print result
#         mv a0, a0             # integer to print
#         li a7, 36             # print int environment call (1)
#         ecall                 # print int environment call
        
#         # exit
#         li a7, 10             # exit environment call id (10)
#         ecall                 # exit environment call
        
# floor_sqrt:
#         li   t0, 0            # unsigned int s = 0;
#         li   t1, 1            # unsigned int i = 1;
#         slli t1, t1, 15       # i = i << 15
# for_next_bit:
#         beqz t1, next_bit_end # if i == 0 goto next_bit_end
#         add  t2, t0, t1       # t2 = s + i
#         mul  t3, t2, t2       # t3 = (t2)^2 = (s+i)^2
#         bltu a0, t3, if_x_is_less_than_t3 # if a0 < t3 then don't add
#         add  t0, t0, t1       # s = s + i
# if_x_is_less_than_t3:
#         srli t1, t1, 1        # i = i >> 1
#         j for_next_bit        # goto for_next_bit
# next_bit_end:  
#         mv a0, t0
#         ret

        .data
n:      .word 144       # Input number to calculate the square root

        .text
        .globl _start
_start:
        # Load the number n into x4
        la      x4, n
        lw      x4, 0(x4)
        
        # Initialize low (lo) and high (hi)
        li      x5, 0      # lo = 0
        add     x6, x4, x0 # hi = n

binary_search:
        # mid = (lo + hi) / 2
        add     x7, x5, x6
        srai    x7, x7, 1

        # mid^2
        mul     x8, x7, x7

        # if mid^2 == n, we've found the exact square root
        beq     x8, x4, done
        
        # if mid^2 < n, move lo to mid + 1
        blt     x8, x4, adjust_lo
        
        # if mid^2 > n, move hi to mid - 1
        add     x6, x7, x0
        addi    x6, x6, -1
        j       check_lo

adjust_lo:
        add     x5, x7, x0
        addi    x5, x5, 1

check_lo:
        # if lo <= hi, continue the binary search
        ble     x5, x6, binary_search

        # if lo > hi, we've found the largest integer such that mid^2 <= n
        add     x9, x7, x0
        blt     x8, x4, done
        addi    x9, x7, -1

done:
        # Exit the program
        li      x10, 10     # Exit syscall
        ebreak