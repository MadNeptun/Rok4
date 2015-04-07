BITS 32
section .text 

global suma
suma:
push   ebp
xor eax, eax
xor ebx, ebx        
mov    ebp, esp     
mov    edx, [ebp+8]
mov    ecx, [ebp+12]
sum_loop:
add eax, [ecx + 4*ebx]
inc ebx
cmp ebx, edx
jne sum_loop
leave
ret