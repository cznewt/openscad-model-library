
//connector_USB02(7,0.1);

module connector_USB02(depth,clear)
{
    width = 13.1+3;
    height = 14.3;

    connector_orthogonal(height,width,depth,clear);
}

module connector_orthogonal(height,width,depth,clear)
{
    width = width + 2*clear;
    height = height + 2*clear;
    depth = depth + 2*clear;

    cube([width,height,depth],center=true);
}
