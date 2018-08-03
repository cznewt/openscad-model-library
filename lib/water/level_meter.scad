
sides = 100;

// Water level meter measurements

// trubka prumer 50, plast 1.8 2m, 70 Kc
// POLOLU VL53L0X TIME-OF-FLIGHT DISTANCE SENSOR, 280 Kc
// https://www.tme.eu/cz/details/pololu-2490/moduly-cidel/pololu/vl53l0x-time-of-flight-distance-sensor/

module cable_holder() {
    translate([-4,-4*3,0])
        difference() {
            cube([8,8*3,8]);
            translate([-0.05,8,0])
                cube([8.1,8,4]);
        }
}

module glass_holder(glass_width){
    
    inner_hole_width = glass_width - 3.5;
    inner_hull_width = glass_width - 1;

    outer_hull_width = glass_width + 5;
    outer_hole_width = glass_width + 1;

    difference() {
        translate([-inner_hull_width/2,-inner_hull_width/2,0])
            cube([inner_hull_width,inner_hull_width,1]);
        translate([-inner_hole_width/2,-inner_hole_width/2,-0.05])
            cube([inner_hole_width,inner_hole_width,1.1]);
    }


    difference() {
        translate([-outer_hull_width/2,-outer_hull_width/2,0])
            cube([outer_hull_width,outer_hull_width,2]);
        translate([-outer_hole_width/2,-outer_hole_width/2,-0.05])
            cube([outer_hole_width,outer_hole_width,2.1]);
    }
}

module pipe(pipe_diameter,pipe_hull,height){
       difference() {
            cylinder(r=pipe_diameter/2+pipe_hull, h=height, $fn=sides);
        translate([0,0,-0.05])

            cylinder(r=pipe_diameter/2, h=height+0.1, $fn=sides);
       }

    }


module distance_meter_bottom(pipe_diameter,pipe_hull,depth)
{
    pipe_radius = pipe_diameter/2;
    bottom_radius = 3*pipe_radius;

    difference() {
        union() {
            //pipe holder
//            cylinder(r=pipe_radius, h=2*depth, $fn=sides);
            cylinder(r=bottom_radius, h=depth, $fn=sides);
            cylinder(r=pipe_radius+pipe_hull+depth, h=7*depth, $fn=sides);
        }
        // draining hole
        translate([-1/2*depth,-bottom_radius-0.05,-0.05])
            cube([depth,bottom_radius*2+0.1,depth/2+.1]);
        translate([-bottom_radius-0.05,-1/2*depth,-0.05])
            cube([bottom_radius*2+0.1,depth,depth/2+.1]);

        //pipe holder
        translate([0,0,-0.05])
            cylinder(r=pipe_radius-depth/2, h=2*depth+.1, $fn=sides);
      //  translate([0,0,-0.05])
       //     cylinder(r=pipe_radius, h=depth+.1, $fn=sides);
        translate([0,0,10])
            cylinder(r=pipe_radius+pipe_hull+0.1, h=6*depth+.1, $fn=sides);
        // bottom cuts
        translate([bottom_radius,bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=depth+.1, $fn=sides);
        translate([bottom_radius,-bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=depth+.1, $fn=sides);
        translate([-bottom_radius,bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=depth+.1, $fn=sides);
        translate([-bottom_radius,-bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=depth+.1, $fn=sides);

         translate([-40,0,depth*4]) rotate([0,90,0])
            cylinder(r=3, h=80, $fn=sides);
         translate([0,40,depth*5]) rotate([90,0,0])
            cylinder(r=3, h=80, $fn=sides);
    }

}

module distance_meter_top(pipe_diameter,pipe_hull,depth)
{
    pipe_radius = pipe_diameter/2;
    bottom_radius = 3*pipe_radius;

    conn_hole = 7*2.54+2;

    difference() {
        union() {
            //pipe holder
            cylinder(r=pipe_radius, h=22, $fn=sides);
            cylinder(r=bottom_radius, h=depth, $fn=sides);
            cylinder(r=pipe_radius+pipe_hull+depth, h=4*depth, $fn=sides);
          //  translate([-1/2*depth,-bottom_radius-0.05,-0.05])
            //   cube([depth,bottom_radius*2+0.1,depth/2+.1]);

        }
        //sensor_hole
        translate([-conn_hole/2,-7.5,20])
            cube([conn_hole,15,3]);

        //thru hole
        translate([-conn_hole/2,7.5-2.64,-0.05])
            cube([conn_hole,2.64,24]);

//        translate([-conn_hole/2,6-7*2.55,-0.05])
//            cube([conn_hole,2.55*5,22+.1]);

        // bottom conn_hole
        translate([-conn_hole/2,7,-0.05])
            cube([conn_hole,10,depth+.1]);
        translate([-10/2,-25,-0.05])
            cube([10,20,depth+.1]);

        // cable hole
        translate([0,5,4]) rotate([90,0,0])
            cylinder(r=3,h=100,$fn=sides);

        //pipe holder
        translate([0,0,22])
            cylinder(r=pipe_radius+pipe_hull+.1, h=5*depth+.1, $fn=sides);

        // bottom cuts
        translate([bottom_radius,bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=depth+.1, $fn=sides);
        translate([bottom_radius,-bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=depth+.1, $fn=sides);
        translate([-bottom_radius,bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=depth+.1, $fn=sides);
        translate([-bottom_radius,-bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=depth+.1, $fn=sides);
    }
    
    translate([0,0,21.5]) glass_holder(24);
    translate([0,bottom_radius-4*3-3,depth]) cable_holder();
    translate([0,-(bottom_radius-4*3-3),depth]) cable_holder();
    translate([bottom_radius-4*3-3,0,depth]) rotate([0,0,90]) cable_holder();
    translate([-(bottom_radius-4*3-3),0,depth]) rotate([0,0,90]) cable_holder();

}


module probe_holder(pipe_diameter,pipe_hull,depth)
{
    pipe_radius = pipe_diameter/2;
    bottom_radius = 2*pipe_radius;

    probe_radius = 12.9/2;

    difference() {
        union() {
            //pipe holder
            cylinder(r=bottom_radius, h=3*depth, $fn=sides);
            


        translate([-probe_radius-depth,35+depth/2,0])
            cube([probe_radius*2+depth*2,20,3*depth]);
        translate([0,35,0])
            cylinder(r=probe_radius+depth, h=3*depth, $fn=sides);


        translate([-probe_radius-depth,-35-depth/2,0])
            cube([probe_radius*2+depth*2,20,3*depth]);
        translate([0,-35,0])
            cylinder(r=probe_radius+depth, h=3*depth, $fn=sides);


        }
        // pipe cut
        translate([0,0,-.05])
            cylinder(r=pipe_radius+pipe_hull+.1, h=3*depth+.1, $fn=sides);

        translate([-probe_radius,35,-.05])
            cube([probe_radius*2,100,3*depth+.1]);
        translate([0,35,-.05])
            cylinder(r=probe_radius, h=3*depth+.1, $fn=sides);

        // bottom cuts
        translate([bottom_radius*1.25,bottom_radius*1.1,-0.05])
            cylinder(r=bottom_radius*10/10, h=3*depth+.1, $fn=sides);
        translate([bottom_radius,-bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=3*depth+.1, $fn=sides);
        translate([-bottom_radius,bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=3*depth+.1, $fn=sides);
        translate([-bottom_radius,-bottom_radius,-0.05])
            cylinder(r=bottom_radius*8/10, h=3*depth+.1, $fn=sides);
    }
    
}
