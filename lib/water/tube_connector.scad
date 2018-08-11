/*
Adapted from: Hose barb adapter and manifold by papergeek  www.thingiverse.com/thing:158717

*/

sides = 200;

//tube_connector(4, 1, 4, 0, 4);

module tube_connector_unit(Size=4, Size_barb_count=4, Size_Bore) {
  difference() {
    union() {
      for ( i = [1:Size_barb_count]) {
        translate([0, 0, (i - 1) * Size * 0.9])
          cylinder( h = Size , r2 = Size * 0.85 / 2, r1 = Size * 1.16 / 2, $fa = 0.5, $fs = 0.5, $fn=sides);
      }
    }
    translate([0, 0, -0.1])
      cylinder(h=Size*Size_barb_count , d=Size_Bore, $fa=0.5, $fs=0.5, $fn=sides);
  }
}


module tube_connector(Size=4, Wall_Thickness=1, Size_barb_count = 4, Shoulder=1, Shoulder_height) {

  Size_Bore = Size - (Wall_Thickness * 2);
  Size_1 = Size + 2*Shoulder; // size of manifols 

  union() {
    translate([0, 0, Shoulder_height/2])
    difference() {
      cylinder( h = Shoulder_height , d = Size_1, center = true, $fa = 0.5, $fs = 0.5, $fn = 100 )  ;
      cylinder(h = Shoulder_height + 1, d1 = Size_Bore, d2 = Size_Bore, center = true, $fa = 0.5, $fs = 0.5 );
    }
    translate([0, 0, Shoulder_height]) {
      tube_connector_unit(Size, Size_barb_count, Size_Bore);
    }
  }
}

