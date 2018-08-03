/* 
robophery garden power box case
*/

include <../../lib/connector/connector_power.scad>;
include <../../lib/connector/connector_keystone.scad>;
include <../../lib/button/button_orthogonal.scad>;
include <../../lib/nut/nut_hexagonal.scad>;
include <../../lib/box/box_waterproof.scad>;

boxSizeX=110;
boxSizeY=230;
boxInnerHeight=80;
boxBottomTopThickness=1.5;
boxScrewCornerRadius=6;
boxScrewDiameter=3.2;
boxWallThickness=3;
barrierThickness=1.2;
barrierHeight=2;
barrierTolerance=0.2;
screwnoseNumber=4;
screwnoseDiameter=4;
screwnoseHeight=5;
screwnoseWallThickness=2.8;
boxClearance=0.1;

difference() {
    union() {
        waterproofBoxCase(
            boxSizeX=boxSizeX,
            boxSizeY=boxSizeY,
            boxInnerHeight=boxInnerHeight,
            boxBottomTopThickness=boxBottomTopThickness,
            boxScrewCornerRadius=boxScrewCornerRadius,
            boxScrewDiameter=boxScrewDiameter,
            boxWallThickness=boxWallThickness,
            barrierThickness=barrierThickness,
            barrierHeight=barrierHeight,
            barrierTolerance=barrierTolerance,
            screwnoseNumber=screwnoseNumber,
            screwnoseDiameter=screwnoseDiameter,
            screwnoseHeight=screwnoseHeight,
            screwnoseWallThickness=screwnoseWallThickness,
            boxClearance=boxClearance
        );

        // relay holders
        translate([boxSizeX-15,boxSizeY-20,boxBottomTopThickness+1.5])
            nut_M_border(5,9,5,boxClearance);
        translate([boxSizeX-15,boxSizeY-20-70,boxBottomTopThickness+1.5])
            nut_M_border(5,9,5,boxClearance);
        translate([boxSizeX-15-48.5,boxSizeY-20,boxBottomTopThickness+1.5])
            nut_M_border(5,9,5,boxClearance);
        translate([boxSizeX-15-48.5,boxSizeY-20-70,boxBottomTopThickness+1.5])
            nut_M_border(5,9,5,boxClearance);
    }
    // power output connectors
    translate([boxWallThickness/2,27+0*55, 44]) rotate([90,90,270])
        connector_IP54(boxWallThickness,boxClearance);

    translate([boxWallThickness/2,27+1*55, 44]) rotate([90,90,270])
        connector_IP54(boxWallThickness,boxClearance);

    translate([boxWallThickness/2,27+2*55, 44]) rotate([90,90,270])
        connector_IP54(boxWallThickness,boxClearance);

    translate([boxWallThickness/2,27+3*55, 44]) rotate([90,90,270])
        connector_IP54(boxWallThickness,boxClearance);

    // power input button
    translate([boxSizeX-boxWallThickness/2, 25, 44]) rotate([90,90,270])
        button_P_H8550VB01(boxWallThickness,boxClearance);

    // power input connector
    translate([boxSizeX-boxWallThickness/2, 52, 44]) rotate([90,90,90])
        connector_Schurter_6100_4(boxWallThickness,boxClearance);

    // keystone data connector
    translate([boxSizeX-boxWallThickness/2, boxSizeY-55, 44]) rotate([90,0,90])
        connector_keystone_cat5e(boxWallThickness,boxClearance);
}
