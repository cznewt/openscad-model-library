
module oled_display(width=28, height=22, thickness=2) {

    difference() {
        color("green") cube([width,height,2], center=true);
        // holes
        translate([width/2-2,height/2-2,-2.5]) cylinder(r=1, h=4);
        translate([-width/2+2,height/2-2,-2.5]) cylinder(r=1, h=4);
        translate([-width/2+2,-height/2+2,-2.5]) cylinder(r=1, h=4);
        translate([width/2-2,-height/2+2,-2.5]) cylinder(r=1, h=4);
    }
    color("blue") translate([0,0,2]) cube([width-thickness*3,height-thickness*3,thickness], center=true);

}
