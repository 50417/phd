__kernel void fn_A(unsigned int A) {
  __requires(A >= 0);
  __requires(A < 128);

  __local int B[128];
  __local int C[128];
  __local int D[128];
  __local int E[128];
  __local int F[128];

  B[get_local_id(0)] = get_local_id(0);
  C[get_local_id(0)] = get_local_id(0);
  D[get_local_id(0)] = get_local_id(0);
  E[get_local_id(0)] = get_local_id(0);
  F[get_local_id(0)] = get_local_id(0);

  __barrier_invariant_3(B[get_local_id(0)] == get_local_id(0), 0, 1, get_local_id(0));
  __barrier_invariant_5(C[get_local_id(0)] == get_local_id(0), 0, 1, 2, 3, get_local_id(0));
  __barrier_invariant_7(D[get_local_id(0)] == get_local_id(0), 0, 1, 2, 3, 4, 5, get_local_id(0));
  __barrier_invariant_9(E[get_local_id(0)] == get_local_id(0), 0, 1, 2, 3, 4, 5, 6, 7, get_local_id(0));
  __barrier_invariant_11(F[get_local_id(0)] == get_local_id(0), 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, get_local_id(0));
  barrier(1);

  __assert(__implies(A <= 1 && get_local_id(0) > A, B[get_local_id(0)] > B[A]));

  __assert(__implies(A <= 3 && get_local_id(0) > A, C[get_local_id(0)] > C[A]));

  __assert(__implies(A <= 5 && get_local_id(0) > A, D[get_local_id(0)] > D[A]));

  __assert(__implies(A <= 7 && get_local_id(0) > A, E[get_local_id(0)] > E[A]));

  __assert(__implies(A <= 9 && get_local_id(0) > A, F[get_local_id(0)] > F[A]));
}