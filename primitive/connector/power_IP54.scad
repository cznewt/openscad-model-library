
include <../../lib/connector/connector_power.scad>;
include <../../lib/plate.scad>;

difference() {
    plate(60,60,3);
    rotate([0,180,0]) {
        connector_IP54_extrusion(3,1,0.1);
    }
}