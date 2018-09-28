kernel void fn_A(global float* A, global double* B) {
  int C = get_global_id(0);
  float D = 1.234567890123456789f;
  B[C] = C < 14 ? D : 14;
}