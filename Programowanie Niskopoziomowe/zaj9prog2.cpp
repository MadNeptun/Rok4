#include <iostream>
extern "C" double wartosc (double a, double b, double x);
int main()
{
	std::cout << wartosc(4,3,2) << std::endl;
	return 0;
}