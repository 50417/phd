__kernel void fn_A(__global float4* A, __global float4* B, __global float4* C, unsigned int D, int E, unsigned int F) {
  size_t G = get_global_id(0) + D;

  if (G >= F) {
    return;
  }

  float4 H = A[G];
  float4 I = B[G];
  float4 J = (float4)0.0f;

  for (int K = 0; K < E; K++) {
    J.x = hypot(H.x, I.x);
    J.y = hypot(H.y, I.y);
    J.z = hypot(H.z, I.z);
    J.w = hypot(H.w, I.w);
  }

  C[G] = J;
}