
sides = 100;

//connector_mid_connect(20.1,50,2.5,0.1);

//connector_mid_back_corner(20.1,50,2.5,0.1);

//connector_top_bot_corner(20.1,50,2.5,0.1);

module connector_mid_connect(hole_diameter,hull_length,hull_thickness,clear)
{
  hull_diameter = hole_diameter+2*hull_thickness;
  hull_offset = hull_length/2+hull_diameter/2;
  hole_clear = [0,0,0,0,0,0];

//  connector_corner_hollow_brick(hole_diameter,hull_thickness,hole_clear,clear);
translate([hole_diameter/2+hull_thickness,-hole_diameter/2-hull_thickness,hole_diameter/2])
  cube([hole_diameter+hull_thickness*2,hole_diameter+hull_thickness*2,hull_thickness+clear]);


translate([-hole_diameter/2-hull_thickness,-hole_diameter/2-hull_thickness,-hole_diameter/2-hull_thickness-clear/2])
  cube([hole_diameter+hull_thickness*2,hole_diameter+hull_thickness*2,hull_thickness+clear]);

translate([-hole_diameter/2,-hole_diameter/2-hull_thickness,-hole_diameter/2-hull_thickness-clear/2])
  rotate([0,-90,0])
  cube([hole_diameter+hull_thickness*2,hole_diameter+hull_thickness*2,hull_thickness+clear]);


  translate([0,hull_offset,0])
    connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([0,-hull_offset,0])
    connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([hull_offset-hull_thickness,0,0])
    rotate([0,0,90])
      connector_corner_square(hole_diameter,hull_thickness,hull_length,[1,1,1,1],clear);
  translate([hull_diameter/2,hull_diameter/2,-hull_diameter/2+hull_thickness/2])    
    connector_corner_holder(hull_thickness,hull_length*4/5);
  translate([hull_diameter/2,-hull_diameter/2,-hull_diameter/2+hull_thickness/2])
    rotate([0,0,270])
      connector_corner_holder(hull_thickness,hull_length*4/5);
}


module connector_mid_front_corner(hole_diameter,hull_length,hull_thickness,clear)
{
  hull_diameter = hole_diameter+2*hull_thickness;
  hull_offset = hull_length/2+hull_diameter/2;
  screw_hole_diameter = [0,0,5,12,0,0];

  connector_corner_brick(hole_diameter,hull_thickness,screw_hole_diameter,clear);
  translate([0,hull_offset,0])
    connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([0,-hull_offset,0])
    connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([hull_offset,0,0])
    rotate([0,0,90])
      connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([hull_diameter/2,hull_diameter/2,-hull_diameter/2+hull_thickness/2])    
    connector_corner_holder(hull_thickness,hull_length*4/5);
  translate([hull_diameter/2,-hull_diameter/2,-hull_diameter/2+hull_thickness/2])
    rotate([0,0,270])
      connector_corner_holder(hull_thickness,hull_length*4/5);
}

module connector_mid_back_corner(hole_diameter,hull_length,hull_thickness,clear)
{
  hull_diameter = hole_diameter+2*hull_thickness;
  hull_offset = hull_length/2+hull_diameter/2;
  screw_hole_diameter = [0,0,5,12,0,0];

