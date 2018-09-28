kernel void fn_A(__global int* A) {
  unsigned B = get_global_size(0);
  unsigned C = get_global_id(0);

  for (int D = 0; D < 100; D++) {
    A[C] += A[C + B];
  }

  for (int E = 0; __invariant(E >= 0), E < 100; E++) {
    A[C + E * B] += A[C + B];
  }

  __function_wide_invariant(__write_implies(A, ((__write_offset_bytes(A) / sizeof(int)) % B) == C));
  __function_wide_invariant(__read_implies(A, ((__read_offset_bytes(A) / sizeof(int)) % B) == C));
}