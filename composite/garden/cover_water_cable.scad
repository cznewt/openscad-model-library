
include <../../lib/water/hose_connector.scad>;
include <../../lib/cover/circular_plug.scad>;

difference() {
    union() {
        circular_plug(122,130,15,3,3);
        translate([0,30,0]) {
            connector_garden_hose(25,0.1);
        }
        translate([0,-25,0]) {
            cylinder(h=20, r1=21.5, r2=21.5);
        }
    }

    translate([0,30,-0.01]) {
        cylinder(h=3.02, r1=6, r2=6);
    }

    translate([0,-25,-.01]) {
        cylinder(h=62, r1=20, r2=20);
    }

}
