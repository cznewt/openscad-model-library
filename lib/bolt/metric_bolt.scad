
include <bolt.scad>;

// https://www.fairburyfastener.com/xdims_metric_nuts.htm

//  hex_nut (height, thread_d, size, tolerance, quality, thread, pitch);
//hex_nut (1/8, 1/4, 3/8, 1/128, 32, 1, "imperial", 28);

/*
    hex_nut (height, thread_d, size, tolerance, quality, bool_cut, thread, pitch);
        height      =   height of the nut
        thread_d    =   threaded hole diameter width
        size        =   [ 0.00, 0.00, 0.00 ]hexagonal nut size
        tolerance   =   tolerance of entire measures (always positive, addition and subtraction already
                        calculated within the script
        quality     =   overall quality of the returned function (ref. $fn)
        bool_cut    =   do (1) or not (0) the nut cut
        *thread     =   string variable declaring measure type -> "metric" or "imperial"
        *pitch      =   stands for thread pitch      
*/

module m2_hex_nut() {
  hex_nut(1.6, 2, 4.32, 0.01, 32, 1, "metric", 0.4);
}

module m2_5_hex_nut() {
  hex_nut(2, 2.5, 5.45, 0.01, 32, 1, "metric", 0.45);
}

module m3_hex_nut() {
  hex_nut(2.3, 3, 6.01, 0.01, 32, 1, "metric", 0.5);
}

module m4_hex_nut() {
  hex_nut(3.2, 4, 7.66, 0.01, 32, 1, "metric", 0.7);
}

module m5_hex_nut() {
  hex_nut(4.7, 5, 8.79, 0.01, 32, 1, "metric", 0.8);
}

module m6_hex_nut() {
  hex_nut(5.2, 6, 11.05, 0.01, 32, 1, "metric", 1);
}

module m8_hex_nut() {
  hex_nut(6.8, 8, 14.38, 0.01, 32, 1, "metric", 1.25);
}

module m10_hex_nut() {
  hex_nut(8.4, 10, 17.77, 0.01, 32, 1, "metric", 1.5);
}

//  hex_bolt (lenght, thread_d, head_h, head_d, tolerance, quality, thread, pitch);

/*
    hex_bolt (lenght, thread_d, head_h, head_d, tolerance, quality, bool_cut, thread, pitch);
        lenght      =   threaded bar lenght
        thread_d    =   threaded bar diameter width
        head_h      =   hexagonal bolt head height
        head_d      =   hexagonal bolt head size
        tolerance   =   tolerance of entire measures (always positive, addition and subtraction already
                        calculated within the script
        quality     =   overall quality of the returned function (ref. $fn)
        bool_cut    =   do (1) or not (0) the nut cut
        *thread     =   string variable declaring measure type -> "metric" or "imperial"
        *pitch      =   stands for thread pitch
*/

module m2_hex_bolt(lenght=26,head_h=2) {
  translate([0, 0, -lenght])
    hex_bolt(lenght, 2, head_h, 4.32, 0.1, 32, 1, "metric", 0.4);
}

module m2_5_hex_bolt(lenght=26,head_h=2) {
  translate([0, 0, -lenght])
    hex_bolt(lenght, 2.5, head_h, 5.45, 0.1, 32, 1, "metric", 0.45);
}

module m3_hex_bolt(lenght=26,head_h=2) {
  translate([0, 0, -lenght])
    hex_bolt(lenght, 3, head_h, 6.01, 0.1, 32, 1, "metric", 0.5);
}

module m4_hex_bolt(lenght=26,head_h=2) {
  translate([0, 0, -lenght])
    hex_bolt(lenght, 4, head_h, 7.66, 0.1, 32, 1, "metric", 0.7);
}

module m5_hex_bolt(lenght=26,head_h=2) {
  translate([0, 0, -lenght])
    hex_bolt(lenght, 5, head_h, 8.79, 0.1, 32, 1, "metric", 0.8);
}

module m6_hex_bolt(lenght=26,head_h=2) {
  translate([0, 0, -lenght])
    hex_bolt(lenght, 6, head_h, 11.05, 0.1, 32, 1, "metric", 1);
}

module m8_hex_bolt(lenght=26,head_h=6.8) {
  translate([0, 0, -lenght])
    hex_bolt(lenght, 8, head_h, 14.38, 0.1, 32, 1, "metric", 1.25);
}

module m10_hex_bolt(lenght=26,head_h=8.4) {
  translate([0, 0, -lenght])
    hex_bolt(lenght, 10, head_h, 17.77, 0.1, 32, 1, "metric", 1.5);
}

//m8_hex_bolt_extrude(20, 1, 0.1);

module m1_6_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 1.6, 3.41, clear);
}

module m2_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 2, 4.32, clear);
}

module m2_5_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 2.5, 5.45, clear);
}

module m3_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 3, 6.01, clear);
}

module m4_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 4, 7.66, clear);
}

module m5_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 5, 8.79, clear);
}

module m6_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 6, 11.05, clear);
}

module m8_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 8, 14.38, clear);
}

module m10_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 10, 17.77, clear);
}

module hex_bolt_extrude(depth, head_h, body, head, clear) {
  translate([0,0,head_h/2]) rotate([0, 0, 90]) hex_head_extrude(head_h, head, clear);
  translate([0,0,head_h]) bolt_body_extrude(depth-head_h+clear, body, clear);
}

module bolt_body_extrude(height, diameter, clear) {
    radius = diameter/2+clear*2;
    cylinder(h=height, r1=radius, r2=radius, center=false, $fn=50);
}

module hex_head_extrude(height, diameter, clear) {
    height = height+clear;
	radius = diameter+1+clear*4;
    angle = 360/6;
	cote = (radius)/tan(angle);

	union() {
		rotate([0,0,0])
			cube([radius,cote,height],center=true);
		rotate([0,0,angle])
			cube([radius,cote,height],center=true);
		rotate([0,0,2*angle])
			cube([radius,cote,height],center=true);
	}
}
