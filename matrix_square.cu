#include <stdio.h>
#include <stdlib.h>

#define SIZE 1024

void debug_print(int size, int *mat)
{
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
        {
            printf("%d ", mat[i * size + j]);
        }

        printf("\n");
    }
}

__global__ void matrix_square(int size, int *res, int *mat)
{
    int i = blockIdx.x;
    int j = threadIdx.x;

    res[i * size + j] = 0;

    for (int k = 0; k < size; k++)
    {
        res[i * size + j] += mat[i * size + k] * mat[k * size + j];
    }
}

int main()
{
    int *hmat, *hres;
    int *mat, *res;

    hmat = (int *)malloc(sizeof(int) * SIZE * SIZE);
    hres = (int *)malloc(sizeof(int) * SIZE * SIZE);

    for (int i = 0; i < SIZE; i++)
    {
        for (int j = 0; j < SIZE; j++)
        {
            hmat[i * SIZE + j] = i * SIZE + j;
        }
    }

    cudaMalloc(&mat, sizeof(int) * SIZE * SIZE);
    cudaMalloc(&res, sizeof(int) * SIZE * SIZE);

    cudaMemcpy(mat, hmat, sizeof(int) * SIZE * SIZE, cudaMemcpyHostToDevice);

    matrix_square<<<SIZE, SIZE>>>(SIZE, res, mat);

    cudaMemcpy(hres, res, sizeof(int) * SIZE * SIZE, cudaMemcpyDeviceToHost);

    debug_print(SIZE, hres);

    cudaFree(mat);
    cudaFree(res);

    free(hmat);
    free(hres);

    return 0;
}
