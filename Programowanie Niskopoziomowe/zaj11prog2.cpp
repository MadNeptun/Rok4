//kompilować pod 32 bity

#include <iostream>
using namespace std;
char * dodaj(char * array1, char * array2, int n)
{
	char * result = new char[n + 4-n%4];
	asm(
	    "xor %%ecx, %%ecx;"
            "loop:"
	    "movd (%%edi), %%xmm0;"
	    "movd (%%esi), %%xmm1;"
	    "paddsb %%xmm1, %%xmm0;"
            "movd %%xmm0, (%%eax);"
	    "add $0x4, %%ecx;"
	    "add $0x4, %%edi;"
            "add $0x4, %%esi;"
	    "add $0x4, %%eax;"
            "cmp %%edx, %%ecx;"
	    "jl loop;"
	: /* void */
	: "D"(array1), "S" (array2), "d"(n), "a"(result)
	: "ecx");
	return result;
}

int main(void)
{
    char a1 [] = { 'A', 'B', 'C', 'D', 'E' };
    char a2 [] = { ' ', ' ', ' ', ' ', ' '};
    char * result = dodaj(a1,a2,5);
    for(int i =0; i<5;)
		cout << *(result+i++) << " ";
	delete result;
}