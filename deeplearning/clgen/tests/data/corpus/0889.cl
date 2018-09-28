__kernel void fn_A(__global int* A, __global int* B, int C) {
  int D = get_group_id(0);
  int E = get_group_id(1);
  int F = get_num_groups(0);
  int G = get_local_id(0);
  int H = get_local_id(1);
  int I, J;

  if ((G | H) == 0)
    atomic_add(A, 1);

  for (I = 1; I < 10000; I++)
    ;
  barrier(2);
  J = A[0];
  barrier(2);
  for (I = 1; I < 10000; I++)
    ;

  if ((G | H) == 0)
    B[E * F + D] = J;
}