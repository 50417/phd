__kernel void fn_A(__read_only image3d_t A, __global int* B) {
  B[0] = get_image_height(A);
}