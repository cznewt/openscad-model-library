
include <../../lib/connector/connector_coaxial.scad>;
include <../../lib/plate.scad>;

difference() {
    plate(40,40,3);
    rotate([0,180,0]) {
        connector_AtlasScientific_EZO_extrusion(3,0.1);
    }
}
