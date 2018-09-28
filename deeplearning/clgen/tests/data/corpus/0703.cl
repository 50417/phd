__kernel void fn_A(int A) {
  int B = 0;

  for (int C = 0; C < 100; C++) {
    if (B > 1000) {
      return;
    }
    B += C;
  }

  for (int C = 0; C < 100; C++) {
    B += C;
  }
}