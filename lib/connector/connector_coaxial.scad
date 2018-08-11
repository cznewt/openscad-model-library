
sides = 100;

//connector_AtlasScientific_EZO_extrusion(3,0.1);

module connector_AtlasScientific_EZO_extrusion(depth,clear)
{
    diameter = 12;
    connector_coaxial_extrusion(diameter,depth,clear);
}

module connector_coaxial_extrusion(diameter,depth,clear)
{
    radius = diameter/2+clear;
    depth = depth+clear;
    cylinder(r=radius, h=depth,center=true, $fn=sides);
}
