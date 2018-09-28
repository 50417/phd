kernel void fn_A(global float4* A, float B, float C, float D, float E) {
  int F = get_global_id(0);
  A[F] = (float4)(B, C, D, E);
}