
circuitBoard(30, 30, 2, 10, 5, 2.54);

module circuitBoardPinHoles(pins, rows, step, depth)
{
    centerX = pins*step/2;
    centerY = rows*step/2;
    for(x=[0:pins-1],y=[0:rows-1])
        translate([x*step-centerX,y*step-centerY,depth-0.1])
            //cube([0.6,0.6,11.5]);
            cylinder(r=0.3, h=depth+0.2);
}

module circuitBoard(width,height,depth,pinsWidth,pinsHeight,pinsStep)
{
  color("limegreen") difference()
  {
    hull()
    {
      translate([-(width-6)/2,-(height-6)/2,-depth]) cylinder(r=3, h=depth );
      translate([-(width-6)/2, (height-6)/2,-depth]) cylinder(r=3, h=depth );
      translate([ (width-6)/2,-(height-6)/2,-depth]) cylinder(r=3, h=depth );
      translate([ (width-6)/2, (height-6)/2,-depth]) cylinder(r=3, h=depth );
    }
    circuitBoardPinHoles(10, 10, 2.54, depth);  

  }
}
