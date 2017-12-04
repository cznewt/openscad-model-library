
pinHeader(2,10,2.54);
//pinHeader(2,10,2);

module pinHeader(pins, rows, step)
{
    color("darkgrey") cube([step*pins,step*rows,step/2]);
  
    for(x=[0:pins-1],y=[0:rows-1])
        translate([x*step+(step/2+.6)/2,y*step+(step/2+.6)/2,-3.5])
          cube([0.6,0.6,11.5]);
}

