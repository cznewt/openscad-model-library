
//connector_GSD4(3,0.1);
//connector_Schurter_6100_4(300,0.1);

module connector_Schurter_6100_4(depth,clear)
{
    conn_height = 20+clear;
    conn_width = 27.5+clear;
    conn_radius = 3+clear;
    depth = depth+clear;
    conn_corner = 4.5;
    lock_width = 12;
    lock_height = conn_height+8;
    lock_depth = 1;

    connector_euro(conn_height, conn_width, depth, conn_radius, conn_corner);
    translate([0, 0, lock_depth-depth/2])
        connector_euro_lock(lock_width, lock_height, depth-lock_depth);
}

module connector_GSD4(depth,clear)
{
    conn_height = 24.5+clear;
    conn_width = 32.5+clear;
    conn_radius = 3+clear;
    conn_corner = 5;
    depth = depth+clear;
    hole_width = 40;
    hole_diameter = 3.0+clear;
    conn_hole_distance = (hole_width-conn_width)/2;

    connector_euro(conn_height,conn_width,depth,conn_radius,conn_corner);
    translate([-conn_width/2-conn_hole_distance,0,0])
        connector_euro_hole(hole_diameter,depth);
    translate([conn_width/2+conn_hole_distance,0,0])
        connector_euro_hole(hole_diameter,depth);
}

module connector_euro_hole(diameter,depth,clear)
{
    cylinder(r=diameter/2, h=depth,center=true);
}

module connector_euro_lock(width,height,depth,clear)
{
    cube([width, height, depth],center=true);
}

module connector_euro(height,width,depth,radius,corner,clear)
{
    height_axis = height/2;
    width_axis = width/2;
    hull(){
        translate([radius-width_axis, radius-height_axis, 0])
            cylinder(r=radius, h=depth,center=true);
        translate([width_axis-radius, radius-height_axis, 0])
            cylinder(r=radius, h=depth,center=true);
        translate([radius-width_axis, height_axis-radius-corner, 0])
            cylinder(r=radius, h=depth,center=true);
        translate([radius+corner-width_axis, height_axis-radius, 0])
            cylinder(r=radius, h=depth,center=true);
        translate([width_axis-radius, height_axis-radius-corner, 0])
            cylinder(r=radius, h=depth,center=true);
        translate([width_axis-radius-corner, height_axis-radius, 0])
            cylinder(r=radius, h=depth,center=true);
    }
}
