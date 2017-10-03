/* 
Waterproof box
*/

module waterproofBoxCase(
    boxSizeX=40,
    boxSizeY=60,
    boxInnerHeight=25,
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
)
{
    boxHeight = boxInnerHeight+boxBottomTopThickness;
	barrierThickness = boxWallThickness-barrierThickness;

	difference()
    {
		union()
        {
			// solid round box, corners
			translate([boxScrewCornerRadius, boxScrewCornerRadius, 0])
                cylinder(r=boxScrewCornerRadius, h=boxHeight, $fn=50); // bottom left
			translate([boxSizeX-boxScrewCornerRadius, boxScrewCornerRadius, 0])
                cylinder(r=boxScrewCornerRadius, h=boxHeight, $fn=50); // bottom right
			translate([boxScrewCornerRadius, boxSizeY-boxScrewCornerRadius, 0])
                cylinder(r=boxScrewCornerRadius, h=boxHeight, $fn=50); // top left
			translate([boxSizeX-boxScrewCornerRadius, boxSizeY-boxScrewCornerRadius, 0])
                cylinder(r=boxScrewCornerRadius, h=boxHeight, $fn=50); // bottom right
			// solid round box, inner filling
			translate([0, boxScrewCornerRadius, 0])
                cube([boxSizeX, boxSizeY-2*boxScrewCornerRadius, boxHeight]);
			translate([boxScrewCornerRadius, 0, 0])
                cube([boxSizeX-2*boxScrewCornerRadius, boxSizeY, boxHeight]);
			// solid round box, top border
			translate([barrierThickness, boxScrewCornerRadius+barrierThickness, 0])
                cube([boxSizeX-2*barrierThickness, boxSizeY-2*boxScrewCornerRadius-2*barrierThickness, boxHeight+barrierHeight]);
			translate([boxScrewCornerRadius+barrierThickness, barrierThickness, 0])
                cube([boxSizeX-2*boxScrewCornerRadius-2*barrierThickness, boxSizeY-2*barrierThickness, boxHeight+barrierHeight]);
		}
		// Inner cut-out
		translate([boxWallThickness, boxScrewCornerRadius+boxWallThickness, boxBottomTopThickness])
            cube([boxSizeX-2*boxWallThickness, boxSizeY-2*boxScrewCornerRadius-2*boxWallThickness, boxHeight+barrierHeight]);
		translate([boxScrewCornerRadius+boxWallThickness, boxWallThickness, boxBottomTopThickness])
            cube([boxSizeX-2*boxScrewCornerRadius-2*boxWallThickness, boxSizeY-2*boxWallThickness, boxHeight+barrierHeight]);
		// Screw holes
		translate([(boxScrewCornerRadius+boxWallThickness)/2,(boxScrewCornerRadius+boxWallThickness)/2,0])
            cylinder(r=boxScrewDiameter/2, h=boxHeight, $fn=20);
		translate([(boxScrewCornerRadius+boxWallThickness)/2,boxSizeY-(boxScrewCornerRadius+boxWallThickness)/2,0])
            cylinder(r=boxScrewDiameter/2, h=boxHeight, $fn=20);
		translate([boxSizeX-(boxScrewCornerRadius+boxWallThickness)/2,(boxScrewCornerRadius+boxWallThickness)/2,0])
            cylinder(r=boxScrewDiameter/2, h=boxHeight, $fn=20);
		translate([boxSizeX-(boxScrewCornerRadius+boxWallThickness)/2,boxSizeY-(boxScrewCornerRadius+boxWallThickness)/2,0])
            cylinder(r=boxScrewDiameter/2, h=boxHeight, $fn=20);
		// **************************
		// ** YOUR OWN CUTOUTS HERE!
		// **************************
 
		// **************************
		// ** / CUTOUTS
		// **************************
	}
	// Lower nose(s)
	if (screwnoseNumber==2)
        translate([boxSizeX/2, 0.001, 0]) mirror([0,1,0])
            waterproofBoxScrewNose(screwnoseDiameter, screwnoseHeight);
	if (screwnoseNumber==4)
    {
		translate([boxSizeX*0.25, 0.001, 0]) mirror([0,1,0])
            waterproofBoxScrewNose(screwnoseDiameter, screwnoseHeight);
		translate([boxSizeX*0.75, 0.001, 0]) mirror([0,1,0])
            waterproofBoxScrewNose(screwnoseDiameter, screwnoseHeight);
	}
	// Upper nose(s)
	if (screwnoseNumber==2)
    {
        translate([boxSizeX/2, boxSizeY-0.001, 0])
            waterproofBoxScrewNose(screwnoseDiameter, screwnoseHeight);
    }
	if (screwnoseNumber==4)
    {
		translate([boxSizeX*0.25, boxSizeY-0.001, 0])
            waterproofBoxScrewNose(screwnoseDiameter, screwnoseHeight);
		translate([boxSizeX*0.75, boxSizeY-0.001, 0])
            waterproofBoxScrewNose(screwnoseDiameter, screwnoseHeight);
	}
}

