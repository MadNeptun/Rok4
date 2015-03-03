SECTION     .text
global      _start
    
_start:

  ;blok wypisujący tekst
  mov eax, 4
  mov ebx, 1
  mov ecx, pytaj
  mov edx, dl_pytaj
  int 80H

  ;blok czytający tekst
  mov eax, 3
  mov ebx, 0
  mov ecx, bufor
  mov edx, dl_bufor
  int 80H 

  mov esi, eax	      ; magia programu po przeczytaniu tekstu w 
		      ; rejestrze eax znajduje się ilość przeczytanych 
                      ; bajtów (wraz z enterem)
  int 80H

  mov eax, 4
  mov ebx, 1
  mov ecx, hej
  mov edx, dl_hej
  int 80H 

  mov eax, 4
  mov ebx, 1
  mov ecx, bufor
  mov edx, esi
  int 80H 

  mov eax, 1
  int 80H

SECTION     .data
pytaj db "Podaj imie: "
dl_pytaj equ $-pytaj
hej db "Hej "
dl_hej equ $-hej
bufor db "                       "
dl_bufor equ $-bufor

