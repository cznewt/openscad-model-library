 
include <../../lib/joint/joint_corner_rect.scad>;

olive=[0.7,0.7,0.7];

module rod(rod_diameter,rod_length) {
  cube([rod_diameter,rod_length,rod_diameter]);
}

module stone(stone_width,stone_depth,stone_height) {
  difference() {    
    cube([stone_width,stone_depth,stone_height]);
    translate([40,40,stone_height-20])
      cube([stone_width-80,stone_depth-80,20+2]);
    translate([15,15,-2])
      cube([stone_width-30,stone_depth-30,6]);
  }
}

module heater(heater_width,heater_depth,heater_height) {
    cube([heater_width,heater_depth,heater_height]);

//  hull() {
//    translate([60,60,0])
//      cylinder(h=stone_height/2+1, r1=30, r2=30);
//    translate([60,stone_depth-60,0])
//      cylinder(h=stone_height/2+1, r1=30, r2=30);
//    translate([stone_width-60,60,stone_height/2])
//      cylinder(h=stone_height/2+1, r1=30, r2=30);
//    translate([stone_width-60,stone_depth-60,stone_height/2])
//      cylinder(h=stone_height/2+1, r1=30, r2=30);
//  }
}

// stone

color([0.8,0.2,0.2]) translate([-40,-40,738+200]) rotate([0,0,0])
  stone(400,600,50);

// heaters

color([0.2,0.2,0.8]) translate([20+99,20,738+80]) rotate([0,0,90])
  heater(131,99,1.5);

color([0.2,0.2,0.8]) translate([320-20,20,738+80]) rotate([0,0,90])
  heater(131,99,1.5);

color([0.2,0.2,0.8]) translate([320-20,520-20-131,738+80]) rotate([0,0,90])
  heater(131,99,1.5);

color([0.2,0.2,0.8]) translate([20+99,520-20-131,738+80]) rotate([0,0,90])
  heater(131,99,1.5);

color([0.2,0.2,0.8]) translate([320-20,350-20-131,738+80]) rotate([0,0,90])
  heater(131,99,1.5);

color([0.2,0.2,0.8]) translate([20+99,350-20-131,738+80]) rotate([0,0,90])
  heater(131,99,1.5);




// rods

color(olive) translate([-20,20,0]) rotate([90,0,0])
  rod(40,720-20);

color(olive) translate([-20,520+20,0]) rotate([90,0,0])
  rod(40,720-20);

color(olive) translate([320-20,20,0]) rotate([90,0,0])
  rod(40,720-20);

color(olive) translate([320-20,520+20,0]) rotate([90,0,0])
  rod(40,720-20);


color(olive) translate([-20,20,720-20]) rotate([0,0,0])
  rod(40,520-46);

color(olive) translate([320-20,20,720-20]) rotate([0,0,0])
  rod(40,520-46);

color(olive) translate([320-20,-20,720-20]) rotate([0,0,90])
  rod(40,320-46);

color(olive) translate([320-20,520-20,720-20]) rotate([0,0,90])
  rod(40,320-26);


color(olive) translate([-20,20,250-20]) rotate([0,0,0])
  rod(40,520-46);

color(olive) translate([320-20,20,250-20]) rotate([0,0,0])
  rod(40,520-46);

color(olive) translate([320-20,-20,250-20]) rotate([0,0,90])
  rod(40,320-46);

color(olive) translate([320-20,520-20,250-20]) rotate([0,0,90])
  rod(40,320-26);


color([0,1,0]) translate([0,0,720]) rotate([270,0,0])
  connector_top_bot_corner(40,80,2,0.1);

color([0,1,0]) translate([0,520,720]) rotate([0,90,270])
  connector_top_bot_corner(40,80,2,0.1);

color([0,1,0]) translate([320,0,720]) rotate([270,0,90])
  connector_top_bot_corner(40,80,2,0.1);

color([0,1,0]) translate([320,520,720]) rotate([0,90,180])
  connector_top_bot_corner(40,80,2,0.1);


            


color([0,1,0]) translate([0,0,250]) rotate([270,0,0])
  connector_top_bot_corner(40,80,2,0.1);

color([0,1,0]) translate([0,520,250]) rotate([0,90,270])
  connector_top_bot_corner(40,80,2,0.1);

color([0,1,0]) translate([320,0,250]) rotate([270,0,90])
  connector_top_bot_corner(40,80,2,0.1);

color([0,1,0]) translate([320,520,250]) rotate([0,90,180])
  connector_top_bot_corner(40,80,2,0.1);