module waterproofBoxLid(
    boxSizeX=40,
    boxSizeY=60,
    boxInnerHeight=25,
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
) {
	boxHeight = boxBottomTopThickness+barrierHeight;
	difference()
    {
		union()
        {
			// solid round box, corners
			translate([boxScrewCornerRadius, boxScrewCornerRadius, 0])
                cylinder(r=boxScrewCornerRadius, h=boxHeight, $fn=50); // bottom left
			translate([boxSizeX-boxScrewCornerRadius, boxScrewCornerRadius, 0])
                cylinder(r=boxScrewCornerRadius, h=boxHeight, $fn=50); // bottom right
			translate([boxScrewCornerRadius, boxSizeY-boxScrewCornerRadius, 0])
                cylinder(r=boxScrewCornerRadius, h=boxHeight, $fn=50); // top left
			translate([boxSizeX-boxScrewCornerRadius, boxSizeY-boxScrewCornerRadius, 0])
                cylinder(r=boxScrewCornerRadius, h=boxHeight, $fn=50); // bottom right
			// solid round box, inner filling
			translate([0, boxScrewCornerRadius, 0])
                cube([boxSizeX, boxSizeY-2*boxScrewCornerRadius, boxHeight]);
			translate([boxScrewCornerRadius, 0, 0])
                cube([boxSizeX-2*boxScrewCornerRadius, boxSizeY, boxHeight]);
			// solid round box, top border
		}
		// inner cut-out X direction
		translate([
			boxWallThickness-(barrierThickness+barrierTolerance),
			boxScrewCornerRadius+boxWallThickness-(barrierThickness+barrierTolerance),
			boxBottomTopThickness
		]) cube([
			boxSizeX-2*(boxWallThickness)+2*(barrierThickness+barrierTolerance),
			boxSizeY-2*boxScrewCornerRadius-2*(boxWallThickness)+2*(barrierThickness+barrierTolerance),
			boxBottomTopThickness+barrierHeight
		]);
		// inner cut-out Y direction
		translate([
			boxScrewCornerRadius+boxWallThickness-(barrierThickness+barrierTolerance),
			boxWallThickness-(barrierThickness+barrierTolerance),
			boxBottomTopThickness
		]) cube([
			boxSizeX-2*boxScrewCornerRadius-2*(boxWallThickness)+2*(barrierThickness+barrierTolerance),
			boxSizeY-2*(boxWallThickness)+2*(barrierThickness+barrierTolerance),
			boxBottomTopThickness+barrierHeight
		]);
		
		// Screw holes
		translate([(boxScrewCornerRadius+boxWallThickness)/2,(boxScrewCornerRadius+boxWallThickness)/2,0]) cylinder(r=boxScrewDiameter/2, h=boxHeight, $fn=20);
		translate([(boxScrewCornerRadius+boxWallThickness)/2,boxSizeY-(boxScrewCornerRadius+boxWallThickness)/2,0]) cylinder(r=boxScrewDiameter/2, h=boxHeight, $fn=20);
		translate([boxSizeX-(boxScrewCornerRadius+boxWallThickness)/2,(boxScrewCornerRadius+boxWallThickness)/2,0]) cylinder(r=boxScrewDiameter/2, h=boxHeight, $fn=20);
		translate([boxSizeX-(boxScrewCornerRadius+boxWallThickness)/2,boxSizeY-(boxScrewCornerRadius+boxWallThickness)/2,0]) cylinder(r=boxScrewDiameter/2, h=boxHeight, $fn=20);
	}

	// inner add X direction
	translate([boxWallThickness+barrierTolerance, boxScrewCornerRadius+boxWallThickness+barrierTolerance, boxBottomTopThickness])
		cube([boxSizeX-2*(boxWallThickness+barrierTolerance), boxSizeY-2*(boxScrewCornerRadius+boxWallThickness+barrierTolerance), barrierHeight]);
	// inner add Y direction
	translate([boxScrewCornerRadius+boxWallThickness+barrierTolerance, boxWallThickness+barrierTolerance, boxBottomTopThickness])
		cube([boxSizeX-2*(boxScrewCornerRadius+boxWallThickness+barrierTolerance), boxSizeY-2*(boxWallThickness+barrierTolerance), barrierHeight]);
}

module waterproofBoxScrewNose(screwholeDiameter=4, noseHeight=5) {
	additionalDistanceFromWall = 1;

	translate([0,screwholeDiameter/2+screwnoseWallThickness+additionalDistanceFromWall, 0])
        difference()
        {
            union()
            {
                translate([-(screwholeDiameter/2+screwnoseWallThickness), -(screwholeDiameter/2+screwnoseWallThickness+additionalDistanceFromWall),0]) cube([(screwholeDiameter/2+screwnoseWallThickness)*2, screwholeDiameter/2+screwnoseWallThickness+additionalDistanceFromWall, noseHeight]);
                    cylinder(r=(screwholeDiameter/2)+screwnoseWallThickness, h=noseHeight, $fn=60);
            }
		cylinder(r=screwholeDiameter/2, h=noseHeight, $fn=60);
        }
}
