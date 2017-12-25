
width = 38.6;
height = 50.6;

module relay(count=2) {

    difference() {
        color("green") cube([width,height,2]);
        translate([3,3,0]) cylinder(r=1.5, h=5);
        translate([35.6,3,0]) cylinder(r=1.5, h=5);
        translate([35.6,47.6,0]) cylinder(r=1.5, h=5);
        translate([3,47.6,0]) cylinder(r=1.5, h=5);
    }

    color("blue") translate([3.5,5,0]) cube([15,27,16+2]);
    color("blue") translate([19.5,5,0]) cube([15,27,16+2]);

}

module pin(mount_height=5) {
    cylinder(r=1.4, h=mount_height);
}

module relay_mount(count=2, mount_height=10, mount_height2=5) {

    translate([width - 3,height-3,-mount_height]) { cylinder(r=4, h=mount_height); translate([0,0,mount_height]) pin(mount_height2);}
    translate([3,height-3,-mount_height]) { cylinder(r=4, h=mount_height); translate([0,0,mount_height]) pin(mount_height2);}  
    translate([3,3,-mount_height]) { cylinder(r=4, h=mount_height); translate([0,0,mount_height]) pin(mount_height2);}  
    translate([width-3,3,-mount_height]) { cylinder(r=4, h=mount_height); translate([0,0,mount_height]) pin(mount_height2);}  
}
