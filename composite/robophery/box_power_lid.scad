/* 
robophery garden power box lid
*/

include <../../lib/connector/connector_power.scad>;
include <../../lib/box/box_waterproof.scad>;

boxSizeX=120;
boxSizeY=120;
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

waterproofBoxLid(
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

    // power output connectors
    translate([35,35,boxWallThickness/2+.4]) rotate([0,180,0])
        connector_IP54(boxWallThickness+1,boxClearance+0.1);

    translate([35,85,boxWallThickness/2+.4]) rotate([0,180,0])
        connector_IP54(boxWallThickness+1,boxClearance+0.1);

    translate([85,35,boxWallThickness/2+.4]) rotate([0,180,0])
        connector_IP54(boxWallThickness+1,boxClearance+0.1);

    translate([85,85,boxWallThickness/2+.4]) rotate([0,180,0])
        connector_IP54(boxWallThickness+1,boxClearance+0.1);

}
