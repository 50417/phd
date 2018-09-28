kernel void fn_A(const unsigned int A, const unsigned int B, const unsigned int C, const unsigned int D, const unsigned int E, const unsigned int F, global const double* restrict G, global const double* restrict H, global const double* restrict I, global const double* restrict J, global double* restrict K) {
  const size_t L = get_global_id(0);
  const size_t M = get_global_id(1);
  const size_t N = get_global_id(2);

  for (unsigned int O = 0; O < D; O++) {
    K[(((0)) + ((E) * ((O))) + ((E) * (D) * ((L))) + ((E) * (D) * (A) * ((M))) + ((E) * (D) * (A) * (B) * ((N))))] = G[(((O)) + ((D) * ((L))) + ((D) * (A) * ((M))) + ((D) * (A) * (B) * ((N))))];

    for (unsigned int P = 0; P < D; P++) {
      if (O == P)
        continue;

      K[(((0)) + ((E) * ((O))) + ((E) * (D) * ((L))) + ((E) * (D) * (A) * ((M))) + ((E) * (D) * (A) * (B) * ((N))))] += H[(((0)) + ((F) * ((P))) + ((F) * (D) * ((O))))] * I[(((P)) + ((D) * ((L))) + ((D) * (A) * ((M))) + ((D) * (A) * (B) * ((N))))];

      unsigned int Q = 1;
      for (unsigned int R = 1; R < F; R++) {
        for (unsigned int S = 0; S < 2 * R + 1; S++) {
          K[(((Q)) + ((E) * ((O))) + ((E) * (D) * ((L))) + ((E) * (D) * (A) * ((M))) + ((E) * (D) * (A) * (B) * ((N))))] += H[(((R)) + ((F) * ((P))) + ((F) * (D) * ((O))))] * J[(((Q - 1)) + ((E - 1) * ((P))) + ((E - 1) * (D) * ((L))) + ((E - 1) * (D) * (A) * ((M))) + ((E - 1) * (D) * (A) * (B) * ((N))))];
          Q += 1;
        }
      }
    }
  }
}