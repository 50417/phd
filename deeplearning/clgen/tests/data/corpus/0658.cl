void fn_A(__local float* A) {
  for (int B = 0; __invariant(__implies(__read(A), (__read_offset_bytes(A) / sizeof(float)) == get_local_id(0))), __invariant(__implies(__write(A), (__write_offset_bytes(A) / sizeof(float)) == get_local_id(0))), B < 100; B++) {
    A[get_local_id(0)] = A[get_local_id(0)] + 1.0f;
  }
}

void fn_B(__local float* A) {
  for (int B = 0; __invariant(__implies(__read(A), (__read_offset_bytes(A) / sizeof(float)) == get_local_id(0))), __invariant(__implies(__write(A), (__write_offset_bytes(A) / sizeof(float)) == get_local_id(0))), B < 100; B++) {
    A[get_local_id(0)] = A[get_local_id(0)] + 1.0f;
  }
}

__kernel void fn_C(__local float* A, __local float* B) {
  fn_A(A);

  barrier(1);

  fn_B(B);
}