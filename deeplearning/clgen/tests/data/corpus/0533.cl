typedef float real; __kernel void fn_A(const uint A, __global int* B) {
  const uint C = get_global_id(0);

  if (C >= A)
    return;

  B[C] = -1;
}