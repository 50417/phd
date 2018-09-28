kernel void fn_A(global float* A, int B, float C) {
  if (get_global_id(0) == 0) {
    A[B] = C;
  }
}