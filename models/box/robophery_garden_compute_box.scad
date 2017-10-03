/* 
robophery garden compute box
*/

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
    }
}
