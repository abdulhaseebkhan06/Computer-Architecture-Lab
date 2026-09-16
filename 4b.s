li x20, 0x100      # Base address of array a
li x21, 0x200      # Base address of array b
li x22, 0x300      # Base address of array c

# i = 0 
lb x5, 0(x20)      # Load char a[0]
lh x6, 0(x21)      # Load short b[0]
add x7, x5, x6     # Add a[0] + b[0]
sw x7, 0(x22)      # Store to int c[0]

# i = 1 
lb x5, 1(x20)      # Load char a[1]
lh x6, 2(x21)      # Load short b[1]
add x7, x5, x6     # Add a[1] + b[1]
sw x7, 4(x22)      # Store to int c[1]

# i = 2 
lb x5, 2(x20)      # Load char a[2]
lh x6, 4(x21)      # Load short b[2]
add x7, x5, x6     # Add a[2] + b[2]
sw x7, 8(x22)      # Store to int c[2]

# i = 3 
lb x5, 3(x20)      # Load char a[3]
lh x6, 6(x21)      # Load short b[3]
add x7, x5, x6     # Add a[3] + b[3]
sw x7, 12(x22)     # Store to int c[3]
