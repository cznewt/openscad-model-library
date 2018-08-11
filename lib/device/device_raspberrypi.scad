/* (c) 2016++ by Saarbastler 
**  https://github.com/saarbastler/library.scad
**
** Raspberry PI model library for generating cases etc.
*/

use <./component.scad>

$fn = 30;

_delta = 0.005;

_c_gray  = [.4, .4, .4];
_c_gold  = [.8, .5, .0];
_c_metal = [.7, .7, .7];
_c_black = [.3, .3, .3];
_c_green_pcb = [.0, .5, .25];
_c_yellow = [.7, .7, .3];


//raspberry_pi_3();
//raspberry_pi_zero(true);


board_dim = [85, 56, 1.25];
hole_d = 2.75;

microusb_dim = [6, 8, 3];
microusb_pos = [10.6 - microusb_dim[1]/2, -1, board_dim[2]];

hdmi_dim = [11.5, 15, 6.5];
hdmi_pos = [32 - hdmi_dim[1]/2, -1, board_dim[2]];

jack_dim = [14.5, 7, 6];
jack_pos = [53.5 - jack_dim[1]/2, -2, board_dim[2]];

gpio_dim = [51, 5, 8.5];
gpio_pos = [3.5+29-gpio_dim[0]/2, board_dim[1]-gpio_dim[1]-1, board_dim[2]];

usbx2_dim = [17.25, 15, 16.5];
usbx2_pos_tab = [
    [board_dim[0]-usbx2_dim[0]+2, 29-usbx2_dim[1]/2, board_dim[2]],
    [board_dim[0]-usbx2_dim[0]+2, 47-usbx2_dim[1]/2, board_dim[2]],
];

ethernet_dim = [21, 16, 13.5];
ethernet_pos = [board_dim[0]-ethernet_dim[0]+2, 10.25-ethernet_dim[1]/2, board_dim[2]];

serialcon_dim = [2.5, 22, 5.5];
serialcon_pos_tab = [
    [1.1, 3.5+28-serialcon_dim[1]/2, board_dim[2]],
    [32+13-serialcon_dim[0]/2, .5, board_dim[2]],
];

sdslot_dim = [11.5, 12, 1.25];
sdslot_pos = [1.75, (board_dim[1]-sdslot_dim[1])/2, -sdslot_dim[2]];

sdcard_dim = [15, 11, 1];
sdcard_pos = [sdslot_pos[0]+sdslot_dim[0]-.25-sdcard_dim[0],
              (board_dim[1]-sdcard_dim[1])/2, -sdcard_dim[2]];

module pinHeader(pins, rows)
{
    color("darkgrey") cube([2.54*pins,2.54*rows,1.27]);
  
    for(x=[0:pins-1],y=[0:rows-1])
        translate([x*2.54+(1.27+.6)/2,y*2.54+(1.27+.6)/2,-3.5])
          cube([0.6,0.6,11.5]);
}

module _plate() {
    corner_radius = 3;
    l = board_dim[0];
    w = board_dim[1];
    h = board_dim[2];
    ring_d = 6.2;
    color(_c_green_pcb) {
        linear_extrude(height=h) {
            difference() {
                translate([corner_radius, corner_radius]) {
                    minkowski() {
                        square([l-corner_radius*2, w-corner_radius*2]);
                        circle(r=corner_radius);
                    }
                }
                hole_positions()
                    circle(d=ring_d);
            }
        }
    }
    color(_c_yellow) {
        linear_extrude(height=board_dim[2]) {
            hole_positions() {
                difference() {
                    circle(d=ring_d);
                    circle(d=hole_d);
                }
            }
        }
    }
}

module _sdslot() {
    color(_c_metal)
        cube(sdslot_dim);
}

module _sdcard() {
    color(_c_black)
        cube(sdcard_dim);
}

module usbx2_pos() {
    for (pos = usbx2_pos_tab)
        translate(pos)
            children();
}

module raspberry_pi_3() {
    _plate();

    translate(microusb_pos)         microusb(microusb_dim, direction="S");
    translate(hdmi_pos)             hdmi(hdmi_dim, direction="S");
    translate(jack_pos)             jack(jack_dim, direction="S");
    translate(gpio_pos)             pin_header_pitch254(20, 2, dim=gpio_dim);
    usbx2_pos()                     usbx2(usbx2_dim, direction="E");
    translate(ethernet_pos)         ethernet(ethernet_dim, direction="E", swap_led=true);
    translate(serialcon_pos_tab[0]) serialcon(serialcon_dim, direction="E");
    translate(serialcon_pos_tab[1]) serialcon(serialcon_dim, direction="W");
    translate(sdslot_pos)           _sdslot();
    translate(sdcard_pos)           _sdcard();
}

module hole_positions() {
    hole_pad = 3.5;
    hole_x1 = hole_pad;
    hole_x2 = hole_pad + 58;
    hole_y1 = hole_pad;
    hole_y2 = hole_pad + 49;

    for (y = [hole_y1, hole_y2])
        for (x = [hole_x1, hole_x2])
            translate([x, y])
                children();
}

module raspberry_pi_zero(withHeader=false)
{
  // PCB
  color("limegreen") difference()
  {
    hull()
    {
      translate([-(65-6)/2,-(30-6)/2,0]) cylinder(r=3, h=1.4 );
      translate([-(65-6)/2, (30-6)/2,0]) cylinder(r=3, h=1.4 );
      translate([ (65-6)/2,-(30-6)/2,0]) cylinder(r=3, h=1.4 );
      translate([ (65-6)/2, (30-6)/2,0]) cylinder(r=3, h=1.4 );
    }
    
    translate([-65/2+3.5,-23/2,-1]) cylinder(d=2.75, h=3);
    translate([-65/2+3.5, 23/2,-1]) cylinder(d=2.75, h=3);
    translate([65/2-3.5,-23/2,-1]) cylinder(d=2.75, h=3);
    translate([65/2-3.5, 23/2,-1]) cylinder(d=2.75, h=3);
  }

  // Header
  if( withHeader)
    translate([3.5-65/2+29-10*2.54,30/2-3.5-2.54,1.4])
      pinHeader(20,2);
    
  translate([-65/2,-30/2,1.4])
  {
    // Micro SD Card
    color("silver") translate([1.5,16.9-5,0]) cube([12,10,1.4]);    
    color("darkgrey") translate([-2.5,16.9-5,0.25]) cube([4,10,1]);
    
    // micro USB
    color("silver") translate([41.4-8/2,-1.5,0]) cube([8,6,2.6]);
    color("silver") translate([54-8/2,-1.5,0]) cube([8,6,2.6]);

    // HDMI
    color("silver")  translate([12.4-11.4/2,-.5,0]) cube([11.3,7.5,3.1]);
    
    // Camera
    color("darkgrey") translate([65-3,(30-17)/2,0]) cube([4,17,1.3]);  
  }
}
