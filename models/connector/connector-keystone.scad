
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

    translate([-lock_width/2,-height/2,-depth/2])
        cube([lock_width,height,depth-lock_depth]);
    translate([-width/2,-height/2,depth/2-lock_depth])
        cube([width,height,lock_depth]);
}
