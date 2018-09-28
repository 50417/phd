__kernel void fn_A(void) {
  int A = get_global_id(0);
  int B = get_global_id(1);
  int C = get_global_id(2);

  for (int D = 0; D < 2147483647; ++D) {
    if (D == 1 && A == 0) {
      printf("I am 0 and I break out from the loop.\n");
      break;
    }
    if (D == 1 && A == 1) {
      printf("I am 1 and I also break out from the loop.\n");
      break;
    }

    barrier(1);
    printf("gid_x %u after barrier at iteration %d\n", A, D);
  }
}