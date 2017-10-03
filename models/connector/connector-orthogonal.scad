
//connector_PSH02_02(3,0.1);
//connector_PSH02_03(3,0.1);
//connector_PSH02_04(3,0.1);

module connector_PSH02_02(depth,clear)
{
    width = 6.2;
    height = 5.5;

    connector_orthogonal(height,width,depth,clear);
}

module connector_PSH02_03(depth,clear)
{
    width = 6.2;
    height = 8;

    connector_orthogonal(height,width,depth,clear);
}

module connector_PSH02_04(depth,clear)
{
    width = 6.2;
    height = 10.5;

    connector_orthogonal(height,width,depth,clear);
}

module connector_orthogonal(height,width,depth,clear)
{
    width = width + 2*clear;
    height = height + 2*clear;
    depth = depth + 2*clear;

    cube([width,height,depth],center=true);
}
