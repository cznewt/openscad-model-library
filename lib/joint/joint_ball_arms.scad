// Ball joint in SCAD by Erik de Bruijn
// Based on a design by Makerblock ( http://makerblock.com/2010/03/blender-help/ )
size=10; // size of the ball joint
joint_spacing =0.5; // some space between them?
joint_thickness = 2; // thickness of the arms
joint_arms = 5; // how many arms do you want?
arm_width = 10; // actually: how much is removed from the arms Larger values will remove more

//render settings
$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice

//print();

ball();
//










joint();


//translate([size*2+10,0,0]) ball();
//rotate([0,180,0]) joint();


module ball()
{
	sphere(r=size);
	translate([0,0,-size]) cylinder(r1=8,r2=6,h=3);
	translate([0,0,-size-3]) cylinder(r=8,h=3);
}



module joint()
{
difference()
{
	sphere(r=size+joint_spacing+joint_thickness);
	sphere(r=size+joint_spacing);
	translate([0,0,-size-3]) cube([size+joint_spacing+joint_thickness+25,size+joint_spacing+joint_thickness+25,18],center=true);
	for(i=[0:joint_arms])
	{
		rotate([0,0,360/joint_arms*i]) translate([-arm_width/2,0, -size/2-4])
			cube([arm_width,size+joint_spacing+joint_thickness+20,size+6]);
	}
}
	translate([0,0,size-2]) cylinder(r2=8,r1=8,h=5);

}