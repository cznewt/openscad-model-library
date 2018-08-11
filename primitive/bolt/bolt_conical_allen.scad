
include <../../lib/material.scad>;
include <../../lib/bolt/bolt.scad>;

//  conical_allen_bolt (height, width, head_size, head_height, tolerance, quality, thread, bool_round, allen_o, thread_len, pitch);

metal() {
  translate ([63, 0, 0]) conical_allen_bolt (20, 3, 6, 4, 0.2, 32, "metric", 1, 2.5, 10, 0.4);
}

/*

    variables marked by an * can be declared or not. Just remember that if you want to not set (eg. "allen_o") a variable, next vars MUST NOT BE DECLARED!!! Look at examples.

    conical_allen_bolt (height, width, head_size, head_height, tolerance, quality, thread, finish, allen_o, thread_len, pitch);
        height      =   total bar lenght
        width       =   bar diameter width
        head_size   =   diameter width of head cone base
        head_height =   height of cone head
        tolerance   =   tolerance of entire measures (always positive, addition and subtraction  already calculated within the script
        quality     =   overall quality of the returned function (ref. $fn)


*/
