__kernel void fn_A(__global int* A, __global int* B) {
  switch (get_global_id(0)) {
    case 0:
      A[get_global_id(0)] = B[get_global_id(0) + 4];
      break;
    case 1:
      A[get_global_id(0)] = B[get_global_id(0) + 14];
      break;
    case 2:
      A[get_global_id(0)] = B[get_global_id(0) + 13];
      break;
    case 6:
      A[get_global_id(0)] = B[get_global_id(0) + 11];
      break;
    case 7:
      A[get_global_id(0)] = B[get_global_id(0) + 10];
      break;
    case 10:
      A[get_global_id(0)] = B[get_global_id(0) + 9];
      break;
    case 12:
      A[get_global_id(0)] = B[get_global_id(0) + 6];
      break;
    default:
      A[get_global_id(0)] = B[get_global_id(0) + 8];
      break;
  }
}