typedef struct {
  int i;
  int j;
} program_state_struct;

typedef struct { int dummy; } used_params_struct;

typedef unsigned char fsm_state;

bool A(fsm_state a) {
  if ((a ^ 0x00) == 0 || (a ^ 0x03) == 0)
    return true;
  return false;
}

bool B(char* b, __constant char* c) {
  int d = 0;
  while (b[d] != '\0' && c[d] != '\0') {
    if (b[d] != c[d])
      return false;
    ++d;
  }
  if (b[d] != c[d])
    return false;
  return true;
}

void C(program_state_struct* e, const __global program_state_struct* f) {
  if (e == 0 || f == 0)
    return;

  e->i = f->i;
  e->j = f->j;
}

unsigned int D(unsigned int g, fsm_state h) {
  if (g == 0 && h == 5)
    return 0;
  if (g == 0 && h == 3)
    return 1;

  return 0;
}

fsm_state E(unsigned int g, unsigned int i) {
  if (g == 0 && i == 0)
    return 5;
  if (g == 0 && i == 1)
    return 3;

  return 0;
}
void F(bool j, bool k, fsm_state l, __global fsm_state* m) {
  if (l == 5 && (j && k))
    *m = 5;
  if (l == 5 && (j && !k))
    *m = 3;
  if (l == 5 && (!j && k))
    *m = 3;
  if (l == 5 && (!j && !k))
    *m = 3;
  if (l == 3 && (j && k))
    *m = 3;
  if (l == 3 && (j && !k))
    *m = 3;
  if (l == 3 && (!j && k))
    *m = 3;
  if (l == 3 && (!j && !k))
    *m = 3;
  else
    return;
}

__kernel void G(__global program_state_struct const* restrict n, __global fsm_state* o, __global fsm_state* p, __global uint* q, __global uint* r, __global used_params_struct* s, uint t) {
  uint u = t;
  int v = get_global_id(0);
  int w = u / get_global_size(0);

  program_state_struct x;
  fsm_state y;
  unsigned int z = 0;

  int d;
  int aa;

  bool j;
  bool k;

prop0:
  if (v + w <= q[0])
    goto prop1;

  y = p[0];

  for (int aa = (v * w); aa < ((v + 1) * w); ++aa) {
    C(&x, &n[aa]);

    d = x.i;
    aa = x.j;

    j = (d >= 0);

    k = (aa >= 0);

    F(j, k, 5, &(o[u * 0 + 0 + aa * 1]));
  }

prop1:

  return;
}