typedef uint z; __constant uint gb_A[] = {0xd807aa98U, 0x12835b01U, 0x243185beU, 0x550c7dc3U, 0x72be5d74U, 0x80deb1feU, 0x9bdc06a7U, 0xc19bf3f4U, 0x0fc19dc6U, 0x240ca1ccU, 0x80000000U, 0x2de92c6fU, 0x4a7484aaU, 0x00000280U, 0x5cb0a9dcU, 0x76f988daU, 0x983e5152U, 0xa831c66dU, 0xb00327c8U, 0xbf597fc7U, 0xc6e00bf3U, 0x00A00055U, 0xd5a79147U, 0x06ca6351U, 0x14292967U, 0x27b70a85U, 0x2e1b2138U,
                          0x4d2c6dfcU, 0x53380d13U, 0x650a7354U, 0x766a0abbU, 0x81c2c92eU, 0x92722c85U, 0xa2bfe8a1U, 0xa81a664bU, 0xc24b8b70U, 0xc76c51a3U, 0xd192e819U, 0xd6990624U, 0xf40e3585U, 0x106aa070U, 0x19a4c116U, 0x1e376c08U, 0x2748774cU, 0x34b0bcb5U, 0x391c0cb3U, 0x4ed8aa4aU, 0x5b9cca4fU, 0x682e6ff3U, 0x748f82eeU, 0x78a5636fU, 0x84c87814U, 0x8cc70208U, 0x90befffaU,
                          0xa4506cebU, 0xbef9a3f7U, 0xc67178f2U, 0x98c7e2a2U, 0x90bb1e3cU, 0x510e527fU, 0x9b05688cU, 0xfc08884dU, 0x3c6ef372U, 0x50c6645bU, 0x6a09e667U, 0xbb67ae85U, 0x3ac42e24U, 0xd21ea4fdU, 0x59f111f1U, 0x923f82a4U, 0xab1c5ed5U, 0x5807aa98U, 0xc19bf274U, 0xe49b69c1U, 0x00a00000U, 0xefbe4786U, 0x00000100U, 0x11002000U, 0x00400022U, 0x136032EDU};

