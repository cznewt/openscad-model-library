
include <../../lib/material.scad>;
include <../../lib/bolt/metric_bolt.scad>;

metal() {
    translate([0,0,0]) m2_hex_nut();
    translate([0,15,0]) m2_5_hex_nut();
    translate([0,30,0]) m3_hex_nut();
    translate([15,0,0]) m4_hex_nut();
    translate([15,15,0]) m5_hex_nut();
    translate([15,30,0]) m6_hex_nut();
    translate([30,0,0]) m8_hex_nut();
}
