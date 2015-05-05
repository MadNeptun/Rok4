section .text 
global iloczyn
iloczyn:
xor rax, rax
mov rax, rsi
cmp rdi, 0x1
je koniec
mul rdx
cmp rdi, 0x2
je koniec
mul rcx
cmp rdi, 0x3
je koniec
mul r8
cmp rdi, 0x4
je koniec
mul r9
cmp rdi, 0x5
je koniec
sub rdi, 0x5
xor rcx, rcx
loop2:
xor rdx, rdx
mov edx, [esp+4*ecx+4] ; pobieranie reszty argumentów ze stosu
mul rdx
inc ecx
cmp rcx, rdi
jne loop2
koniec:
ret