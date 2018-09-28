__kernel void __attribute__((reqd_work_group_size(1, 1, 1))) fn_A(__global char* A) {
  char B[2];

  B[0] = A[0];
  B[1] = A[1];

  printf("Hello World!\n");
  printf("The host has sent the following values to the kernel %d & %d\n", B[0], B[1]);
  printf("The kernel in this example does not send data back to the host\n");
}