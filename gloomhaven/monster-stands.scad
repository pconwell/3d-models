/**********************************
based on original design by rpgweb
https://www.printables.com/model/61073-the-perfect-gloomhavenfrosthaven-standee-with-opti
please adhere to Creative Commons license as outlined above
**********************************/

$fa = 1;
$fs = 0.4;

// -------------------------------- //
// ------------- BASE ------------- //
// -------------------------------- //

// plate
difference(){
    cylinder(h=3, r=14); //base plate
    cylinder(h=1.5, r=6); //bottom hole
}

// cogs
translate([0,0,3])
    difference(){
        //center
      cylinder(h=3, r=3.5); // outer cog radius
        
      cr = 4; // radius from center to cog cutout cirle center
      dg = 36; // degrees between each cog
        
      for (i=[0:1:9]){
           
      x = sin(i * dg) * cr;
      y = cos(i * dg) * cr;

      translate([x,y,0])
      cylinder(h=3.1, r=1); // size of each cog
    
            }
        }
    
// spine
translate([0,0,6])
    rotate([0,0,90])
    cylinder(h=2, r=3, $fn=5);

// cap
translate([0,0,8])
    rotate([0,0,90])
    cylinder(h=1, r1=3.25, r2=2.5, $fn=5);
    
// -------------------------------- //
// ------------- TOP -------------- //
// -------------------------------- //
  
// clearance  
cl = .1;
        
translate([-30,0,0]){

// plate
//translate([-30,0,0]){
difference(){
   cylinder(h=3, r=14); //plate
   rotate([0,0,90])
   cylinder(h=2-cl, r=3+(cl/2), $fn=5); //hole
   translate([0,0,2-cl])
   rotate([0,0,90])
   cylinder(h=1+cl,r=3.25+(cl/2), $fn=5); //hole countersink
   translate([0,-11,0]){
   rotate([0,0,90]){
   cylinder(h=3, r=5.5, $fn=6); //number slot
   translate([0,0,1])
   cylinder(h=3, r=6.5, $fn=6);
   translate([0,0,2])
   cylinder(h=3, r=7.5, $fn=6);
   }}
   }
   
// Standee Holder Row #1
translate([-8,8,3]){
cube([16,2,3]);
translate([0,1,0])
cylinder(h=3, r=1);
translate([0,1,3])
sphere(1);
translate([16,1,3])
sphere(1);
translate([16,1,0])
cylinder(h=3, r=1);
translate([0,1,3])
rotate([0,90,0])
cylinder(h=16,r=1);
}
   
// Standee Holder Row #2
translate([-10,3.9,3]){
cube([20,2,3]);
translate([0,1,0])
cylinder(h=3, r=1);
translate([20,1,0])
cylinder(h=3, r=1);
translate([0,1,3])
sphere(1);
translate([20,1,3])
sphere(1);
translate([0,1,3])
rotate([0,90,0])
cylinder(h=20,r=1);
}

// Standee Holder Row #3a
translate([-10,-0.2,3]){
cube([5,2,3]);
translate([0,1,0])
cylinder(h=3, r=1);
translate([5,1,0])
cylinder(h=3, r=1);
translate([0,1,3])
sphere(1);
translate([5,1,3])
sphere(1);
translate([0,1,3])
rotate([0,90,0])
cylinder(h=5,r=1);
}

// Standee Holder Row #3b
translate([5,-0.2,3]){
cube([5,2,3]);
translate([0,1,0])
cylinder(h=3, r=1);
translate([5,1,0])
cylinder(h=3, r=1);
translate([5,1,3])
sphere(1);
translate([0,1,3])
sphere(1);
translate([0,1,3])
rotate([0,90,0])
cylinder(h=5,r=1);
}

// Standee Holder Row #4a
translate([-10,-4.3,3]){
cube([5,2,3]);
translate([0,1,0])
cylinder(h=3, r=1);
translate([5,1,0])
cylinder(h=3, r=1);
translate([0,1,3])
sphere(1);
translate([5,1,3])
sphere(1);
translate([0,1,3])
rotate([0,90,0])
cylinder(h=5,r=1);
}

// Standee Holder Row #4b
translate([5,-4.3,3]){
cube([5,2,3]);
translate([0,1,0])
cylinder(h=3, r=1);
translate([5,1,0])
cylinder(h=3, r=1);
translate([5,1,3])
sphere(1);
translate([0,1,3])
sphere(1);
translate([0,1,3])
rotate([0,90,0])
cylinder(h=5,r=1);
}

} // end translate

