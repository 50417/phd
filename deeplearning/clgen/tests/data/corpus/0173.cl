typedef struct {
  int one;
  int two;
} someInts;

typedef struct {
  float3 lettuce;
  int salsa;
  char cheese;
} tacoStruct;

__kernel void fn_A(__global tacoStruct* A, __global char* B) {
  int C = get_global_id(0);

  B[0] = A->salsa + '0';
  B[1] = A->cheese;
  B[2] = A->lettuce.x;
  B[3] = A->lettuce.y;
  B[4] = A->lettuce.z;
  B[5] = 0;
}