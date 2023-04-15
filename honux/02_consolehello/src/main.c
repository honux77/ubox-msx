#include <stdint.h>

extern void printf(char *message);

void main()
{
	for (int y = 0; y < 23; y++)
	{
		for (int x = 0; x <= y; x++)
		{
			printf("*");
		}
		printf("\r\n");
	}
}
