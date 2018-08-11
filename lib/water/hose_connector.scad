
sides = 50;

//connector_garden_hose(5, 0.1);

module connector_garden_hose(height, clear)
{

    riA = 14/2;
    riB = 9/2-0.25;  // rimthickness trouble

    vert0 = 64;
    vert1 = 32;

    t1 = height; // minimum wallthickness
    r1 = 38/2;

    // initial standoff
    t2 = 4; 
    r2 = 20/2;

    // torodial reduction
    t3 = 8; 
    r3= 14/2;

    // trapezoidal
    t4 = 0.75;
    t5 = 1.50; r5 = 17/2;
    t6 = 0.75;
    s6 = t1+t2+t3+t4+t5+t6;

    // tip
    t7 = 2.50;
    t8 = 3.00;
    t9 = 3.5;
    r7 = 16/2;
    r8 = 11.5/2; // critical
    r9 = r7;

    /*
    todo  
    smaller tiptorus (2.5mm radius instead of 3.0mm
    */

    difference()
    {

        union()
        {
        
    cylinder(r=r2,h=t1,$fn=sides);

        translate([0,0,t1])
        {
            cylinder(r=r2,h=t2,$fn=sides);

            translate([0,0,t2])
            difference()
            {
            cylinder(r=r2,h=t3,$fn=sides);

            translate([0,0,t3])
            scale([1,1,t3/(r2-r3)])
            rotate_extrude(convexity=3, $fn=sides)
            translate([r2,0,0])
            circle(r=r2-r3,$fn=sides);
            }

        }

        // trapezoidal part
        translate([0,0,t1+t2+t3])
        rotate_extrude(convexity=3, $fn=sides)
        polygon(points=[[0,0],[r3,0],[r5,t4],[r5,t4+t5],[r7,t4+t5+t6],[0,t4+t5+t6]],paths=[[0,1,2,3,4,5]]);

        //tip
        translate([0,0,s6])
        {
            cylinder(r = r7, h=t7+t8,$fn=sides) ;
            translate([0,0,t7+t8+0.5])
            torus(2.5,r7-2.5,vert1,vert0);
            // maybe add cylinder here ################### "t_8_1/2"
        }

    }

    // too low in z
    translate([0,0,s6+t7+t8/2])
    torus(t8/2*sqrt(2), (r7+r8)/2 + (r7-r8)/2*sqrt(2),4,vert0); // test

    translate([0,0,s6+t7+t8/2])
    torus(t8/2, r8+t8/2,vert1,vert0); // test

translate([0,0,s6+t7+t8/2])
torus(t8/2+.9, r8+t8/2+2,vert1,vert0); // test


    cylinder(r=riB,h= (t1+24)*1.1,$fn=sides);  // to see 24 mm 

    translate([0,0,-0.05])
    //cylinder(r1=riA,r2=riB,h=10,$fn=vert0);
    //cylinder(r1=riA,r2=riB,h=10,$fn=vert0);  // h=10 just looks good
    cylinder(r1=riA+1.0,r2=riB,h=12,$fn=sides);  // h=10 just looks good


    // DEBUGGING CUT
    // translate([30,0,0]) cube([60,60,60],center=true);


    }

}

module torus(ra,rb,va,vb)
{
    rotate_extrude(convexity=3, $fn=sides)
    translate([rb,0,0])
        rotate(45,[0,0,1])
            circle(r=ra,$fn=sides);
}
