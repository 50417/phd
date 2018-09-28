float fn_A(float A) {
  return half_powr(2.0f, A);
}

__kernel void fn_B(__global float* A) {
  if (A[get_global_id(0)])
    fn_A(2.0f);
}