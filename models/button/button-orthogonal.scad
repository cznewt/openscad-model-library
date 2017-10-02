
module button_P_H8550VB01(depth) {
  height = 13;
  width = 19.2;
  button_orthogonal(width, height, depth);
}

module button_orthogonal(width, height, depth) {
  cube([width, height, depth]);
}

// button_P_H8550VB01(3);
