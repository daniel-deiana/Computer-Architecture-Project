#include <cuda.h>
#include <cuda_runtime.h>
#include <stdio.h>

__global__ void mm(int* c, int* a, int* b, int n){

  int x = threadIdx.x + blockIdx.x * blockDim.x;
  int y = threadIdx.y + blockIdx.y * blockDim.y;

  if (x > n || y > n)
    return;

  for (int k = 0; k < n; k++)
    c[x * n + y] += a[x * n + k] * b[k * n + y];
}

int main (void){

  int DIM_V = 32;

  int a[DIM_V][DIM_V],b[DIM_V][DIM_V],c[DIM_V][DIM_V];
  int*d_a, *d_b, *d_c;

  dim3 block(DIM_V, DIM_V);

  int size = sizeof(int)*DIM_V*DIM_V;

  // allocate memory on device
  cudaMalloc((void**)&d_a,size);
  cudaMalloc((void**)&d_b,size);
  cudaMalloc((void**)&d_c,size);

  for (int k = 0; k < DIM_V; k++) {
    for (int j = 0; j < DIM_V; j++) {
    a[k][j] = 1;
    b[k][j] = 1;
    c[k][j] = 0;
    }
  }

  cudaMemcpy(d_a,&a,size,cudaMemcpyHostToDevice);
  cudaMemcpy(d_b,&b,size,cudaMemcpyHostToDevice);
  cudaMemcpy(d_c,&c,size,cudaMemcpyHostToDevice);

  mm<<<1,block>>> (d_c,d_a,d_b,DIM_V);

  cudaMemcpy(c,d_c,size,cudaMemcpyDeviceToHost);


   for (int k = 0; k < DIM_V; k++) {
    for (int j = 0; j < DIM_V; j++) {
    printf("%d ",c[k][j]);
    }
    printf("\n");
  }
  cudaFree(d_a);cudaFree(d_b);cudaFree(d_c);

return 0;
}