typedef int int2 __attribute((ext_vector_type(2))); int fn_A() {
  int2 A = (int2)(1, 0);
  int2 B = (int2)(1, 1);
  return (A && B).x + (A || B).y;
}

int fn_B() {
  int2 A = (int2)(1, 0);
  return (!A).y;
}