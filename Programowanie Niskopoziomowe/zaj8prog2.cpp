#include <iostream>
extern void kopiuj(int * cel, int * zrodlo, unsigned int n);
extern void zeruj(int * tablica, unsigned int n);

int main()
{
	unsigned int n = 4;
	int * d = new int [6];
	int * s = new int [6];
	int * t = new int [6];
	
	d[0] = d[1] = d[2] = d[3] = d[4] = d[5] = 0;
	s[0] = s[1] = s[2] = s[3] = s[4] = s[5] = 5;
	t[0] = t[1] = t[2] = t[3] = t[4] = t[5] = 5;
	
	kopiuj(d,s,n);	
	zeruj(t,n);

	for(int i=0; i<6; i++)
	{
		std::cout << d[i] << " " << s[i] << " " << t[i] << std::endl;
	}
	
	delete d, s, t;
	return 0;
}