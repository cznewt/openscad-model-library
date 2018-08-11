// Pin Connectors V2
// Tony Buser <tbuser@gmail.com>

//pin_tack(h=10);

module pin_simple(h=10, r=4, bh=3, br=8) {
  // bh = base_height
  // br = base_radius

  union() {
    cylinder(h=bh, r=br, $fn=50);
    translate([0, 0, bh]) cylinder(h=h, r=r, $fn=50);
  }
}

module pin_tack(h=10, r=4, lh=3, lt=1, bh=3, br=4) {
  // bh = base_height
  // br = base_radius
  
  union() {
    cylinder(h=bh, r=br, $fn=50);
    translate([0, 0, bh]) pin(h, r, lh, lt);
  }
}
// just call pin instead, I made this module because it was easier to do the rotation option this way
// since openscad complains of recursion if I did it all in one module
module pin(h=10, r=4, lh=3, lt=1) {
  // h = shaft height
  // r = shaft radius
  // lh = lip height
  // lt = lip thickness

  difference() {
    pin_solid(h, r, lh, lt);
    
    // center cut
    translate([-r*0.5/2, -(r*2+lt*2)/2, h/4]) cube([r*0.5, r*2+lt*2, h]);
    translate([0, 0, h/4]) cylinder(h=h+lh, r=r/2.5, $fn=50);
    // center curve
    // translate([0, 0, h/4]) rotate([90, 0, 0]) cylinder(h=r*2, r=r*0.5/2, center=true, $fn=50);
  
    // side cuts
    translate([-r*2, -lt-r*1.125, -1]) cube([r*4, lt*2, h+2]);
    translate([-r*2, -lt+r*1.125, -1]) cube([r*4, lt*2, h+2]);
  }
}

// this is mainly to make the pinhole module easier
module pin_solid(h=10, r=4, lh=3, lt=1) {
  union() {
    // shaft
    cylinder(h=h-lh, r=r, $fn=50);
    // lip
    // translate([0, 0, h-lh]) cylinder(h=lh*0.25, r1=r, r2=r+(lt/2), $fn=30);
    // translate([0, 0, h-lh+lh*0.25]) cylinder(h=lh*0.25, r2=r, r1=r+(lt/2), $fn=30);
    // translate([0, 0, h-lh+lh*0.50]) cylinder(h=lh*0.50, r1=r, r2=r-(lt/2), $fn=30);

    // translate([0, 0, h-lh]) cylinder(h=lh*0.50, r1=r, r2=r+(lt/2), $fn=30);
    // translate([0, 0, h-lh+lh*0.50]) cylinder(h=lh*0.50, r1=r+(lt/2), r2=r-(lt/3), $fn=30);    

    translate([0, 0, h-lh]) cylinder(h=lh*0.25, r1=r, r2=r+(lt/2), $fn=50);
    translate([0, 0, h-lh+lh*0.25]) cylinder(h=lh*0.25, r=r+(lt/2), $fn=50);    
    translate([0, 0, h-lh+lh*0.50]) cylinder(h=lh*0.50, r1=r+(lt/2), r2=r-(lt/2), $fn=50);

    // translate([0, 0, h-lh]) cylinder(h=lh, r1=r+(lt/2), r2=1, $fn=30);
    // translate([0, 0, h-lh-lt/2]) cylinder(h=lt/2, r1=r, r2=r+(lt/2), $fn=30);
  }
}
