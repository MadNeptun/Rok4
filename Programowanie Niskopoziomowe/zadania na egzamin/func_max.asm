BITS 32             ;( 1)
section .text       ;( 2)
global _run, run    ;( 3)
_run:               ;( 4)
run:                ;( 5)
  enter 8, 0        ;( 6) tworzenie ramki stosu
  mov [esp], ebx    ;( 7)
  mov edi, 0        ;( 8)
  sub edx, edx      ;( 9)
  mov ecx, [ebp+8]  ;(10)
  lea esi, [ebp+16] ;(11) ustawianie adresu
  cld               ;(12) czyszczenie flag (direction)
.loop:              ;(13) początek pętli
  lodsd             ;(14) ładuje 4 bajty z esi do eax i zwiększa (zależy od flagi direction) esi o 4
  cmp eax, 0        ;(15)
  je .end           ;(16) wyjście z petli
  cmp ecx, eax      ;(17) ustawienie flag porównania
  cmovg eax, edi    ;(18) przenieś jeżeli większe (flagi z porównania powyżej)
  cmovle ebx, eax   ;(19) przenieś jeżeli mniejsze lub równe (flagi z porównania powyżej)
  add edx, eax      ;(20)
  jmp .loop         ;(21) koniec pętli
.end:               ;(22)
  mov esi, [ebp+12] ;(23) kopiowanie wyników - tak naprawdę max jest tam gdzie wywoła się ostatni raz instrukcja z lini 14
  mov eax, edx      ;(24)
  mov [esi],ebx     ;(25)
  pop ebx           ;(26)
  leave             ;(27) zakonczenie funkcji
  ret               ;(28)
                    ;(29)

