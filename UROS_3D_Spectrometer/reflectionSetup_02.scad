


LaserDiameter = 13.1;
LaserLength = 22;

LensDiameter = 8.2;
LensLength = 12;

PCBWidth= 10.5;
PCBLength= 17;

//translate([0,-40,-0]) rotate([0,0,-45]) color("DeepPink") LaserModule();

//translate([0,-40,-0]) rotate([0,0,-45]) LaserBase();

translate([0,0,0]) Reflectometer();



module Reflectometer(){
    

    difference() {
        group(){
          OpticalConnector();
          difference() {  
          translate([0,-16,0]) rotate([90,0,0]) cylinder(h=10, d1=29.5, d2=14.5, center = true, $fn = 100);
            translate([0,-20,0]) rotate([90,0,0]) cube([9,9,40],true);
          }
          //translate([0,0,0]) rotate([90,0,180]) roundedRect ([38,36,2],5);
          translate([0,-1,0]) rotate([90,0,0]) cylinder(h=20, d1=32.5, d2=29.5, center = true, $fn = 100);
          //translate([0,0,0]) rotate([90,0,0]) roundedRect ([30,30,10],10);
        }
      translate([0,14.8,0]) rotate([90,0,0]) roundedRect ([25,25,24],10);
        
      #translate([0,-15,0]) rotate([90,0,0]) cube([0.8,2.8,40],true);  
      #translate([9,-10,-0]) rotate([0,90,-45]) cylinder(h = 30, d = 5.1, center = true, $fn = 100);
      #translate([-9,-10,-0]) rotate([0,90,45]) cylinder(h = 30, d = 5.1, center = true, $fn = 100);
    }
    
}

module OpticalConnector(){
    difference() {
    translate([32.5,-21,-7.5]) rotate([90,0,180])  import("Spectrometer_inlet.STL", convexity=3);
        translate([12,-15,0]) rotate([0,0,0]) cube([12.8,22.8,40],true);
        translate([-12,-15,0]) rotate([0,0,0]) cube([12.8,22.8,40],true);
        translate([0,-15,11]) rotate([0,90,0]) cube([12.8,22.8,40],true);
        translate([0,-15,-11]) rotate([0,90,0]) cube([12.8,22.8,40],true);
    }
}
// Cuvette
module CuvetteHolder(){
difference() {
    color("Grey") translate([-0,0,0]) CuvetteBase();
    translate([0,0,8+5]) cube([12.8,12.8,40],true);
    translate([16,-13,8+5]) rotate([0,0,-45]) cube([12.8,12.8,40],true);
    translate([10,-10,-0]) rotate([0,90,-45]) cylinder(h = 20, d = 5, center = true, $fn = 100);
    //#translate([0,-15,0]) rotate([0,90,90]) cylinder(h = 30, d = 5, center = true, $fn = 100);
    translate([0,-15,0]) rotate([90,0,0]) cube([0.8,2.8,40],true);
    }
}

module CuvetteBase(){

    translate([0,0,-12]) roundedRect ([36,28,2],5);
    translate([0,-8,-12]) roundedRect ([36,36,2],5);
    rotate([0,0,-45]) translate([0,0,-10.6]) roundedRect ([26,26,16],12);
    translate([0,-8,-10.6]) roundedRect ([28,28,4],3);
    translate([0,0,-10.6]) roundedRect ([16,16,24],1);
    translate([32.5,-21,-7.5]) rotate([90,0,180])  import("Spectrometer_inlet.STL", convexity=3);
}

/// Laser
module LaserBase(){

    color("Grey")LaserHolders();
    translate([16,0,-12]) roundedRect ([40,24,2],5);
    translate([10,0,-10.6]) roundedRect ([22,12,4],3);
    translate([32,0,-10.6]) roundedRect ([8,8,8],3);
}

module LaserHolders(){
    difference() {
    rotate([0,90,0])cylinder(h = 8, d = LaserDiameter+4, center = false, $fn = 100);
    rotate([0,90,0])cylinder(h = LaserLength, d = LaserDiameter, center = false, $fn = 100);
    translate([0,-20/2,2.5]) cube([PCBLength,20,10],false);
    }
    translate([12,0,0]) difference() {
    rotate([0,90,0])cylinder(h = 8, d = LaserDiameter+4, center = false, $fn = 100);
    rotate([0,90,0])cylinder(h = LaserLength, d = LaserDiameter, center = false, $fn = 100);
    translate([0,-20/2,2.5]) cube([PCBLength,20,10],false);
    }
}


module LaserModule(){ 
    rotate([0,90,0])cylinder(h = LaserLength, d = LaserDiameter, center = false, $fn = 100);
    translate([-LensLength,0,0]) rotate([0,90,0])cylinder(h = LensLength, d = LensDiameter, center = false, $fn = 100);
    translate([LaserLength,-PCBWidth/2,-1.2]) cube([PCBLength,PCBWidth,2],false);
}

// radius - radius of corners
module roundedRect(size, radius)
{
	x = size[0];
	y = size[1];
	z = size[2];

	translate([0,0,0])
	linear_extrude(height=z)
	hull()
	{
		// place 4 circles in the corners, with the given radius
		translate([(-x/2)+(radius), (-y/2)+(radius), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius), (-y/2)+(radius), 0])
		circle(r=radius);
	
		translate([(-x/2)+(radius), (y/2)-(radius), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius), (y/2)-(radius), 0])
		circle(r=radius);
	}
  }
