/* 
robophery garden compute box
*/

include <../../lib/connector/connector_euro.scad>;
include <../../lib/connector/connector_keystone.scad>;
include <../../lib/button/button_orthogonal.scad>;
include <../../lib/box/box_waterproof.scad>;

boxClearance = 0.1;
boxWallThickness=3;

waterproofBoxCase(
    boxSizeX=100,
    boxSizeY=100,
    boxInnerHeight=40,
    boxBottomTopThickness=1.5,
    boxScrewCornerRadius=6,
    boxScrewDiameter=3.2,
    boxWallThickness=boxWallThickness,
    barrierThickness=1.2,
    barrierHeight=2,
    barrierTolerance=0.2,
    screwnoseNumber=4,
    screwnoseDiameter=4,
    screwnoseHeight=5,
    screwnoseWallThickness=2.8,
    boxClearance = boxClearance
);

// extrusions

// power output connectors
translate([boxWallThickness/2,27+0*32, 32]) rotate([90,90,90])
  connectorGSD4(boxWallThickness,boxClearance);

translate([boxWallThickness/2,27+1*32, 32]) rotate([90,90,90])
  connectorGSD4(boxWallThickness,boxClearance);

translate([boxWallThickness/2,27+2*32, 32]) rotate([90,90,90])
  connectorGSD4(boxWallThickness,boxClearance);

translate([boxWallThickness/2,27+3*32, 32]) rotate([90,90,90])
  connectorGSD4(boxWallThickness,boxClearance);

// power input button
translate([boxSizeX-boxWallThickness/2, 20, 32]) rotate([90,90,270])
  buttonPH8550VB01(boxWallThickness,boxClearance);

// power input connector
translate([boxSizeX-boxWallThickness/2, 45, 32]) rotate([90,90,90])
  connectorSchurter61004(boxWallThickness,boxClearance);

// keystone data connector
translate([boxSizeX-boxWallThickness/2, boxSizeY-35, 32]) rotate([90,0,90])
  connectorkeystonecat5e(boxWallThickness,boxClearance);
