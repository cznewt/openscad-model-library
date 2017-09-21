// dsub.scad
//
// D-Sub connector library by 'dpeart'
// http://forums.reprap.org/read.php?313,577003

function db_conn_table(idx) =
				  // [b,d,f,k]
	idx == "db9F"  ? [12.50,11.10,6.53,2.11] :
	idx == "db9R"  ? [12.50,11.10,5.72,3.35] :
	idx == "db15F" ? [16.66,15.27,6.53,2.11] :
	idx == "db15R" ? [16.66,15.27,5.72,3.35] :
	idx == "db25F" ? [23.52,22.15,6.53,2.11] :
	idx == "db25R" ? [23.52,21.39,5.72,3.35] :
	idx == "db37F" ? [31.75,29.54,6.53,2.11] :
	idx == "db37R" ? [31.75,29.54,5.72,3.35] :
	idx == "db50F" ? [30.56,29.19,7.93,2.11] :
	idx == "db50R" ? [30.56,28.17,7.06,3.35] :
	"Error";

//dsub("db9R");
//dsub("db25R",0.2);

module dsub(conn, g=0)
{
    sides = 20;
    
    conn_dimensions = db_conn_table(conn);
    if(conn_dimensions == "Error")
    {
        echo(str("ERROR: Connector '", conn, "' not found"));
        echo("ERROR: Allowed are db9F, db9R, db15F, db15R, db25F, db25R, db37F, db37R, db50F and db50R.");
		
        color("red")
        {
            for ( a = [-45,45])
                rotate([0,0,a])
                    cube([4,20,4], true);
        }
    }
    else
    {
        b = conn_dimensions[0];
        d = conn_dimensions[1];
        f = conn_dimensions[2];
        k = conn_dimensions[3];

        cut_angle = 10;
        mounting_hole = 3.05;
        o = 2*(g+f-k)*tan(cut_angle);

        translate([0,0,-0.5])
        {
            union()
            {
                hull()
                {
                    //Upper Left
                    translate([-(g+d-k),(g+f-k),0])
                        cylinder(h=1, d=k, $fn=sides);
                    //Upper Right
                    translate([(g+d-k),(g+f-k),0])
                        cylinder(h=1, d=k, $fn=sides);
                    //Lower Left
                    translate([-(g+d-k)+o,-(g+f-k),0])
                        cylinder(h=1, d=k, $fn=sides);
                    //Lower Right
                    translate([(g+d-k)-o,-(g+f-k),0])
                        cylinder(h=1, d=k, $fn=sides);
                }

                // Mounting Holes
                translate([-b,0,0])
                    cylinder(h=1, d=g+mounting_hole, $fn=6);
                translate([b,0,0])
                    cylinder(h=1, d=g+mounting_hole, $fn=6);
            }
        }
    }
}
