
sides = 200;

//circular_plug(110,130,20,5,5);

module circular_plug(bottom_diameter,top_diameter,height,wall_thickness,bottom_thickness) {
    difference() {
        union() {
            cylinder(h=bottom_thickness, r1=bottom_diameter/2, r2=bottom_diameter/2, $fn=sides);
            cylinder(h=height, r1=bottom_diameter/2, r2=top_diameter/2, $fn=sides);
        }
        translate([0,0,bottom_thickness])
            cylinder(h=height-bottom_thickness+0.01, r1=bottom_diameter/2-wall_thickness, r2=top_diameter/2-wall_thickness, $fn=sides);
    }
}