  connector_corner_brick(hole_diameter,hull_thickness,screw_hole_diameter,clear);
  translate([0,hull_offset,0])
    connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([0,-hull_offset,0])
    connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([hull_offset,0,0])
    rotate([0,0,90])
      connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([0,0,hull_offset])
    rotate([90,0,0])
      connector_corner_square(hole_diameter,hull_thickness,hull_length,[1,1,1,1],clear);
  translate([hull_diameter/2,hull_diameter/2,-hull_diameter/2+hull_thickness/2])    
    connector_corner_holder(hull_thickness,hull_length*4/5);
//  translate([hull_diameter/2,-hull_diameter/2+hull_thickness/2,hull_diameter/2])    
//    rotate([90,0,0])
//      connector_corner_holder(hull_thickness,hull_length);
  translate([-hull_diameter/2+hull_thickness/2,-hull_diameter/2,hull_diameter/2])    
    rotate([0,270,180])
      connector_corner_holder(hull_thickness,hull_length*4/5);
  translate([-hull_diameter/2+hull_thickness/2,hull_diameter/2,hull_diameter/2])    
    rotate([0,270,0])
      connector_corner_holder(hull_thickness,hull_length*4/5);
  translate([hull_diameter/2,-hull_diameter/2,-hull_diameter/2+hull_thickness/2])
    rotate([0,0,270])
      connector_corner_holder(hull_thickness,hull_length*4/5);
}


module connector_top_bot_corner(hole_diameter,hull_length,hull_thickness,clear)
{
  hull_diameter = hole_diameter+2*hull_thickness;
  hull_offset = hull_length/2+hull_diameter/2;

  screw_hole_diameter = [0,0,5,12,12,5];

  connector_corner_brick(hole_diameter,hull_thickness,screw_hole_diameter,clear);
  translate([0,hull_offset,0])
    connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([hull_offset,0,0])
    rotate([0,0,90])
      connector_corner_square(hole_diameter,hull_thickness,hull_length,[0,1,1,1],clear);
  translate([0,0,hull_offset])
    rotate([90,0,0])
      connector_corner_square(hole_diameter,hull_thickness,hull_length,[1,1,1,1],clear);
  translate([hull_diameter/2,hull_diameter/2,-hull_diameter/2+hull_thickness/2])    
    connector_corner_holder(hull_thickness,hull_length*4/5);
  translate([hull_diameter/2,-hull_diameter/2+hull_thickness/2,hull_diameter/2])    
    rotate([90,0,0])
      connector_corner_holder(hull_thickness,hull_length*4/5);
  translate([-hull_diameter/2+hull_thickness/2,hull_diameter/2,hull_diameter/2])    
    rotate([0,270,0])
      connector_corner_holder(hull_thickness,hull_length*4/5);
}

module connector_corner_brick(hole_diameter,hull_thickness,screw_hole_diameter,clear)
{
    hull_diameter = hole_diameter+2*hull_thickness;
    difference() {
      translate([-hull_diameter/2,-hull_diameter/2,-hull_diameter/2])
        cube([hull_diameter,hull_diameter,hull_diameter]);
      translate([-hole_diameter/2,-hole_diameter/2,-hole_diameter/2])
        cube([hole_diameter,hole_diameter,hole_diameter]);

      translate([0,0,-hole_diameter/2-hull_thickness-clear/2])
        cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[0], $fn=sides);
      translate([0,0,hole_diameter/2-clear/2])
        cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[1], $fn=sides);
      translate([hole_diameter/2-clear/2,0,0])
        rotate([0,90,0])
          cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[2], $fn=sides);
      translate([-hole_diameter/2-hull_thickness-clear/2,0,0])
        rotate([0,90,0])
          cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[3], $fn=sides);
      translate([0,-hole_diameter/2+clear/2,0])
        rotate([90,0,0])
          cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[4], $fn=sides);
      translate([0,hole_diameter/2+hull_thickness+clear/2,0])
        rotate([90,0,0])
          cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[5], $fn=sides);
    }

}


