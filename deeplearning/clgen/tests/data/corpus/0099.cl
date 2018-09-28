kernel void fn_A(global char* A, char B, unsigned int C, unsigned int D) {
  int E = get_global_id(0);
  if (E < D) {
    A[E + C] = B;
  }
}