// pi360
 
// side length (in mm)
a = 59;
// circumradius (in mm)
R = 50.1884;
// inradius (apothem) (in mm)
r = 40.6033;
radius = R;
// height of the base (in mm)
baseHeight = 2;
// number of polygon sides
sides = 5;


union() {
    difference() {
        linear_extrude( height = baseHeight )
            union() {
                polyShape();
                circle( r=radius/2, $fn=sides);
            }
            cylinder (h=4, r=6.4/2, center = true, $fn=100);
    }
    // left side mounting block
    difference() {
        translate([-43.6033,21.5,2])
            cube([4,8,6], center = false);
        translate([-43.6033,25.5,5])
            rotate([0,90,0]) {
                cylinder (h=4, d=2.75, center=false, $fn=100);
            }
    }
    // right side mounting block
    difference() {
        translate([-43.6033,-29.5,2])
            cube([4,8,6], center = false);
        translate([-43.6033,-25.5,5])
            rotate([0,90,0]) {
                cylinder (h=4, d=2.75, center=false, $fn=100);
            }
    }
    rotate([0,0,72]) {
        // left side mounting block
        difference() {
            translate([-43.6033,21.5,2])
                cube([4,8,6], center = false);
            translate([-43.6033,25.5,5])
                rotate([0,90,0]) {
                    cylinder (h=4, d=2.75, center=false, $fn=100);
                }
        }
        // right side mounting block
        difference() {
            translate([-43.6033,-29.5,2])
                cube([4,8,6], center = false);
            translate([-43.6033,-25.5,5])
                rotate([0,90,0]) {
                cylinder (h=4, d=2.75, center=false, $fn=100);
            }
        }
    }
    rotate([0,0,144]) {
        // left side mounting block
        difference() {
            translate([-43.6033,21.5,2])
                cube([4,8,6], center = false);
            translate([-43.6033,25.5,5])
                rotate([0,90,0]) {
                cylinder (h=4, d=2.75, center=false, $fn=100);
            }
        }
        // right side mounting block
        difference() {
            translate([-43.6033,-29.5,2])
                cube([4,8,6], center = false);
            translate([-43.6033,-25.5,5])
                rotate([0,90,0]) {
                cylinder (h=4, d=2.75, center=false, $fn=100);
            }
        }
    }
    rotate([0,0, 216]) {
        // left side mounting block
        difference() {
            translate([-43.6033,21.5,2])
                cube([4,8,6], center = false);
            translate([-43.6033,25.5,5])
                rotate([0,90,0]) {
                cylinder (h=4, d=2.75, center=false, $fn=100);
            }
        }
        // right side mounting block
        difference() {
            translate([-43.6033,-29.5,2])
                cube([4,8,6], center = false);
            translate([-43.6033,-25.5,5])
                rotate([0,90,0]) {
                cylinder (h=4, d=2.75, center=false, $fn=100);
            }
        }
    }
    rotate([0,0,288]) {
        // left side mounting block
        difference() {
            translate([-43.6033,21.5,2])
                cube([4,8,6], center = false);
            translate([-43.6033,25.5,5])
                rotate([0,90,0]) {
                cylinder (h=4, d=2.75, center=false, $fn=100);
            }
        }
        // right side mounting block
        difference() {
            translate([-43.6033,-29.5,2])
                cube([4,8,6], center = false);
            translate([-43.6033,-25.5,5])
                rotate([0,90,0]) {
                cylinder (h=4, d=2.75, center=false, $fn=100);
            }
        }
    }
}

 module polyShape() {
    difference(){
       // start with outer shape
       offset( r=3, $fn=48 )
          circle( r=radius, $fn=sides );
        
       // take away inner shape
       translate([-26,0,0])
          offset ( r=1, $fn=48 )
             circle (r=radius/2, $fn=3 );
       rotate([0,0,72]) {
          translate([-26,0,0])
             offset ( r=1, $fn=48 )
                circle (r=radius/2, $fn=3 );
       }
       rotate([0,0,144]) {
          translate([-26,0,0])
             offset ( r=1, $fn=48 )
                circle (r=radius/2, $fn=3 );
       }
       rotate([0,0,216]) {
          translate([-26,0,0])
             offset ( r=1, $fn=48 )
                circle (r=radius/2, $fn=3 );
       }
       rotate([0,0,288]) {
          translate([-26,0,0])
             offset ( r=1, $fn=48 )
                circle (r=radius/2, $fn=3 );
       }
    }
}
