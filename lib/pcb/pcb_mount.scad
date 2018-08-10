
module pcb_mount(radius1=3, radius2=1.5, height1=6, height2=4) {
    cylinder(r=radius1, h=height1);
    translate([0,0,height1]) cylinder(r=radius2, h=height2);
}
