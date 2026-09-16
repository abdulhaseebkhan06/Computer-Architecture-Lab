main:
    li      x5, 4           # value of a (outer loop limit)
    li      x6, 3           # value of b (inner loop limit)
    li      x7, 0           # i = 0 (outer loop counter)
    li      x10, 0x200      # base address of array D

outer_loop:
    bge     x7, x5, exit    # If i >= a, exit outer loop
    li      x29, 0          # Reset j = 0 at the start of every inner loop
inner_loop:
    bge     x29, x6, exit_inner # If j >= b, exit inner loop
    # Calculate memory address for D[4 * j]
    # Index is (4 * j), and byte offset is (4 * j) * 4 = 16 * j
    slli    x30, x29, 4     # x30 = j * 16 
    add     x31, x10, x30   # x31 = base address + byte offset (&D[4*j])

    # Compute value: i + j
    add     x28, x7, x29    # x28 = i + j

    # Store result into memory: D[4 * j] = i + j
    sw      x28, 0(x31)     # Store word from x28 into D[4*j]

    # Increment inner loop counter (j++)
    addi    x29, x29, 1     # j = j + 1
    j       inner_loop      # Repeat inner loop

exit_inner:
    # Increment outer loop counter (i++)
    addi    x7, x7, 1       # i = i + 1
    j       outer_loop      # Repeat outer loop

exit:
    