void fn_A(__global int* A) {
  __requires(__enabled());
}

__kernel void fn_B(__global int* A) {
  fn_A(A);
}