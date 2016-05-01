// Un-official (China source) M12 mount 36 x 36 mm RPi-compatible camera
// (search "raspberry camera board M12x0.5 lens" on Ebay)
// Sept. 16, 2014  J. Beale
// version 1.1 (added 2mm to U-bracket to allow tilt motion with screw in place)

// ==============================================================
slop = 0.2;  // size by which ID of holes shrinks during print
fn = 50;     // facets on a cylinder
eps = 0.03;  // a small number

CBW = 36.5; // width of camera PCB (x)
CBL = 36.5; // length of camera PCB (y)
CBH = 1.63; // thickness of camera PCB
CBBH = 2.9-CBH; // camera PCB bottom component keep-out height
CBBS = 2.0; // PCB bottom keeput setback from edge
CBBCS = 7;  // PCB bottom keepout corner setback

CBFCH = 4.45-CBH; // 15-way flex connector height
CBFCW = 22.1; // 15-way flex connector width
CBFCL = 5.65; // 15-way FC length
CBFCE = 0.97; // 15-way FC edge setback

MHOD = 3.0; // M3 mounting screw hole OD
MHCC = 29.0; // M3 mounting hole center-center distance

FCW = 16.15; // 15-way FC width

// ===================================================
// == HOUSING for 36x36mm M12-lens camera board  ==

PIW = 56; // rpi2 width (x axis)
PIL = 65; // rpi2 length over mounting holes (y axis)
CCW = 40; // camera housing width (x axis)
CCL = 40; // camera housing length (y axis)
CCBD = 4; // camera housing back depth (z axis)
CCBF = 2.6; // camera housing back front lip height (z axis)
CCBIW = CBW+slop*2; // housing back interior width
CCBIL = CBL+slop*2; // housing back interior length
CCBSW = FCW+1; // width for flex cable slot
BS=8; // mounting screw boss width
BSO=0.8; // boss offset towards center
SHID = 3.0;  // ID of screw hole (note ID will be "slop" smaller)

font = "Liberation Sans";
num_size = 8;
letter_size = 24;
letter_height = 2;

module CHB_outside() {
  difference() {
    union() {
      translate([-CCW/2,-CCL/2,-CCBD]) 
		    cube([CCW,CCL,CCBD+CCBF]); // back body of housing
    }
    union() {
	    translate([-CCBSW/2,-(CCL/2)-eps,-1.6]) 
		    cube([CCBSW,CCL/2,CCBD*2]); // slot for flex cable
      translate([-CCBIW/2,-CCBIL/2,-(CBFCH+slop)]) 
		    cube([CCBIW,CCBIL,CCBD+CCBF]); // cutout hole for board
    }
  }
}

// mounting screw bosses in 4 corners of camera back
module CHB_Boss() {
  union() {
	  translate([(CCW/2)-BS-BSO,-CCL/2+BSO,-(BS/2)])
      cube([BS,BS,CCBD+CCBF-CBH]); // boss for mounting screw
	  translate([(CCW/2)-BS-BSO,CCL/2-BS-BSO,-(BS/2)])
      cube([BS,BS,CCBD+CCBF-CBH]); // boss for mounting screw
	  translate([-(CCW/2)+BSO,-CCL/2+BSO,-(BS/2)])
      cube([BS,BS,CCBD+CCBF-CBH]); // boss for mounting screw
	  translate([-(CCW/2)+BSO,CCL/2-BS-BSO,-(BS/2)])
      cube([BS,BS,CCBD+CCBF-CBH]); // boss for mounting screw
  }
}

module CameraHousingBack() {
  difference() {
    union() {
      CHB_outside();
      CHB_Boss();
    }
  }
}

module letter(l,font_size=30) {
  // Use linear_extrude() to make the letters 3D objects as
  // they are only 2D shapes when only using text()
  linear_extrude(height = letter_height) {
    text(l, size = font_size, font = font, halign = "center", valign = "center", $fn = 36);
  }
}

difference() {
  union() {
    CameraHousingBack();
    translate([-PIW/2,-PIL/2,-CCBD])
      difference() {
        cube([PIW,PIL,CCBD-2]);
      }
  }
  union() {
    translate([PIW/2-3.5,PIL/2-3.5,-BS])
 	    cylinder(d=SHID+slop,h=50,$fn=50);
    translate([-PIW/2+3.5,PIL/2-3.5,-BS])
 	    cylinder(d=SHID+slop,h=50,$fn=50);
    translate([PIW/2-3.5,-PIL/2+3.5,-BS])
 	    cylinder(d=SHID+slop,h=50,$fn=50);
    translate([-PIW/2+3.5,-PIL/2+3.5,-BS])
 	    cylinder(d=SHID+slop,h=50,$fn=50);
  }
  //translate([0,26,-3])
    //letter("1",num_size);
  translate([-CCBSW/2,-(CCL/2)-eps-6,-4]) 
    cube([CCBSW,2,CCBD*2]); // slot for flex cable
}
