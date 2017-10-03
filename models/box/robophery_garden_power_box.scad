/* 
robophery garden power box
*/

include <../../lib/connector/connector_euro.scad>;
include <../../lib/connector/connector_keystone.scad>;
include <../../lib/button/button_orthogonal.scad>;
include <../../lib/box/box_waterproof.scad>;

boxSizeX=110;
boxSizeY=150;
boxInnerHeight=65;
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

    union() {
        // power output connectors
        translate([boxWallThickness/2,27+0*32, 32]) rotate([90,90,90])
            connector_GSD4(boxWallThickness,boxClearance);

        translate([boxWallThickness/2,27+1*32, 32]) rotate([90,90,90])
            connector_GSD4(boxWallThickness,boxClearance);

        translate([boxWallThickness/2,27+2*32, 32]) rotate([90,90,90])
            connector_GSD4(boxWallThickness,boxClearance);

        translate([boxWallThickness/2,27+3*32, 32]) rotate([90,90,90])
            connector_GSD4(boxWallThickness,boxClearance);

        // power input button
        translate([boxSizeX-boxWallThickness/2, 20, 32]) rotate([90,90,270])
            button_P_H8550VB01(boxWallThickness,boxClearance);

        // power input connector
        translate([boxSizeX-boxWallThickness/2, 45, 32]) rotate([90,90,90])
            connector_Schurter_6100_4(boxWallThickness,boxClearance);

        // keystone data connector
        translate([boxSizeX-boxWallThickness/2, boxSizeY-35, 32]) rotate([90,0,90])
            connector_keystone_cat5e(boxWallThickness,boxClearance);
    }
}
