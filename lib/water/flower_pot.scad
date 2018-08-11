
// Hydroponicky kosicek prumer 14cm, 70 Kc, 4x70 = 280 Kc
// http://www.growmania.cz/extra-pevny-hydroponicky-kosicek-prumer-14cm-p-4755.html

sides = 200;

//flower_pot(120, 65, 40, 2);

module flower_pot(height, top_radius, bottom_radius, wall) {
    difference() {
        cylinder(r1=bottom_radius,r2=top_radius,h=height, $fn=sides);
        translate([0,0,wall])
            cylinder(r1=bottom_radius-wall,r2=top_radius-wall,h=height, $fn=sides);
    }
}
