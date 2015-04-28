#include <iostream>
extern unsigned int rotate(unsigned int x, int n = 1);
extern unsigned char rotate(unsigned char x, int n = 1);

int main()
{
	unsigned int number = 1;
	unsigned char character = ' ';
	std::cout << rotate(number,2) << std::endl;
	std::cout << rotate(character) << std::endl;
	return 0;
}