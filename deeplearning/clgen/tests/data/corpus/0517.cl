__kernel void fn_A(__global unsigned long* A, __global unsigned long* B, const unsigned long C, const unsigned long D, __local unsigned long* E) {
  unsigned int F = get_local_size(0) * get_group_id(0) + get_local_id(0);
  unsigned int G = get_local_id(0);
  E[G] = 0;
  if (F < C)
    E[G] = A[F];
  E[get_local_size(0) + G] = A[F + get_local_size(0)];

  barrier(1);
  unsigned int H = get_local_size(0);
  while (H > 0) {
    if (G < H)
      E[G] += E[G + H];
    H = H / 2;
    barrier(1);
  }

  if (G == 0)
    B[get_group_id(0)] = E[0];
}