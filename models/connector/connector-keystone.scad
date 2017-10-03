
//connector_keystone_cat5e(3,0.1);

module connector_keystone_cat5e(depth,clear)
{
   lock_width = 30;

   connector_keystone(lock_width,depth,clear);
}

module connector_keystone(lock_width,depth,clear)
{
    height = 20+clear;
    width = 14.5+clear;
    depth = depth+clear;
    lock_depth = 1.3;
    lock_offset = (lock_width-width)/2;

    translate([0,0,0])
        cube([lock_width,height,depth-lock_depth],center=true);
    translate([0,0,depth/2])
        cube([width,height,lock_depth],center=true);
}
