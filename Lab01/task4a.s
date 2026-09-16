main:
li x10, 0x78786464
li x11, 0xA8A81919

addi x15, x0, 0x100
sw x10, 0(x15)

addi x16, x0, 0x1F0
sw x11, 0(x16)

lhu x12, 0(x15)

lh x13 , 0(x16)

lb x14, 0(x16)

