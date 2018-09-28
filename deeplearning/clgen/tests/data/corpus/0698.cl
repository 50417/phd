__kernel void fn_A(volatile __global float8* A) {
  for (unsigned B = 0; __invariant(__write_implies(A, ((__write_offset_bytes(A) / sizeof(float8)) % (get_global_size(0))) == get_global_id(0))), B < 100; B++) {
    A[get_global_size(0) * B + get_global_id(0)] = get_global_id(0);
  }
}