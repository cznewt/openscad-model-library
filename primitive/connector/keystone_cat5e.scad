
include <../../lib/connector/connector_keystone.scad>;
include <../../lib/plate.scad>;

difference() {
    plate(60,40,3);
    rotate([0,180,0]) {
        connector_keystone_cat5e_extrusion(3,0.1);
    }
}
