
include <../nut/nut_hexagonal.scad>;

sides = 100;

//connector_GSD4(3,0.1);
//connector_Schurter_6100_4(3,0.1);

module connector_Schurter_6100_4(depth,clear, type="simple")
{
    conn_height = 20;
    conn_width = 27.5;
    conn_radius = 3;
    conn_corner = 4.5;
    lock_width = 12;
    lock_height = conn_height+8;
    lock_depth = 1;

    connector_euro(conn_height,conn_width,depth,conn_radius,conn_corner,clear);

    if (type != "simple") {
        translate([0, 0, lock_depth-depth/2])
            connector_euro_lock(lock_width,lock_height,depth-lock_depth,clear);
    }
}

module connector_GSD4(depth,clear)
{
    conn_height = 24.5;
    conn_width = 32.5;
    conn_radius = 3;
    conn_corner = 5;
    hole_width = 40;
    hole_diameter = 3.0+clear;
    conn_hole_distance = (hole_width-conn_width)/2;

    connector_euro(conn_height,conn_width,depth,conn_radius,conn_corner,clear);
    translate([-conn_width/2-conn_hole_distance,0,0])
        connector_euro_hole(hole_diameter,depth,clear);
    translate([conn_width/2+conn_hole_distance,0,0])
        connector_euro_hole(hole_diameter,depth,clear);
}

module connector_euro_hole(diameter,depth,clear)
{
    radius = diameter/2 + clear;

    cylinder(r=radius, h=depth,center=true,$fn=sides);
    translate([0,0,2-depth])
        nut_M(6,1,clear);
}

module connector_euro_lock(width,height,depth,clear)
{
    height = height+2*clear;
    width = width+2*clear;
    depth = depth+clear;

    cube([width, height, depth],center=true);
}

module connector_euro(height,width,depth,radius,corner,clear)
{
    height = height+2*clear;
    width = width+2*clear;
    radius = radius+2*clear;
    depth = depth+clear;
    height_axis = height/2;
    width_axis = width/2;

    hull(){
        translate([radius-width_axis, radius-height_axis, 0])
            cylinder(r=radius, h=depth,center=true, $fn=sides);
        translate([width_axis-radius, radius-height_axis, 0])
            cylinder(r=radius, h=depth,center=true, $fn=sides);
        translate([radius-width_axis, height_axis-radius-corner, 0])
            cylinder(r=radius, h=depth,center=true, $fn=sides);
        translate([radius+corner-width_axis, height_axis-radius, 0])
            cylinder(r=radius, h=depth,center=true, $fn=sides);
        translate([width_axis-radius, height_axis-radius-corner, 0])
            cylinder(r=radius, h=depth,center=true, $fn=sides);
        translate([width_axis-radius-corner, height_axis-radius, 0])
            cylinder(r=radius, h=depth,center=true, $fn=sides);
    }
}
