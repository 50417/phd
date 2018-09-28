kernel void fn_A(global char* A, global char* B) {
  size_t C = get_global_id(0);
  char2 D = vload2(C, A);
  if (B[C] == 0)
    D++;
  else if (B[C] == 1)
    ++D;
  else if (B[C] == 2)
    D--;
  else
    --D;
  vstore2(D, C, A);
}