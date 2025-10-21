#include <cuda.h>

#include <stdlib.h>

extern
__global__ void addKernel(const int *A, const int *B, int *C, int N);


int main(int argc, char **argv) {
  int buf[3][16];
  memset(buf, 0, sizeof(buf));

  int *cuBuf;
  cudaMalloc(&cuBuf, sizeof(buf));
  cudaMemcpy(cuBuf, buf, sizeof(buf), cudaMemcpyHostToDevice);
  dim3 grid(4), block(4);
  addKernel<<<grid,block>>>(&cuBuf[0], &cuBuf[16], &cuBuf[32], 16);


  cudaFree(cuBuf);
  return 0;
}

