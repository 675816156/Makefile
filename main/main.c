#include <stdio.h>

extern int add(int a, int b);
extern int sub(int a, int b);
extern int div(int a, int b);

int main(void)
{
    int a = 100;
    int b = 10;

    printf("a + b = %d\n", add(a, b));
    printf("a - b = %d\n", sub(a, b));
    printf("a / b = %d\n", div(a, b));
    return 0;
}