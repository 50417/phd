kernel void fn_A(global int* A, global int* B) {
  int C = A[get_global_id(0)];
  int D = work_group_scan_exclusive_add(C);
  B[get_global_id(0)] = D;
}

kernel void fn_B(global uint* A, global uint* B) {
  uint C = A[get_global_id(0)];
  uint D = work_group_scan_exclusive_add(C);
  B[get_global_id(0)] = D;
}

kernel void fn_C(global long* A, global long* B) {
  long C = A[get_global_id(0)];
  long D = work_group_scan_exclusive_add(C);
  B[get_global_id(0)] = D;
}

kernel void fn_D(global ulong* A, global ulong* B) {
  ulong C = A[get_global_id(0)];
  ulong D = work_group_scan_exclusive_add(C);
  B[get_global_id(0)] = D;
}

kernel void fn_E(global float* A, global float* B) {
  float C = A[get_global_id(0)];
  float D = work_group_scan_exclusive_add(C);
  B[get_global_id(0)] = D;
}

kernel void fn_F(global int* A, global int* B) {
  int C = A[get_global_id(0)];
  int D = work_group_scan_exclusive_max(C);
  B[get_global_id(0)] = D;
}

kernel void fn_G(global uint* A, global uint* B) {
  uint C = A[get_global_id(0)];
  uint D = work_group_scan_exclusive_max(C);
  B[get_global_id(0)] = D;
}

kernel void fn_H(global long* A, global long* B) {
  long C = A[get_global_id(0)];
  long D = work_group_scan_exclusive_max(C);
  B[get_global_id(0)] = D;
}

kernel void fn_I(global ulong* A, global ulong* B) {
  ulong C = A[get_global_id(0)];
  ulong D = work_group_scan_exclusive_max(C);
  B[get_global_id(0)] = D;
}

kernel void fn_J(global float* A, global float* B) {
  float C = A[get_global_id(0)];
  float D = work_group_scan_exclusive_max(C);
  B[get_global_id(0)] = D;
}

kernel void fn_K(global int* A, global int* B) {
  int C = A[get_global_id(0)];
  int D = work_group_scan_exclusive_min(C);
  B[get_global_id(0)] = D;
}

kernel void fn_L(global uint* A, global uint* B) {
  uint C = A[get_global_id(0)];
  uint D = work_group_scan_exclusive_min(C);
  B[get_global_id(0)] = D;
}

kernel void fn_M(global long* A, global long* B) {
  long C = A[get_global_id(0)];
  long D = work_group_scan_exclusive_min(C);
  B[get_global_id(0)] = D;
}

kernel void fn_N(global ulong* A, global ulong* B) {
  ulong C = A[get_global_id(0)];
  ulong D = work_group_scan_exclusive_min(C);
  B[get_global_id(0)] = D;
}

kernel void fn_O(global float* A, global float* B) {
  float C = A[get_global_id(0)];
  float D = work_group_scan_exclusive_min(C);
  B[get_global_id(0)] = D;
}