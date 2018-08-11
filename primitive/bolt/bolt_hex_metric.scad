
include <../../lib/material.scad>;
include <../../lib/bolt/metric_bolt.scad>;

metal() {
  translate([0, 20, 0])
    m8_hex_bolt(26);

  m10_hex_bolt(26);
}
