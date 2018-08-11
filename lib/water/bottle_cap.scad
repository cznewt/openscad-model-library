// $Header$

// cap/mount for PET bottle, usually 16oz, 20oz, 1l, 2l

// Adapted from https://www.thingiverse.com/thing:897760

sides = 50;

threadOD = 27.4;
threadID = 24.7;
neckD = 21.4;

// thread base width 2.2
threadPitch = 2.9;//3.2;
nTurns = 2.3;
toLip = 11;

threadDepth = (threadOD-threadID)/2;

//bottle_top();
//bottle_cap();

module bottle_top() {

  union() {
    translate([0,0,-2.9])
      cylinder(r=threadID/2+3,h=3,$fn=sides);
    cylinder(r=threadID/2-.2,h=toLip,$fn=sides);
    // can't really do a hull to make threads thicker, so
    // just repeat them.  Its not perfect, but you won't be able
    // to tell by the time it gets through the slicer
    for(offst=[.4,.7,1]) translate([0,0,3.25-offst])
      linear_extrude(height=nTurns*threadPitch,twist=-nTurns*360)
      translate([threadDepth,0,0]) circle(r=threadID/2 + threadDepth/2);
  }
}

// for removing from a solid to make a place
// where a PET bottle can be screwed in
module bottle_tap(h=10) {
  hh=h+0.5; // a little thread over the top
  union() {
    translate([0,0,-1]) cylinder(r=threadOD/2+.3,h=1  ,$fn=sides);
    translate([0,0,-2]) cylinder(r=threadID/2+.3,h=h+2,$fn=sides);

    // can't really do a hull to make threads thicker, so
    // just repeat them.  Its not perfect, but you won't be able
    // to tell by the time it gets through the slicer
    for(offst=[-.05,-.25,-.45,-.65]) translate([0,0,offst])
      linear_extrude(height=hh,twist=-(hh/threadPitch)*360,slices=80)
      translate([threadDepth,0,0])
      circle(r=threadID/2 + threadDepth/2,$fn=48);
  }
}

module bottle_cap() {
  translate([0,0,9]) {
      difference () {
        cylinder(r=threadOD/2+3,h=18,center=true,$fn=sides);
        translate([0,0, 1]) bottle_tap();
        translate([0,0,-9.1]) cylinder(r2=threadID/2,r1=threadOD/2+.3,h=2,$fn=sides);
      }
  }
}