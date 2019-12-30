#include <stdio.h>
#include <stdio.h>

unsigned isqrt (unsigned x);

void test (unsigned x)
{
    unsigned y = isqrt (x);

    printf ("sqrt (%10u) = %10u    %10u <= %10u < %10llu\n",
        x, y, y * y, x, (unsigned long long) (y + 1) * (y + 1));

    if ((unsigned long long) y * y > x)
        printf ("Error! y * y > x\n");

    if (x >= (unsigned long long) (y + 1) * (y + 1))
        printf ("Error! x >= (y + 1) * (y + 1)\n");
}

int main (void)
{
    int i;

    for (i = 0; i < 256; i ++)
        test (i);

    for (i = 0; i < 256; i ++)
        test (0xFFFFFFFF - i);

    for (i = 0; i < 256; i ++)
        test ((unsigned) rand ());

    return 0;
}
