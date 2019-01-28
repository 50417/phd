typedef int int2 __attribute((ext_vector_type(2))); int A() {
  int2 a = (int2)(1, 0);
  int2 b = (int2)(1, 1);
  return (a && b).x + (a || b).y;
}

int B() {
  int2 a = (int2)(1, 0);
  return (!a).y;
}