__kernel void A(__global const float* a, __global float* b) {
  (b[(((1) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((1) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((2) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((1) - 1) * (8)) + (get_global_id(0))]);
  (b[(((3) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((3) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((1) - 1) * (8)) + (get_global_id(0))]);
  (b[(((4) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((4) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((6) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((6) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((1) - 1) * (8)) + (get_global_id(0))]);
  (b[(((7) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((7) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((6) - 1) * (8)) + (get_global_id(0))]);
  (b[(((8) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((8) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((12) - 1) * (8)) + (get_global_id(0))]);
  (b[(((13) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((13) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((14) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((14) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((6) - 1) * (8)) + (get_global_id(0))]);
  (b[(((15) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((22) - 1) * (8)) + (get_global_id(0))]);
  (b[(((16) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((16) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((17) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((17) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((18) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((18) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((19) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((19) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((20) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((20) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((21) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((22) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((22) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((23) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((23) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((24) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((24) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((8) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((25) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((25) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((8) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((26) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((26) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((8) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((27) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((27) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((8) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((28) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((28) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((8) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((30) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((30) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((11) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((31) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((31) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((11) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((1) - 1) * (8)) + (get_global_id(0))]);
  (b[(((32) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((32) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((11) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((33) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((33) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((11) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((34) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((34) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((35) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((35) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((36) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((36) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((1) - 1) * (8)) + (get_global_id(0))]);
  (b[(((37) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((37) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((6) - 1) * (8)) + (get_global_id(0))]);
  (b[(((38) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((38) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((39) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((39) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((11) - 1) * (8)) + (get_global_id(0))]);
  (b[(((40) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((40) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((12) - 1) * (8)) + (get_global_id(0))]);
  (b[(((41) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((41) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((42) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((42) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((43) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((43) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((44) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((44) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((45) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((45) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((47) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((47) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((48) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((48) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((49) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((49) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((1) - 1) * (8)) + (get_global_id(0))]);
  (b[(((50) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((50) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((51) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((51) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((52) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((52) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((53) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((53) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((54) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((54) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((55) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((55) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((56) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((56) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((11) - 1) * (8)) + (get_global_id(0))]);
  (b[(((59) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((59) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((22) - 1) * (8)) + (get_global_id(0))]);
  (b[(((60) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((60) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((61) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((61) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((62) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((62) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((63) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((63) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((64) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((64) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((1) - 1) * (8)) + (get_global_id(0))]);
  (b[(((65) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((65) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((66) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((66) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((67) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((67) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((6) - 1) * (8)) + (get_global_id(0))]);
  (b[(((68) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((68) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((11) - 1) * (8)) + (get_global_id(0))]);
  (b[(((69) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((69) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((12) - 1) * (8)) + (get_global_id(0))]);
  (b[(((70) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((70) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((12) - 1) * (8)) + (get_global_id(0))]);
  (b[(((71) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((71) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((13) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((72) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((72) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((13) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((73) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((73) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((13) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((74) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((74) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((13) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((75) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((75) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((13) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((76) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((76) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((13) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((77) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((77) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((13) - 1) * (8)) + (get_global_id(0))]);
  (b[(((78) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((78) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((79) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((79) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((80) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((80) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((81) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((81) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((82) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((82) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((83) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((83) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((84) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((84) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((85) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((85) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((86) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((86) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((8) - 1) * (8)) + (get_global_id(0))]);
  (b[(((87) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((87) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((88) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((88) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((89) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((89) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((90) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((90) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((13) - 1) * (8)) + (get_global_id(0))]);
  (b[(((91) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((91) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((92) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((92) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((93) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((93) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((94) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((94) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((95) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((95) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((17) - 1) * (8)) + (get_global_id(0))]);
  (b[(((96) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((96) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((97) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((97) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((98) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((98) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((99) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((99) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((100) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((100) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((101) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((101) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((102) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((102) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((10) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((103) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((103) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((10) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((104) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((104) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((10) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((105) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((105) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((10) - 1) * (8)) + (get_global_id(0))]);
  (b[(((106) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((106) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((10) - 1) * (8)) + (get_global_id(0))]);
  (b[(((107) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((107) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((10) - 1) * (8)) + (get_global_id(0))]);
  (b[(((108) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((108) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((17) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((109) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((109) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((17) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((110) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((110) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((17) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((111) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((111) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((17) - 1) * (8)) + (get_global_id(0))]);
  (b[(((112) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((112) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((17) - 1) * (8)) + (get_global_id(0))]);
  (b[(((113) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((113) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((17) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((17) - 1) * (8)) + (get_global_id(0))]);
  (b[(((114) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((114) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((14) - 1) * (8)) + (get_global_id(0))]);
  (b[(((116) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((116) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((14) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((117) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((117) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((14) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((118) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((118) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((14) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((119) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((119) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((14) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((120) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((120) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((14) - 1) * (8)) + (get_global_id(0))]);
  (b[(((122) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((122) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((123) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((123) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((124) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((124) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((125) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((125) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((126) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((126) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((18) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((127) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((127) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((18) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((128) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((128) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((18) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((129) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((129) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((18) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((130) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((130) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((18) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((131) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((131) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((18) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((132) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((132) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((133) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((133) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((134) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((134) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((135) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((135) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((136) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((136) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((137) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((137) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((138) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((138) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((139) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((139) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((140) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((140) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((141) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((141) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((142) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((142) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((8) - 1) * (8)) + (get_global_id(0))]);
  (b[(((144) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((144) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((145) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((145) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((146) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((146) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((148) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((148) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((149) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((149) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((150) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((150) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((151) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((151) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((152) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((152) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((153) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((153) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((154) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((154) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((155) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((155) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]);
  (b[(((156) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((156) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((157) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((157) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((158) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((158) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((159) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((159) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((160) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((160) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((161) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((161) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((162) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((162) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((163) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((163) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((164) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((164) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]);
  (b[(((165) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((165) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]);
  (b[(((166) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((166) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]);
  (b[(((167) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((167) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]);
  (b[(((168) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((168) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((169) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((169) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((15) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((170) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((170) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((171) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((171) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((172) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((172) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((173) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((173) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((174) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((174) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((175) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((175) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((176) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((176) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((177) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((177) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((178) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((178) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((8) - 1) * (8)) + (get_global_id(0))]);
  (b[(((180) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((180) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((16) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((181) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((181) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((16) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((182) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((182) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((16) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((183) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((183) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((16) - 1) * (8)) + (get_global_id(0))]);
  (b[(((184) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((184) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((16) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((185) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((185) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((20) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((186) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((186) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((20) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((187) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((187) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((20) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((188) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((188) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((20) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((189) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((189) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((20) - 1) * (8)) + (get_global_id(0))]);
  (b[(((190) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((190) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((191) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((191) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((192) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((192) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((193) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((193) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((194) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((194) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((195) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((195) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((196) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((196) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((197) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((197) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((198) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((198) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((21) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
  (b[(((199) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((199) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((200) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((200) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((2) - 1) * (8)) + (get_global_id(0))]);
  (b[(((201) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((201) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((3) - 1) * (8)) + (get_global_id(0))]);
  (b[(((202) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((202) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((5) - 1) * (8)) + (get_global_id(0))]);
  (b[(((203) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((203) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((4) - 1) * (8)) + (get_global_id(0))]);
  (b[(((204) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((204) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((7) - 1) * (8)) + (get_global_id(0))]);
  (b[(((205) - 1) * (8)) + (get_global_id(0))]) =
      (b[(((205) - 1) * (8)) + (get_global_id(0))]) *
      (a[(((9) - 1) * (8)) + (get_global_id(0))]);
}