// -------------------------------- //
// ------------- DIAL ------------- //
// -------------------------------- //

// move to coordinates for this piece
translate([30, 0, 0]) {

// plate
//translate([30,0,0])
difference(){
    cylinder(h=2, r=14); //plate
    cylinder(h=2.1, r=5.5); //core hole
} 

// UPPER ARM
// Upper Inner Ring - Support
intersection(){
difference(){
   cylinder(h=2, r=5.5);
   cylinder(h=2.1, r=3.625);
}
intersection(){
rotate([0,0,-45])
cube(10);
//rotate([0,0,90])
//cube(10);
}
}

intersection(){
difference(){
   cylinder(h=2, r=5.5);
   cylinder(h=2.1, r=3.625);
}
intersection(){
rotate([0,0,160])
cube(10);
rotate([0,0,110])
cube(10);
}
}

// Arms
intersection(){
difference(){
   cylinder(h=2, r=4.625);
   cylinder(h=2.1, r=3.625);
}
rotate([0,0,36])
cube(10);
}

intersection(){
difference(){
   cylinder(h=2, r=4.625);
   cylinder(h=2.1, r=3.625);
}
rotate([0,0,-36-90])
cube(10);
}


d1 = 36*9;
translate([sin(d1) * 4,cos(d1) * 4,0])
difference(){
cylinder(h=2, r=1);
   translate([sin(d1) * -4,-1*(cos(d1) * 4),0])
   difference(){
   cylinder(h=2.1, r=5.5);
   cylinder(h=2.1, r=4.625);
}
}

d2 = 36*6;
translate([sin(d2) * 4,cos(d2) * 4,0])
difference(){
cylinder(h=2, r=1);
   translate([sin(d2) * -4,-1*(cos(d2) * 4),0])
   difference(){
   cylinder(h=2.1, r=5.5);
   cylinder(h=2.1, r=4.625);
}
}



// outer numerals 0-9, radially outward-facing
 cr = 10; // distance of texture disc from center
 dg = 36; // degrees between each disc

difference(){
   for (i = [0:1:9]) {
      x = sin(i * dg) * cr;
      y = cos(i * dg) * cr;
      angle = -i * dg; // rotate so text faces out

      //texture discs
      translate([x, y, 0])
      cylinder(h=2, r=5.5);

      // number text, raised and facing outward
      color("black") //for screen viewing only
      translate([x, y, 2])  // raise above disc
      rotate([0, 0, angle + 180])  // face outward
      linear_extrude(height=.2)
      text(str(i), size=6, font="Arial:style=Bold", halign="center", valign="center");
 };
 cylinder(h=3, r=5.5); // remove "inner" portion of texture discs
}
 
} // end translate


// -------------------------------- //
// ------------- 10 HP ------------ //
// -------------------------------- //

translate([0,-40,0]){
difference(){
union(){
cylinder(h=1.5, r=16, $fn=3);
rotate([0,0,30])
cylinder(h=3, r=16, $fn=3);
rotate([0,0,60])
cylinder(h=1.5, r=16, $fn=3);
rotate([0,0,90])
cylinder(h=3, r=16, $fn=3);
}
cylinder(h=1.5, r=6);
}
difference() {
        translate([0, 0, 3])
            cylinder(h=1.5, r=5.9);

        // engraved text — lowered slightly into cylinder
        translate([0, 0, 4.01])  // just into top surface
        rotate([0, 0, 0])
        linear_extrude(height = 0.6)
            text("HP", size = 4, font = "Arial", halign = "center", valign = "center");
    }
   
}

translate([0,40,0]){
   difference(){
   cylinder(h=3, r=16);
   cylinder(h=1.5, r=6);
   }
difference() {
        translate([0, 0, 3])
            cylinder(h=1.5, r=5.9);

        // engraved text — lowered slightly into cylinder
        translate([0, 0, 4.01])  // just into top surface
        rotate([0, 0, 0])
        linear_extrude(height = 0.6)
            text("S", size = 4, font = "Arial", halign = "center", valign = "center");
    }
      
}
