// Copyright (c) 2017 Clément Bœsch <u pkh.me>
//
// Permission to use, copy, modify, and distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

//include <bbb_config.scad>
use <./component.scad>

$fn = 30;

_delta = 0.005;

_c_gray  = [.4, .4, .4];
_c_gold  = [.8, .5, .0];
_c_metal = [.7, .7, .7];
_c_black = [.3, .3, .3];

function in2mm(v) = 2.54 * v / 100;

board_dim = [in2mm(3400), in2mm(2150), 1.75];

hole_d = in2mm(125);

ledgesz = in2mm(250);
redgesz = in2mm(500);

ethernet_dim = [21, 16, 13.5];
ethernet_pos = [-in2mm(100), in2mm(855), board_dim[2]];

power_dim = [14, 9, 11];
power_pos = [-in2mm(100), in2mm(215), board_dim[2]];

gpio_dim = [59, 5, 8.5];
gpio_pos_tab = [[18,                0.5, board_dim[2]],
                [18, board_dim[1]-5-0.5, board_dim[2]]];

usb_dim = [14, 14.5, 8];
usb_pos = [72.5, in2mm(405) - .6, board_dim[2]];

button_base_dim = [4, 3, 1.5];
button_pusher_dim = [2, 1.5, 0.5];

miniusb_dim = [7, in2mm(1880-1575), 4];
miniusb_pos = [-in2mm(25), in2mm(1575), -miniusb_dim[2]];

hdmi_dim = [7.5, in2mm(1110-850), 3];
hdmi_pos = [board_dim[0]-hdmi_dim[0]+in2mm(25), in2mm(850), -hdmi_dim[2]];

sdslot_dim = [15, in2mm(1755-1205), 2];
sdslot_pos = [board_dim[0]-sdslot_dim[0], in2mm(1205), -sdslot_dim[2]];

sdcard_dim = [15, 11, 1];
sdcard_pos = [sdslot_pos[0]+in2mm(110), sdslot_pos[1]+0.5, -sdcard_dim[2]];

rt1_dim = [3.5, 8, 10.5];
rt1_pos = [68, 6.5, board_dim[2]];

pins_dim = [15, 2.5, 8.5];
pins_pos = [41, 6, board_dim[2]];

module _plate() {
    color(_c_gray) {
        linear_extrude(height=board_dim[2]) {
            difference() {
                square([board_dim[0], board_dim[1]]);
                hole_positions()
                    circle(d=hole_d+1);
                plate_edges();
            }
        }
    }
    color(_c_gold) {
        linear_extrude(height=board_dim[2]) {
            hole_positions() {
                difference() {
                    circle(d=hole_d+1);
                    circle(d=hole_d);
                }
            }
        }
    }
}

module _power() {
    l = power_dim[0];
    w = power_dim[1];
    h = power_dim[2];

    l1 = 3.5;
    l0 = l - l1;
    h0 = 6.5;

    color(_c_black) {
        difference() {
            union() {
                translate([l1, 0]) {
                    cube([l0, w, h0]);
                    translate([0, w/2, h0])
                        rotate([0, 90])
                            cylinder(d=w-1, h=l0);
                }
                cube([l1, w, h]);
            }
            translate([-_delta, w/2, h0])
                rotate([0, 90])
                    cylinder(d=6.5, h=l0);
        }
    }
    color(_c_metal)
        translate([0, w/2, h0])
            rotate([0, 90])
                cylinder(d=2, h=l0);
}

module _button() {
    base_l = button_base_dim[0];
    base_w = button_base_dim[1];
    base_h = button_base_dim[2];

    button_l = button_pusher_dim[0];
    button_w = button_pusher_dim[1];

    translate([0, 0, board_dim[2]]) {
        color(_c_metal)
            cube(button_base_dim);

        color(_c_black)
            translate([(base_l-button_l)/2, (base_w-button_w)/2, base_h])
                cube(button_pusher_dim);
    }
}

module _miniusb() {
    color(_c_metal)
        cube(miniusb_dim);
}

module _hdmi() {
    color(_c_metal)
        cube(hdmi_dim);
}

module _sdslot() {
    color(_c_metal)
        cube(sdslot_dim);
}

module _sdcard() {
    color(_c_black)
        cube(sdcard_dim);
}

module _rt1() {
    rt1_l = rt1_dim[0];
    rt1_w = rt1_dim[1];
    rt1_h = rt1_dim[2];

    head_l = rt1_dim[0];
    head_w = rt1_dim[1];
    head_h = rt1_dim[2] / 3;

    color(_c_metal)
        for (y = [1, rt1_w-1])
            translate([rt1_l/2, y])
                cylinder(d=1, h=rt1_h-head_h);

    color(_c_gold)
        translate([0, 0, rt1_h-head_h])
            cube([head_l, head_w, head_h]);
}

module hole_positions() {
    translate([in2mm( 575), in2mm(2025)]) children();
    translate([in2mm( 575), in2mm( 125)]) children();
    translate([in2mm(3175), in2mm( 250)]) children();
    translate([in2mm(3175), in2mm(1900)]) children();
}

module plate_edges() {
    l = board_dim[0];
    w = board_dim[1];

    difference() {
        union() {
            translate([        0,         0]) square(ledgesz);
            translate([        0, w-ledgesz]) square(ledgesz);
            translate([l-redgesz, w-redgesz]) square(redgesz);
            translate([l-redgesz,         0]) square(redgesz);
        }

        translate([  ledgesz,   ledgesz]) circle(ledgesz);
        translate([  ledgesz, w-ledgesz]) circle(ledgesz);
        translate([l-redgesz, w-redgesz]) circle(redgesz);
        translate([l-redgesz,   redgesz]) circle(redgesz);
    }
}

module gpio_pos() {
    for (pos = gpio_pos_tab)
        translate(pos)
            children();
}

module button_pos() {
    translate([5.5, 40])     children();
    translate([5.5, 40+9.5]) children();
    translate([74, 41.5])    children();
}

module beaglebone_black() {
    _plate();

    // top
    translate(power_pos)    _power();
    translate(ethernet_pos) ethernet(ethernet_dim);
    gpio_pos()              female_header_pitch254(23, 2, dim=gpio_dim);
    translate(usb_pos)      usb(usb_dim, direction="E");
    button_pos()            _button();
    translate(rt1_pos)      _rt1();
    translate(pins_pos)     pin_header_pitch254(6, 1, dim=pins_dim);

    // bottom
    translate(miniusb_pos)  _miniusb();
    translate(hdmi_pos)     _hdmi();
    translate(sdslot_pos)   _sdslot();
    translate(sdcard_pos)   _sdcard();
}
