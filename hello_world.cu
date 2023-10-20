#include <stdio.h>

__global__ void hello_world()
{
    printf("Hello, world!\n");
}

int main()
{
    hello_world<<<32, 32>>>();
    cudaDeviceSynchronize();
    return 0;
}
