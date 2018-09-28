typedef struct _test_arg_struct {
  int a;
  int b;
} test_arg_struct;

kernel void fn_A(global float const volatile* A, local int* B, test_arg_struct C) {
}