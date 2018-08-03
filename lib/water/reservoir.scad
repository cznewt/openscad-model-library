
// KLAMTARE Krabice s vikem 350 Kc
// http://www.ikea.com/cz/cs/catalog/products/70292364/
// resrvoir(300, 450, 580, 5);

// Prepravka T50, 190 Kc
// https://www.hornbach.cz/shop/Prepravka-T50/6402463/artikl.html
// reservoir(300, 400, 600, 5);


module reservoir(double_height, width, depth, wall) {
height = double_height/2;
    difference() {
        minkowski() {
            translate([0,0,height/2])
                cube([width,depth,height],true);
            cylinder(r=40,h=height);  // rounded corners
        }
        minkowski() {
            translate([0,0,height/2+wall])
                cube([width-wall,depth-wall,height],true);
            cylinder(r=40,h=height);  // rounded corners
        }
    }
}
