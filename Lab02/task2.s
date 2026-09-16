main:
    li x20, 1             # Value of x (Input selector, e.g., 0, 1, 2, 3, 4)
    li x21, 0              # Value of a (Result variable)
    li x22, 8              # Value of b (Input operand, signed)
    li x23, 11             # Value of c (Input operand, signed)

    # Check for Case 1 (x == 1)
    li t0, 1
    beq x20, t0, Case_1
    
    # Check for Case 2 (x == 2)
    li t0, 2
    beq x20, t0, Case_2
    
    # Check for Case 3 (x == 3)
    li t0, 3
    beq x20, t0, Case_3
    
    # Check for Case 4 (x == 4)
    li t0, 4
    beq x20, t0, Case_4
    
    # Default case: if none of the above match, jump to Default handler
    j Default

Case_1:
    add x21, x22, x23      # a = b + c
    j Exit

Case_2:
    sub x21, x22, x23      # a = b - c
    j Exit

Case_3:
    slli x21, x22, 1       # a = b * 2 (Shift left logical by 1 multiplies by 2)
    j Exit

Case_4:
    srai x21, x22, 1       # a = b / 2 (Use srai instead of srli for signed division)
    j Exit

Default:
    li x21, 0              # a = 0 (Default case when x matches none of the choices)
    j Exit

Exit:
