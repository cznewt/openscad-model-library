
include <../../lib/material.scad>;
include <../../lib/bolt/bolt.scad>;

//  allen_bolt (lenght, thread_d, head_h, head_d, a_depth, tolerance, quality, bool_round, allen_o, thread, pitch);
metal() {
  allen_bolt (10, 3, 3.5, 5.5, 3, 0.2, 50, 1, 2.5, "metric", 0.425);
}
/*

    variables marked by an * can be declared or not. Just remember that if you want to not set (eg. "allen_o") a variable, next vars MUST NOT BE DECLARED!!! Look at examples.

    allen_bolt (lenght, thread_d, head_h, head_d, a_depth, tolerance, quality, allen_o, thread, pitch);
        lenght      =   threaded bar lenght
        thread_d    =   threaded bar diameter width
        head_h      =   cylindrical bolt head height
        head_d      =   cylindrical bolt head diameter
        a_depth     =   hexagonal Allen keyhole depth height
        tolerance   =   tolerance of entire measures (always positive, addition and subtraction  already calculated within the script
        quality     =   overall quality of the returned function (ref. $fn)
        *bool_round =   boolean that set roundness of the head
        *allen_o    =   allen hexagonal keyhole dimension
        *thread     =   string variable declaring measure type -> "metric" or "imperial"
        *pitch      =   stands for thread pitch
        
*/
