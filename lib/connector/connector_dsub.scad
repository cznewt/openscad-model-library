/*
Inspired by D-Sub connector library by 'dpeart'
http://forums.reprap.org/read.php?313,577003
*/

//connector_dsub_9F(10,0.1);
//connector_dsub_9R(10,0.1);
//connector_dsub_15F(10,0.1);
//connector_dsub 15R(10,0.1);
//connector_dsub_25F(10,0.1);
//connector_dsub_25R(10,0.1);
//connector_dsub_37F(10,0.1);
//connector_dsub_37R(10,0.1);
//connector_dsub_50F(10,0.1);
//connector_dsub_50R(10,0.1);

module connector_dsub_9F(depth,clear)
{
    dimensions = [12.50,11.10,6.53,2.11];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub_9R(depth,clear)
{
    dimensions = [12.50,11.10,5.72,3.35];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub_15F(depth,clear)
{
    dimensions = [16.66,15.27,6.53,2.11];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub_15R(depth,clear)
{
    dimensions = [16.66,15.27,5.72,3.35];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub_25F(depth,clear)
{
    dimensions = [23.52,22.15,6.53,2.11];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub_25R(depth,clear)
{
    dimensions = [23.52,21.39,5.72,3.35];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub_37F(depth,clear)
{
    dimensions = [31.75,29.54,6.53,2.11];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub_37R(depth,clear)
{
    dimensions = [31.75,29.54,5.72,3.35];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub_50F(depth,clear)
{
    dimensions = [30.56,29.19,7.93,2.11];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub_50R(depth,clear)
{
    dimensions = [30.56,28.17,7.06,3.35];
    connector_dsub(dimensions,depth,clear);
}

module connector_dsub(dimensions,depth,clear)
{
    sides = 20;
    
    b = dimensions[0];
    d = dimensions[1];
    f = dimensions[2];
    k = dimensions[3];
    h = depth+clear;
    g = clear;

    cut_angle = 10;
    mounting_hole = 3.05;
    o = 2*(g+f-k)*tan(cut_angle);

    translate([0,0,-0.5])
    {
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

            translate([-b,0,-h/2])
                cylinder(h=h, d=g+mounting_hole, $fn=6);
            translate([b,0,-h/2])
                cylinder(h=h, d=g+mounting_hole, $fn=6);
        }
    }
}
