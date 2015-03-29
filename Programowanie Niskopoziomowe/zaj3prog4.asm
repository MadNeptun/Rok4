%include "asm64_io.inc"

segment .data
s1 db 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
s2 db 'z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a'
current db 0x0

segment .bss
tab times 100 db

segment .text
global asm_main 
asm_main:
enter 0,0
xor edi, edi

read_loop:
xor esi, esi
xor ebx, ebx
xor eax, eax
xor ecx, ecx
xor edx, edx
call read_char
mov bl, 0x0A
cmp al, bl
je wypisz
mov [current], al

offset_loop:
mov cl, [current]
cmp [s1 + esi], cl
jne end_prep
mov bl, [s2 + esi]
mov [current], bl
jmp wstaw
end_prep:
cmp esi, 0x19
je wstaw
inc esi
jmp offset_loop

wstaw:
mov ebx, [current]
mov [tab + edi], ebx
inc edi
cmp edi, 0x63
jne read_loop

wypisz:
xor esi, esi
xor ebx, ebx
xor eax, eax
xor ecx, ecx
xor edx, edx

wypisz_loop:
mov eax, [tab + esi]
call print_char
inc esi
cmp esi, edi
jl wypisz_loop

koniec:
mov rax, 0
leave
ret