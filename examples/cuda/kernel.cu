#include <cuda.h>

__global__ void addKernel(const int *A, const int *B, int *C, int N) {
  int id = threadIdx.x + blockIdx.x * blockDim.x;
  if (id < N) {
    C[id] = A[id] + B[id];
  }
}

