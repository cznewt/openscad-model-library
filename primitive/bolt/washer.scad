
include <../../lib/material.scad>;
include <../../lib/bolt/bolt.scad>;

//  washer (outer, inner, width, tolerance, quality, thread);

metal() {
  washer (3/8, 3/16, 1/16, 1/128, 32, "imperial");
}

/*

    washer (outer, inner, width, tolerance, quality, thread);
        outer       =   outer washer diameter
        inner       =   inner washer diameter
        tolerance   =   tolerance of entire measures (always positive, addition and subtraction already
                        calculated within the script
        quality     =   overall quality of the returned function (ref. $fn)
        *thread     =   string variable declaring measure type -> "metric" or "imperial"
        
*/
