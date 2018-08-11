
// connector_keystone_cat5e_extrusion(3,0.1);

module connector_keystone_cat5e_extrusion(depth,clear)
{
   lock_width = 30;

   connector_keystone_extrusion(lock_width,depth,clear);
}

module connector_keystone_extrusion(lock_width,depth,clear)
{
    height = 20+2*clear;
    width = 14.5+2*clear;
    depth = depth+2*clear;
    lock_depth = 1.3;
    lock_offset = (lock_width-width)/2;

    //#cube([lock_width,height,depth],center=true);
    translate([-lock_width/2,-height/2,-depth/2])
        cube([lock_width,height,depth-lock_depth]);
    translate([-width/2,-height/2,depth/2-lock_depth-clear])
        cube([width,height,lock_depth+clear]);
}
