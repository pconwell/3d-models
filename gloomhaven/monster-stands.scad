/**********************************
based on original design by rpgweb
https://www.printables.com/model/61073-the-perfect-gloomhavenfrosthaven-standee-with-opti
please adhere to Creative Commons license as outlined above
**********************************/

// -------------------------------- //
// ---------- PARAMETERS ---------- //
// -------------------------------- //

$fa = 1;
$fs = 0.4;

cl = 0.1;             // clearance
dg = 36;              // degrees: 360 ÷ 10 = 36

// -------------------------------- //
// ------------ MODULES ----------- //
// -------------------------------- //

module standee_holder(position, length) {
   translate(position) {
      cube([length, 2, 3]);

      height = 3;

      // End caps
      translate([0, 1, 0]) cylinder(h=height, r=1);
      translate([length, 1, 0]) cylinder(h=height, r=1);

      // Spheres on top
      translate([0, 1, height]) sphere(1);
      translate([length, 1, height]) sphere(1);

      // Arched top
      translate([0, 1, height])
         rotate([0, 90, 0])
         cylinder(h=length, r=1);
   }
}

module dial_arm_indent(position_number, offset_degrees) {
   angle = position_number * dg;

   intersection() {
      difference() {
         cylinder(h=2, r=4.625);
         cylinder(h=2, r=3.625);
      }
      rotate([0, 0, angle + offset_degrees])
         cube(10);
   }

   translate([sin(-angle) * 4, cos(angle) * 4, 0])
      difference() {
         cylinder(h=2, r=1);
         translate([sin(-angle) * -4, -1 * (cos(angle) * 4), 0])
            difference() {
               cylinder(h=2, r=5.5);
               cylinder(h=2, r=4.625);
            }
      }
}

module text_wrapper(characters, ext_height, font_size) {
   linear_extrude(height = ext_height)
      text(characters, size = font_size, font = "Arial:style=Bold", halign = "center", valign = "center");
}

// -------------------------------- //
// ------------- BASE ------------- //
// -------------------------------- //

difference() {
   cylinder(h=3, r=14);       // base plate
   cylinder(h=1.5, r=6);      // bottom hole
}

translate([0, 0, 3])
   difference() {
      cylinder(h=3, r=3.5);   // outer cog radius
      cr = 4;

      for (i = [0:1:9]) {
         x = sin(i * dg) * cr;
         y = cos(i * dg) * cr;
         translate([x, y, 0])
            cylinder(h=3, r=1);
      }
   }

translate([0, 0, 6])
   rotate([0, 0, 90])
      cylinder(h=1, r=3, $fn=5);

translate([0, 0, 7])
   rotate([0, 0, 90])
      cylinder(h=1, r1=3.25, r2=2.5, $fn=5);

// -------------------------------- //
// ------------- TOP -------------- //
// -------------------------------- //

translate([-40, 0, 0]) {
   difference() {
      cylinder(h=2, r=14);  // top plate

      // hole & countersink
      rotate([0, 0, 90])
         cylinder(h=1 - cl, r=3 + (cl / 2), $fn=5);

      translate([0, 0, 1 - cl])
         rotate([0, 0, 90])
            cylinder(h=1 + cl, r1=3.25 + (cl / 2), r2=2.5 + (cl / 2), $fn=5);

      // number slot & bevel
      translate([0, -11, 0]) {
         rotate([0, 0, 90]) {
            cylinder(h=3, r=5.5, $fn=6);
            translate([0, 0, 1])
               cylinder(h=3, r=6.5, $fn=6);
         }
      }
   }

   // Standee Holders
   standee_holder([-8, 8, 2], 16);   // row 1
   standee_holder([-10, 4, 2], 20);  // row 2
   standee_holder([-10, 0, 2], 5);   // row 3a
   standee_holder([5, 0, 2], 5);     // row 3b
   standee_holder([-10, -4, 2], 5);  // row 4a
   standee_holder([5, -4, 2], 5);    // row 4b
}

// -------------------------------- //
// ------------- DIAL ------------- //
// -------------------------------- //

translate([40, 0, 0]) {
   difference() {
      cylinder(h=2, r=14);     // dial plate
      cylinder(h=2, r=5.5);    // core hole
   }

   intersection() {
      difference() {
         cylinder(h=2, r=5.5);
         cylinder(h=2, r=3.625);
      }
      intersection() {
         rotate([0, 0, -45]) cube(10);
      }
   }

   intersection() {
      difference() {
         cylinder(h=2, r=5.5);
         cylinder(h=2, r=3.625);
      }
      intersection() {
         rotate([0, 0, 160]) cube(10);
         rotate([0, 0, 110]) cube(10);
      }
   }

   // arms
   dial_arm_indent(1, 0);     // upper
   dial_arm_indent(4, 90);    // lower

   // outer numerals 0–9
   difference() {
      cr = 10;
      for (i = [0:1:9]) {
         x = sin(i * dg) * cr;
         y = cos(i * dg) * cr;
         angle = -i * dg;

         translate([x, y, 0])
            cylinder(h=2, r=5.5);

         color("black")
         translate([x, y, 2])
            rotate([0, 0, angle + 180])
               text_wrapper(str(i), 0.4, 6);
      }
      cylinder(h=3, r=5.5); // remove "inner" section
   }
}

// -------------------------------- //
// ------------- 10 HP ------------ //
// -------------------------------- //

translate([0, -40, 0]) {
   difference() {
      union() {
         cylinder(h=1, r=16, $fn=3);
         rotate([0, 0, 30]) cylinder(h=2, r=16, $fn=3);
         rotate([0, 0, 60]) cylinder(h=1, r=16, $fn=3);
         rotate([0, 0, 90]) cylinder(h=2, r=16, $fn=3);
      }
      cylinder(h=1.5, r=6); // bottom hole
   }

   difference() {
      translate([0, 0, 2])
         cylinder(h=1.5, r=6 - cl);
      translate([0, 0, 3])
         text_wrapper("HP", 0.5, 4);
   }
}

// -------------------------------- //
// ----------- SHIELD ------------- //
// -------------------------------- //

translate([0, 40, 0]) {
   difference() {
      cylinder(h=2, r=15);       // base
      cylinder(h=1.5, r=6);      // bottom hole
   }

   difference() {
      translate([0, 0, 2])
         cylinder(h=1.5, r=6 - cl);
      translate([0, 0, 3])
         text_wrapper("S", 0.5, 5);
   }
}
