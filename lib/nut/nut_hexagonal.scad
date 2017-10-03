//nut_M2(1,0.1);
//nut_M2_5(1,0.1);
//nut_M3(1,0.1);
//nut_M10(1,0.1);

module nut_M2(height,clear)
{
    radius = 2;

    nut_hexagonal(radius,height,clear);
}

module nut_M2_5(height,clear)
{
    radius = 2.5;

    nut_hexagonal(radius,height,clear);
}

module nut_M3(height,clear)
{
    radius = 3;

    nut_hexagonal(radius,height,clear);
}

module nut_M10(height,clear)
{
    radius = 10;

    nut_hexagonal(radius,height,clear);
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
