kernel void fn_A(global int* A) {
  atomic_min(A + 0, -8);
  atomic_min(A + 1, -6);
  atomic_min(A + 2, 3);
  atomic_min(A + 3, -3);
  atomic_min(A + 4, 6);
  atomic_min(A + 5, 8);

  atomic_max(A + 6, -8);
  atomic_max(A + 7, -6);
  atomic_max(A + 8, 3);
  atomic_max(A + 9, -3);
  atomic_max(A + 10, 6);
  atomic_max(A + 11, 8);
}