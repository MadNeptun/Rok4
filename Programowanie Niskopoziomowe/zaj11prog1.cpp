//kompilować pod 32 bity
#include <iostream>
using namespace std;
void kopiuj(int* cel, int* zrodlo, int n)
{
	asm("rep movsl;" : : "D" (cel), "S" (zrodlo), "c" (n));
}

int main(void)
{
    int a1 [] = { 1, 4, 2, 5, 3 };
    int a2 [] = { 0, 0, 0, 0, 0 };
    kopiuj(a2,a1,4);
    for(int i =0; i<5;)
		cout << *(a2+i++) << " ";
}