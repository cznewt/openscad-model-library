
include <../../lib/device/device_raspberrypi.scad>;

rotate([0, 0, $t*360])
    translate([-board_dim[0]/2, -board_dim[1]/2])
        raspberry_pi_3();
