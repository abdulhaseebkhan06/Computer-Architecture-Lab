main:
    addi x20, x0, 1         # g = 1
    addi x21, x0, 2         # h = 2
    addi x22, x0, 3         # Test value 1
    addi x23, x0, 3         # Test value 2
    
    bne  x22, x23, Else
    add  x19, x20, x21      # f = g + h (if equal)
    beq  x0, x0, Skip_Else
Else:
    sub  x19, x20, x21      # f = g - h (if not equal)
Skip_Else:
    li   x25, 0x200         # x25 = Base address of array 'save'
    li   x24, 2             # x24 = Target value 'k' (match value)
    li   x22, 0             # x22 = Index 'i' initialized to 0

    # Populate array elements in memory so the loop runs 3 times:
    # save[0] = 2, save[1] = 2, save[2] = 2, save[3] = 5 (exit trigger)
    li   x5, 2
    sw   x5, 0(x25)         # save[0] = 2
    sw   x5, 4(x25)         # save[1] = 2
    sw   x5, 8(x25)         # save[2] = 2
    li   x5, 5
    sw   x5, 12(x25)        # save[3] = 5 (breaks the loop)

Loop:
    slli x10, x22, 2        # x10 = i * 4 (byte offset for word elements)
    add  x10, x10, x25      # x10 = base address + byte offset (&save[i])
    lw   x9, 0(x10)         # x9 = save[i]
    
    bne  x9, x24, Exit_loop # Exit loop if save[i] != k
    
    addi x22, x22, 1        # i = i + 1 (increment index)
    beq  x0, x0, Loop       # Repeat loop

Exit_loop:
    