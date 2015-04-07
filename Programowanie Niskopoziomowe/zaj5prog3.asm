BITS 32
section .text 

global sortuj
sortuj:

push   ebp
mov    ebp, esp     
mov    eax, [ebp+8]
mov    ebx, [ebp+12]
mov    ecx, [ebp+16]
mov    eax, [eax]
mov    ebx, [ebx]
mov    ecx, [ecx]

cmp ebx, ecx
jge swap_1
jmp swap_1_end
swap_1:
mov edx, ecx
mov ecx, ebx
mov ebx, edx
swap_1_end:

cmp eax, ebx
jge swap_2
jmp swap_2_end
swap_2:
mov edx, eax
mov eax, ebx
mov ebx, edx
swap_2_end:

cmp ebx, ecx
jge swap_3
jmp swap_3_end
swap_3:
mov edx, ecx
mov ecx, ebx
mov ebx, edx
swap_3_end:

mov edx, [esp+8]
mov    [edx], eax
mov edx, [esp+12]
mov    [edx], ebx
mov edx, [esp+16]
mov    [edx], ecx

leave
ret