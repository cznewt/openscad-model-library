
// nut_M3(height=1,0.1);

module nut_M3(height,clear)
{
    nut_hexagone(3,height,clear);
}

module nut_hexagone(radius,height,clear)
{
	angle = 360/6;
	cote = (radius+clear)/tan(angle);

	union()
    {
		rotate([0,0,0])
			cube([radius+clear,cote,height],center=true);
		rotate([0,0,angle])
			cube([radius+clear,cote,height],center=true);
		rotate([0,0,2*angle])
			cube([radius+clear,cote,height],center=true);
	}

}
