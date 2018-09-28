kernel void fn_A(global float* A) {
  A[get_global_id(0)] = 1.0;
}

kernel void fn_B(global float* A, global float* B) {
}

kernel void fn_C(global float* A, global float* B) {
  int C = get_global_id(0);
  B[C] = sin(sin((A[C])));
}