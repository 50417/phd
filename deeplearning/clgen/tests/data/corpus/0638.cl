__kernel void fn_A() {
  __local int A[1024];
  __local int B[1024];

  A[get_local_id(0)] = 0;
  B[get_local_id(0)] = 0;

  for (int C = 0; __invariant(A[get_local_id(0)] == B[get_local_id(0)]), C < 100; C++) {
    A[get_local_id(0)]++;
    B[get_local_id(0)]++;
  }
}