;
; program zapętla się w pewnym momencie nie potrafię stwierdzić dlaczego
;

%include "asm64_io.inc"

segment .data
liczb1 dd 0x0
liczb2 dd 0x0

segment .text
global asm_main 
asm_main:
enter 0,0

mov rdi, 0x2
mov rsi, 0x1

call read_int
mov [liczb1], rax
call read_int
mov [liczb2], rax

petla_1:
xor rax, rax
xor rcx, rcx
xor rdx, rdx
xor rbx, rbx
mov rax, [liczb1]
mov rbx, rdi
div rbx
mov rcx, 0x0
cmp rdx, rcx
je jedna_jest_ok

xor rdx, rdx
xor rbx, rbx
mov rax, [liczb2]
mov rbx, rdi
div rbx
mov rcx, 0x0
cmp rdx, rcx
je jedna_jest_ok

jmp nowydzielnik_s		
nowydzielnik_e:	

mov rax, [liczb1]
xor rbx, rbx
mov rbx, 0x1
cmp rax, rbx
jne petla_1
mov rax, [liczb2]
xor rbx, rbx
mov rbx, 0x1
cmp rax, rbx
jne petla_1

jmp koniec

jedna_jest_ok:
mov rax, rsi
mov rbx, rdi
mul rbx
mov rsi, rax

xor rdx, rdx
mov rax, [liczb1]
mov rbx, 0x1
cmp rax, rbx
je licz1zmien_e
mov rbx, rdi
div rbx
mov rcx, 0x0
cmp rdx, rcx
je licz1zmien_s
licz1zmien_e:

xor rdx, rdx
mov rax, [liczb2]
mov rbx, 0x1
cmp rax, rbx
je licz2zmien_e
mov rbx, rdi
div rbx
mov rcx, 0x0
cmp rdx, rcx
je licz2zmien_s
licz2zmien_e:

jmp nowydzielnik_e

nowydzielnik_s:
xor rdx, rdx
xor rax, rax

mov rbx, 0x2
mov rcx, rdi
add rcx, 0x1

petla_2:
cmp rcx, rbx
je dzielnik_koniec

xor rdx, rdx
mov rax, rcx
div rbx
cmp rdx, rcx
je dodaj_do_dzielnika_s
mov rbx, 0x1
dodaj_do_dzielnika_e:
add rbx, 0x1

jmp petla_2

dzielnik_koniec:
mov rdi, rcx
jmp nowydzielnik_e

dodaj_do_dzielnika_s:
add rcx, 0x1
mov rbx, 0x1
jmp dodaj_do_dzielnika_e

licz1zmien_s:
mov [liczb1], rax
jmp licz1zmien_e

licz2zmien_s:
mov [liczb2], rax
jmp licz2zmien_e

koniec:
xor rax, rax
mov rax, rsi
call println_int
mov rax, 0
leave
ret

;
; program w c++ obrazujący algorytm
;
;#include <iostream>
;#include <cstdlib>
;using namespace std;
;
;int main() {
;	int licz1;
;	int licz2;
;	cin >> licz1;
;	cin >> licz2;
;	int divider = 2;
;	int acc = 1;	
;	while (true)
;	{
;		if (licz1%divider == 0 || licz2%divider == 0)
;		{
;			acc *= divider;
;			if (licz1 != 1 && licz1%divider == 0)
;				licz1 /= divider;
;			if (licz2 != 1 && licz2%divider == 0)
;				licz2 /= divider;
;		}
;		else
;		{
;			int d = 2;
;			divider++;
;			while (true)
;			{
;				if (d == divider)
;					break;
;
;				if (divider%d == 0)
;				{
;					d = 1;
;					divider++;
;				}
;				d++;
;			}
;		}
;		if (licz1 == 1 && licz2 == 1)
;			break;
;	}
;	cout << acc;
;}
