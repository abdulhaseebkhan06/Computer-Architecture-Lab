main:
    li x1, 5             # int a = 5;
    li x2, 0             # int b = 0 + 0; (Fixed: assigned to x2 instead of read-only x0)
    addi x1, x2, 32      # a = b + 32;
    
    # int d = (a + b) - 5;
    add x3, x1, x2       # temporary = a + b
    addi x4, x3, -5    
    
    # int e = (((a - d) + (b - a)) + d);
    sub x3, x1, x4       # temp1 = a - d
    sub x6, x2, x1       # temp2 = b - a
    add x7, x3, x6       # temp3 = temp1 + temp2
    add x5, x7, x4       # int e = temp3 + d (e is in x5)
    
    # e = a + b + d + e;
    add x3, x1, x2       # temp4 = a + b
    add x3, x3, x4       # temp4 = temp4 + d
    add x5, x3, x5       # e = temp4 + e (updates e in x5)

end:
    j end