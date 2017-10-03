
//connector_AtlasScientific_EZO(3,0.1);

module connector_AtlasScientific_EZO(depth,clear)
{
    diameter = 12;

    connector_coaxial(diameter,depth,clear);
}

module connector_coaxial(diameter,depth,clear)
{
    cylinder(r=diameter/2+clear, h=depth,center=true);
}
