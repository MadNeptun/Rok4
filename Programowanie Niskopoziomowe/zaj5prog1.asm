BITS 32
section .text 

global suma
suma:
xor ecx, ecx
xor eax, eax
push   ebp        
mov    ebp, esp     
mov    edx, [ebp+8]
sum_loop:
inc ecx
add eax, ecx
cmp ecx, edx
jne sum_loop
leave
ret