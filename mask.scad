$fa = 1;
$fs = 0.04;
height = 1;
e = 0.01;

module round_over(radius) {
    difference() {
        cube([radius, radius, height+e]);
        cylinder(r=radius, h=height+e+e);
    }
}

module mark() {
    cylinder(r=1.5, h=height + e, $fn=3);
}

module nub() {
    cylinder(r=1.5, h=height + e);
}

module mask_plate() {
    difference() {
        // Main plate
        difference() {
            cube([111, 40, height]);
           
            translate([2, 38, 0])
                rotate(90)
                round_over(2);
            translate([2, 2, 0])
                rotate(180)
                round_over(2);
            translate([109, 38, 0])
                round_over(2);
            translate([109, 2, 0])
                rotate(270)
                round_over(2);
        }
        
        // Viewfinder
        translate([8, 15, 0])
            cube([25, 16, height + e]);
        
        // Brilliant window
        translate([57, 18,0])
            cube([16, 10, height + e]);
        
        // Rangefinder patch
        translate([99, 18, 0])
            cube([10, 10, height + e]);
    }
    
    
    // 6x7 marks
    union() {
        translate([10,31,0])
        rotate(30)
            mark();
        
        translate([31,31,0])
        rotate(30)
            mark();
        
        translate([10,15,0])
        rotate(90)
            mark();
        
        translate([31,15,0])
        rotate(90)
            mark();
    }
    
    // nubs
    union() {
        translate([1, 33, 0])
            nub();
        
        translate([110, 10, 0])
            nub();
    }
}

mask_plate();