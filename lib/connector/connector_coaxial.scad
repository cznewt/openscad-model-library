
//connector_AtlasScientific_EZO(3,0.1);

module connector_AtlasScientific_EZO(depth,clear)
{
    diameter = 12;

    connector_coaxial(diameter,depth,clear);
}

module connector_coaxial(diameter,depth,clear)
{
    radius = diameter/2+clear;
    depth = depth+clear;

    cylinder(r=radius, h=depth,center=true);
}
