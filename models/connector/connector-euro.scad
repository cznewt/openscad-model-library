
module connector_Schurter_6100_4(depth) {
  conn_height = 20.2;
  conn_width = 27.7;
  conn_radius = 3;
  conn_corner = 4.5;

  lock_width = 12;
  lock_height = conn_height+8;
  lock_depth = 1;
  connector_euro(conn_height, conn_width, depth, conn_radius, conn_corner);
  translate([(conn_width-lock_width)/2, -4, lock_depth])
  connector_euro_lock(lock_width, lock_height, depth-lock_depth);

}

module connector_GSD4(depth) {
  conn_height = 24.5;
  conn_width = 32.5;
  conn_radius = 3;
  conn_corner = 5;
  hole_width = 40;
  hole_diameter = 3.0;

  conn_hole_distance = (hole_width-conn_width)/2;
  connector_euro(conn_height, conn_width, depth, conn_radius, conn_corner);
  translate([-conn_hole_distance, conn_height/2, 0])
    connector_euro_hole(hole_diameter, depth);
  translate([conn_width+conn_hole_distance, conn_height/2, 0])
    connector_euro_hole(hole_diameter, depth);
}

module connector_euro_hole(diameter, depth) {
  cylinder(r=diameter/2, h=depth);
}

module connector_euro_lock(width, height, depth) {
  cube([width, height, depth]);
}

module connector_euro(height, width, depth, radius, corner) {
  hull(){
    translate([radius, radius, 0]) cylinder(r=radius, h=depth);
    translate([width-radius, radius, 0]) cylinder(r=radius, h=depth);
    translate([radius, height-radius-corner, 0]) cylinder(r=radius, h=depth);
    translate([radius+corner, height-radius, 0]) cylinder(r=radius, h=depth);
    translate([width-radius, height-radius-corner, 0]) cylinder(r=radius, h=depth);
    translate([width-radius-corner, height-radius, 0]) cylinder(r=radius, h=depth);
  }
}

//connector_GSD4(3);
//connector_Schurter_6100_4(3);