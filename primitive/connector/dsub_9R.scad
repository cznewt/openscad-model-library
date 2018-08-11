
include <../../lib/connector/connector_dsub.scad>;
include <../../lib/plate.scad>;

difference() {
    plate(40,40,3);
    rotate([0,180,0]) {
        connector_dsub_9R_extrusion(3,0.1);
    }
}