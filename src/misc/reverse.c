#include <stdio.h>

#define REVERSE(n) ((n << 24) | (((n >> 16) << 24) >> 16) | (((n << 16) >> 24) << 16) | (n >> 24))

int main()
{
    unsigned int n = 0x00000000;
    printf("reversed: %x\n", REVERSE(n));
    return 0;
}