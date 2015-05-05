section .text 
global iloczyn
iloczyn:
push rbx
xor rcx, rcx
xor rbx, rbx
xor rax, rax
mov rax, 0x1
loop:
mov ebx, [rsi]
mul ebx
inc ecx
add rsi, 0x4
cmp rcx, rdi
jne loop
pop rbx
ret