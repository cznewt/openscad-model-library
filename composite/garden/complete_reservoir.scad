
include <../../lib/water/level_meter.scad>;
include <../../lib/water/reservoir.scad>;
include <../../lib/water/flower_pot.scad>;

sides = 100;

// distance meter
translate([0,0, 5])
  distance_meter_bottom(46,2,8);
translate([0,0, 300]) rotate([180,0,0])
    distance_meter_top(46,2,8);
color([0,1,0])
    translate([0,0,15.1])
       pipe(46,2,265.8);
// water pot
reservoir(300, 450, 580, 5);
//reservoir(300, 400, 600, 5);
// flower pots
translate([140, 190, 200])
    flower_pot(120, 70, 50, 2);
translate([140, -190, 200])
    flower_pot(120, 70, 50, 2);
translate([-140, 190, 200])
    flower_pot(120, 70, 50, 2);
translate([-140, -190, 200])
    flower_pot(120, 70, 50, 2);
