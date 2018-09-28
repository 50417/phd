kernel void fn_A(local float* A, global float* B) {
  atomic_xchg(A, 10.0f);
  atomic_xchg(B, 10.0f);
}