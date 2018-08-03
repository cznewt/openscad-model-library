
include <../../lib/joint/joint_corner_rect.scad>;

olive=[0.7,0.7,0.7];

module rod(rod_diameter,rod_length)
{
 cube([rod_diameter,rod_length,rod_diameter]);
}

color(olive) translate([-10,13,13]) rotate([90,0,0])
  rod(20,800-26);

color(olive) translate([-10,800+10,13]) rotate([90,0,0])
  rod(20,800-26);

color(olive) translate([600-10,13,13]) rotate([90,0,0])
  rod(20,800-26);

color(olive) translate([600-10,800+10,13]) rotate([90,0,0])
  rod(20,800-26);


color(olive) translate([-10,13,13+800]) rotate([90,0,0])
  rod(20,1200-26);

color(olive) translate([-10,800+10,13+800]) rotate([90,0,0])
  rod(20,1200-26);

color(olive) translate([600-10,13,13+800]) rotate([90,0,0])
  rod(20,1200-26);

color(olive) translate([600-10,800+10,13+800]) rotate([90,0,0])
  rod(20,1200-26);


color(olive) translate([-10,13,0]) rotate([0,0,0])
  rod(20,800-26);

color(olive) translate([600-10,13,0]) rotate([0,0,0])
  rod(20,800-26);

color(olive) translate([600-10,-10,0]) rotate([0,0,90])
  rod(20,600-26);

color(olive) translate([600-10,800-10,0]) rotate([0,0,90])
  rod(20,600-26);


color(olive) translate([600-10,13,800-10]) rotate([0,0,0])
  rod(20,800-26);

color(olive) translate([600-10,-10,800-10]) rotate([0,0,90])
  rod(20,600-26);

color(olive) translate([600-10,800-10,800-10]) rotate([0,0,90])
  rod(20,600-26);


color(olive) translate([-10,13,2000-10]) rotate([0,0,0])
  rod(20,800-26);

color(olive) translate([600-10,13,2000-10]) rotate([0,0,0])
  rod(20,800-26);

color(olive) translate([600-10,-10,2000-10]) rotate([0,0,90])
  rod(20,600-26);

color(olive) translate([600-10,800-10,2000-10]) rotate([0,0,90])
  rod(20,600-26);



color([0,1,0]) translate([0,0,800]) rotate([-90,0,0])
  connector_mid_front_corner(20,50,2,0.1);

color([0,1,0]) translate([0,800,800]) rotate([90,0,0])
  connector_mid_front_corner(20,50,2,0.1);


color([0,1,0]) translate([600,0,800]) rotate([90,0,180])
  connector_mid_back_corner(20,50,2,0.1);

color([0,1,0]) translate([600,800,800]) rotate([-90,0,180])
  connector_mid_back_corner(20,50,2,0.1);


color([0,1,0]) translate([0,0,0]) rotate([0,0,0])
  connector_top_bot_corner(20,50,2,0.1);

color([0,1,0]) translate([0,800,0]) rotate([0,0,270])
  connector_top_bot_corner(20,50,2,0.1);

color([0,1,0]) translate([600,0,0]) rotate([0,0,90])
  connector_top_bot_corner(20,50,2,0.1);

color([0,1,0]) translate([600,800,0]) rotate([0,0,180])
  connector_top_bot_corner(20,50,2,0.1);


color([0,1,0]) translate([0,0,2000]) rotate([270,0,0])
  connector_top_bot_corner(20,50,2,0.1);

color([0,1,0]) translate([0,800,2000]) rotate([0,90,270])
  connector_top_bot_corner(20,50,2,0.1);

color([0,1,0]) translate([600,0,2000]) rotate([270,0,90])
  connector_top_bot_corner(20,50,2,0.1);

color([0,1,0]) translate([600,800,2000]) rotate([0,90,180])
  connector_top_bot_corner(20,50,2,0.1);
