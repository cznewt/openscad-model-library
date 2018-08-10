
include <../../lib/water/bottle_cap.scad>;
include <../../lib/water/tube_connector.scad>;

sides = 100;

difference() {
  union() {
    bottle_cap();
    translate([0,0,-3])
      tube_connector(4, 1, 3, 0, 2);
    translate([0,0,-6]) rotate([0,180,0])
      tube_connector(4, 1, 3, 0, 5);
  }
  cylinder(h=200, r1=1, r2=1, center=true, $fn=80);
  translate([0,0,9.01])
    cylinder(h=10, r1=40, r2=40, $fn=40);
}