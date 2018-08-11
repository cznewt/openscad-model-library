
include <../bolt/metric_bolt.scad>;

//m2_hex_spacer(2, 2, 0.1);

module m1_6_hex_spacer(height, width, clear) {
    difference() {
        diameter = 3.41;
        hex_head_extrude(height, diameter+width, clear);
        translate([0,0,0]) hex_head_extrude(height+2*clear, diameter, clear);
    }
}


module m2_hex_spacer(height, width, clear) {
    difference() {
        diameter = 4.32;
        hex_head_extrude(height, diameter+width, clear);
        translate([0,0,0]) hex_head_extrude(height+2*clear, diameter, clear);
    }
}

module m2_5_hex_spacer(height, width, clear) {
    difference() {
        diameter = 5.45;
        hex_head_extrude(height, diameter+width, clear);
        translate([0,0,0]) hex_head_extrude(height+2*clear, diameter, clear);
    }
}

module m3_hex_spacer(height, width, clear) {
    difference() {
        diameter = 6.01;
        hex_head_extrude(height, diameter+width, clear);
        translate([0,0,0]) hex_head_extrude(height+2*clear, diameter, clear);
    }
}

module m4_hex_spacer(height, width, clear) {
    difference() {
        diameter = 7.66;
        hex_head_extrude(height, diameter+width, clear);
        translate([0,0,0]) hex_head_extrude(height+2*clear, diameter, clear);
    }
}

module m5_hex_spacer(height, width, clear) {
    difference() {
        diameter = 8.79;
        hex_head_extrude(height, diameter+width, clear);
        translate([0,0,0]) hex_head_extrude(height+2*clear, diameter, clear);
    }
}

module m6_hex_spacer(height, width, clear) {
    difference() {
        diameter = 11.05;
        hex_head_extrude(height, diameter+width, clear);
        translate([0,0,0]) hex_head_extrude(height+2*clear, diameter, clear);
    }
}

module m8_hex_spacer(height, width, clear) {
    difference() {
        diameter = 14.38;
        hex_head_extrude(height, diameter+width, clear);
        translate([0,0,0]) hex_head_extrude(height+2*clear, diameter, clear);
    }
}

module m10_hex_spacer(height, width, clear) {
    difference() {
        diameter = 17.77;
        hex_head_extrude(height, diameter+width, clear);
        translate([0,0,0]) hex_head_extrude(height+2*clear, diameter, clear);
    }
}
