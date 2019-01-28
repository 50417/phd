__constant float a[47] = {8.193313185354206e-04,  3.535548569572820e-04,  -1.453429245341695e-03, 1.042805860697287e-03,  1.264224526451337e-03,  -3.219586065044259e-03, 1.423981657254563e-03,  3.859884310477692e-03, -6.552708013395765e-03, 8.590509694961493e-04,  9.363722386299336e-03,  -1.120357391780316e-02, -2.423088424232164e-03, 1.927528718829535e-02,  -1.646405738285926e-02, -1.143040384534755e-02,
                          3.652830082843752e-02,  -2.132986170036144e-02, -3.396829121834471e-02, 7.273086636811442e-02,  -2.476823886110626e-02, -1.207789042999466e-01, 2.861583432079335e-01,  6.398255789896659e-01, 2.861583432079335e-01,  -1.207789042999466e-01, -2.476823886110626e-02, 7.273086636811442e-02,  -3.396829121834471e-02, -2.132986170036144e-02, 3.652830082843752e-02,  -1.143040384534755e-02,
                          -1.646405738285926e-02, 1.927528718829535e-02,  -2.423088424232164e-03, -1.120357391780316e-02, 9.363722386299336e-03,  8.590509694961493e-04,  -6.552708013395765e-03, 3.859884310477692e-03, 1.423981657254563e-03,  -3.219586065044259e-03, 1.264224526451337e-03,  1.042805860697287e-03,  -1.453429245341695e-03, 3.535548569572820e-04,  8.193313185354206e-04};

__kernel void A(__global float2* b, __global float2* c, uint d) {
  const size_t e = get_global_size(0);
  const size_t f = get_global_id(0);
  const size_t g = d / e;
  const size_t h = f * g;

  size_t i, j;
  for (i = 0; i < g; i++) {
    j = i * e;
    c[j + f] = b[h + i];
  }
}

__kernel void B(__global float2* b, __global float2* c, uint d) {
  const size_t e = get_global_size(0);
  const size_t f = get_global_id(0);
  const size_t k = sizeof(a) / sizeof(float);
  const size_t l = d / e;
  const size_t m = l + k - 1;

  size_t i, n, h;
  if (f == 0) {
    for (i = (m - k + 1); i < m; i++) {
      h = i * e;
      c[h] = (float2)(0.0f, 0.0f);
    }
  }

  float2 o;
  for (i = 0; i < k - 1; i++) {
    o = (float2)(0.0f, 0.0f);

    for (n = 0; n < i + 1; n++) {
      h = n * e;
      o = o + b[h + f] * a[(k - 1) - i + n];
    }

    h = i * e;
    c[h + f + 1] = o;
  }

  for (i = k - 1; i <= l - 1; i++) {
    o = (float2)(0.0f, 0.0f);

    for (n = 0; n < k; n++) {
      h = (i - (k - 1) + n) * e;
      o = o + b[h + f] * a[n];
    }

    h = i * e;
    c[h + f + 1] = o;
  }

  for (i = l; i < m; i++) {
    o = (float2)(0.0f, 0.0f);

    for (n = 0; n < m - i; n++) {
      h = (i - (k - 1) + n) * e;
      o = o + b[h + f] * a[n];
    }

    h = i * e;
    c[h + f + 1] = o;
  }
}

__kernel void C(__global float2* b, __global float2* c, uint p) {
  const size_t e = get_global_size(0);
  const size_t f = get_global_id(0);
  const size_t k = sizeof(a) / sizeof(float);
  const size_t m = p / e;

  size_t q = f * m;

  size_t i, h, r;
  for (i = 0; i < k - 1; i++) {
    h = i * e;
    r = (m + i) * e;
    c[q + i] = b[h + f + 1] + b[r + f];
  }

  for (i = k - 1; i < m; i++) {
    h = i * e;
    c[q + i] = b[h + f + 1];
  }
}