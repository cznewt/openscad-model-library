
include <../../lib/water/level_meter.scad>;

sides = 100;

translate([0,0, 5])
  distance_meter_bottom(46,2,8);
translate([0,0, 300]) rotate([180,0,0])
    distance_meter_top(46,2,8);
color([0,1,0])
    translate([0,0,15.1])
       pipe(46,2,265.8);
