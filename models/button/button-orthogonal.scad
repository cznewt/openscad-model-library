
//button_P_H8550VB01(3,.1);

module button_P_H8550VB01(depth,clear)
{
    height = 13;
    width = 19.2;
    depth = depth+clear;

    button_orthogonal(width,height,depth,clear);
}

module button_orthogonal(width,height,depth,clear)
{
    cube([width+clear,height+clear,depth+clear],center=true);
}
