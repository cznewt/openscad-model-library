
//nut_M(3,1,0.1);
//nut_M(6,1,0.1);
//nut_M_border(6,10,3,0.1);

module nut_M(size,height,clear)
{
    nut_hexagonal(size,height,clear);
}

module nut_M_border(size,radius,height,clear)
{
    difference() {
        //cylinder(r=radius, h=height,center=true);
        nut_hexagonal(radius,height,clear);
        nut_hexagonal(size,height,clear);
    }
}

module nut_hexagonal(radius,height,clear)
{
    height = height+clear;
	radius = radius+clear;
    angle = 360/6;
	cote = (radius)/tan(angle);

	union()
    {
		rotate([0,0,0])
			cube([radius,cote,height],center=true);
		rotate([0,0,angle])
			cube([radius,cote,height],center=true);
		rotate([0,0,2*angle])
			cube([radius,cote,height],center=true);
	}
}
