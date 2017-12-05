
include <../nut/nut_hexagonal.scad>;

sides = 100;

//connector_IP54(3,0.1);

module connector_IP54(depth,clear)
{
    conn_diameter = 44 + 2*clear;
    hole_diameter = 3.0 + 2*clear;
    hole_position = 19;

    cylinder(r=conn_diameter/2, h=depth,center=true, $fn=sides);

    translate([-hole_position,hole_position,0])
        connector_power_hole(hole_diameter,depth,clear);
    translate([-hole_position,-hole_position,0])
        connector_power_hole(hole_diameter,depth,clear);
    translate([hole_position,hole_position,0])
        connector_power_hole(hole_diameter,depth,clear);
    translate([hole_position,-hole_position,0])
        connector_power_hole(hole_diameter,depth,clear);

}

module connector_power_hole(diameter,depth,clear)
{
    radius = diameter/2 + clear;

    cylinder(r=radius, h=depth,center=true, $fn=sides);
    translate([0,0,2-depth])
        nut_M(6,1,clear);
}

