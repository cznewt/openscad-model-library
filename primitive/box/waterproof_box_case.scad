
include <../../lib/box/box_waterproof.scad>;

waterproofBoxCase(
    boxSizeX=160,
    boxSizeY=120,
    boxInnerHeight=40,
    boxBottomTopThickness=1.5,
    boxScrewCornerRadius=6,
    boxScrewDiameter=3.2,
    boxWallThickness=3,
    barrierThickness=1.2,
    barrierHeight=2,
    barrierTolerance=0.2,
    screwnoseNumber=4,
    screwnoseDiameter=4,
    screwnoseHeight=5,
    screwnoseWallThickness=2.8,
    boxClearance = 0.1
);