__kernel __attribute__((vec_type_hint(z))) __attribute__((reqd_work_group_size(128, 1, 1))) void fn_A(

    const z A,

    const uint B, const uint C, const uint D, const uint E, const uint F, const uint G, const uint H, const uint I, const uint J, const uint K, const uint L, const uint M, const uint N, const uint O, const uint P, const uint Q, const uint R, const uint S, const uint T, const uint U, const uint V, const uint W, const uint X, const uint Y, const uint Z, const uint AA, const uint AB, volatile __global uint* AC) {
  z AD[930];

  const z AE = A + (uint)(get_global_id(0));

  AD[15] = AE + B;

  AD[16] = (bitselect((z)O, (z)N, (z)AD[15]) + M) + ((rotate((z)(AD[15]), (z)26) ^ rotate((z)(AD[15]), (z)21) ^ rotate((z)(AD[15]), (z)7)));
  AD[26] = AE + D;

  AD[27] = bitselect((z)Q, (z)R, (z)AD[26] ^ (z)Q) + ((rotate((z)(AD[26]), (z)30) ^ rotate((z)(AD[26]), (z)19) ^ rotate((z)(AD[26]), (z)10)));
  AD[17] = AD[16] + P;

  AD[19] = (bitselect((z)N, (z)AD[15], (z)AD[17]) + S) + ((rotate((z)(AD[17]), (z)26) ^ rotate((z)(AD[17]), (z)21) ^ rotate((z)(AD[17]), (z)7)));
  AD[28] = AD[27] + AD[16];

  AD[548] = bitselect((z)AD[26], (z)Q, (z)AD[28] ^ (z)AD[26]) + ((rotate((z)(AD[28]), (z)30) ^ rotate((z)(AD[28]), (z)19) ^ rotate((z)(AD[28]), (z)10)));
  AD[20] = AD[19] + R;

  AD[22] = (bitselect((z)AD[15], (z)AD[17], (z)AD[20]) + T) + ((rotate((z)(AD[20]), (z)26) ^ rotate((z)(AD[20]), (z)21) ^ rotate((z)(AD[20]), (z)7)));
  AD[29] = AD[548] + AD[19];

  AD[549] = bitselect((z)AD[28], (z)AD[26], (z)AD[29] ^ (z)AD[28]) + ((rotate((z)(AD[29]), (z)30) ^ rotate((z)(AD[29]), (z)19) ^ rotate((z)(AD[29]), (z)10)));
  AD[23] = AD[22] + Q;

  AD[24] = bitselect((z)AD[17], (z)AD[20], (z)AD[23]) + ((rotate((z)(AD[23]), (z)26) ^ rotate((z)(AD[23]), (z)21) ^ rotate((z)(AD[23]), (z)7)));
  AD[180] = AE + C;
  AD[30] = AD[549] + AD[22];

  AD[31] = bitselect((z)AD[29], (z)AD[28], (z)AD[30] ^ (z)AD[29]) + ((rotate((z)(AD[30]), (z)30) ^ rotate((z)(AD[30]), (z)19) ^ rotate((z)(AD[30]), (z)10)));
  AD[181] = AD[180] + AD[24];

  AD[182] = AD[181] + AD[26];
  AD[183] = AD[181] + AD[31];
  AD[18] = AD[17] + gb_A[0];

  AD[186] = (bitselect((z)AD[20], (z)AD[23], (z)AD[182]) + AD[18]) + ((rotate((z)(AD[182]), (z)26) ^ rotate((z)(AD[182]), (z)21) ^ rotate((z)(AD[182]), (z)7)));
  AD[184] = bitselect((z)AD[30], (z)AD[29], (z)AD[183] ^ (z)AD[30]) + ((rotate((z)(AD[183]), (z)30) ^ rotate((z)(AD[183]), (z)19) ^ rotate((z)(AD[183]), (z)10)));

  AD[187] = AD[186] + AD[28];
  AD[188] = AD[186] + AD[184];
  AD[21] = AD[20] + gb_A[1];

  AD[191] = (bitselect((z)AD[23], (z)AD[182], (z)AD[187]) + AD[21]) + ((rotate((z)(AD[187]), (z)26) ^ rotate((z)(AD[187]), (z)21) ^ rotate((z)(AD[187]), (z)7)));
  AD[189] = bitselect((z)AD[183], (z)AD[30], (z)AD[188] ^ (z)AD[183]) + ((rotate((z)(AD[188]), (z)30) ^ rotate((z)(AD[188]), (z)19) ^ rotate((z)(AD[188]), (z)10)));

  AD[192] = AD[191] + AD[29];
  AD[193] = AD[191] + AD[189];
  AD[25] = AD[23] + gb_A[2];

  AD[196] = (bitselect((z)AD[182], (z)AD[187], (z)AD[192]) + AD[25]) + ((rotate((z)(AD[192]), (z)26) ^ rotate((z)(AD[192]), (z)21) ^ rotate((z)(AD[192]), (z)7)));
  AD[194] = bitselect((z)AD[188], (z)AD[183], (z)AD[193] ^ (z)AD[188]) + ((rotate((z)(AD[193]), (z)30) ^ rotate((z)(AD[193]), (z)19) ^ rotate((z)(AD[193]), (z)10)));

  AD[197] = AD[196] + AD[30];
  AD[198] = AD[196] + AD[194];
  AD[185] = AD[182] + gb_A[3];

  AD[201] = (bitselect((z)AD[187], (z)AD[192], (z)AD[197]) + AD[185]) + ((rotate((z)(AD[197]), (z)26) ^ rotate((z)(AD[197]), (z)21) ^ rotate((z)(AD[197]), (z)7)));
  AD[199] = bitselect((z)AD[193], (z)AD[188], (z)AD[198] ^ (z)AD[193]) + ((rotate((z)(AD[198]), (z)30) ^ rotate((z)(AD[198]), (z)19) ^ rotate((z)(AD[198]), (z)10)));

  AD[202] = AD[201] + AD[183];
  AD[203] = AD[201] + AD[199];
  AD[190] = AD[187] + gb_A[4];

  AD[206] = (bitselect((z)AD[192], (z)AD[197], (z)AD[202]) + AD[190]) + ((rotate((z)(AD[202]), (z)26) ^ rotate((z)(AD[202]), (z)21) ^ rotate((z)(AD[202]), (z)7)));
  AD[204] = bitselect((z)AD[198], (z)AD[193], (z)AD[203] ^ (z)AD[198]) + ((rotate((z)(AD[203]), (z)30) ^ rotate((z)(AD[203]), (z)19) ^ rotate((z)(AD[203]), (z)10)));

  AD[207] = AD[206] + AD[188];
  AD[208] = AD[206] + AD[204];
  AD[195] = AD[192] + gb_A[5];

  AD[211] = (bitselect((z)AD[197], (z)AD[202], (z)AD[207]) + AD[195]) + ((rotate((z)(AD[207]), (z)26) ^ rotate((z)(AD[207]), (z)21) ^ rotate((z)(AD[207]), (z)7)));
  AD[209] = bitselect((z)AD[203], (z)AD[198], (z)AD[208] ^ (z)AD[203]) + ((rotate((z)(AD[208]), (z)30) ^ rotate((z)(AD[208]), (z)19) ^ rotate((z)(AD[208]), (z)10)));

  AD[212] = AD[193] + AD[211];
  AD[213] = AD[211] + AD[209];
  AD[200] = AD[197] + gb_A[6];

  AD[216] = (bitselect((z)AD[202], (z)AD[207], (z)AD[212]) + AD[200]) + ((rotate((z)(AD[212]), (z)26) ^ rotate((z)(AD[212]), (z)21) ^ rotate((z)(AD[212]), (z)7)));
  AD[214] = bitselect((z)AD[208], (z)AD[203], (z)AD[213] ^ (z)AD[208]) + ((rotate((z)(AD[213]), (z)30) ^ rotate((z)(AD[213]), (z)19) ^ rotate((z)(AD[213]), (z)10)));

  AD[217] = AD[198] + AD[216];
  AD[218] = AD[216] + AD[214];
  AD[205] = AD[202] + gb_A[7];

  AD[220] = (bitselect((z)AD[207], (z)AD[212], (z)AD[217]) + AD[205]) + ((rotate((z)(AD[217]), (z)26) ^ rotate((z)(AD[217]), (z)21) ^ rotate((z)(AD[217]), (z)7)));
  AD[219] = bitselect((z)AD[213], (z)AD[208], (z)AD[218] ^ (z)AD[213]) + ((rotate((z)(AD[218]), (z)30) ^ rotate((z)(AD[218]), (z)19) ^ rotate((z)(AD[218]), (z)10)));

  AD[222] = AD[203] + AD[220];
  AD[223] = AD[220] + AD[219];
  AD[210] = AD[207] + I;

  AD[226] = (bitselect((z)AD[212], (z)AD[217], (z)AD[222]) + AD[210]) + ((rotate((z)(AD[222]), (z)26) ^ rotate((z)(AD[222]), (z)21) ^ rotate((z)(AD[222]), (z)7)));
  AD[225] = bitselect((z)AD[218], (z)AD[213], (z)AD[223] ^ (z)AD[218]) + ((rotate((z)(AD[223]), (z)30) ^ rotate((z)(AD[223]), (z)19) ^ rotate((z)(AD[223]), (z)10)));

  AD[0] = ((rotate((z)(AE), (z)25) ^ rotate((z)(AE), (z)14) ^ ((AE) >> 3U))) + E;
  AD[228] = AD[226] + AD[225];
  AD[227] = AD[208] + AD[226];
  AD[215] = AD[212] + J;

  AD[231] = (bitselect((z)AD[217], (z)AD[222], (z)AD[227]) + AD[215]) + ((rotate((z)(AD[227]), (z)26) ^ rotate((z)(AD[227]), (z)21) ^ rotate((z)(AD[227]), (z)7)));
  AD[229] = bitselect((z)AD[223], (z)AD[218], (z)AD[228] ^ (z)AD[223]) + ((rotate((z)(AD[228]), (z)30) ^ rotate((z)(AD[228]), (z)19) ^ rotate((z)(AD[228]), (z)10)));
  AD[1] = AD[0] + gb_A[8];

  AD[232] = AD[213] + AD[231];
  AD[233] = AD[231] + AD[229];
  AD[221] = AD[217] + AD[1];
  AD[32] = AE + F;

  AD[236] = (bitselect((z)AD[222], (z)AD[227], (z)AD[232]) + AD[221]) + ((rotate((z)(AD[232]), (z)26) ^ rotate((z)(AD[232]), (z)21) ^ rotate((z)(AD[232]), (z)7)));
  AD[234] = bitselect((z)AD[228], (z)AD[223], (z)AD[233] ^ (z)AD[228]) + ((rotate((z)(AD[233]), (z)30) ^ rotate((z)(AD[233]), (z)19) ^ rotate((z)(AD[233]), (z)10)));
  AD[33] = AD[32] + gb_A[9];

  AD[3] = ((rotate((z)(AD[0]), (z)15) ^ rotate((z)(AD[0]), (z)13) ^ ((AD[0]) >> 10U))) + gb_A[10];
  AD[238] = AD[236] + AD[234];
  AD[237] = AD[218] + AD[236];
  AD[224] = AD[222] + AD[33];

  AD[241] = (bitselect((z)AD[227], (z)AD[232], (z)AD[237]) + AD[224]) + ((rotate((z)(AD[237]), (z)26) ^ rotate((z)(AD[237]), (z)21) ^ rotate((z)(AD[237]), (z)7)));
  AD[239] = bitselect((z)AD[233], (z)AD[228], (z)AD[238] ^ (z)AD[233]) + ((rotate((z)(AD[238]), (z)30) ^ rotate((z)(AD[238]), (z)19) ^ rotate((z)(AD[238]), (z)10)));
  AD[4] = AD[3] + gb_A[11];

  AD[35] = ((rotate((z)(AD[32]), (z)15) ^ rotate((z)(AD[32]), (z)13) ^ ((AD[32]) >> 10U)));
  AD[243] = AD[241] + AD[239];
  AD[242] = AD[223] + AD[241];
  AD[230] = AD[227] + AD[4];

  AD[246] = (bitselect((z)AD[232], (z)AD[237], (z)AD[242]) + AD[230]) + ((rotate((z)(AD[242]), (z)26) ^ rotate((z)(AD[242]), (z)21) ^ rotate((z)(AD[242]), (z)7)));
  AD[244] = bitselect((z)AD[238], (z)AD[233], (z)AD[243] ^ (z)AD[238]) + ((rotate((z)(AD[243]), (z)30) ^ rotate((z)(AD[243]), (z)19) ^ rotate((z)(AD[243]), (z)10)));
  AD[36] = AD[35] + gb_A[12];

  AD[7] = ((rotate((z)(AD[3]), (z)15) ^ rotate((z)(AD[3]), (z)13) ^ ((AD[3]) >> 10U))) + gb_A[13];
  AD[248] = AD[246] + AD[244];
  AD[247] = AD[228] + AD[246];
  AD[235] = AD[232] + AD[36];

  AD[251] = (bitselect((z)AD[237], (z)AD[242], (z)AD[247]) + AD[235]) + ((rotate((z)(AD[247]), (z)26) ^ rotate((z)(AD[247]), (z)21) ^ rotate((z)(AD[247]), (z)7)));
  AD[249] = bitselect((z)AD[243], (z)AD[238], (z)AD[248] ^ (z)AD[243]) + ((rotate((z)(AD[248]), (z)30) ^ rotate((z)(AD[248]), (z)19) ^ rotate((z)(AD[248]), (z)10)));
  AD[8] = AD[7] + gb_A[14];

  AD[38] = ((rotate((z)(AD[35]), (z)15) ^ rotate((z)(AD[35]), (z)13) ^ ((AD[35]) >> 10U))) + G;
  AD[253] = AD[251] + AD[249];
  AD[252] = AD[233] + AD[251];
  AD[240] = AD[237] + AD[8];

  AD[256] = (bitselect((z)AD[242], (z)AD[247], (z)AD[252]) + AD[240]) + ((rotate((z)(AD[252]), (z)26) ^ rotate((z)(AD[252]), (z)21) ^ rotate((z)(AD[252]), (z)7)));
  AD[254] = bitselect((z)AD[248], (z)AD[243], (z)AD[253] ^ (z)AD[248]) + ((rotate((z)(AD[253]), (z)30) ^ rotate((z)(AD[253]), (z)19) ^ rotate((z)(AD[253]), (z)10)));
  AD[40] = AD[38] + gb_A[15];

  AD[10] = ((rotate((z)(AD[7]), (z)15) ^ rotate((z)(AD[7]), (z)13) ^ ((AD[7]) >> 10U))) + H;
  AD[258] = AD[256] + AD[254];
  AD[257] = AD[238] + AD[256];
  AD[245] = AD[242] + AD[40];

  AD[261] = (bitselect((z)AD[247], (z)AD[252], (z)AD[257]) + AD[245]) + ((rotate((z)(AD[257]), (z)26) ^ rotate((z)(AD[257]), (z)21) ^ rotate((z)(AD[257]), (z)7)));
  AD[259] = bitselect((z)AD[253], (z)AD[248], (z)AD[258] ^ (z)AD[253]) + ((rotate((z)(AD[258]), (z)30) ^ rotate((z)(AD[258]), (z)19) ^ rotate((z)(AD[258]), (z)10)));
  AD[13] = AD[10] + gb_A[16];

  AD[43] = ((rotate((z)(AD[38]), (z)15) ^ rotate((z)(AD[38]), (z)13) ^ ((AD[38]) >> 10U))) + AD[0];
  AD[263] = AD[261] + AD[259];
  AD[262] = AD[243] + AD[261];
  AD[250] = AD[247] + AD[13];

  AD[266] = (bitselect((z)AD[252], (z)AD[257], (z)AD[262]) + AD[250]) + ((rotate((z)(AD[262]), (z)26) ^ rotate((z)(AD[262]), (z)21) ^ rotate((z)(AD[262]), (z)7)));
  AD[264] = bitselect((z)AD[258], (z)AD[253], (z)AD[263] ^ (z)AD[258]) + ((rotate((z)(AD[263]), (z)30) ^ rotate((z)(AD[263]), (z)19) ^ rotate((z)(AD[263]), (z)10)));
  AD[11] = ((rotate((z)(AD[10]), (z)15) ^ rotate((z)(AD[10]), (z)13) ^ ((AD[10]) >> 10U)));
  AD[45] = AD[43] + gb_A[17];

  AD[52] = AD[11] + AD[32];
  AD[267] = AD[248] + AD[266];
  AD[255] = AD[252] + AD[45];
  AD[268] = AD[266] + AD[264];

  AD[271] = (bitselect((z)AD[257], (z)AD[262], (z)AD[267]) + AD[255]) + ((rotate((z)(AD[267]), (z)26) ^ rotate((z)(AD[267]), (z)21) ^ rotate((z)(AD[267]), (z)7)));
  AD[269] = bitselect((z)AD[263], (z)AD[258], (z)AD[268] ^ (z)AD[263]) + ((rotate((z)(AD[268]), (z)30) ^ rotate((z)(AD[268]), (z)19) ^ rotate((z)(AD[268]), (z)10)));
  AD[54] = AD[52] + gb_A[18];

  AD[48] = ((rotate((z)(AD[43]), (z)15) ^ rotate((z)(AD[43]), (z)13) ^ ((AD[43]) >> 10U))) + AD[3];
  AD[273] = AD[271] + AD[269];
  AD[272] = AD[253] + AD[271];
  AD[260] = AD[257] + AD[54];

  AD[276] = (bitselect((z)AD[262], (z)AD[267], (z)AD[272]) + AD[260]) + ((rotate((z)(AD[272]), (z)26) ^ rotate((z)(AD[272]), (z)21) ^ rotate((z)(AD[272]), (z)7)));
  AD[274] = bitselect((z)AD[268], (z)AD[263], (z)AD[273] ^ (z)AD[268]) + ((rotate((z)(AD[273]), (z)30) ^ rotate((z)(AD[273]), (z)19) ^ rotate((z)(AD[273]), (z)10)));
  AD[49] = AD[48] + gb_A[19];

  AD[61] = ((rotate((z)(AD[52]), (z)15) ^ rotate((z)(AD[52]), (z)13) ^ ((AD[52]) >> 10U))) + AD[35];
  AD[278] = AD[276] + AD[274];
  AD[277] = AD[258] + AD[276];
  AD[265] = AD[262] + AD[49];

  AD[281] = (bitselect((z)AD[267], (z)AD[272], (z)AD[277]) + AD[265]) + ((rotate((z)(AD[277]), (z)26) ^ rotate((z)(AD[277]), (z)21) ^ rotate((z)(AD[277]), (z)7)));
  AD[279] = bitselect((z)AD[273], (z)AD[268], (z)AD[278] ^ (z)AD[273]) + ((rotate((z)(AD[278]), (z)30) ^ rotate((z)(AD[278]), (z)19) ^ rotate((z)(AD[278]), (z)10)));
  AD[62] = AD[61] + gb_A[20];

  AD[53] = ((rotate((z)(AD[48]), (z)15) ^ rotate((z)(AD[48]), (z)13) ^ ((AD[48]) >> 10U))) + AD[7];
  AD[283] = AD[281] + AD[279];
  AD[282] = AD[263] + AD[281];
  AD[270] = AD[267] + AD[62];

  AD[286] = (bitselect((z)AD[272], (z)AD[277], (z)AD[282]) + AD[270]) + ((rotate((z)(AD[282]), (z)26) ^ rotate((z)(AD[282]), (z)21) ^ rotate((z)(AD[282]), (z)7)));
  AD[284] = bitselect((z)AD[278], (z)AD[273], (z)AD[283] ^ (z)AD[278]) + ((rotate((z)(AD[283]), (z)30) ^ rotate((z)(AD[283]), (z)19) ^ rotate((z)(AD[283]), (z)10)));
  AD[39] = AD[38] + gb_A[21];
  AD[55] = AD[53] + gb_A[22];

  AD[66] = ((rotate((z)(AD[61]), (z)15) ^ rotate((z)(AD[61]), (z)13) ^ ((AD[61]) >> 10U))) + AD[39];
  AD[288] = AD[286] + AD[284];
  AD[287] = AD[268] + AD[286];
  AD[275] = AD[272] + AD[55];

  AD[291] = (bitselect((z)AD[277], (z)AD[282], (z)AD[287]) + AD[275]) + ((rotate((z)(AD[287]), (z)26) ^ rotate((z)(AD[287]), (z)21) ^ rotate((z)(AD[287]), (z)7)));
  AD[289] = bitselect((z)AD[283], (z)AD[278], (z)AD[288] ^ (z)AD[283]) + ((rotate((z)(AD[288]), (z)30) ^ rotate((z)(AD[288]), (z)19) ^ rotate((z)(AD[288]), (z)10)));
  AD[12] = AD[10] + K;
  AD[68] = AD[66] + gb_A[23];

  AD[67] = ((rotate((z)(AD[53]), (z)15) ^ rotate((z)(AD[53]), (z)13) ^ ((AD[53]) >> 10U))) + AD[12];
  AD[293] = AD[291] + AD[289];
  AD[292] = AD[273] + AD[291];
  AD[280] = AD[277] + AD[68];

  AD[296] = (bitselect((z)AD[282], (z)AD[287], (z)AD[292]) + AD[280]) + ((rotate((z)(AD[292]), (z)26) ^ rotate((z)(AD[292]), (z)21) ^ rotate((z)(AD[292]), (z)7)));
  AD[294] = bitselect((z)AD[288], (z)AD[283], (z)AD[293] ^ (z)AD[288]) + ((rotate((z)(AD[293]), (z)30) ^ rotate((z)(AD[293]), (z)19) ^ rotate((z)(AD[293]), (z)10)));
  AD[2] = ((rotate((z)(AD[0]), (z)25) ^ rotate((z)(AD[0]), (z)14) ^ ((AD[0]) >> 3U)));
  AD[69] = AD[67] + gb_A[24];
  AD[44] = AD[43] + L;

  AD[75] = ((rotate((z)(AD[66]), (z)15) ^ rotate((z)(AD[66]), (z)13) ^ ((AD[66]) >> 10U))) + AD[44];
  AD[298] = AD[296] + AD[294];
  AD[297] = AD[278] + AD[296];
  AD[285] = AD[282] + AD[69];
  AD[5] = AD[2] + H;

  AD[301] = (bitselect((z)AD[287], (z)AD[292], (z)AD[297]) + AD[285]) + ((rotate((z)(AD[297]), (z)26) ^ rotate((z)(AD[297]), (z)21) ^ rotate((z)(AD[297]), (z)7)));
  AD[299] = bitselect((z)AD[293], (z)AD[288], (z)AD[298] ^ (z)AD[293]) + ((rotate((z)(AD[298]), (z)30) ^ rotate((z)(AD[298]), (z)19) ^ rotate((z)(AD[298]), (z)10)));
  AD[56] = AD[52] + AD[5];
  AD[76] = AD[75] + gb_A[25];

  AD[34] = ((rotate((z)(AD[32]), (z)25) ^ rotate((z)(AD[32]), (z)14) ^ ((AD[32]) >> 3U))) + AD[0];
  AD[70] = ((rotate((z)(AD[67]), (z)15) ^ rotate((z)(AD[67]), (z)13) ^ ((AD[67]) >> 10U))) + AD[56];
  AD[302] = AD[283] + AD[301];
  AD[303] = AD[301] + AD[299];
  AD[290] = AD[287] + AD[76];

  AD[306] = (bitselect((z)AD[292], (z)AD[297], (z)AD[302]) + AD[290]) + ((rotate((z)(AD[302]), (z)26) ^ rotate((z)(AD[302]), (z)21) ^ rotate((z)(AD[302]), (z)7)));
  AD[304] = bitselect((z)AD[298], (z)AD[293], (z)AD[303] ^ (z)AD[298]) + ((rotate((z)(AD[303]), (z)30) ^ rotate((z)(AD[303]), (z)19) ^ rotate((z)(AD[303]), (z)10)));
  AD[6] = ((rotate((z)(AD[3]), (z)25) ^ rotate((z)(AD[3]), (z)14) ^ ((AD[3]) >> 3U)));
  AD[77] = AD[70] + gb_A[26];
  AD[50] = AD[34] + AD[48];

  AD[78] = ((rotate((z)(AD[75]), (z)15) ^ rotate((z)(AD[75]), (z)13) ^ ((AD[75]) >> 10U))) + AD[50];
  AD[308] = AD[306] + AD[304];
  AD[307] = AD[288] + AD[306];
  AD[295] = AD[292] + AD[77];
  AD[41] = AD[32] + AD[6];

  AD[311] = (bitselect((z)AD[297], (z)AD[302], (z)AD[307]) + AD[295]) + ((rotate((z)(AD[307]), (z)26) ^ rotate((z)(AD[307]), (z)21) ^ rotate((z)(AD[307]), (z)7)));
  AD[309] = bitselect((z)AD[303], (z)AD[298], (z)AD[308] ^ (z)AD[303]) + ((rotate((z)(AD[308]), (z)30) ^ rotate((z)(AD[308]), (z)19) ^ rotate((z)(AD[308]), (z)10)));
  AD[63] = AD[41] + AD[61];
  AD[85] = AD[78] + gb_A[27];

  AD[37] = ((rotate((z)(AD[35]), (z)25) ^ rotate((z)(AD[35]), (z)14) ^ ((AD[35]) >> 3U))) + AD[3];
  AD[79] = ((rotate((z)(AD[70]), (z)15) ^ rotate((z)(AD[70]), (z)13) ^ ((AD[70]) >> 10U))) + AD[63];
  AD[312] = AD[293] + AD[311];
  AD[313] = AD[311] + AD[309];
  AD[300] = AD[297] + AD[85];

  AD[316] = (bitselect((z)AD[302], (z)AD[307], (z)AD[312]) + AD[300]) + ((rotate((z)(AD[312]), (z)26) ^ rotate((z)(AD[312]), (z)21) ^ rotate((z)(AD[312]), (z)7)));
  AD[314] = bitselect((z)AD[308], (z)AD[303], (z)AD[313] ^ (z)AD[308]) + ((rotate((z)(AD[313]), (z)30) ^ rotate((z)(AD[313]), (z)19) ^ rotate((z)(AD[313]), (z)10)));
  AD[9] = ((rotate((z)(AD[7]), (z)25) ^ rotate((z)(AD[7]), (z)14) ^ ((AD[7]) >> 3U)));
  AD[86] = AD[79] + gb_A[28];
  AD[57] = AD[37] + AD[53];

  AD[87] = ((rotate((z)(AD[78]), (z)15) ^ rotate((z)(AD[78]), (z)13) ^ ((AD[78]) >> 10U))) + AD[57];
  AD[318] = AD[316] + AD[314];
  AD[317] = AD[298] + AD[316];
  AD[305] = AD[302] + AD[86];
  AD[46] = AD[35] + AD[9];

  AD[321] = (bitselect((z)AD[307], (z)AD[312], (z)AD[317]) + AD[305]) + ((rotate((z)(AD[317]), (z)26) ^ rotate((z)(AD[317]), (z)21) ^ rotate((z)(AD[317]), (z)7)));
  AD[319] = bitselect((z)AD[313], (z)AD[308], (z)AD[318] ^ (z)AD[313]) + ((rotate((z)(AD[318]), (z)30) ^ rotate((z)(AD[318]), (z)19) ^ rotate((z)(AD[318]), (z)10)));
  AD[71] = AD[46] + AD[66];
  AD[92] = AD[87] + gb_A[29];

  AD[42] = ((rotate((z)(AD[38]), (z)25) ^ rotate((z)(AD[38]), (z)14) ^ ((AD[38]) >> 3U))) + AD[7];
  AD[88] = ((rotate((z)(AD[79]), (z)15) ^ rotate((z)(AD[79]), (z)13) ^ ((AD[79]) >> 10U))) + AD[71];
  AD[322] = AD[303] + AD[321];
  AD[323] = AD[321] + AD[319];
  AD[310] = AD[307] + AD[92];

  AD[326] = (bitselect((z)AD[312], (z)AD[317], (z)AD[322]) + AD[310]) + ((rotate((z)(AD[322]), (z)26) ^ rotate((z)(AD[322]), (z)21) ^ rotate((z)(AD[322]), (z)7)));
  AD[324] = bitselect((z)AD[318], (z)AD[313], (z)AD[323] ^ (z)AD[318]) + ((rotate((z)(AD[323]), (z)30) ^ rotate((z)(AD[323]), (z)19) ^ rotate((z)(AD[323]), (z)10)));
  AD[14] = ((rotate((z)(AD[10]), (z)25) ^ rotate((z)(AD[10]), (z)14) ^ ((AD[10]) >> 3U)));
  AD[93] = AD[88] + gb_A[30];
  AD[72] = AD[42] + AD[67];

  AD[94] = ((rotate((z)(AD[87]), (z)15) ^ rotate((z)(AD[87]), (z)13) ^ ((AD[87]) >> 10U))) + AD[72];
  AD[328] = AD[326] + AD[324];
  AD[327] = AD[308] + AD[326];
  AD[315] = AD[312] + AD[93];
  AD[51] = AD[38] + AD[14];

  AD[331] = (bitselect((z)AD[317], (z)AD[322], (z)AD[327]) + AD[315]) + ((rotate((z)(AD[327]), (z)26) ^ rotate((z)(AD[327]), (z)21) ^ rotate((z)(AD[327]), (z)7)));
  AD[329] = bitselect((z)AD[323], (z)AD[318], (z)AD[328] ^ (z)AD[323]) + ((rotate((z)(AD[328]), (z)30) ^ rotate((z)(AD[328]), (z)19) ^ rotate((z)(AD[328]), (z)10)));
  AD[80] = AD[51] + AD[75];
  AD[100] = AD[94] + gb_A[31];

  AD[47] = ((rotate((z)(AD[43]), (z)25) ^ rotate((z)(AD[43]), (z)14) ^ ((AD[43]) >> 3U))) + AD[10];
  AD[95] = ((rotate((z)(AD[88]), (z)15) ^ rotate((z)(AD[88]), (z)13) ^ ((AD[88]) >> 10U))) + AD[80];
  AD[332] = AD[313] + AD[331];
  AD[333] = AD[331] + AD[329];
  AD[320] = AD[317] + AD[100];

  AD[336] = (bitselect((z)AD[322], (z)AD[327], (z)AD[332]) + AD[320]) + ((rotate((z)(AD[332]), (z)26) ^ rotate((z)(AD[332]), (z)21) ^ rotate((z)(AD[332]), (z)7)));
  AD[334] = bitselect((z)AD[328], (z)AD[323], (z)AD[333] ^ (z)AD[328]) + ((rotate((z)(AD[333]), (z)30) ^ rotate((z)(AD[333]), (z)19) ^ rotate((z)(AD[333]), (z)10)));
  AD[81] = AD[47] + AD[70];
  AD[101] = AD[95] + gb_A[32];

  AD[58] = ((rotate((z)(AD[52]), (z)25) ^ rotate((z)(AD[52]), (z)14) ^ ((AD[52]) >> 3U))) + AD[43];
  AD[102] = ((rotate((z)(AD[94]), (z)15) ^ rotate((z)(AD[94]), (z)13) ^ ((AD[94]) >> 10U))) + AD[81];
  AD[337] = AD[318] + AD[336];
  AD[338] = AD[336] + AD[334];
  AD[325] = AD[322] + AD[101];

  AD[341] = (bitselect((z)AD[327], (z)AD[332], (z)AD[337]) + AD[325]) + ((rotate((z)(AD[337]), (z)26) ^ rotate((z)(AD[337]), (z)21) ^ rotate((z)(AD[337]), (z)7)));
  AD[339] = bitselect((z)AD[333], (z)AD[328], (z)AD[338] ^ (z)AD[333]) + ((rotate((z)(AD[338]), (z)30) ^ rotate((z)(AD[338]), (z)19) ^ rotate((z)(AD[338]), (z)10)));
  AD[89] = AD[58] + AD[78];
  AD[108] = AD[102] + gb_A[33];

  AD[59] = ((rotate((z)(AD[48]), (z)25) ^ rotate((z)(AD[48]), (z)14) ^ ((AD[48]) >> 3U))) + AD[52];
  AD[103] = ((rotate((z)(AD[95]), (z)15) ^ rotate((z)(AD[95]), (z)13) ^ ((AD[95]) >> 10U))) + AD[89];
  AD[342] = AD[323] + AD[341];
  AD[343] = AD[341] + AD[339];
  AD[330] = AD[327] + AD[108];

  AD[346] = (bitselect((z)AD[332], (z)AD[337], (z)AD[342]) + AD[330]) + ((rotate((z)(AD[342]), (z)26) ^ rotate((z)(AD[342]), (z)21) ^ rotate((z)(AD[342]), (z)7)));
  AD[344] = bitselect((z)AD[338], (z)AD[333], (z)AD[343] ^ (z)AD[338]) + ((rotate((z)(AD[343]), (z)30) ^ rotate((z)(AD[343]), (z)19) ^ rotate((z)(AD[343]), (z)10)));
  AD[90] = AD[59] + AD[79];
  AD[109] = AD[103] + gb_A[34];

  AD[64] = ((rotate((z)(AD[61]), (z)25) ^ rotate((z)(AD[61]), (z)14) ^ ((AD[61]) >> 3U))) + AD[48];
  AD[110] = ((rotate((z)(AD[102]), (z)15) ^ rotate((z)(AD[102]), (z)13) ^ ((AD[102]) >> 10U))) + AD[90];
  AD[347] = AD[328] + AD[346];
  AD[348] = AD[346] + AD[344];
  AD[335] = AD[332] + AD[109];

  AD[351] = (bitselect((z)AD[337], (z)AD[342], (z)AD[347]) + AD[335]) + ((rotate((z)(AD[347]), (z)26) ^ rotate((z)(AD[347]), (z)21) ^ rotate((z)(AD[347]), (z)7)));
  AD[349] = bitselect((z)AD[343], (z)AD[338], (z)AD[348] ^ (z)AD[343]) + ((rotate((z)(AD[348]), (z)30) ^ rotate((z)(AD[348]), (z)19) ^ rotate((z)(AD[348]), (z)10)));
  AD[60] = ((rotate((z)(AD[53]), (z)25) ^ rotate((z)(AD[53]), (z)14) ^ ((AD[53]) >> 3U)));
  AD[116] = AD[110] + gb_A[35];
  AD[96] = AD[87] + AD[64];

  AD[111] = ((rotate((z)(AD[103]), (z)15) ^ rotate((z)(AD[103]), (z)13) ^ ((AD[103]) >> 10U))) + AD[96];
  AD[353] = AD[351] + AD[349];
  AD[352] = AD[333] + AD[351];
  AD[340] = AD[337] + AD[116];
  AD[65] = AD[60] + AD[61];

  AD[356] = (bitselect((z)AD[342], (z)AD[347], (z)AD[352]) + AD[340]) + ((rotate((z)(AD[352]), (z)26) ^ rotate((z)(AD[352]), (z)21) ^ rotate((z)(AD[352]), (z)7)));
  AD[354] = bitselect((z)AD[348], (z)AD[343], (z)AD[353] ^ (z)AD[348]) + ((rotate((z)(AD[353]), (z)30) ^ rotate((z)(AD[353]), (z)19) ^ rotate((z)(AD[353]), (z)10)));
  AD[97] = AD[88] + AD[65];
  AD[117] = AD[111] + gb_A[36];

  AD[73] = ((rotate((z)(AD[66]), (z)25) ^ rotate((z)(AD[66]), (z)14) ^ ((AD[66]) >> 3U))) + AD[53];
  AD[118] = ((rotate((z)(AD[110]), (z)15) ^ rotate((z)(AD[110]), (z)13) ^ ((AD[110]) >> 10U))) + AD[97];
  AD[357] = AD[338] + AD[356];
  AD[358] = AD[356] + AD[354];
  AD[345] = AD[342] + AD[117];

  AD[361] = (bitselect((z)AD[347], (z)AD[352], (z)AD[357]) + AD[345]) + ((rotate((z)(AD[357]), (z)26) ^ rotate((z)(AD[357]), (z)21) ^ rotate((z)(AD[357]), (z)7)));
  AD[359] = bitselect((z)AD[353], (z)AD[348], (z)AD[358] ^ (z)AD[353]) + ((rotate((z)(AD[358]), (z)30) ^ rotate((z)(AD[358]), (z)19) ^ rotate((z)(AD[358]), (z)10)));
  AD[104] = AD[73] + AD[94];
  AD[124] = AD[118] + gb_A[37];

  AD[74] = ((rotate((z)(AD[67]), (z)25) ^ rotate((z)(AD[67]), (z)14) ^ ((AD[67]) >> 3U))) + AD[66];
  AD[119] = ((rotate((z)(AD[111]), (z)15) ^ rotate((z)(AD[111]), (z)13) ^ ((AD[111]) >> 10U))) + AD[104];
  AD[362] = AD[343] + AD[361];
  AD[363] = AD[361] + AD[359];
  AD[350] = AD[347] + AD[124];

  AD[366] = (bitselect((z)AD[352], (z)AD[357], (z)AD[362]) + AD[350]) + ((rotate((z)(AD[362]), (z)26) ^ rotate((z)(AD[362]), (z)21) ^ rotate((z)(AD[362]), (z)7)));
  AD[364] = bitselect((z)AD[358], (z)AD[353], (z)AD[363] ^ (z)AD[358]) + ((rotate((z)(AD[363]), (z)30) ^ rotate((z)(AD[363]), (z)19) ^ rotate((z)(AD[363]), (z)10)));
  AD[105] = AD[74] + AD[95];
  AD[125] = AD[119] + gb_A[38];

  AD[82] = ((rotate((z)(AD[75]), (z)25) ^ rotate((z)(AD[75]), (z)14) ^ ((AD[75]) >> 3U))) + AD[67];
  AD[126] = ((rotate((z)(AD[118]), (z)15) ^ rotate((z)(AD[118]), (z)13) ^ ((AD[118]) >> 10U))) + AD[105];
  AD[367] = AD[348] + AD[366];
  AD[368] = AD[366] + AD[364];
  AD[355] = AD[352] + AD[125];

  AD[371] = (bitselect((z)AD[357], (z)AD[362], (z)AD[367]) + AD[355]) + ((rotate((z)(AD[367]), (z)26) ^ rotate((z)(AD[367]), (z)21) ^ rotate((z)(AD[367]), (z)7)));
  AD[369] = bitselect((z)AD[363], (z)AD[358], (z)AD[368] ^ (z)AD[363]) + ((rotate((z)(AD[368]), (z)30) ^ rotate((z)(AD[368]), (z)19) ^ rotate((z)(AD[368]), (z)10)));
  AD[112] = AD[102] + AD[82];
  AD[132] = AD[126] + gb_A[39];

  AD[83] = ((rotate((z)(AD[70]), (z)25) ^ rotate((z)(AD[70]), (z)14) ^ ((AD[70]) >> 3U))) + AD[75];
  AD[127] = ((rotate((z)(AD[119]), (z)15) ^ rotate((z)(AD[119]), (z)13) ^ ((AD[119]) >> 10U))) + AD[112];
  AD[372] = AD[353] + AD[371];
  AD[373] = AD[371] + AD[369];
  AD[360] = AD[357] + AD[132];

  AD[376] = (bitselect((z)AD[362], (z)AD[367], (z)AD[372]) + AD[360]) + ((rotate((z)(AD[372]), (z)26) ^ rotate((z)(AD[372]), (z)21) ^ rotate((z)(AD[372]), (z)7)));
  AD[374] = bitselect((z)AD[368], (z)AD[363], (z)AD[373] ^ (z)AD[368]) + ((rotate((z)(AD[373]), (z)30) ^ rotate((z)(AD[373]), (z)19) ^ rotate((z)(AD[373]), (z)10)));
  AD[113] = AD[103] + AD[83];
  AD[133] = AD[127] + gb_A[40];

  AD[84] = ((rotate((z)(AD[78]), (z)25) ^ rotate((z)(AD[78]), (z)14) ^ ((AD[78]) >> 3U))) + AD[70];
  AD[134] = ((rotate((z)(AD[126]), (z)15) ^ rotate((z)(AD[126]), (z)13) ^ ((AD[126]) >> 10U))) + AD[113];
  AD[377] = AD[358] + AD[376];
  AD[378] = AD[376] + AD[374];
  AD[365] = AD[362] + AD[133];

  AD[381] = (bitselect((z)AD[367], (z)AD[372], (z)AD[377]) + AD[365]) + ((rotate((z)(AD[377]), (z)26) ^ rotate((z)(AD[377]), (z)21) ^ rotate((z)(AD[377]), (z)7)));
  AD[379] = bitselect((z)AD[373], (z)AD[368], (z)AD[378] ^ (z)AD[373]) + ((rotate((z)(AD[378]), (z)30) ^ rotate((z)(AD[378]), (z)19) ^ rotate((z)(AD[378]), (z)10)));
  AD[120] = AD[110] + AD[84];
  AD[140] = AD[134] + gb_A[41];

  AD[91] = ((rotate((z)(AD[79]), (z)25) ^ rotate((z)(AD[79]), (z)14) ^ ((AD[79]) >> 3U))) + AD[78];
  AD[135] = ((rotate((z)(AD[127]), (z)15) ^ rotate((z)(AD[127]), (z)13) ^ ((AD[127]) >> 10U))) + AD[120];
  AD[382] = AD[363] + AD[381];
  AD[383] = AD[381] + AD[379];
  AD[370] = AD[367] + AD[140];

  AD[386] = (bitselect((z)AD[372], (z)AD[377], (z)AD[382]) + AD[370]) + ((rotate((z)(AD[382]), (z)26) ^ rotate((z)(AD[382]), (z)21) ^ rotate((z)(AD[382]), (z)7)));
  AD[384] = bitselect((z)AD[378], (z)AD[373], (z)AD[383] ^ (z)AD[378]) + ((rotate((z)(AD[383]), (z)30) ^ rotate((z)(AD[383]), (z)19) ^ rotate((z)(AD[383]), (z)10)));
  AD[121] = AD[111] + AD[91];
  AD[141] = AD[135] + gb_A[42];

  AD[98] = ((rotate((z)(AD[87]), (z)25) ^ rotate((z)(AD[87]), (z)14) ^ ((AD[87]) >> 3U))) + AD[79];
  AD[142] = ((rotate((z)(AD[134]), (z)15) ^ rotate((z)(AD[134]), (z)13) ^ ((AD[134]) >> 10U))) + AD[121];
  AD[387] = AD[368] + AD[386];
  AD[388] = AD[386] + AD[384];
  AD[375] = AD[372] + AD[141];

  AD[391] = (bitselect((z)AD[377], (z)AD[382], (z)AD[387]) + AD[375]) + ((rotate((z)(AD[387]), (z)26) ^ rotate((z)(AD[387]), (z)21) ^ rotate((z)(AD[387]), (z)7)));
  AD[389] = bitselect((z)AD[383], (z)AD[378], (z)AD[388] ^ (z)AD[383]) + ((rotate((z)(AD[388]), (z)30) ^ rotate((z)(AD[388]), (z)19) ^ rotate((z)(AD[388]), (z)10)));
  AD[128] = AD[118] + AD[98];
  AD[147] = AD[142] + gb_A[43];

  AD[99] = ((rotate((z)(AD[88]), (z)25) ^ rotate((z)(AD[88]), (z)14) ^ ((AD[88]) >> 3U))) + AD[87];
  AD[143] = ((rotate((z)(AD[135]), (z)15) ^ rotate((z)(AD[135]), (z)13) ^ ((AD[135]) >> 10U))) + AD[128];
  AD[392] = AD[373] + AD[391];
  AD[393] = AD[391] + AD[389];
  AD[380] = AD[377] + AD[147];

  AD[396] = (bitselect((z)AD[382], (z)AD[387], (z)AD[392]) + AD[380]) + ((rotate((z)(AD[392]), (z)26) ^ rotate((z)(AD[392]), (z)21) ^ rotate((z)(AD[392]), (z)7)));
  AD[394] = bitselect((z)AD[388], (z)AD[383], (z)AD[393] ^ (z)AD[388]) + ((rotate((z)(AD[393]), (z)30) ^ rotate((z)(AD[393]), (z)19) ^ rotate((z)(AD[393]), (z)10)));
  AD[129] = AD[119] + AD[99];
  AD[148] = AD[143] + gb_A[44];

  AD[106] = ((rotate((z)(AD[94]), (z)25) ^ rotate((z)(AD[94]), (z)14) ^ ((AD[94]) >> 3U))) + AD[88];
  AD[149] = ((rotate((z)(AD[142]), (z)15) ^ rotate((z)(AD[142]), (z)13) ^ ((AD[142]) >> 10U))) + AD[129];
  AD[397] = AD[378] + AD[396];
  AD[398] = AD[396] + AD[394];
  AD[385] = AD[382] + AD[148];

  AD[401] = (bitselect((z)AD[387], (z)AD[392], (z)AD[397]) + AD[385]) + ((rotate((z)(AD[397]), (z)26) ^ rotate((z)(AD[397]), (z)21) ^ rotate((z)(AD[397]), (z)7)));
  AD[399] = bitselect((z)AD[393], (z)AD[388], (z)AD[398] ^ (z)AD[393]) + ((rotate((z)(AD[398]), (z)30) ^ rotate((z)(AD[398]), (z)19) ^ rotate((z)(AD[398]), (z)10)));
  AD[136] = AD[126] + AD[106];
  AD[153] = AD[149] + gb_A[45];

  AD[107] = ((rotate((z)(AD[95]), (z)25) ^ rotate((z)(AD[95]), (z)14) ^ ((AD[95]) >> 3U))) + AD[94];
  AD[150] = ((rotate((z)(AD[143]), (z)15) ^ rotate((z)(AD[143]), (z)13) ^ ((AD[143]) >> 10U))) + AD[136];
  AD[402] = AD[383] + AD[401];
  AD[403] = AD[401] + AD[399];
  AD[390] = AD[387] + AD[153];

  AD[406] = (bitselect((z)AD[392], (z)AD[397], (z)AD[402]) + AD[390]) + ((rotate((z)(AD[402]), (z)26) ^ rotate((z)(AD[402]), (z)21) ^ rotate((z)(AD[402]), (z)7)));
  AD[404] = bitselect((z)AD[398], (z)AD[393], (z)AD[403] ^ (z)AD[398]) + ((rotate((z)(AD[403]), (z)30) ^ rotate((z)(AD[403]), (z)19) ^ rotate((z)(AD[403]), (z)10)));
  AD[137] = AD[127] + AD[107];
  AD[154] = AD[150] + gb_A[46];

  AD[114] = ((rotate((z)(AD[102]), (z)25) ^ rotate((z)(AD[102]), (z)14) ^ ((AD[102]) >> 3U))) + AD[95];
  AD[155] = ((rotate((z)(AD[149]), (z)15) ^ rotate((z)(AD[149]), (z)13) ^ ((AD[149]) >> 10U))) + AD[137];
  AD[407] = AD[388] + AD[406];
  AD[408] = AD[406] + AD[404];
  AD[395] = AD[392] + AD[154];

  AD[411] = (bitselect((z)AD[397], (z)AD[402], (z)AD[407]) + AD[395]) + ((rotate((z)(AD[407]), (z)26) ^ rotate((z)(AD[407]), (z)21) ^ rotate((z)(AD[407]), (z)7)));
  AD[409] = bitselect((z)AD[403], (z)AD[398], (z)AD[408] ^ (z)AD[403]) + ((rotate((z)(AD[408]), (z)30) ^ rotate((z)(AD[408]), (z)19) ^ rotate((z)(AD[408]), (z)10)));
  AD[144] = AD[134] + AD[114];
  AD[159] = AD[155] + gb_A[47];

  AD[115] = ((rotate((z)(AD[103]), (z)25) ^ rotate((z)(AD[103]), (z)14) ^ ((AD[103]) >> 3U))) + AD[102];
  AD[156] = ((rotate((z)(AD[150]), (z)15) ^ rotate((z)(AD[150]), (z)13) ^ ((AD[150]) >> 10U))) + AD[144];
  AD[412] = AD[393] + AD[411];
  AD[413] = AD[411] + AD[409];
  AD[400] = AD[397] + AD[159];

  AD[416] = (bitselect((z)AD[402], (z)AD[407], (z)AD[412]) + AD[400]) + ((rotate((z)(AD[412]), (z)26) ^ rotate((z)(AD[412]), (z)21) ^ rotate((z)(AD[412]), (z)7)));
  AD[414] = bitselect((z)AD[408], (z)AD[403], (z)AD[413] ^ (z)AD[408]) + ((rotate((z)(AD[413]), (z)30) ^ rotate((z)(AD[413]), (z)19) ^ rotate((z)(AD[413]), (z)10)));
  AD[145] = AD[135] + AD[115];
  AD[160] = AD[156] + gb_A[48];

  AD[122] = ((rotate((z)(AD[110]), (z)25) ^ rotate((z)(AD[110]), (z)14) ^ ((AD[110]) >> 3U))) + AD[103];
  AD[161] = ((rotate((z)(AD[155]), (z)15) ^ rotate((z)(AD[155]), (z)13) ^ ((AD[155]) >> 10U))) + AD[145];
  AD[417] = AD[398] + AD[416];
  AD[418] = AD[416] + AD[414];
  AD[405] = AD[402] + AD[160];

  AD[421] = (bitselect((z)AD[407], (z)AD[412], (z)AD[417]) + AD[405]) + ((rotate((z)(AD[417]), (z)26) ^ rotate((z)(AD[417]), (z)21) ^ rotate((z)(AD[417]), (z)7)));
  AD[419] = bitselect((z)AD[413], (z)AD[408], (z)AD[418] ^ (z)AD[413]) + ((rotate((z)(AD[418]), (z)30) ^ rotate((z)(AD[418]), (z)19) ^ rotate((z)(AD[418]), (z)10)));
  AD[151] = AD[142] + AD[122];
  AD[165] = AD[161] + gb_A[49];

  AD[123] = ((rotate((z)(AD[111]), (z)25) ^ rotate((z)(AD[111]), (z)14) ^ ((AD[111]) >> 3U))) + AD[110];
  AD[162] = ((rotate((z)(AD[156]), (z)15) ^ rotate((z)(AD[156]), (z)13) ^ ((AD[156]) >> 10U))) + AD[151];
  AD[422] = AD[403] + AD[421];
  AD[423] = AD[421] + AD[419];
  AD[410] = AD[407] + AD[165];

  AD[426] = (bitselect((z)AD[412], (z)AD[417], (z)AD[422]) + AD[410]) + ((rotate((z)(AD[422]), (z)26) ^ rotate((z)(AD[422]), (z)21) ^ rotate((z)(AD[422]), (z)7)));
  AD[424] = bitselect((z)AD[418], (z)AD[413], (z)AD[423] ^ (z)AD[418]) + ((rotate((z)(AD[423]), (z)30) ^ rotate((z)(AD[423]), (z)19) ^ rotate((z)(AD[423]), (z)10)));
  AD[152] = AD[143] + AD[123];
  AD[166] = AD[162] + gb_A[50];

  AD[130] = ((rotate((z)(AD[118]), (z)25) ^ rotate((z)(AD[118]), (z)14) ^ ((AD[118]) >> 3U))) + AD[111];
  AD[167] = ((rotate((z)(AD[161]), (z)15) ^ rotate((z)(AD[161]), (z)13) ^ ((AD[161]) >> 10U))) + AD[152];
  AD[427] = AD[408] + AD[426];
  AD[428] = AD[426] + AD[424];
  AD[415] = AD[412] + AD[166];

  AD[431] = (bitselect((z)AD[417], (z)AD[422], (z)AD[427]) + AD[415]) + ((rotate((z)(AD[427]), (z)26) ^ rotate((z)(AD[427]), (z)21) ^ rotate((z)(AD[427]), (z)7)));
  AD[429] = bitselect((z)AD[423], (z)AD[418], (z)AD[428] ^ (z)AD[423]) + ((rotate((z)(AD[428]), (z)30) ^ rotate((z)(AD[428]), (z)19) ^ rotate((z)(AD[428]), (z)10)));
  AD[157] = AD[149] + AD[130];
  AD[170] = AD[167] + gb_A[51];

  AD[131] = ((rotate((z)(AD[119]), (z)25) ^ rotate((z)(AD[119]), (z)14) ^ ((AD[119]) >> 3U))) + AD[118];
  AD[168] = ((rotate((z)(AD[162]), (z)15) ^ rotate((z)(AD[162]), (z)13) ^ ((AD[162]) >> 10U))) + AD[157];
  AD[432] = AD[413] + AD[431];
  AD[433] = AD[431] + AD[429];
  AD[420] = AD[417] + AD[170];

  AD[436] = (bitselect((z)AD[422], (z)AD[427], (z)AD[432]) + AD[420]) + ((rotate((z)(AD[432]), (z)26) ^ rotate((z)(AD[432]), (z)21) ^ rotate((z)(AD[432]), (z)7)));
  AD[434] = bitselect((z)AD[428], (z)AD[423], (z)AD[433] ^ (z)AD[428]) + ((rotate((z)(AD[433]), (z)30) ^ rotate((z)(AD[433]), (z)19) ^ rotate((z)(AD[433]), (z)10)));
  AD[158] = AD[150] + AD[131];
  AD[171] = AD[168] + gb_A[52];

  AD[138] = ((rotate((z)(AD[126]), (z)25) ^ rotate((z)(AD[126]), (z)14) ^ ((AD[126]) >> 3U))) + AD[119];
  AD[172] = ((rotate((z)(AD[167]), (z)15) ^ rotate((z)(AD[167]), (z)13) ^ ((AD[167]) >> 10U))) + AD[158];
  AD[437] = AD[418] + AD[436];
  AD[438] = AD[436] + AD[434];
  AD[425] = AD[422] + AD[171];

  AD[441] = (bitselect((z)AD[427], (z)AD[432], (z)AD[437]) + AD[425]) + ((rotate((z)(AD[437]), (z)26) ^ rotate((z)(AD[437]), (z)21) ^ rotate((z)(AD[437]), (z)7)));
  AD[439] = bitselect((z)AD[433], (z)AD[428], (z)AD[438] ^ (z)AD[433]) + ((rotate((z)(AD[438]), (z)30) ^ rotate((z)(AD[438]), (z)19) ^ rotate((z)(AD[438]), (z)10)));
  AD[163] = AD[155] + AD[138];
  AD[174] = AD[172] + gb_A[53];

  AD[139] = ((rotate((z)(AD[127]), (z)25) ^ rotate((z)(AD[127]), (z)14) ^ ((AD[127]) >> 3U))) + AD[126];
  AD[173] = ((rotate((z)(AD[168]), (z)15) ^ rotate((z)(AD[168]), (z)13) ^ ((AD[168]) >> 10U))) + AD[163];
  AD[442] = AD[423] + AD[441];
  AD[443] = AD[441] + AD[439];
  AD[430] = AD[427] + AD[174];

  AD[445] = (bitselect((z)AD[432], (z)AD[437], (z)AD[442]) + AD[430]) + ((rotate((z)(AD[442]), (z)26) ^ rotate((z)(AD[442]), (z)21) ^ rotate((z)(AD[442]), (z)7)));
  AD[444] = bitselect((z)AD[438], (z)AD[433], (z)AD[443] ^ (z)AD[438]) + ((rotate((z)(AD[443]), (z)30) ^ rotate((z)(AD[443]), (z)19) ^ rotate((z)(AD[443]), (z)10)));
  AD[164] = AD[156] + AD[139];
  AD[175] = AD[173] + gb_A[54];

  AD[146] = ((rotate((z)(AD[134]), (z)25) ^ rotate((z)(AD[134]), (z)14) ^ ((AD[134]) >> 3U))) + AD[127];
  AD[176] = ((rotate((z)(AD[172]), (z)15) ^ rotate((z)(AD[172]), (z)13) ^ ((AD[172]) >> 10U))) + AD[164];
  AD[446] = AD[428] + AD[445];
  AD[447] = AD[445] + AD[444];
  AD[435] = AD[432] + AD[175];

  AD[449] = (bitselect((z)AD[437], (z)AD[442], (z)AD[446]) + AD[435]) + ((rotate((z)(AD[446]), (z)26) ^ rotate((z)(AD[446]), (z)21) ^ rotate((z)(AD[446]), (z)7)));
  AD[448] = bitselect((z)AD[443], (z)AD[438], (z)AD[447] ^ (z)AD[443]) + ((rotate((z)(AD[447]), (z)30) ^ rotate((z)(AD[447]), (z)19) ^ rotate((z)(AD[447]), (z)10)));
  AD[169] = AD[161] + AD[146];
  AD[178] = AD[176] + gb_A[55];

  AD[177] = ((rotate((z)(AD[173]), (z)15) ^ rotate((z)(AD[173]), (z)13) ^ ((AD[173]) >> 10U))) + AD[169];
  AD[451] = AD[449] + AD[448];
  AD[450] = AD[433] + AD[449];
  AD[440] = AD[437] + AD[178];

  AD[453] = (bitselect((z)AD[442], (z)AD[446], (z)AD[450]) + AD[440]) + ((rotate((z)(AD[450]), (z)26) ^ rotate((z)(AD[450]), (z)21) ^ rotate((z)(AD[450]), (z)7)));
  AD[452] = bitselect((z)AD[447], (z)AD[443], (z)AD[451] ^ (z)AD[447]) + ((rotate((z)(AD[451]), (z)30) ^ rotate((z)(AD[451]), (z)19) ^ rotate((z)(AD[451]), (z)10)));
  AD[179] = AD[177] + gb_A[56];

  AD[454] = AD[438] + AD[453];
  AD[494] = AD[442] + AD[179];
  AD[455] = AD[453] + AD[452];

  AD[457] = (bitselect((z)AD[446], (z)AD[450], (z)AD[454]) + AD[494]) + ((rotate((z)(AD[454]), (z)26) ^ rotate((z)(AD[454]), (z)21) ^ rotate((z)(AD[454]), (z)7)));
  AD[456] = bitselect((z)AD[451], (z)AD[447], (z)AD[455] ^ (z)AD[451]) + ((rotate((z)(AD[455]), (z)30) ^ rotate((z)(AD[455]), (z)19) ^ rotate((z)(AD[455]), (z)10)));

  AD[459] = AD[457] + AD[456];

  AD[461] = AD[455] + V;
  AD[460] = AD[459] + U;

  AD[495] = AD[460] + gb_A[57];
  AD[469] = AD[461] + gb_A[58];

  AD[498] = (bitselect((z)gb_A[60], (z)gb_A[59], (z)AD[495]) + AD[469]) + ((rotate((z)(AD[495]), (z)26) ^ rotate((z)(AD[495]), (z)21) ^ rotate((z)(AD[495]), (z)7)));
  AD[462] = AD[451] + W;

  AD[496] = AD[460] + gb_A[61];
  AD[506] = AD[498] + gb_A[62];
  AD[470] = AD[462] + gb_A[63];

  AD[507] = (bitselect((z)gb_A[59], (z)AD[495], (z)AD[506]) + AD[470]) + ((rotate((z)(AD[506]), (z)26) ^ rotate((z)(AD[506]), (z)21) ^ rotate((z)(AD[506]), (z)7)));
  AD[500] = bitselect((z)gb_A[64], (z)gb_A[65], (z)AD[496] ^ (z)gb_A[64]) + ((rotate((z)(AD[496]), (z)30) ^ rotate((z)(AD[496]), (z)19) ^ rotate((z)(AD[496]), (z)10)));
  AD[463] = AD[447] + X;

  AD[458] = AD[443] + AD[457];
  AD[499] = AD[498] + AD[500];
  AD[508] = AD[507] + gb_A[65];
  AD[473] = AD[463] + gb_A[66];

  AD[510] = (bitselect((z)AD[495], (z)AD[506], (z)AD[508]) + AD[473]) + ((rotate((z)(AD[508]), (z)26) ^ rotate((z)(AD[508]), (z)21) ^ rotate((z)(AD[508]), (z)7)));
  AD[928] = bitselect((z)AD[496], (z)gb_A[64], (z)AD[499] ^ (z)AD[496]) + ((rotate((z)(AD[499]), (z)30) ^ rotate((z)(AD[499]), (z)19) ^ rotate((z)(AD[499]), (z)10)));
  AD[464] = AD[458] + Y;

  AD[476] = AD[464] + AD[460] + gb_A[67];
  AD[511] = AD[510] + gb_A[64];
  AD[509] = AD[928] + AD[507];
  AD[465] = AD[454] + Z;

  AD[514] = (bitselect((z)AD[506], (z)AD[508], (z)AD[511]) + AD[476]) + ((rotate((z)(AD[511]), (z)26) ^ rotate((z)(AD[511]), (z)21) ^ rotate((z)(AD[511]), (z)7)));
  AD[512] = bitselect((z)AD[499], (z)AD[496], (z)AD[509] ^ (z)AD[499]) + ((rotate((z)(AD[509]), (z)30) ^ rotate((z)(AD[509]), (z)19) ^ rotate((z)(AD[509]), (z)10)));
  AD[478] = AD[465] + gb_A[68];

  AD[519] = AD[506] + AD[478];
  AD[516] = AD[496] + AD[514];
  AD[513] = AD[510] + AD[512];
  AD[466] = AD[450] + AA;

  AD[520] = (bitselect((z)AD[508], (z)AD[511], (z)AD[516]) + AD[519]) + ((rotate((z)(AD[516]), (z)26) ^ rotate((z)(AD[516]), (z)21) ^ rotate((z)(AD[516]), (z)7)));
  AD[515] = bitselect((z)AD[509], (z)AD[499], (z)AD[513] ^ (z)AD[509]) + ((rotate((z)(AD[513]), (z)30) ^ rotate((z)(AD[513]), (z)19) ^ rotate((z)(AD[513]), (z)10)));
  AD[480] = AD[466] + gb_A[69];

  AD[524] = AD[508] + AD[480];
  AD[521] = AD[499] + AD[520];
  AD[517] = AD[514] + AD[515];
  AD[467] = AD[446] + AB;

  AD[525] = (bitselect((z)AD[511], (z)AD[516], (z)AD[521]) + AD[524]) + ((rotate((z)(AD[521]), (z)26) ^ rotate((z)(AD[521]), (z)21) ^ rotate((z)(AD[521]), (z)7)));
  AD[522] = bitselect((z)AD[513], (z)AD[509], (z)AD[517] ^ (z)AD[513]) + ((rotate((z)(AD[517]), (z)30) ^ rotate((z)(AD[517]), (z)19) ^ rotate((z)(AD[517]), (z)10)));
  AD[484] = AD[467] + gb_A[70];

  AD[529] = AD[511] + AD[484];
  AD[526] = AD[509] + AD[525];
  AD[523] = AD[520] + AD[522];

  AD[530] = (bitselect((z)AD[516], (z)AD[521], (z)AD[526]) + AD[529]) + ((rotate((z)(AD[526]), (z)26) ^ rotate((z)(AD[526]), (z)21) ^ rotate((z)(AD[526]), (z)7)));
  AD[550] = bitselect((z)AD[517], (z)AD[513], (z)AD[523] ^ (z)AD[517]) + ((rotate((z)(AD[523]), (z)30) ^ rotate((z)(AD[523]), (z)19) ^ rotate((z)(AD[523]), (z)10)));

  AD[531] = AD[513] + AD[530];
  AD[533] = AD[516] + gb_A[71];
  AD[527] = AD[550] + AD[525];

  AD[534] = (bitselect((z)AD[521], (z)AD[526], (z)AD[531]) + AD[533]) + ((rotate((z)(AD[531]), (z)26) ^ rotate((z)(AD[531]), (z)21) ^ rotate((z)(AD[531]), (z)7)));
  AD[551] = bitselect((z)AD[523], (z)AD[517], (z)AD[527] ^ (z)AD[523]) + ((rotate((z)(AD[527]), (z)30) ^ rotate((z)(AD[527]), (z)19) ^ rotate((z)(AD[527]), (z)10)));

  AD[535] = AD[517] + AD[534];
  AD[538] = AD[521] + gb_A[1];
  AD[532] = AD[551] + AD[530];

  AD[539] = (bitselect((z)AD[526], (z)AD[531], (z)AD[535]) + AD[538]) + ((rotate((z)(AD[535]), (z)26) ^ rotate((z)(AD[535]), (z)21) ^ rotate((z)(AD[535]), (z)7)));
  AD[552] = bitselect((z)AD[527], (z)AD[523], (z)AD[532] ^ (z)AD[527]) + ((rotate((z)(AD[532]), (z)30) ^ rotate((z)(AD[532]), (z)19) ^ rotate((z)(AD[532]), (z)10)));

  AD[540] = AD[523] + AD[539];
  AD[542] = AD[526] + gb_A[2];
  AD[536] = AD[552] + AD[534];

  AD[543] = (bitselect((z)AD[531], (z)AD[535], (z)AD[540]) + AD[542]) + ((rotate((z)(AD[540]), (z)26) ^ rotate((z)(AD[540]), (z)21) ^ rotate((z)(AD[540]), (z)7)));
  AD[553] = bitselect((z)AD[532], (z)AD[527], (z)AD[536] ^ (z)AD[532]) + ((rotate((z)(AD[536]), (z)30) ^ rotate((z)(AD[536]), (z)19) ^ rotate((z)(AD[536]), (z)10)));

  AD[544] = AD[527] + AD[543];
  AD[555] = AD[531] + gb_A[3];
  AD[541] = AD[553] + AD[539];

  AD[558] = (bitselect((z)AD[535], (z)AD[540], (z)AD[544]) + AD[555]) + ((rotate((z)(AD[544]), (z)26) ^ rotate((z)(AD[544]), (z)21) ^ rotate((z)(AD[544]), (z)7)));
  AD[547] = bitselect((z)AD[536], (z)AD[532], (z)AD[541] ^ (z)AD[536]) + ((rotate((z)(AD[541]), (z)30) ^ rotate((z)(AD[541]), (z)19) ^ rotate((z)(AD[541]), (z)10)));

  AD[559] = AD[532] + AD[558];
  AD[556] = AD[535] + gb_A[4];
  AD[545] = AD[547] + AD[543];

  AD[562] = (bitselect((z)AD[540], (z)AD[544], (z)AD[559]) + AD[556]) + ((rotate((z)(AD[559]), (z)26) ^ rotate((z)(AD[559]), (z)21) ^ rotate((z)(AD[559]), (z)7)));
  AD[561] = bitselect((z)AD[541], (z)AD[536], (z)AD[545] ^ (z)AD[541]) + ((rotate((z)(AD[545]), (z)30) ^ rotate((z)(AD[545]), (z)19) ^ rotate((z)(AD[545]), (z)10)));

  AD[563] = AD[536] + AD[562];
  AD[560] = AD[561] + AD[558];
  AD[557] = AD[540] + gb_A[5];

  AD[568] = (bitselect((z)AD[544], (z)AD[559], (z)AD[563]) + AD[557]) + ((rotate((z)(AD[563]), (z)26) ^ rotate((z)(AD[563]), (z)21) ^ rotate((z)(AD[563]), (z)7)));
  AD[564] = bitselect((z)AD[545], (z)AD[541], (z)AD[560] ^ (z)AD[545]) + ((rotate((z)(AD[560]), (z)30) ^ rotate((z)(AD[560]), (z)19) ^ rotate((z)(AD[560]), (z)10)));

  AD[569] = AD[541] + AD[568];
  AD[572] = AD[544] + gb_A[6];
  AD[565] = AD[562] + AD[564];

  AD[574] = (bitselect((z)AD[559], (z)AD[563], (z)AD[569]) + AD[572]) + ((rotate((z)(AD[569]), (z)26) ^ rotate((z)(AD[569]), (z)21) ^ rotate((z)(AD[569]), (z)7)));
  AD[570] = bitselect((z)AD[560], (z)AD[545], (z)AD[565] ^ (z)AD[560]) + ((rotate((z)(AD[565]), (z)30) ^ rotate((z)(AD[565]), (z)19) ^ rotate((z)(AD[565]), (z)10)));
  AD[468] = ((rotate((z)(AD[461]), (z)25) ^ rotate((z)(AD[461]), (z)14) ^ ((AD[461]) >> 3U)));

  AD[497] = AD[468] + AD[460];
  AD[575] = AD[545] + AD[574];
  AD[571] = AD[568] + AD[570];
  AD[573] = AD[559] + gb_A[72];

  AD[578] = (bitselect((z)AD[563], (z)AD[569], (z)AD[575]) + AD[573]) + ((rotate((z)(AD[575]), (z)26) ^ rotate((z)(AD[575]), (z)21) ^ rotate((z)(AD[575]), (z)7)));
  AD[576] = bitselect((z)AD[565], (z)AD[560], (z)AD[571] ^ (z)AD[565]) + ((rotate((z)(AD[571]), (z)30) ^ rotate((z)(AD[571]), (z)19) ^ rotate((z)(AD[571]), (z)10)));
  AD[929] = ((rotate((z)(AD[462]), (z)25) ^ rotate((z)(AD[462]), (z)14) ^ ((AD[462]) >> 3U)));
  AD[503] = AD[497] + 0xe49b69c1U;

  AD[471] = AD[929] + AD[461] + gb_A[74];
  AD[582] = AD[563] + AD[503];
  AD[579] = AD[560] + AD[578];
  AD[577] = AD[574] + AD[576];

  AD[583] = (bitselect((z)AD[569], (z)AD[575], (z)AD[579]) + AD[582]) + ((rotate((z)(AD[579]), (z)26) ^ rotate((z)(AD[579]), (z)21) ^ rotate((z)(AD[579]), (z)7)));
  AD[580] = bitselect((z)AD[571], (z)AD[565], (z)AD[577] ^ (z)AD[571]) + ((rotate((z)(AD[577]), (z)30) ^ rotate((z)(AD[577]), (z)19) ^ rotate((z)(AD[577]), (z)10)));
  AD[488] = AD[471] + gb_A[75];

  AD[472] = ((rotate((z)(AD[463]), (z)25) ^ rotate((z)(AD[463]), (z)14) ^ ((AD[463]) >> 3U))) + AD[462];
  AD[587] = AD[569] + AD[488];
  AD[584] = AD[565] + AD[583];
  AD[581] = AD[578] + AD[580];

  AD[588] = (bitselect((z)AD[575], (z)AD[579], (z)AD[584]) + AD[587]) + ((rotate((z)(AD[584]), (z)26) ^ rotate((z)(AD[584]), (z)21) ^ rotate((z)(AD[584]), (z)7)));
  AD[586] = bitselect((z)AD[577], (z)AD[571], (z)AD[581] ^ (z)AD[577]) + ((rotate((z)(AD[581]), (z)30) ^ rotate((z)(AD[581]), (z)19) ^ rotate((z)(AD[581]), (z)10)));
  AD[501] = ((rotate((z)(AD[497]), (z)15) ^ rotate((z)(AD[497]), (z)13) ^ ((AD[497]) >> 10U))) + AD[472];
  AD[475] = ((rotate((z)(AD[471]), (z)15) ^ rotate((z)(AD[471]), (z)13) ^ ((AD[471]) >> 10U)));
  AD[926] = AD[575] + gb_A[8];

  AD[474] = AD[475] + AD[463] + ((rotate((z)(AD[464]), (z)25) ^ rotate((z)(AD[464]), (z)14) ^ ((AD[464]) >> 3U)));
  AD[927] = AD[926] + AD[501];
  AD[589] = AD[571] + AD[588];
  AD[585] = AD[583] + AD[586];

  AD[592] = (bitselect((z)AD[579], (z)AD[584], (z)AD[589]) + AD[927]) + ((rotate((z)(AD[589]), (z)26) ^ rotate((z)(AD[589]), (z)21) ^ rotate((z)(AD[589]), (z)7)));
  AD[590] = bitselect((z)AD[581], (z)AD[577], (z)AD[585] ^ (z)AD[581]) + ((rotate((z)(AD[585]), (z)30) ^ rotate((z)(AD[585]), (z)19) ^ rotate((z)(AD[585]), (z)10)));
  AD[477] = ((rotate((z)(AD[465]), (z)25) ^ rotate((z)(AD[465]), (z)14) ^ ((AD[465]) >> 3U))) + AD[464];
  AD[489] = AD[474] + gb_A[9];

  AD[518] = ((rotate((z)(AD[501]), (z)15) ^ rotate((z)(AD[501]), (z)13) ^ ((AD[501]) >> 10U))) + AD[477];
  AD[479] = ((rotate((z)(AD[466]), (z)25) ^ rotate((z)(AD[466]), (z)14) ^ ((AD[466]) >> 3U)));
  AD[596] = AD[579] + AD[489];
  AD[593] = AD[577] + AD[592];
  AD[591] = AD[588] + AD[590];

  AD[597] = (bitselect((z)AD[584], (z)AD[589], (z)AD[593]) + AD[596]) + ((rotate((z)(AD[593]), (z)26) ^ rotate((z)(AD[593]), (z)21) ^ rotate((z)(AD[593]), (z)7)));
  AD[594] = bitselect((z)AD[585], (z)AD[581], (z)AD[591] ^ (z)AD[585]) + ((rotate((z)(AD[591]), (z)30) ^ rotate((z)(AD[591]), (z)19) ^ rotate((z)(AD[591]), (z)10)));
  AD[481] = AD[479] + AD[465];
  AD[601] = AD[518] + gb_A[11];

  AD[482] = ((rotate((z)(AD[474]), (z)15) ^ rotate((z)(AD[474]), (z)13) ^ ((AD[474]) >> 10U))) + AD[481];
  AD[602] = AD[584] + AD[601];
  AD[598] = AD[581] + AD[597];
  AD[595] = AD[592] + AD[594];

  AD[632] = (bitselect((z)AD[589], (z)AD[593], (z)AD[598]) + AD[602]) + ((rotate((z)(AD[598]), (z)26) ^ rotate((z)(AD[598]), (z)21) ^ rotate((z)(AD[598]), (z)7)));
  AD[599] = bitselect((z)AD[591], (z)AD[585], (z)AD[595] ^ (z)AD[591]) + ((rotate((z)(AD[595]), (z)30) ^ rotate((z)(AD[595]), (z)19) ^ rotate((z)(AD[595]), (z)10)));
  AD[483] = AD[466] + gb_A[76] + ((rotate((z)(AD[467]), (z)25) ^ rotate((z)(AD[467]), (z)14) ^ ((AD[467]) >> 3U)));
  AD[490] = AD[482] + gb_A[12];

  AD[528] = ((rotate((z)(AD[518]), (z)15) ^ rotate((z)(AD[518]), (z)13) ^ ((AD[518]) >> 10U))) + AD[483];
  AD[736] = AD[585] + AD[632];
  AD[605] = AD[589] + AD[490];
  AD[600] = AD[597] + AD[599];
  AD[485] = AD[467] + gb_A[77];

  AD[738] = (bitselect((z)AD[593], (z)AD[598], (z)AD[736]) + AD[605]) + ((rotate((z)(AD[736]), (z)26) ^ rotate((z)(AD[736]), (z)21) ^ rotate((z)(AD[736]), (z)7)));
  AD[744] = bitselect((z)AD[595], (z)AD[591], (z)AD[600] ^ (z)AD[595]) + ((rotate((z)(AD[600]), (z)30) ^ rotate((z)(AD[600]), (z)19) ^ rotate((z)(AD[600]), (z)10)));
  AD[487] = ((rotate((z)(AD[482]), (z)15) ^ rotate((z)(AD[482]), (z)13) ^ ((AD[482]) >> 10U))) + AD[485];
  AD[603] = AD[528] + gb_A[14];

  AD[502] = AD[497] + AD[487];
  AD[739] = AD[591] + AD[738];
  AD[604] = AD[593] + AD[603];
  AD[737] = AD[744] + AD[632];

  AD[741] = (bitselect((z)AD[598], (z)AD[736], (z)AD[739]) + AD[604]) + ((rotate((z)(AD[739]), (z)26) ^ rotate((z)(AD[739]), (z)21) ^ rotate((z)(AD[739]), (z)7)));
  AD[745] = bitselect((z)AD[600], (z)AD[595], (z)AD[737] ^ (z)AD[600]) + ((rotate((z)(AD[737]), (z)30) ^ rotate((z)(AD[737]), (z)19) ^ rotate((z)(AD[737]), (z)10)));
  AD[486] = AD[471] + gb_A[10];
  AD[606] = AD[502] + gb_A[15];

  AD[537] = ((rotate((z)(AD[528]), (z)15) ^ rotate((z)(AD[528]), (z)13) ^ ((AD[528]) >> 10U))) + AD[486];
  AD[742] = AD[595] + AD[741];
  AD[613] = AD[598] + AD[606];
  AD[740] = AD[745] + AD[738];

  AD[747] = (bitselect((z)AD[736], (z)AD[739], (z)AD[742]) + AD[613]) + ((rotate((z)(AD[742]), (z)26) ^ rotate((z)(AD[742]), (z)21) ^ rotate((z)(AD[742]), (z)7)));
  AD[746] = bitselect((z)AD[737], (z)AD[600], (z)AD[740] ^ (z)AD[737]) + ((rotate((z)(AD[740]), (z)30) ^ rotate((z)(AD[740]), (z)19) ^ rotate((z)(AD[740]), (z)10)));
  AD[607] = AD[537] + gb_A[16];

  AD[546] = ((rotate((z)(AD[502]), (z)15) ^ rotate((z)(AD[502]), (z)13) ^ ((AD[502]) >> 10U))) + AD[501];
  AD[751] = AD[736] + AD[607];
  AD[748] = AD[600] + AD[747];
  AD[743] = AD[746] + AD[741];

  AD[752] = (bitselect((z)AD[739], (z)AD[742], (z)AD[748]) + AD[751]) + ((rotate((z)(AD[748]), (z)26) ^ rotate((z)(AD[748]), (z)21) ^ rotate((z)(AD[748]), (z)7)));
  AD[749] = bitselect((z)AD[740], (z)AD[737], (z)AD[743] ^ (z)AD[740]) + ((rotate((z)(AD[743]), (z)30) ^ rotate((z)(AD[743]), (z)19) ^ rotate((z)(AD[743]), (z)10)));
  AD[608] = AD[546] + gb_A[17];

  AD[554] = ((rotate((z)(AD[537]), (z)15) ^ rotate((z)(AD[537]), (z)13) ^ ((AD[537]) >> 10U))) + AD[474];
  AD[756] = AD[739] + AD[608];
  AD[753] = AD[737] + AD[752];
  AD[750] = AD[747] + AD[749];

  AD[757] = (bitselect((z)AD[742], (z)AD[748], (z)AD[753]) + AD[756]) + ((rotate((z)(AD[753]), (z)26) ^ rotate((z)(AD[753]), (z)21) ^ rotate((z)(AD[753]), (z)7)));
  AD[754] = bitselect((z)AD[743], (z)AD[740], (z)AD[750] ^ (z)AD[743]) + ((rotate((z)(AD[750]), (z)30) ^ rotate((z)(AD[750]), (z)19) ^ rotate((z)(AD[750]), (z)10)));
  AD[609] = AD[554] + gb_A[18];

  AD[566] = ((rotate((z)(AD[546]), (z)15) ^ rotate((z)(AD[546]), (z)13) ^ ((AD[546]) >> 10U))) + AD[518];
  AD[761] = AD[742] + AD[609];
  AD[758] = AD[740] + AD[757];
  AD[755] = AD[752] + AD[754];

  AD[762] = (bitselect((z)AD[748], (z)AD[753], (z)AD[758]) + AD[761]) + ((rotate((z)(AD[758]), (z)26) ^ rotate((z)(AD[758]), (z)21) ^ rotate((z)(AD[758]), (z)7)));
  AD[759] = bitselect((z)AD[750], (z)AD[743], (z)AD[755] ^ (z)AD[750]) + ((rotate((z)(AD[755]), (z)30) ^ rotate((z)(AD[755]), (z)19) ^ rotate((z)(AD[755]), (z)10)));
  AD[610] = AD[566] + gb_A[19];

  AD[567] = ((rotate((z)(AD[554]), (z)15) ^ rotate((z)(AD[554]), (z)13) ^ ((AD[554]) >> 10U))) + AD[482];
  AD[766] = AD[748] + AD[610];
  AD[763] = AD[743] + AD[762];
  AD[760] = AD[757] + AD[759];

  AD[767] = (bitselect((z)AD[753], (z)AD[758], (z)AD[763]) + AD[766]) + ((rotate((z)(AD[763]), (z)26) ^ rotate((z)(AD[763]), (z)21) ^ rotate((z)(AD[763]), (z)7)));
  AD[764] = bitselect((z)AD[755], (z)AD[750], (z)AD[760] ^ (z)AD[755]) + ((rotate((z)(AD[760]), (z)30) ^ rotate((z)(AD[760]), (z)19) ^ rotate((z)(AD[760]), (z)10)));
  AD[611] = AD[567] + gb_A[20];

  AD[614] = ((rotate((z)(AD[566]), (z)15) ^ rotate((z)(AD[566]), (z)13) ^ ((AD[566]) >> 10U))) + AD[528];
  AD[771] = AD[753] + AD[611];
  AD[768] = AD[750] + AD[767];
  AD[765] = AD[762] + AD[764];

  AD[772] = (bitselect((z)AD[758], (z)AD[763], (z)AD[768]) + AD[771]) + ((rotate((z)(AD[768]), (z)26) ^ rotate((z)(AD[768]), (z)21) ^ rotate((z)(AD[768]), (z)7)));
  AD[769] = bitselect((z)AD[760], (z)AD[755], (z)AD[765] ^ (z)AD[760]) + ((rotate((z)(AD[765]), (z)30) ^ rotate((z)(AD[765]), (z)19) ^ rotate((z)(AD[765]), (z)10)));
  AD[612] = AD[502] + gb_A[78];
  AD[615] = AD[614] + gb_A[22];

  AD[616] = ((rotate((z)(AD[567]), (z)15) ^ rotate((z)(AD[567]), (z)13) ^ ((AD[567]) >> 10U))) + AD[612];
  AD[504] = ((rotate((z)(AD[497]), (z)25) ^ rotate((z)(AD[497]), (z)14) ^ ((AD[497]) >> 3U))) + gb_A[76];
  AD[776] = AD[758] + AD[615];
  AD[773] = AD[755] + AD[772];
  AD[770] = AD[767] + AD[769];

  AD[777] = (bitselect((z)AD[763], (z)AD[768], (z)AD[773]) + AD[776]) + ((rotate((z)(AD[773]), (z)26) ^ rotate((z)(AD[773]), (z)21) ^ rotate((z)(AD[773]), (z)7)));
  AD[774] = bitselect((z)AD[765], (z)AD[760], (z)AD[770] ^ (z)AD[765]) + ((rotate((z)(AD[770]), (z)30) ^ rotate((z)(AD[770]), (z)19) ^ rotate((z)(AD[770]), (z)10)));
  AD[492] = ((rotate((z)(AD[471]), (z)25) ^ rotate((z)(AD[471]), (z)14) ^ ((AD[471]) >> 3U)));
  AD[618] = AD[537] + AD[504];
  AD[617] = AD[616] + gb_A[23];

  AD[619] = ((rotate((z)(AD[614]), (z)15) ^ rotate((z)(AD[614]), (z)13) ^ ((AD[614]) >> 10U))) + AD[618];
  AD[781] = AD[763] + AD[617];
  AD[778] = AD[760] + AD[777];
  AD[775] = AD[772] + AD[774];
  AD[505] = AD[492] + AD[497];

  AD[782] = (bitselect((z)AD[768], (z)AD[773], (z)AD[778]) + AD[781]) + ((rotate((z)(AD[778]), (z)26) ^ rotate((z)(AD[778]), (z)21) ^ rotate((z)(AD[778]), (z)7)));
  AD[779] = bitselect((z)AD[770], (z)AD[765], (z)AD[775] ^ (z)AD[770]) + ((rotate((z)(AD[775]), (z)30) ^ rotate((z)(AD[775]), (z)19) ^ rotate((z)(AD[775]), (z)10)));
  AD[621] = AD[505] + AD[546];
  AD[620] = AD[619] + gb_A[24];

  AD[622] = ((rotate((z)(AD[616]), (z)15) ^ rotate((z)(AD[616]), (z)13) ^ ((AD[616]) >> 10U))) + AD[621];
  AD[625] = ((rotate((z)(AD[501]), (z)25) ^ rotate((z)(AD[501]), (z)14) ^ ((AD[501]) >> 3U)));
  AD[786] = AD[768] + AD[620];
  AD[783] = AD[765] + AD[782];
  AD[624] = AD[554] + AD[471];
  AD[780] = AD[777] + AD[779];

  AD[787] = (bitselect((z)AD[773], (z)AD[778], (z)AD[783]) + AD[786]) + ((rotate((z)(AD[783]), (z)26) ^ rotate((z)(AD[783]), (z)21) ^ rotate((z)(AD[783]), (z)7)));
  AD[784] = bitselect((z)AD[775], (z)AD[770], (z)AD[780] ^ (z)AD[775]) + ((rotate((z)(AD[780]), (z)30) ^ rotate((z)(AD[780]), (z)19) ^ rotate((z)(AD[780]), (z)10)));
  AD[493] = ((rotate((z)(AD[474]), (z)25) ^ rotate((z)(AD[474]), (z)14) ^ ((AD[474]) >> 3U)));
  AD[626] = AD[625] + AD[624];
  AD[623] = AD[622] + gb_A[25];

  AD[627] = ((rotate((z)(AD[619]), (z)15) ^ rotate((z)(AD[619]), (z)13) ^ ((AD[619]) >> 10U))) + AD[626];
  AD[791] = AD[773] + AD[623];
  AD[788] = AD[770] + AD[787];
  AD[785] = AD[782] + AD[784];
  AD[629] = AD[493] + AD[501];

  AD[792] = (bitselect((z)AD[778], (z)AD[783], (z)AD[788]) + AD[791]) + ((rotate((z)(AD[788]), (z)26) ^ rotate((z)(AD[788]), (z)21) ^ rotate((z)(AD[788]), (z)7)));
  AD[789] = bitselect((z)AD[780], (z)AD[775], (z)AD[785] ^ (z)AD[780]) + ((rotate((z)(AD[785]), (z)30) ^ rotate((z)(AD[785]), (z)19) ^ rotate((z)(AD[785]), (z)10)));
  AD[630] = AD[566] + AD[629];
  AD[628] = AD[627] + gb_A[26];

  AD[634] = ((rotate((z)(AD[518]), (z)25) ^ rotate((z)(AD[518]), (z)14) ^ ((AD[518]) >> 3U))) + AD[474];
  AD[631] = ((rotate((z)(AD[622]), (z)15) ^ rotate((z)(AD[622]), (z)13) ^ ((AD[622]) >> 10U))) + AD[630];
  AD[796] = AD[778] + AD[628];
  AD[793] = AD[775] + AD[792];
  AD[790] = AD[787] + AD[789];

  AD[797] = (bitselect((z)AD[783], (z)AD[788], (z)AD[793]) + AD[796]) + ((rotate((z)(AD[793]), (z)26) ^ rotate((z)(AD[793]), (z)21) ^ rotate((z)(AD[793]), (z)7)));
  AD[794] = bitselect((z)AD[785], (z)AD[780], (z)AD[790] ^ (z)AD[785]) + ((rotate((z)(AD[790]), (z)30) ^ rotate((z)(AD[790]), (z)19) ^ rotate((z)(AD[790]), (z)10)));
  AD[491] = ((rotate((z)(AD[482]), (z)25) ^ rotate((z)(AD[482]), (z)14) ^ ((AD[482]) >> 3U)));
  AD[635] = AD[567] + AD[634];
  AD[633] = AD[631] + gb_A[27];

  AD[636] = ((rotate((z)(AD[627]), (z)15) ^ rotate((z)(AD[627]), (z)13) ^ ((AD[627]) >> 10U))) + AD[635];
  AD[801] = AD[783] + AD[633];
  AD[798] = AD[780] + AD[797];
  AD[795] = AD[792] + AD[794];
  AD[638] = AD[491] + AD[518];

  AD[802] = (bitselect((z)AD[788], (z)AD[793], (z)AD[798]) + AD[801]) + ((rotate((z)(AD[798]), (z)26) ^ rotate((z)(AD[798]), (z)21) ^ rotate((z)(AD[798]), (z)7)));
  AD[799] = bitselect((z)AD[790], (z)AD[785], (z)AD[795] ^ (z)AD[790]) + ((rotate((z)(AD[795]), (z)30) ^ rotate((z)(AD[795]), (z)19) ^ rotate((z)(AD[795]), (z)10)));
  AD[639] = AD[638] + AD[614];
  AD[637] = AD[636] + gb_A[28];

  AD[642] = ((rotate((z)(AD[528]), (z)25) ^ rotate((z)(AD[528]), (z)14) ^ ((AD[528]) >> 3U))) + AD[482];
  AD[640] = ((rotate((z)(AD[631]), (z)15) ^ rotate((z)(AD[631]), (z)13) ^ ((AD[631]) >> 10U))) + AD[639];
  AD[806] = AD[788] + AD[637];
  AD[803] = AD[785] + AD[802];
  AD[800] = AD[797] + AD[799];

  AD[807] = (bitselect((z)AD[793], (z)AD[798], (z)AD[803]) + AD[806]) + ((rotate((z)(AD[803]), (z)26) ^ rotate((z)(AD[803]), (z)21) ^ rotate((z)(AD[803]), (z)7)));
  AD[804] = bitselect((z)AD[795], (z)AD[790], (z)AD[800] ^ (z)AD[795]) + ((rotate((z)(AD[800]), (z)30) ^ rotate((z)(AD[800]), (z)19) ^ rotate((z)(AD[800]), (z)10)));
  AD[643] = AD[616] + AD[642];
  AD[641] = AD[640] + gb_A[29];

  AD[646] = ((rotate((z)(AD[502]), (z)25) ^ rotate((z)(AD[502]), (z)14) ^ ((AD[502]) >> 3U))) + AD[528];
  AD[644] = ((rotate((z)(AD[636]), (z)15) ^ rotate((z)(AD[636]), (z)13) ^ ((AD[636]) >> 10U))) + AD[643];
  AD[811] = AD[793] + AD[641];
  AD[808] = AD[790] + AD[807];
  AD[805] = AD[802] + AD[804];

  AD[812] = (bitselect((z)AD[798], (z)AD[803], (z)AD[808]) + AD[811]) + ((rotate((z)(AD[808]), (z)26) ^ rotate((z)(AD[808]), (z)21) ^ rotate((z)(AD[808]), (z)7)));
  AD[809] = bitselect((z)AD[800], (z)AD[795], (z)AD[805] ^ (z)AD[800]) + ((rotate((z)(AD[805]), (z)30) ^ rotate((z)(AD[805]), (z)19) ^ rotate((z)(AD[805]), (z)10)));
  AD[647] = AD[619] + AD[646];
  AD[645] = AD[644] + gb_A[30];

  AD[650] = ((rotate((z)(AD[537]), (z)25) ^ rotate((z)(AD[537]), (z)14) ^ ((AD[537]) >> 3U))) + AD[502];
  AD[648] = ((rotate((z)(AD[640]), (z)15) ^ rotate((z)(AD[640]), (z)13) ^ ((AD[640]) >> 10U))) + AD[647];
  AD[816] = AD[798] + AD[645];
  AD[813] = AD[795] + AD[812];
  AD[810] = AD[807] + AD[809];

  AD[817] = (bitselect((z)AD[803], (z)AD[808], (z)AD[813]) + AD[816]) + ((rotate((z)(AD[813]), (z)26) ^ rotate((z)(AD[813]), (z)21) ^ rotate((z)(AD[813]), (z)7)));
  AD[814] = bitselect((z)AD[805], (z)AD[800], (z)AD[810] ^ (z)AD[805]) + ((rotate((z)(AD[810]), (z)30) ^ rotate((z)(AD[810]), (z)19) ^ rotate((z)(AD[810]), (z)10)));
  AD[925] = AD[622] + AD[650];
  AD[649] = AD[648] + gb_A[31];

  AD[653] = ((rotate((z)(AD[546]), (z)25) ^ rotate((z)(AD[546]), (z)14) ^ ((AD[546]) >> 3U))) + AD[537];
  AD[651] = ((rotate((z)(AD[644]), (z)15) ^ rotate((z)(AD[644]), (z)13) ^ ((AD[644]) >> 10U))) + AD[925];
  AD[821] = AD[803] + AD[649];
  AD[818] = AD[800] + AD[817];
  AD[815] = AD[812] + AD[814];

  AD[822] = (bitselect((z)AD[808], (z)AD[813], (z)AD[818]) + AD[821]) + ((rotate((z)(AD[818]), (z)26) ^ rotate((z)(AD[818]), (z)21) ^ rotate((z)(AD[818]), (z)7)));
  AD[819] = bitselect((z)AD[810], (z)AD[805], (z)AD[815] ^ (z)AD[810]) + ((rotate((z)(AD[815]), (z)30) ^ rotate((z)(AD[815]), (z)19) ^ rotate((z)(AD[815]), (z)10)));
  AD[654] = AD[627] + AD[653];
  AD[652] = AD[651] + gb_A[32];

  AD[657] = ((rotate((z)(AD[554]), (z)25) ^ rotate((z)(AD[554]), (z)14) ^ ((AD[554]) >> 3U))) + AD[546];
  AD[655] = ((rotate((z)(AD[648]), (z)15) ^ rotate((z)(AD[648]), (z)13) ^ ((AD[648]) >> 10U))) + AD[654];
  AD[826] = AD[808] + AD[652];
  AD[823] = AD[805] + AD[822];
  AD[820] = AD[817] + AD[819];

  AD[827] = (bitselect((z)AD[813], (z)AD[818], (z)AD[823]) + AD[826]) + ((rotate((z)(AD[823]), (z)26) ^ rotate((z)(AD[823]), (z)21) ^ rotate((z)(AD[823]), (z)7)));
  AD[824] = bitselect((z)AD[815], (z)AD[810], (z)AD[820] ^ (z)AD[815]) + ((rotate((z)(AD[820]), (z)30) ^ rotate((z)(AD[820]), (z)19) ^ rotate((z)(AD[820]), (z)10)));
  AD[658] = AD[631] + AD[657];
  AD[656] = AD[655] + gb_A[33];

  AD[661] = ((rotate((z)(AD[566]), (z)25) ^ rotate((z)(AD[566]), (z)14) ^ ((AD[566]) >> 3U))) + AD[554];
  AD[659] = ((rotate((z)(AD[651]), (z)15) ^ rotate((z)(AD[651]), (z)13) ^ ((AD[651]) >> 10U))) + AD[658];
  AD[831] = AD[813] + AD[656];
  AD[828] = AD[810] + AD[827];
  AD[825] = AD[822] + AD[824];

  AD[832] = (bitselect((z)AD[818], (z)AD[823], (z)AD[828]) + AD[831]) + ((rotate((z)(AD[828]), (z)26) ^ rotate((z)(AD[828]), (z)21) ^ rotate((z)(AD[828]), (z)7)));
  AD[829] = bitselect((z)AD[820], (z)AD[815], (z)AD[825] ^ (z)AD[820]) + ((rotate((z)(AD[825]), (z)30) ^ rotate((z)(AD[825]), (z)19) ^ rotate((z)(AD[825]), (z)10)));
  AD[662] = AD[636] + AD[661];
  AD[660] = AD[659] + gb_A[34];

  AD[665] = ((rotate((z)(AD[567]), (z)25) ^ rotate((z)(AD[567]), (z)14) ^ ((AD[567]) >> 3U))) + AD[566];
  AD[663] = ((rotate((z)(AD[655]), (z)15) ^ rotate((z)(AD[655]), (z)13) ^ ((AD[655]) >> 10U))) + AD[662];
  AD[836] = AD[818] + AD[660];
  AD[833] = AD[815] + AD[832];
  AD[830] = AD[827] + AD[829];

  AD[837] = (bitselect((z)AD[823], (z)AD[828], (z)AD[833]) + AD[836]) + ((rotate((z)(AD[833]), (z)26) ^ rotate((z)(AD[833]), (z)21) ^ rotate((z)(AD[833]), (z)7)));
  AD[834] = bitselect((z)AD[825], (z)AD[820], (z)AD[830] ^ (z)AD[825]) + ((rotate((z)(AD[830]), (z)30) ^ rotate((z)(AD[830]), (z)19) ^ rotate((z)(AD[830]), (z)10)));
  AD[666] = AD[640] + AD[665];
  AD[664] = AD[663] + gb_A[35];

  AD[669] = ((rotate((z)(AD[614]), (z)25) ^ rotate((z)(AD[614]), (z)14) ^ ((AD[614]) >> 3U))) + AD[567];
  AD[667] = ((rotate((z)(AD[659]), (z)15) ^ rotate((z)(AD[659]), (z)13) ^ ((AD[659]) >> 10U))) + AD[666];
  AD[841] = AD[823] + AD[664];
  AD[838] = AD[820] + AD[837];
  AD[835] = AD[832] + AD[834];

  AD[842] = (bitselect((z)AD[828], (z)AD[833], (z)AD[838]) + AD[841]) + ((rotate((z)(AD[838]), (z)26) ^ rotate((z)(AD[838]), (z)21) ^ rotate((z)(AD[838]), (z)7)));
  AD[839] = bitselect((z)AD[830], (z)AD[825], (z)AD[835] ^ (z)AD[830]) + ((rotate((z)(AD[835]), (z)30) ^ rotate((z)(AD[835]), (z)19) ^ rotate((z)(AD[835]), (z)10)));
  AD[670] = AD[644] + AD[669];
  AD[668] = AD[667] + gb_A[36];

  AD[677] = ((rotate((z)(AD[616]), (z)25) ^ rotate((z)(AD[616]), (z)14) ^ ((AD[616]) >> 3U))) + AD[614];
  AD[671] = ((rotate((z)(AD[663]), (z)15) ^ rotate((z)(AD[663]), (z)13) ^ ((AD[663]) >> 10U))) + AD[670];
  AD[846] = AD[828] + AD[668];
  AD[843] = AD[825] + AD[842];
  AD[840] = AD[837] + AD[839];

  AD[847] = (bitselect((z)AD[833], (z)AD[838], (z)AD[843]) + AD[846]) + ((rotate((z)(AD[843]), (z)26) ^ rotate((z)(AD[843]), (z)21) ^ rotate((z)(AD[843]), (z)7)));
  AD[844] = bitselect((z)AD[835], (z)AD[830], (z)AD[840] ^ (z)AD[835]) + ((rotate((z)(AD[840]), (z)30) ^ rotate((z)(AD[840]), (z)19) ^ rotate((z)(AD[840]), (z)10)));
  AD[678] = AD[648] + AD[677];
  AD[676] = AD[671] + gb_A[37];

  AD[682] = ((rotate((z)(AD[619]), (z)25) ^ rotate((z)(AD[619]), (z)14) ^ ((AD[619]) >> 3U))) + AD[616];
  AD[679] = ((rotate((z)(AD[667]), (z)15) ^ rotate((z)(AD[667]), (z)13) ^ ((AD[667]) >> 10U))) + AD[678];
  AD[851] = AD[833] + AD[676];
  AD[848] = AD[830] + AD[847];
  AD[845] = AD[842] + AD[844];

  AD[852] = (bitselect((z)AD[838], (z)AD[843], (z)AD[848]) + AD[851]) + ((rotate((z)(AD[848]), (z)26) ^ rotate((z)(AD[848]), (z)21) ^ rotate((z)(AD[848]), (z)7)));
  AD[849] = bitselect((z)AD[840], (z)AD[835], (z)AD[845] ^ (z)AD[840]) + ((rotate((z)(AD[845]), (z)30) ^ rotate((z)(AD[845]), (z)19) ^ rotate((z)(AD[845]), (z)10)));
  AD[683] = AD[651] + AD[682];
  AD[680] = AD[679] + gb_A[38];

  AD[686] = ((rotate((z)(AD[622]), (z)25) ^ rotate((z)(AD[622]), (z)14) ^ ((AD[622]) >> 3U))) + AD[619];
  AD[684] = ((rotate((z)(AD[671]), (z)15) ^ rotate((z)(AD[671]), (z)13) ^ ((AD[671]) >> 10U))) + AD[683];
  AD[856] = AD[838] + AD[680];
  AD[853] = AD[835] + AD[852];
  AD[850] = AD[847] + AD[849];

  AD[857] = (bitselect((z)AD[843], (z)AD[848], (z)AD[853]) + AD[856]) + ((rotate((z)(AD[853]), (z)26) ^ rotate((z)(AD[853]), (z)21) ^ rotate((z)(AD[853]), (z)7)));
  AD[854] = bitselect((z)AD[845], (z)AD[840], (z)AD[850] ^ (z)AD[845]) + ((rotate((z)(AD[850]), (z)30) ^ rotate((z)(AD[850]), (z)19) ^ rotate((z)(AD[850]), (z)10)));
  AD[687] = AD[655] + AD[686];
  AD[685] = AD[684] + gb_A[39];

  AD[690] = ((rotate((z)(AD[627]), (z)25) ^ rotate((z)(AD[627]), (z)14) ^ ((AD[627]) >> 3U))) + AD[622];
  AD[688] = ((rotate((z)(AD[679]), (z)15) ^ rotate((z)(AD[679]), (z)13) ^ ((AD[679]) >> 10U))) + AD[687];
  AD[861] = AD[843] + AD[685];
  AD[858] = AD[840] + AD[857];
  AD[855] = AD[852] + AD[854];

  AD[862] = (bitselect((z)AD[848], (z)AD[853], (z)AD[858]) + AD[861]) + ((rotate((z)(AD[858]), (z)26) ^ rotate((z)(AD[858]), (z)21) ^ rotate((z)(AD[858]), (z)7)));
  AD[859] = bitselect((z)AD[850], (z)AD[845], (z)AD[855] ^ (z)AD[850]) + ((rotate((z)(AD[855]), (z)30) ^ rotate((z)(AD[855]), (z)19) ^ rotate((z)(AD[855]), (z)10)));
  AD[691] = AD[659] + AD[690];
  AD[689] = AD[688] + gb_A[40];

  AD[694] = ((rotate((z)(AD[631]), (z)25) ^ rotate((z)(AD[631]), (z)14) ^ ((AD[631]) >> 3U))) + AD[627];
  AD[692] = ((rotate((z)(AD[684]), (z)15) ^ rotate((z)(AD[684]), (z)13) ^ ((AD[684]) >> 10U))) + AD[691];
  AD[866] = AD[848] + AD[689];
  AD[863] = AD[845] + AD[862];
  AD[860] = AD[857] + AD[859];

  AD[867] = (bitselect((z)AD[853], (z)AD[858], (z)AD[863]) + AD[866]) + ((rotate((z)(AD[863]), (z)26) ^ rotate((z)(AD[863]), (z)21) ^ rotate((z)(AD[863]), (z)7)));
  AD[864] = bitselect((z)AD[855], (z)AD[850], (z)AD[860] ^ (z)AD[855]) + ((rotate((z)(AD[860]), (z)30) ^ rotate((z)(AD[860]), (z)19) ^ rotate((z)(AD[860]), (z)10)));
  AD[695] = AD[663] + AD[694];
  AD[693] = AD[692] + gb_A[41];

  AD[698] = ((rotate((z)(AD[636]), (z)25) ^ rotate((z)(AD[636]), (z)14) ^ ((AD[636]) >> 3U))) + AD[631];
  AD[696] = ((rotate((z)(AD[688]), (z)15) ^ rotate((z)(AD[688]), (z)13) ^ ((AD[688]) >> 10U))) + AD[695];
  AD[871] = AD[853] + AD[693];
  AD[868] = AD[850] + AD[867];
  AD[865] = AD[862] + AD[864];

  AD[873] = (bitselect((z)AD[858], (z)AD[863], (z)AD[868]) + AD[871]) + ((rotate((z)(AD[868]), (z)26) ^ rotate((z)(AD[868]), (z)21) ^ rotate((z)(AD[868]), (z)7)));
  AD[869] = bitselect((z)AD[860], (z)AD[855], (z)AD[865] ^ (z)AD[860]) + ((rotate((z)(AD[865]), (z)30) ^ rotate((z)(AD[865]), (z)19) ^ rotate((z)(AD[865]), (z)10)));
  AD[699] = AD[667] + AD[698];
  AD[697] = AD[696] + gb_A[42];

  AD[702] = ((rotate((z)(AD[640]), (z)25) ^ rotate((z)(AD[640]), (z)14) ^ ((AD[640]) >> 3U))) + AD[636];
  AD[700] = ((rotate((z)(AD[692]), (z)15) ^ rotate((z)(AD[692]), (z)13) ^ ((AD[692]) >> 10U))) + AD[699];
  AD[877] = AD[858] + AD[697];
  AD[874] = AD[855] + AD[873];
  AD[870] = AD[867] + AD[869];

  AD[878] = (bitselect((z)AD[863], (z)AD[868], (z)AD[874]) + AD[877]) + ((rotate((z)(AD[874]), (z)26) ^ rotate((z)(AD[874]), (z)21) ^ rotate((z)(AD[874]), (z)7)));
  AD[875] = bitselect((z)AD[865], (z)AD[860], (z)AD[870] ^ (z)AD[865]) + ((rotate((z)(AD[870]), (z)30) ^ rotate((z)(AD[870]), (z)19) ^ rotate((z)(AD[870]), (z)10)));
  AD[703] = AD[671] + AD[702];
  AD[701] = AD[700] + gb_A[43];

  AD[706] = ((rotate((z)(AD[644]), (z)25) ^ rotate((z)(AD[644]), (z)14) ^ ((AD[644]) >> 3U))) + AD[640];
  AD[704] = ((rotate((z)(AD[696]), (z)15) ^ rotate((z)(AD[696]), (z)13) ^ ((AD[696]) >> 10U))) + AD[703];
  AD[882] = AD[863] + AD[701];
  AD[879] = AD[860] + AD[878];
  AD[876] = AD[873] + AD[875];

  AD[883] = (bitselect((z)AD[868], (z)AD[874], (z)AD[879]) + AD[882]) + ((rotate((z)(AD[879]), (z)26) ^ rotate((z)(AD[879]), (z)21) ^ rotate((z)(AD[879]), (z)7)));
  AD[880] = bitselect((z)AD[870], (z)AD[865], (z)AD[876] ^ (z)AD[870]) + ((rotate((z)(AD[876]), (z)30) ^ rotate((z)(AD[876]), (z)19) ^ rotate((z)(AD[876]), (z)10)));
  AD[707] = AD[679] + AD[706];
  AD[705] = AD[704] + gb_A[44];

  AD[710] = ((rotate((z)(AD[648]), (z)25) ^ rotate((z)(AD[648]), (z)14) ^ ((AD[648]) >> 3U))) + AD[644];
  AD[708] = ((rotate((z)(AD[700]), (z)15) ^ rotate((z)(AD[700]), (z)13) ^ ((AD[700]) >> 10U))) + AD[707];
  AD[887] = AD[868] + AD[705];
  AD[884] = AD[865] + AD[883];
  AD[881] = AD[878] + AD[880];

  AD[888] = (bitselect((z)AD[874], (z)AD[879], (z)AD[884]) + AD[887]) + ((rotate((z)(AD[884]), (z)26) ^ rotate((z)(AD[884]), (z)21) ^ rotate((z)(AD[884]), (z)7)));
  AD[885] = bitselect((z)AD[876], (z)AD[870], (z)AD[881] ^ (z)AD[876]) + ((rotate((z)(AD[881]), (z)30) ^ rotate((z)(AD[881]), (z)19) ^ rotate((z)(AD[881]), (z)10)));
  AD[711] = AD[684] + AD[710];
  AD[709] = AD[708] + gb_A[45];

  AD[714] = ((rotate((z)(AD[651]), (z)25) ^ rotate((z)(AD[651]), (z)14) ^ ((AD[651]) >> 3U))) + AD[648];
  AD[712] = ((rotate((z)(AD[704]), (z)15) ^ rotate((z)(AD[704]), (z)13) ^ ((AD[704]) >> 10U))) + AD[711];
  AD[892] = AD[874] + AD[709];
  AD[889] = AD[870] + AD[888];
  AD[886] = AD[883] + AD[885];

  AD[893] = (bitselect((z)AD[879], (z)AD[884], (z)AD[889]) + AD[892]) + ((rotate((z)(AD[889]), (z)26) ^ rotate((z)(AD[889]), (z)21) ^ rotate((z)(AD[889]), (z)7)));
  AD[890] = bitselect((z)AD[881], (z)AD[876], (z)AD[886] ^ (z)AD[881]) + ((rotate((z)(AD[886]), (z)30) ^ rotate((z)(AD[886]), (z)19) ^ rotate((z)(AD[886]), (z)10)));
  AD[715] = AD[688] + AD[714];
  AD[713] = AD[712] + gb_A[46];

  AD[718] = ((rotate((z)(AD[655]), (z)25) ^ rotate((z)(AD[655]), (z)14) ^ ((AD[655]) >> 3U))) + AD[651];
  AD[716] = ((rotate((z)(AD[708]), (z)15) ^ rotate((z)(AD[708]), (z)13) ^ ((AD[708]) >> 10U))) + AD[715];
  AD[897] = AD[879] + AD[713];
  AD[894] = AD[876] + AD[893];
  AD[891] = AD[888] + AD[890];

  AD[898] = (bitselect((z)AD[884], (z)AD[889], (z)AD[894]) + AD[897]) + ((rotate((z)(AD[894]), (z)26) ^ rotate((z)(AD[894]), (z)21) ^ rotate((z)(AD[894]), (z)7)));
  AD[895] = bitselect((z)AD[886], (z)AD[881], (z)AD[891] ^ (z)AD[886]) + ((rotate((z)(AD[891]), (z)30) ^ rotate((z)(AD[891]), (z)19) ^ rotate((z)(AD[891]), (z)10)));
  AD[719] = AD[692] + AD[718];
  AD[717] = AD[716] + gb_A[47];

  AD[722] = ((rotate((z)(AD[659]), (z)25) ^ rotate((z)(AD[659]), (z)14) ^ ((AD[659]) >> 3U))) + AD[655];
  AD[720] = ((rotate((z)(AD[712]), (z)15) ^ rotate((z)(AD[712]), (z)13) ^ ((AD[712]) >> 10U))) + AD[719];
  AD[902] = AD[884] + AD[717];
  AD[899] = AD[881] + AD[898];
  AD[896] = AD[893] + AD[895];

  AD[903] = (bitselect((z)AD[889], (z)AD[894], (z)AD[899]) + AD[902]) + ((rotate((z)(AD[899]), (z)26) ^ rotate((z)(AD[899]), (z)21) ^ rotate((z)(AD[899]), (z)7)));
  AD[900] = bitselect((z)AD[891], (z)AD[886], (z)AD[896] ^ (z)AD[891]) + ((rotate((z)(AD[896]), (z)30) ^ rotate((z)(AD[896]), (z)19) ^ rotate((z)(AD[896]), (z)10)));
  AD[723] = AD[696] + AD[722];
  AD[721] = AD[720] + gb_A[48];

  AD[672] = ((rotate((z)(AD[663]), (z)25) ^ rotate((z)(AD[663]), (z)14) ^ ((AD[663]) >> 3U))) + AD[659];
  AD[724] = ((rotate((z)(AD[716]), (z)15) ^ rotate((z)(AD[716]), (z)13) ^ ((AD[716]) >> 10U))) + AD[723];
  AD[907] = AD[889] + AD[721];
  AD[904] = AD[886] + AD[903];
  AD[901] = AD[898] + AD[900];

  AD[908] = (bitselect((z)AD[894], (z)AD[899], (z)AD[904]) + AD[907]) + ((rotate((z)(AD[904]), (z)26) ^ rotate((z)(AD[904]), (z)21) ^ rotate((z)(AD[904]), (z)7)));
  AD[905] = bitselect((z)AD[896], (z)AD[891], (z)AD[901] ^ (z)AD[896]) + ((rotate((z)(AD[901]), (z)30) ^ rotate((z)(AD[901]), (z)19) ^ rotate((z)(AD[901]), (z)10)));
  AD[673] = ((rotate((z)(AD[667]), (z)25) ^ rotate((z)(AD[667]), (z)14) ^ ((AD[667]) >> 3U))) + AD[663];
  AD[726] = AD[700] + AD[672];
  AD[725] = AD[724] + gb_A[49];

  AD[727] = ((rotate((z)(AD[720]), (z)15) ^ rotate((z)(AD[720]), (z)13) ^ ((AD[720]) >> 10U))) + AD[726];
  AD[912] = AD[894] + AD[725];
  AD[909] = AD[891] + AD[908];
  AD[906] = AD[903] + AD[905];
  AD[675] = AD[667] + gb_A[52];
  AD[729] = AD[704] + AD[673];

  AD[913] = (bitselect((z)AD[899], (z)AD[904], (z)AD[909]) + AD[912]) + ((rotate((z)(AD[909]), (z)26) ^ rotate((z)(AD[909]), (z)21) ^ rotate((z)(AD[909]), (z)7)));
  AD[910] = bitselect((z)AD[901], (z)AD[896], (z)AD[906] ^ (z)AD[901]) + ((rotate((z)(AD[906]), (z)30) ^ rotate((z)(AD[906]), (z)19) ^ rotate((z)(AD[906]), (z)10)));
  AD[674] = ((rotate((z)(AD[671]), (z)25) ^ rotate((z)(AD[671]), (z)14) ^ ((AD[671]) >> 3U))) + AD[675];
  AD[730] = ((rotate((z)(AD[724]), (z)15) ^ rotate((z)(AD[724]), (z)13) ^ ((AD[724]) >> 10U))) + AD[729];
  AD[728] = AD[727] + gb_A[50];

  AD[681] = ((rotate((z)(AD[679]), (z)25) ^ rotate((z)(AD[679]), (z)14) ^ ((AD[679]) >> 3U))) + AD[671];
  AD[917] = AD[899] + AD[901] + AD[728];
  AD[914] = AD[896] + AD[913];
  AD[911] = AD[908] + AD[910];
  AD[732] = AD[708] + AD[674];
  AD[731] = AD[730] + gb_A[51];

  AD[918] = (bitselect((z)AD[904], (z)AD[909], (z)AD[914]) + AD[917]) + ((rotate((z)(AD[914]), (z)26) ^ rotate((z)(AD[914]), (z)21) ^ rotate((z)(AD[914]), (z)7)));
  AD[915] = bitselect((z)AD[906], (z)AD[901], (z)AD[911] ^ (z)AD[906]) + ((rotate((z)(AD[911]), (z)30) ^ rotate((z)(AD[911]), (z)19) ^ rotate((z)(AD[911]), (z)10)));
  AD[733] = ((rotate((z)(AD[727]), (z)15) ^ rotate((z)(AD[727]), (z)13) ^ ((AD[727]) >> 10U))) + AD[732];
  AD[919] = AD[906] + AD[904] + AD[731];
  AD[734] = AD[712] + AD[681];

  AD[920] = (bitselect((z)AD[909], (z)AD[914], (z)AD[918]) + AD[919]) + ((rotate((z)(AD[918]), (z)26) ^ rotate((z)(AD[918]), (z)21) ^ rotate((z)(AD[918]), (z)7)));
  AD[735] = ((rotate((z)(AD[730]), (z)15) ^ rotate((z)(AD[730]), (z)13) ^ ((AD[730]) >> 10U))) + AD[734];
  AD[921] = AD[911] + AD[909] + AD[733];
  AD[916] = AD[913] + AD[915];

  AD[922] = (bitselect((z)AD[914], (z)AD[918], (z)AD[920]) + AD[921]) + ((rotate((z)(AD[920]), (z)26) ^ rotate((z)(AD[920]), (z)21) ^ rotate((z)(AD[920]), (z)7)));
  AD[923] = AD[916] + AD[914] + AD[735];

  AD[924] = (bitselect((z)AD[918], (z)AD[920], (z)AD[922]) + AD[923]) + ((rotate((z)(AD[922]), (z)26) ^ rotate((z)(AD[922]), (z)21) ^ rotate((z)(AD[922]), (z)7)));
  if (AD[924] == gb_A[79])
    AC[AC[(0x0F)]++] = AE;
}