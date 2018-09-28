kernel void fn_A(const int A, global float* B) {
  const int C = get_global_id(0);
  if (C >= A) {
    return;
  }
  B[C] = 1.0f / B[C];
}