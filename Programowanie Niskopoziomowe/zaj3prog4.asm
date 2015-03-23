%include "asm64_io.inc"

segment .data
s1 db 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
s2 db 'z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a'
current db 0x0

segment .bss
tab times 100 dw

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
mov eax, esi
mov ebx, s1
mov edx, s2
add ebx, eax
add edx, eax
mov cl, [current]
cmp [ebx], cl
jne end_prep
mov bl, [edx]
mov [current], bl
jmp wstaw
end_prep:
cmp esi, 0x19
je wstaw
inc esi
jmp offset_loop

wstaw:
mov eax, edi
mov ecx, 4
mul ecx
add eax, tab
mov ebx, [current]
mov [eax], ebx
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
mov eax, esi
mov ecx, 4
mul ecx
mov ebx, eax
add ebx, tab
mov eax, [ebx]
call print_char
inc esi
cmp esi, edi
jl wypisz_loop

koniec:
mov rax, 0
leave
ret