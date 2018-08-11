
include <./material.scad>;

module plate(height=50, width=50, depth=10) {
  plastic() {
    cube([height, width, depth], true);
  }
}
