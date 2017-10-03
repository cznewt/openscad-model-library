//---------------------------------------------------------------
//-- Openscad HC-SR04 module
//-- (C) Juan Pedro Lopez (jotape)
//-- May-2013
//---------------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------------

//------------------------------------------------------------------
//-- Draw an HC-SR04 sensor module
//--
//-- Parameters:
//--  extractHoles: if true, draw the screw holes so you
//--  can extract them off another geometry, else just
//--  draw the module.
//------------------------------------------------------------------
module module_HC_SR04(extractHoles=false)
{
	// Draw the sensors
	translate(v = [-13.5, 0, 7.5]) {
		cylinder(h = 13.8, r = 8, center = true, $fn=36);
	}

	translate(v = [13.5, 0, 7.5]) {
		cylinder(h = 13.8, r = 8, center = true, $fn=36);
	}

	if (extractHoles == true) {
		union() {
			// Draw the PCB
			cube(size = [45,20,1.2], center = true);

			// Draw the screw holes
			union() {
				union() {
					translate(v = [-20, -8, 2.6]) {
						cylinder(h = 4, r = 1.5, center = true, $fn=18);
					}

					translate(v = [-20, 8, 2.6]) {
						cylinder(h = 4, r = 1.5, center = true, $fn=18);
					}
				}

				union() {
					translate(v = [20, 8, 2.6]) {
						cylinder(h = 4, r = 1.5, center = true, $fn=18);
					}

					translate(v = [20, -8, 2.6]) {
						cylinder(h = 4, r = 1.5, center = true, $fn=18);
					}
				}
			}
		}
	}
	else {
		difference() {
			// Draw the PCB
			cube(size = [45,20,1.2], center = true);

			// Draw the screw holes
			union() {
				union() {
					translate(v = [-20, -8, 0]) {
						cylinder(h = 4, r = 1.5, center = true, $fn=18);
					}

					translate(v = [-20, 8, 0]) {
						cylinder(h = 4, r = 1.5, center = true, $fn=18);
					}
				}

				union() {
					translate(v = [20, 8, 0]) {
						cylinder(h = 4, r = 1.5, center = true, $fn=18);
					}

					translate(v = [20, -8, 0]) {
						cylinder(h = 4, r = 1.5, center = true, $fn=18);
					}
				}
			}
		}
	}
}
