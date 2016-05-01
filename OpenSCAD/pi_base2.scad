// pi360
 
// side length (in mm)
a = 62;
// circumradius (in mm)
R = 52.7404;
// inradius (apothem) (in mm)
r = 42.6678;
radius = R;
// height of the base (in mm)
baseHeight = 3;
// number of polygon sides
sides = 5;


union() {
   difference() {
      linear_extrude( height = baseHeight )
         union() {
            polyShape();
            // inner polygon
            circle( r=radius/2, $fn=sides);
         }
         cylinder (h=baseHeight+4, r=6.5/2, center = true, $fn=100);
   }
   difference() {
      translate([0,0,2])
         linear_extrude( height = baseHeight+4 )
            polySide();
      translate([-43.6033,24.75,5])
         rotate([0,90,0]) {
            cylinder (h=5, d=3.2, center=true, $fn=100);
         }
      translate([-43.6033,-24.75,5])
         rotate([0,90,0]) {
            cylinder (h=5, d=3.2, center=true, $fn=100);
         }
      rotate([0,0,72]) {
         translate([-43.6033,24.75,5])
            rotate([0,90,0]) {
               cylinder (h=5, d=3.2, center=true, $fn=100);
            }
         translate([-43.6033,-24.75,5])
            rotate([0,90,0]) {
               cylinder (h=5, d=3.2, center=true, $fn=100);
            }
      } 
      rotate([0,0,144]) {
         translate([-43.6033,24.75,5])
            rotate([0,90,0]) {
               cylinder (h=5, d=3.2, center=true, $fn=100);
            }
         translate([-43.6033,-24.75,5])
            rotate([0,90,0]) {
               cylinder (h=5, d=3.2, center=true, $fn=100);
            }
      } 
      rotate([0,0, 216]) {
         translate([-43.6033,24.75,5])
            rotate([0,90,0]) {
               cylinder (h=5, d=3.2, center=true, $fn=100);
            }
         translate([-43.6033,-24.75,5])
            rotate([0,90,0]) {
               cylinder (h=5, d=3.2, center=true, $fn=100);
            }
      } 
      rotate([0,0,288]) {
         translate([-43.6033,24.75,5])
            rotate([0,90,0]) {
               cylinder (h=5, d=3.2, center=true, $fn=100);
            }
         translate([-43.6033,-24.75,5])
            rotate([0,90,0]) {
               cylinder (h=5, d=3.2, center=true, $fn=100);
            }
      } 
   }
}

 module polyShape() {
    difference(){
       // outer polygon
       offset( r=3, $fn=48 )
          circle( r=radius, $fn=sides );
        
       // take away inner shape
       translate([-27.435,0,0])
          offset ( r=1, $fn=48 )
             circle (r=radius/2, $fn=3 );
       rotate([0,0,72]) {
          translate([-27.435,0,0])
             offset ( r=1, $fn=48 )
                circle (r=radius/2, $fn=3 );
       }
       rotate([0,0,144]) {
          translate([-27.435,0,0])
             offset ( r=1, $fn=48 )
                circle (r=radius/2, $fn=3 );
       }
       rotate([0,0,216]) {
          translate([-27.435,0,0])
             offset ( r=1, $fn=48 )
                circle (r=radius/2, $fn=3 );
       }
       rotate([0,0,288]) {
          translate([-27.435,0,0])
             offset ( r=1, $fn=48 )
                circle (r=radius/2, $fn=3 );
       }
    }
}

module polySide() {
    difference(){
        // outer polygon
        offset( r=3, $fn=48 )
            circle( r=radius, $fn=sides );
        // inner polygon
        offset( r=3, $fn=48 )
            circle( r=radius-5, $fn=sides );
        translate([-44,0,0])
            square([5, 36], center = true);
        rotate([0,0,72]) {
            translate([-44,0,0])
                square([5, 36], center = true);
        }
        rotate([0,0,144]) {
            translate([-44,0,0])
                square([5, 36], center = true);
        }
        rotate([0,0,216]) {
            translate([-44,0,0])
                square([5, 36], center = true);
        }
        rotate([0,0,288]) {
            translate([-44,0,0])
                square([5, 36], center = true);
        }
    }
}
