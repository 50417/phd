__kernel void fn_A(__global int* A) {
  __assert(__read_offset_bytes(A) == 42);
}