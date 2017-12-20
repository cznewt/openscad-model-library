
module switch(width = 21.20, height = 25.70, thickness=25, cover_width=29.70, cover_height=35, cover_thickness=4.7) {

    color("black") cube([width,height,thickness], center=true);
    color("black") translate([0,0,thickness/2]) cube([cover_width,cover_height,cover_thickness], center=true);
    color("red") translate([0,0,thickness/2+3]) cube([width,height,4], center=true);

}
