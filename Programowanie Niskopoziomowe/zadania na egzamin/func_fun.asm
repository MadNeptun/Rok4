BITS 32                     ;( 1)
section .data               ;( 2)
dane1: dd 0,   0,   4       ;( 3)
dane2: dd 0, 100, 200       ;( 4)
section .text               ;( 5)
change1:                    ;( 6)
    push ebx                ;( 7)
    mov ebx, [esp+8]        ;( 8)
    lea eax, [1+ebx*4+ebx]  ;( 9) obliczenie adresu
    pop ebx                 ;(10)
    ret                     ;(11)
change2:                    ;(12) 
    mov eax, 2              ;(13)
    ret                     ;(14)
change3:                    ;(15)
    enter 0,0               ;(16) alokacja ramki stosu ilość bitów na zmienne, poziom zagłębienia procedury
    shl eax, 2              ;(17) przesunięcie bitów w lewo w eax o 2 (puste miejsca wypełnione zerami)
    leave                   ;(18) skasowanie ramki stosu
    ret                     ;(19)
global _fun, fun            ;(20)
_fun:                       ;(21) wejście do funkcji
fun:                        ;(22) 
   enter 24, 0              ;(23) alokacja ramki stosu ilość bitów na zmienne, poziom zagłębienia procedury
   mov [esp],   edi         ;(24) operacje przygotowujące
   mov [esp+4], esi         ;(25)
   mov [esp+8], ebx         ;(26)
   std                      ;(27) ustawianie flag (direction)
   lea edi, [ebp-4]         ;(28) ładuje obliczony adres do pamięci
   mov esi, dane2           ;(29)
   mov ecx, 3               ;(30)
   rep movsd                ;(31) kopiowanie tablicy z esi do edi o długości ecx
   cld                      ;(32) czyszczenie flag (direction)
   mov ecx, 3               ;(33)
   rep lodsd                ;(34) ładuje 4 bajty z esi do eax i zwiększa (zależy od flagi direction) esi o 4 (tyle razy ile wynosi ecx)
   mov edi, [ebp+8]         ;(35)
   mov ecx, [ebp+12]        ;(36)
   mov ebx, eax             ;(37)
label0:                     ;(38) początek pętli
   lea eax, [ecx-1]         ;(39) ładuje obliczony adres do pamięci
   cdq                      ;(40) kopiuje najwyższy bit z eax do edx i powtarza go na każdym miejscu
   idiv dword [jump_size]   ;(41) dzielenie ze znakiem edx:eax przez argument, wynik trafia do eax a reszta do edx
   mov eax, [edi]           ;(42)
   neg ebx                  ;(43) negacja bitów
   add [ebp + ebx - 8], eax ;(44)
                            ;(45)
   push eax                 ;(46) dodaj na stos
   call [jump + edx*4]      ;(47) skocz do etykiety o numerze edx-1 (reszta zabiegów służy obliczeniu adresu)
   add esp, 4               ;(48)
   stosd                    ;(49) kopiuje 4 bajty z eax do edi i zwiększa (zależy od flagi direction) edi o 4
   loop label0              ;(50) koniec pętli (zmniejsza ecx o 1, jeśli nie zero to skacze do podanej etykiety)
   mov eax, [ebp-12]        ;(51)
   sub eax, [ebp-4]         ;(52)
                            ;(53)
   pop edi                  ;(54) opróżnienie stosu
   pop esi                  ;(55) 
   pop ebx                  ;(56)
   leave                    ;(57) wyjście z funkcji, skasowanie ramki stosu
   ret                      ;(58)
jump: dd change1, change2   ;(59) 'zmienne' wskazujące miejsce skoku
      dd change3            ;(60)
jump_size: dd 3             ;(61) 'zmienna' przechowująca 3

