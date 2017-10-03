/* 
robophery garden compute box
*/

include <../../lib/connector/connector_keystone.scad>;
include <../../lib/connector/connector_coaxial.scad>;
include <../../lib/connector/connector_orthogonal.scad>;
include <../../lib/box/box_waterproof.scad>;

boxSizeX=110;
boxSizeY=95;
boxInnerHeight=36;
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
        // Atlassian connectors - Coaxials        
        translate([box_Wall_Thickness/2,22+0*15.3,22]) rotate([90,90,90])
            connector_AtlasScientific_EZO(box_Wall_Thickness,boxClearance);
        translate([box_Wall_Thickness/2,22+1*15.3,22]) rotate([90,90,90])
            connector_AtlasScientific_EZO(box_Wall_Thickness,boxClearance);

        // PSH02 connectors - I2C and 1Wire
        translate([box_Wall_Thickness/2,57+0*2.54,22]) rotate([90,180,90])
            connector_PSH02(4,box_Wall_Thickness,boxClearance);
        translate([box_Wall_Thickness/2,57+4*2.54,22]) rotate([90,180,90])
            connector_PSH02(4,box_Wall_Thickness,boxClearance);
        translate([box_Wall_Thickness/2,57+8*2.54,22-1.25]) rotate([90,180,90])
            connector_PSH02(3,box_Wall_Thickness,boxClearance);

        // keystone data connector
        translate([box_Size_X-box_Wall_Thickness/2, box_Size_Y-35, 20]) rotate([90,0,90])
          connector_keystone_cat5e(box_Wall_Thickness,boxClearance);
    }
}
