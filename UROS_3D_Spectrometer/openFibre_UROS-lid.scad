
/// SLA UROS logo

translate([-60,0,26.5]) rotate([-90,0,0]) import("FiberSpecLid.STL", convexity=10);

rotate([0,180,0]) logos();

logoHeight = 2;

module logos(){

linear_extrude(height = 0.4, center = false, convexity = 10) import(file = "openFibreSpec_logos.dxf", layer = "specLid");

linear_extrude(height = logoHeight- 1, center = false, convexity = 10) import(file = "openFibreSpec_logos.dxf", layer = "rose");

linear_extrude(height = logoHeight, center = false, convexity = 10) import(file = "openFibreSpec_logos.dxf", layer = "outer");

linear_extrude(height = logoHeight, center = false, convexity = 10) import(file = "openFibreSpec_logos.dxf", layer = "grapes");

linear_extrude(height = logoHeight, center = false, convexity = 10) import(file = "openFibreSpec_logos.dxf", layer = "uros_logo");

linear_extrude(height = logoHeight, center = false, convexity = 10) import(file = "openFibreSpec_logos.dxf", layer = "gaudilabs");

linear_extrude(height = logoHeight, center = false, convexity = 10) import(file = "openFibreSpec_logos.dxf", layer = "openFibreSpec");

linear_extrude(height = logoHeight, center = false, convexity = 10) import(file = "openFibreSpec_logos.dxf", layer = "specRim");
}


        

