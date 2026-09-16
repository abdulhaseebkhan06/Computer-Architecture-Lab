.globl main

main:
    li   x10, 2          # g = 2
    li   x11, 3          # h = 3
    li   x12, 4          # i = 4
    li   x13, 5          # j = 5
    
    jal  x1, leaf_example
    
    li   a0, 1           
    ecall                
    j    exit

leaf_example:
    # Save registers to stack
    addi sp, sp, -32     # Allocate stack frame
    sw   x18, 0(sp)      
    sw   x19, 8(sp)      
    sw   x20, 16(sp)     

    # Compute f = (g + h) - (i + j)
    add  x18, x10, x11   # g + h
    add  x19, x12, x13   # i + j
    sub  x20, x18, x19   # f = (g + h) - (i + j)
    
    addi x10, x20, 0     # Return value in a0 (x10)

    # Restore registers and stack
    lw   x18, 0(sp)      
    lw   x19, 8(sp)      
    lw   x20, 16(sp)     
    addi sp, sp, 32     # Deallocate stack frame
    
    jalr x0, 0(x1)       # Return to caller

exit:
