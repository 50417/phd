kernel void fn_A(const int A, const float B, const float C, global float* D, global const float* E, global float* F) {
  const int G = get_global_id(0);
  if (G >= A) {
    return;
  }

  D[G] = C * D[G] - B * E[G];

  F[G] += D[G];
}