/////////TODO
//clean up/add vars
//idk

include <roundedcube.scad>
include <threadlib/threadlib.scad>

plate_height = 1.6;
plate_raised = 25;
rear_panel_width = 90;
housing_height = 42;
angle = 10;
vents_height = 18;
vents_var = (tan(10) * 94 / 13);

module potentiomer () {
    translate([14, 80, -10.1]) 
    rotate([0, 0, 90]) import("/Users/guesthome/Downloads/POT10K.obj");
}

module nano() {
    rotate([0, 180, 0]) union() { 
        cube([18, 44, 1.6]);
        translate([5, 37, 1.6]) cube([8, 9, 4]);
    }
}

module usbb() {
    cube([8, 9, 4]);
}

module lidcutouts() {
    //4x3 keys
    for(k = [7 : 21 : 49]) {
        for(h = [7 : 19.05 : 66.11]) {
            translate([h, k, 0]) cube([14, 14, plate_height]);
        }
    }
    
    //2x1 keys
    for(h = [45.1 : 19.05 : 66.11]) {
        translate([h, 73, 0]) cube([14, 14, plate_height]);
    }
    
    //led
    translate([33.05, 80, 0]) cylinder(plate_height, 1.5, 1.5);
    
    //pot
    translate([14, 80, 0]) cylinder(plate_height, 4.0, 4.0);
}

module lid() {
    union() {
        roundedcube([85.15, 94 / cos(10), plate_height], false, 0.5, "z");
        difference() {
            translate([33.05, 80, -7]) cylinder(7, 3.5, 3.5);
            translate([33.05, 80, -7]) cylinder(7, 2.5, 2.5);
        }
    }
}

module lidscrewholes() {
    translate([2, 2, 0]) cylinder(plate_height, 1, 1);
    translate([83.15, 2, 0]) cylinder(plate_height, 1, 1);
    translate([2, 92, 0]) cylinder(plate_height, 1, 1);
    translate([83.15, 92, 0]) cylinder(plate_height, 1, 1);
}

module housingscrewholes() {
    translate([2, 2, 20]) tap("M2", turns=14);
    translate([83.15, 2, 20]) tap("M2", turns=14);
    translate([2, 92, 36]) tap("M2", turns=14);
    translate([83.15, 92, 36]) tap("M2", turns=14);
}

module plate () {
    difference() {
        difference() {
            lid();
            lidcutouts();
            lidscrewholes();
        }
        potentiomer();
    }
}

module housing() {
    union() {
        difference() {
            roundedcube([85.15, 94, housing_height], false, 0.5, "z");
            translate([4, 2, 1]) roundedcube([77.15, rear_panel_width, housing_height -1], false, 0.5, "z");
            translate([2, 4, 1]) roundedcube([81.15, 86, housing_height -1], false, 0.5, "z");
            housingscrewholes();
            
            //vents
            STUPID_LIST_OF_VENTS_AHHHHHHHHHHH();
            
            //usb cutout
            translate([51.575, 48, 5.6]) rotate([0, 180, 0]) union() { 
                cube([18, 44, 1.6]);
                translate([5, 37, 1.6]) cube([8, 9, 4.1]);
            }
            
            translate([0, 0, plate_raised]) rotate_about_pt(angle, 0, 0, [0, 0, 0])
            cube([85.15, 100, 17]);
        }
        //pot stand
        difference() {
            translate([14, 80, 1.0]) cylinder(housing_height -9, 4.0, 4.0);
            translate([0, 0, plate_raised]) rotate_about_pt(angle, 0, 0, [0, 0, 0]) translate([14, 80, -7]) cylinder(9, 8, 8);
        }
        
        //board post
        difference() {
            translate([33.575, 48, 1]) cube([18, 2, 3]);
            translate([48.075, 49, 1]) cylinder(3, 0.7, 0.7);
        }
    }
}

module rotate_about_pt(x, y, z, pt) { 
    translate(pt)
        rotate([x, y, z]) // CHANGE HERE
            translate(-pt)
                children();   
}

//translate([0, 0, plate_raised]) rotate_about_pt(angle, 0, 0, [0, 0, 0]) plate();

housing();

//potentiomer();

//translate([0, 0, 5.6]) nano();

module STUPID_LIST_OF_VENTS_AHHHHHHHHHHH() {
    for(x = [0 : 83.15 : 83.15]) {
        translate([x, 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, vents_height], false, 1.5 , "x");
        translate([x, 2 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 1 * vents_var + vents_height], false, 1.5 , "x");
        translate([x, 3 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 2 * vents_var + vents_height], false, 1.5 , "x"); 
        translate([x, 4 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 3 * vents_var + vents_height], false, 1.5 , "x");
        translate([x, 5 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 4 * vents_var + vents_height], false, 1.5 , "x");
        translate([x, 6 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 5 * vents_var + vents_height], false, 1.5 , "x");
        translate([x, 7 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 6 * vents_var + vents_height], false, 1.5 , "x");
        translate([x, 8 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 7 * vents_var + vents_height], false, 1.5 , "x");
        translate([x, 9 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 8 * vents_var + vents_height], false, 1.5 , "x");
        translate([x, 10 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 9 * vents_var + vents_height], false, 1.5 , "x");
        translate([x, 11 * 7.3125, 3.5]) rotate_about_pt(-10, 0, 0, [1, 1.5, 10]) roundedcube([2, 3, 10 * vents_var + vents_height], false, 1.5 , "x"); 
    }
}
