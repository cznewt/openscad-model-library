
sides = 200;

conic_cup(58,58,90,7);

module conic_cup(bottom_diameter,top_diameter,height,wall_thickness)
{
difference() {
union() {
cylinder(h=height, r1=bottom_diameter, r2=top_diameter, $fn=sides);
translate([0,0,height])
cylinder(h=20, r1=top_diameter, r2=top_diameter+15, $fn=sides);

translate([0,0,height+20])
cylinder(h=3, r1=top_diameter+15, r2=top_diameter+15, $fn=sides);

}
translate([0,0,wall_thickness])
cylinder(h=height+40+wall_thickness+1, r1=bottom_diameter-wall_thickness, r2=top_diameter-wall_thickness, $fn=sides);

translate([0,0,height+2])
cylinder(h=20+4, r1=top_diameter-wall_thickness, r2=top_diameter+15-wall_thickness, $fn=sides);


translate([0,0,wall_thickness-1])
cylinder(h=wall_thickness+2, r1=3, r2=3, $fn=sides);

translate([0,0,-1])
cylinder(h=wall_thickness+2, r1=3, r2=3, $fn=sides);

translate([20,20,-1])
cylinder(h=wall_thickness+2, r1=3, r2=3, $fn=sides);

translate([-20,20,-1])
cylinder(h=wall_thickness+2, r1=3, r2=3, $fn=sides);

translate([20,-20,-1])
cylinder(h=wall_thickness+2, r1=3, r2=3, $fn=sides);

translate([-20,-20,-1])
cylinder(h=wall_thickness+2, r1=3, r2=3, $fn=sides);


}
}
