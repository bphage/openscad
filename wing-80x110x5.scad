$fn = 200;

l = 110;
lf = 17;
lb = 20;
lt = 50;
h = 80;
d = 5;

s = (lt - lf - lb)/(l - lf - lb);

assert(lt > lf + lb);

module wingprofile(l, lf, lb, d) {
    union() {
        polygon([[0, 0], [lb, d/2], [lb, -d/2]]);

        translate([lb, 0, 0])
            polygon([[0, d/2], [l - lf - lb, d/2],
                     [l - lf - lb, -d/2], [0, -d/2]]);

        translate([l - lf, 0, 0]) scale([lf / d, 1, 1]) intersection() {
            circle(d = d);
            translate([0, -d, 0]) square([d, 2*d]);
        }
    }
}

difference() {
    hull() {
        linear_extrude(0.001) wingprofile(l, lf, lb, d);
        translate([0, 0, h]) linear_extrude(0.001) 
            wingprofile(lt, lf, lb, d);
    }
    
    translate([30, 0, 0]) cylinder(h = 30, d = 3);
    translate([60, 0, 0]) cylinder(h = 30, d = 3);
}