
include <../../lib/connector/connector_euro.scad>;
include <../../lib/plate.scad>;

difference() {
    plate(60,40,3);
    rotate([0,180,0]) {
        connector_Schurter_6100_4_extrusion(3,0.1);
    }
}
