main:
li x22, 0 # i initialization
li x23, 0 # Sum Initialization 
li x24, 3 # stored 10 in x24 to compare with i
li x26, 0x200 # x26 is base adress

Loop1:
slli x25, x22, 2 # x25 contains i*4
add x27, x26, x25 # adress
sw x22, 0(x27)
addi x22,x22,1
blt x22,x24, Loop1
li x22, 0 # i reset
Loop2:
slli x25, x22, 2 # x25 contains i*4
add x27, x26, x25 # adress
lw x28, 0(x27) # Value of a[i]
add x23,x23,x28 
addi x22,x22,1
blt x22,x24,Loop2
