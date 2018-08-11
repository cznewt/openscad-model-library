
include <../../lib/material.scad>;
include <../../lib/bolt/bolt.scad>;

//  grub_bolt (lenght, thread_d, a_depth, tolerance, quality, allen_o, thread, pitch);

metal() {
  translate ([0, 0, 0]) grub_bolt (4, 3, 3, 0.2, 32, 1.5, "metric", 0.425);
}

/*
    grub_bolt (lenght, thread_d, a_depth, tolerance, quality, allen_o, thread, pitch);
        lenght      =   threaded bar lenght
        thread_d    =   threaded bar diameter width
        a_depth     =   hexagonal Allen keyhole depth height
        tolerance   =   tolerance of entire measures (always positive, addition and subtraction already
                        calculated within the script
        quality     =   overall quality of the returned function (ref. $fn)
        *allen_o    =   allen hexagonal keyhole dimension
        *thread     =   string variable declaring measure type -> "metric" or "imperial"
        *pitch      =   stands for thread pitch        
*/
