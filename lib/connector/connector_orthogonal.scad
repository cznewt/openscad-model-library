
//connector_DUPON_SPK(1,10,0.1);
//connector_DUPON_SPK(2,10,0.1);
//connector_DUPON_SPK(3,10,0.1);
//connector_DUPON_SPK(4,10,0.1);
//connector_DUPON_SPK(8,10,0.1);
//connector_DUPON_SPK(10,10,0.1);
//connector_DUPON_SPK_border(10,4,10,0.1);
//connector_PSH02(2,10,0.1);
//connector_PSH02(3,10,0.1);
//connector_PSH02(4,10,0.1);
//connector_PSH02(8,10,0.1);
//connector_PSH02_border(4,2,7,0.1);

module connector_DUPON_SPK_extrusion(pins,depth,clear)
{
    step = 2.54;
    width = 2.9;
    height = 0.1+pins*step;

    connector_orthogonal_extrusion(height,width,depth,clear);
}

module connector_DUPON_SPK_border_extrusion(pins,border,depth,clear)
{
    step = 2.54;
    width = 2.9;
    height = 0.1+pins*step;

    difference() {
        connector_orthogonal_extrusion(height+2*border,width+2*border,depth,clear);
        connector_orthogonal_extrusion(height,width,depth,clear);
    }
}

module connector_PSH02_extrusion(pins,depth,clear)
{
    step = 2.54;
    width = 2.9;
    height = 0.1+pins*step;

    connector_orthogonal_extrusion(height,width,depth,clear);
}

module connector_PSH02_border_extrusion(pins,border,depth,clear)
{
    step = 2.54;
    width = 2.9;
    height = 0.1+pins*step;

    difference() {
        connector_orthogonal_extrusion(height+2*border,width+2*border,depth,clear);
        connector_orthogonal_extrusion(height,width,depth,clear);
    }
}

module connector_orthogonal_extrusion(height,width,depth,clear)
{
    width = width + 2*clear;
    height = height + 2*clear;
    depth = depth + 2*clear;

    cube([width,height,depth],center=true);
}
