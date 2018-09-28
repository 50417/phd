kernel void fn_A(global float* A, global float* B) {
  B[get_global_id(0)] = *A;
}