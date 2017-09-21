// 2d primitive for outside fillets.
module fil_2d_o(r, angle=90) {
  intersection() {
    circle(r=r);
    polygon([
      [0, 0],
      [0, r],
      [r * tan(angle/2), r],
      [r * sin(angle), r * cos(angle)]
    ]);
  }
}

// 2d primitive for inside fillets.
module fil_2d_i(r, angle=90) {
  difference() {
    polygon([
      [0, 0],
      [0, -r],
      [-r * tan(angle/2), -r],
      [-r * sin(angle), -r * cos(angle)]
    ]);
    circle(r=r);
  }
}

// 3d polar outside fillet.
module fil_polar_o(R, r, angle=90) {
  rotate_extrude(convexity=10) {
    translate([R, 0, 0]) {
      fil_2d_o(r, angle);
    }
  }
}

// 3d polar inside fillet.
module fil_polar_i(R, r, angle=90) {
  rotate_extrude(convexity=10) {
    translate([R, 0, 0]) {
      fil_2d_i(r, angle);
    }
  }
}

// 3d linear outside fillet.
module fil_linear_o(l, r, angle=90) {
  rotate([0, -90, 180]) {
    linear_extrude(height=l, center=false) {
      fil_2d_o(r, angle);
    }
  }
}

// 3d linear inside fillet.
module fil_linear_o(l, r, angle=90) {
  rotate([0, -90, 180]) {
    linear_extrude(height=l, center=false) {
      fil_2d_i(r, angle);
    }
  }
}