/**********************************
based on original design by rpgweb
https://www.printables.com/model/61073-the-perfect-gloomhavenfrosthaven-standee-with-opti
please adhere to Creative Commons license as outlined above
**********************************/

$fa = 1;
$fs = 0.4;

// ----- BASE ----- //

// plate
difference(){
    cylinder(h=3, r=14); //base plate
    cylinder(h=1.5, r=3); //bottom hole
}

// cogs
translate([0,0,3])
    difference(){
        //center
        cylinder(h=3, r=3.5); // outer cog radius
        
        cr = 4; // radius from center to cog cutout cirle center
        dg = 36; // degrees between each cog
        
        for (i=[0:1:9])

        translate([sin(i*dg)*cr,cos(i*dg)*cr,0])
        cylinder(h=3, r=1); // size of each cog
    }
    
// spine
translate([0,0,3])
translate([0,0,3])
    cylinder(h=2, r=3, $fn=10);

// cap
translate([0,0,3])
translate([0,0,3])
translate([0,0,2])
    cylinder(h=1, r1=3.25, r2=2.5, $fn=10);
    
// ----- TOP ----- //
  
// clearance  
cl = .1;

// plate
translate([-30,0,0])
difference(){
    cylinder(h=3, r=14); //plate
    cylinder(h=2-cl, r=3+(cl/2), $fn=10); //hole
    translate([0,0,2-cl])
    cylinder(h=1+cl,r=3.25+(cl/2), $fn=10); //hole countersink
    translate([-11,0,0])
    cylinder(h=3, r=5.5, $fn=6); //number slot
}

/*

// standee holder row #1
translate([-22,-8,3])
cube([2,16,2]); //base box
translate([-21,-8,3])
cylinder(h=2,r=1); //rounded end 1
translate([-21,-8,5])
sphere(1); //rounded end top joint 1
translate([-21,8,3])
cylinder(h=2,r=1); //rounded end 2
translate([-21,8,5])
sphere(1); //rounded end top joint 2
translate([-21,-8,5])
rotate([-90,0,0])
cylinder(h=16,r=1); //rounded top

// standee holder row #2

translate([-26.5,-11,3])
cube([2,22,2]);
translate([-25.5,-11,3])
cylinder(h=2, r=1);
translate([-25.5,-11,5])
sphere(1);
translate([-25.5,11,3])
cylinder(h=2, r=1);
translate([-25.5,11,5])
sphere(1);
translate([-25.5,-11,5])
rotate([-90,0,0])
cylinder(h=22,r=1); //rounded top

// standee holder row #3

translate([-31,-12,3])
cube([2,8,2]);
translate([-31,4,3])
cube([2,8,2]);

// standee holder row #4

translate([-35.5,-12,3])
cube([2,8,2]);
translate([-35.5,4,3])
cube([2,8,2]); 

*/



