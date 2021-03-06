
include <../../lib/material.scad>;
include <../../lib/bolt/bolt.scad>;

//  cone_head_bolt (lenght, thread_d, head_h, head_d, a_depth, tolerance, quality, allen_o, thread, pitch);

metal() {
  cone_head_bolt (10, 3, 1.5, 5.5, 2, 0.2, 32, 2, "metric", 0.425);
}

/*        
    cone_head_bolt (lenght, thread_d, head_h, head_d, a_depth, tolerance, quality, allen_o, thread, pitch);
        lenght      =   threaded bar lenght
        thread_d    =   threaded bar diameter width
        head_h      =   cylindrical bolt head height
        head_d      =   cylindrical bolt head diameter
        a_depth     =   hexagonal Allen keyhole depth height
        tolerance   =   tolerance of entire measures (always positive, addition and subtraction already
                        calculated within the script
        quality     =   overall quality of the returned function (ref. $fn)
        *allen_o    =   allen hexagonal keyhole dimension
        *thread     =   string variable declaring measure type -> "metric" or "imperial"
        *pitch      =   stands for thread pitch
*/
