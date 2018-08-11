/*
Inspired by D-Sub connector library by 'dpeart'
http://forums.reprap.org/read.php?313,577003
*/

sides = 100;

include <../nut/nut_hexagonal.scad>;
include <../bolt/metric_bolt.scad>;

//connector_dsub_9F(3,0.1);
//connector_dsub_9R(3,0.1);
//connector_dsub_15F(3,0.1);
//connector_dsub_15R(3,0.1);
//connector_dsub_25F(3,0.1);
//connector_dsub_25R(3,0.1);
//connector_dsub_37F(3,0.1);
//connector_dsub_37R(3,0.1);
//connector_dsub_50F(3,0.1);
//connector_dsub_50R(10,0.1);

module connector_dsub_9F_extrusion(depth,clear)
{
    dimensions = [12.50,11.10,6.53,2.11];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_9R_extrusion(depth,clear)
{
    dimensions = [12.50,11.10,5.72,3.35];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_15F_extrusion(depth,clear)
{
    dimensions = [16.66,15.27,6.53,2.11];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_15R_extrusion(depth,clear)
{
    dimensions = [16.66,15.27,5.72,3.35];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_25F_extrusion(depth,clear)
{
    dimensions = [23.52,22.15,6.53,2.11];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_25R_extrusion(depth,clear)
{
    dimensions = [23.52,21.39,5.72,3.35];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_37F_extrusion(depth,clear)
{
    dimensions = [31.75,29.54,6.53,2.11];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_37R_extrusion(depth,clear)
{
    dimensions = [31.75,29.54,5.72,3.35];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_50F_extrusion(depth,clear)
{
    dimensions = [30.56,29.19,7.93,2.11];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_50R_extrusion(depth,clear)
{
    dimensions = [30.56,28.17,7.06,3.35];
    connector_dsub_extrusion(dimensions,depth,clear);
}

module connector_dsub_extrusion(dimensions,depth,clear)
{
    
    b = dimensions[0];
    d = dimensions[1];
    f = dimensions[2];
    k = dimensions[3];
    h = depth+clear;
    g = clear;

    cut_angle = 10;
    mounting_hole = 3.05;
    o = 2*(g+f-k)*tan(cut_angle);

        union()
        {
            hull()
            {
                translate([-(g+d-k),(g+f-k),-h/2])
                    cylinder(h=h, d=k, $fn=sides);
                translate([(g+d-k),(g+f-k),-h/2])
                    cylinder(h=h, d=k, $fn=sides);
                translate([-(g+d-k)+o,-(g+f-k),-h/2])
                    cylinder(h=h, d=k, $fn=sides);
                translate([(g+d-k)-o,-(g+f-k),-h/2])
                    cylinder(h=h, d=k, $fn=sides);
            }

            translate([-b,0,0])
                m1_6_hex_bolt_extrude(h, 1, 0.1);

            translate([b,0,0])
                m1_6_hex_bolt_extrude(h, 1, 0.1);
        }
}
