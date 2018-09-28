__attribute__((always_inline)) int fn_A() {
  return get_local_id(0);
}

__attribute__((always_inline)) int fn_B(int A) {
  return A;
}

__kernel void fn_C() {
  __local int A[1024];
  __local int B[1024];

  int C = fn_A();

  int D = get_local_id(1);

  int E;

  E = fn_B(get_local_size(0));

  int F = D * get_local_size(0) + get_local_id(0);

  for (int G = 0; G < 100; G++) {
    A[D * E + C] = B[get_local_id(1) * get_local_size(0) + C] + 2;

    B[F]++;
  }
}