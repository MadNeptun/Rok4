BITS 32
section .data
min dd 0x0
max dd 0x0

section .text 

global minmax
minmax:
push   ebp
mov    ebp, esp     
mov    edx, [ebp+8]
mov    ecx, [ebp+12]
mov    eax, [ecx]
mov    [min], eax
mov    [max], eax
xor ebx, ebx
loop:
mov eax, [ecx + 4*ebx]
cmp eax, [min]
jge next_1
mov [min], eax
next_1:
cmp eax, [max]
jle next_2
mov [max], eax
next_2:
inc ebx
cmp ebx, edx
jne loop

mov eax, [min]
mov edx, [max]

mov ebx, [ebp-8]
mov ecx, [ebp-4]

mov [ebx], eax
mov [ecx], edx

mov eax, ebx

leave
ret