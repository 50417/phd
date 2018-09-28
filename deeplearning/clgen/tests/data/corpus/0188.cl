__kernel void fn_A(__global float4* A, int B, float C, float4 D) {
  int E = get_global_id(0);
  if (E >= B)
    return;

  float4 F = A[E];

  for (int G = 0; G < 10000; G++) {
    F += C * D;
  }

  A[E] = F;
}