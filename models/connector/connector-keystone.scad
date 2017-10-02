
module connector_keystone_cat5e(depth) {
 lock_width = 30;

 connector_keystone(lock_width, depth);
}

module connector_keystone(lock_width, depth) {
  height = 20;
  width = 14.5;
  lock_depth = 1.3;

  lock_offset = (lock_width - width)/2;
  translate([0, 0, lock_depth])
    cube([lock_width, height, depth-lock_depth]);

  translate([lock_offset, 0, 0])
    cube([width, height, lock_depth]);
}

// connector_keystone_cat5e(3);
