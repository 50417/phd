__kernel void A(__global const float* a, __global const float* b,
                __global float* c, const float d, __global const float* e) {
  float f = ((a[(((12) - 1) * (8)) + (get_global_id(0))]) -
             (b[(((12) - 1) * (8)) + (get_global_id(0))])) +
            ((a[(((13) - 1) * (8)) + (get_global_id(0))]) -
             (b[(((13) - 1) * (8)) + (get_global_id(0))])) +
            ((a[(((14) - 1) * (8)) + (get_global_id(0))]) -
             (b[(((14) - 1) * (8)) + (get_global_id(0))])) +
            ((a[(((15) - 1) * (8)) + (get_global_id(0))]) -
             (b[(((15) - 1) * (8)) + (get_global_id(0))]));
  float g = ((a[(((22) - 1) * (8)) + (get_global_id(0))]) -
             (b[(((22) - 1) * (8)) + (get_global_id(0))])) +
            ((a[(((23) - 1) * (8)) + (get_global_id(0))]) -
             (b[(((23) - 1) * (8)) + (get_global_id(0))]));
  float h = ((a[(((27) - 1) * (8)) + (get_global_id(0))]) -
             (b[(((27) - 1) * (8)) + (get_global_id(0))])) +
            ((a[(((28) - 1) * (8)) + (get_global_id(0))]) -
             (b[(((28) - 1) * (8)) + (get_global_id(0))]));

  (c[(((7) - 1) * (8)) + (get_global_id(0))]) =
      (+f - ((a[(((17) - 1) * (8)) + (get_global_id(0))]) -
             (b[(((17) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((18) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((18) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((19) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((19) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((20) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((20) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((21) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((21) - 1) * (8)) + (get_global_id(0))])) -
       g - g + ((a[(((24) - 1) * (8)) + (get_global_id(0))]) -
                (b[(((24) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((26) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((26) - 1) * (8)) + (get_global_id(0))])) +
       h - ((a[(((33) - 1) * (8)) + (get_global_id(0))]) -
            (b[(((33) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((47) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((47) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((55) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((55) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((75) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((75) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((76) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((76) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((84) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((84) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((85) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((85) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((86) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((86) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((101) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((101) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((138) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((138) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((141) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((141) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((142) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((142) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((153) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((153) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((162) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((162) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((163) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((163) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((174) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((174) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((175) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((175) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((176) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((176) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((177) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((177) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((178) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((178) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((187) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((187) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((188) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((188) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((197) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((197) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((203) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((203) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((204) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((204) - 1) * (8)) + (get_global_id(0))]))) *
      d * e[6];
  (c[(((8) - 1) * (8)) + (get_global_id(0))]) =
      (+((a[(((16) - 1) * (8)) + (get_global_id(0))]) -
         (b[(((16) - 1) * (8)) + (get_global_id(0))])) +
       g - ((a[(((24) - 1) * (8)) + (get_global_id(0))]) -
            (b[(((24) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((25) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((25) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((26) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((26) - 1) * (8)) + (get_global_id(0))])) -
       h + ((a[(((76) - 1) * (8)) + (get_global_id(0))]) -
            (b[(((76) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((86) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((86) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((142) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((142) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((176) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((176) - 1) * (8)) + (get_global_id(0))])) -
       ((a[(((178) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((178) - 1) * (8)) + (get_global_id(0))])) +
       ((a[(((197) - 1) * (8)) + (get_global_id(0))]) -
        (b[(((197) - 1) * (8)) + (get_global_id(0))]))) *
      d * e[7];
}