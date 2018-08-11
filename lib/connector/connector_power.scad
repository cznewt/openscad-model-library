
include <../nut/nut_hexagonal.scad>;
include <../bolt/metric_bolt.scad>;

sides = 100;

//connector_IP54_extrusion(5, 1, 0.1);

module connector_IP54_extrusion(depth, bolt_depth, clear)
{
    conn_diameter = 44 + 2*clear;
    hole_position = 19;

    cylinder(r=conn_diameter/2, h=depth+2*clear,center=true, $fn=sides);
    translate([-hole_position,hole_position,0])
        m2_5_hex_bolt_extrude(depth, bolt_depth, 0.1);
    translate([-hole_position,-hole_position,0])
        m2_5_hex_bolt_extrude(depth, bolt_depth, 0.1);
    translate([hole_position,hole_position,0])
        m2_5_hex_bolt_extrude(depth, bolt_depth, 0.1);
    translate([hole_position,-hole_position,0])
        m2_5_hex_bolt_extrude(depth, bolt_depth, 0.1);
}