module connector_corner_hollow_brick(hole_diameter,hull_thickness,hull_clear,clear)
{
    hull_diameter = hole_diameter+2*hull_thickness;
    difference() {
      translate([-hull_diameter/2,-hull_diameter/2,-hull_diameter/2])
        cube([hull_diameter,hull_diameter,hull_diameter]);
      translate([-hole_diameter/2,-hole_diameter/2,-hole_diameter/2])
        translate([-hole_diameter,-hole_diameter,0])
        cube([hole_diameter*2,hole_diameter*2,hull_thickness]);

      if(hull_clear[0] == 0) {
      translate([0,0,-hole_diameter/2-hull_thickness-clear/2])
        translate([-hole_diameter,-hole_diameter,0])
        cube([hole_diameter*2,hole_diameter*2,hull_thickness]);
      }
      if(hull_clear[1] == 0) {
      translate([0,0,hole_diameter/2-clear/2])
        translate([-hole_diameter,-hole_diameter,0])
        cube([hole_diameter*2,hole_diameter*2,hull_thickness]);
      }
      if(hull_clear[2] == 0) {
      translate([hole_diameter/2-clear/2,0,0])
        rotate([0,90,0])
          cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[2], $fn=sides);
      }
      if(hull_clear[3] == 0) {
      translate([-hole_diameter/2-hull_thickness-clear/2,0,0])
        rotate([0,90,0])
          cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[3], $fn=sides);
      }
      if(hull_clear[4] == 0) {
      translate([0,-hole_diameter/2+clear/2,0])
        rotate([90,0,0])
          cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[4], $fn=sides);
      }
      if(hull_clear[5] == 0) {
      translate([0,hole_diameter/2+hull_thickness+clear/2,0])
        rotate([90,0,0])
          cylinder(h=hull_thickness+0.1, d=screw_hole_diameter[5], $fn=sides);
      }
    }

}

module connector_corner_square(hole_diameter,hull_thickness,hull_length,hull_clear,clear)
{

    hull_diameter = hole_diameter+2*hull_thickness;
    hole_length = hull_length+1;


    difference() {
      translate([-hull_diameter/2,-hull_length/2,-hull_diameter/2])
        cube([hull_diameter,hull_length,hull_diameter]);
      translate([-hole_diameter/2,-hole_length/2,-hole_diameter/2])
        cube([hole_diameter,hole_length,hole_diameter]);
      translate([0,0,-hole_diameter/2-hull_thickness-clear/2])
        cylinder(h=hull_thickness+0.1, d=5, $fn=sides);
      translate([0,0,hole_diameter/2-clear/2])
        cylinder(h=hull_thickness+0.1, d=5, $fn=sides);
      translate([hole_diameter/2-clear/2,0,0])
        rotate([0,90,0])
          cylinder(h=hull_thickness+0.1, d=5, $fn=sides);
      translate([-hole_diameter/2-hull_thickness-clear/2,0,0])
        rotate([0,90,0])
          cylinder(h=hull_thickness+0.1, d=5, $fn=sides);

      if(hull_clear[0] == 0) {
        translate([-hole_diameter/2,-hole_length/2,hole_diameter/2-clear/2])
          cube([hole_diameter,hole_length,hull_thickness+clear]);
      }

      if(hull_clear[1] == 0) {
        translate([-hole_diameter/2,-hole_length/2,-hole_diameter/2-hull_thickness-clear/2])
          cube([hole_diameter,hole_length,hull_thickness+clear]);
      }
      if(hull_clear[2] == 0) {
        translate([-hole_diameter/2-hull_thickness-clear/2,-hole_length/2,hole_diameter/2])
          rotate([0,90,0])
            cube([hole_diameter,hole_length,hull_thickness+clear]);
      }
      if(hull_clear[3] == 0) {
        translate([+hole_diameter/2-clear/2,-hole_length/2,hole_diameter/2])
          rotate([0,90,0])
            cube([hole_diameter,hole_length,hull_thickness+clear]);
      }
    }

}

module connector_corner_holder(hull_thickness,hull_length,clear)
{
    translate([0,0,-hull_thickness/2])
      difference() {
        linear_extrude(height=hull_thickness)
        {
          polygon(points=[[0,0],[hull_length,0],[0,hull_length]], paths=[[0,1,2]]);
        }
        translate([hull_length/3.14,hull_length/3.14,-0.5])
          cylinder(h=hull_thickness+1, d=5, $fn=sides);

    }
}
