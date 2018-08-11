
include <../../lib/button/button_orthogonal.scad>;
include <../../lib/plate.scad>;

difference() {
    plate(60,40,3);
    rotate([0,180,0]) {
        button_P_H8550VB01(3,0.1);
    }
}
