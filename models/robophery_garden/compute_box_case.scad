/* 
robophery garden compute box
*/

include <../../lib/connector/connector_keystone.scad>;
include <../../lib/connector/connector_usb.scad>;
include <../../lib/nut/nut_hexagonal.scad>;
include <../../lib/box/box_waterproof.scad>;
include <../../lib/device/device_raspberrypi.scad>;

boxSizeX=110;
boxSizeY=160;
boxInnerHeight=40;
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
unitLocationX = 30;
unitLocationY = 20;
changerLocationX = boxSizeX-20;
changerLocationY = boxSizeY-20;

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
        /*
        translate([unitLocationX+58/2-10,unitLocationY+49/2,boxBottomTopThickness+7])
        rotate([0,0,180])
        raspberryPi3();
        */
        // unit holders
        translate([unitLocationX,unitLocationY,boxBottomTopThickness+1.5])
            nut_M_border(5,9,5,boxClearance);
        translate([unitLocationX,unitLocationY+49,boxBottomTopThickness+1.5])
            nut_M_border(5,9,5,boxClearance);
        translate([unitLocationX+58,unitLocationY,boxBottomTopThickness+1.5])
            nut_M_border(5,9,5,boxClearance);
        translate([unitLocationX+58,unitLocationY+49,boxBottomTopThickness+1.5])
            nut_M_border(5,9,5,boxClearance);

        // changer holders
        translate([changerLocationX,changerLocationY,boxBottomTopThickness+1.5])
            nut_M_border(4,8,5,boxClearance);
        translate([changerLocationX,changerLocationY-49,boxBottomTopThickness+1.5])
            nut_M_border(4,8,5,boxClearance);
        translate([changerLocationX-38,changerLocationY,boxBottomTopThickness+1.5])
            nut_M_border(4,8,5,boxClearance);
        translate([changerLocationX-38,changerLocationY-49,boxBottomTopThickness+1.5])
            nut_M_border(4,8,5,boxClearance);

    }
    // USB data connectors
    translate([boxWallThickness/2,25.5,18]) rotate([270,0,90])
        connector_USB02(boxWallThickness,2);
    translate([boxWallThickness/2,43.5,18]) rotate([270,0,90])
        connector_USB02(boxWallThickness,2);

    // keystone data connectors
    translate([boxWallThickness/2,boxSizeY-28,22]) rotate([270,0,90])
        connector_keystone_cat5e(boxWallThickness,boxClearance);
    translate([boxWallThickness/2,boxSizeY-62,22]) rotate([270,0,90])
        connector_keystone_cat5e(boxWallThickness,boxClearance);
}
