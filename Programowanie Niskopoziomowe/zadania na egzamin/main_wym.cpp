#include <cstdio>                                 //( 1)
using namespace std;                              //( 2)
extern "C" void wymiana(char*, char, char, char); //( 3)
extern "C" void wypelnij(char, char*);            //( 4)
extern "C" int szukaj(char*);                     //( 5)
                                                  //( 6)
int main() {                                      //( 7)
  char z = 'A';                                   //( 8)
  char tab[]="12345678901234567890";              //( 9) nic specjalnego
  wypelnij(z, tab);                               //(10) wykonanie funkcji
  printf("[%s]\n", tab);                          //(11) wypisanie łańcucha znaków
  printf("%d %d\n", szukaj(tab), szukaj(tab+9));  //(12) wypisanie wartości wyszukiwania jako liczba
  char txt[]="To jest tekst probny";              //(13)
  wymiana(txt, 'k','A'-'a','*');                  //(14) wykonanie funkcji
  //wymiana(txt, 'f',1,'#');                      //(15) wykonanie funkcji
  printf("[%s]\n", txt);                          //(16) wypisanie łańcucha znaków
  return 0;                                       //(17)
}                                                 //(18)

