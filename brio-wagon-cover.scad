// Print with substrate

$fn = 200;

plate = [65.7, 15.9, 1.25];

// Hitch flange
hf = [1.8, 4.8, 7];
hd = 2.5;

// Wheel base
wbase = 50.1;

// Wheel flange
wf = [2, 4.7, 3.5];
wd = 3;

// Screw base
sbase = [59.5, 9.5];
sd = [4.5, 2.8, 6];
sh = [4.5, 2.9];

module flange(start, size, a=0, d=0) {
    translate(start)
    rotate(a=a, v=[0, 0, 1])
    difference() {
        translate([0, -size.y/2, 0])
            cube(size);
        translate([0, 0, size.z]) rotate([0, 90, 0])
            cylinder(size.x, d=d);
    }
}

module screwhole(h, d) {
    difference() {
        cylinder(h[0], d=d[2]);
        cylinder(h[1], d=d[0]);
        translate([0, 0, h[1]]) cylinder(h[0] - h[1], d=d[1]);
    }
}

difference() {
    translate([-plate.x/2, -plate.y/2, 0])
        cube(plate);
    translate([sbase.x/2, sbase.y/2, 0]) cylinder(1.25, d=sd[0]);
    translate([-sbase.x/2, sbase.y/2, 0]) cylinder(1.25, d=sd[0]);
    translate([sbase.x/2, -sbase.y/2, 0]) cylinder(1.25, d=sd[0]);
    translate([-sbase.x/2, -sbase.y/2, 0]) cylinder(1.25, d=sd[0]);
}

flange([plate.x/2, 0, 0], hf, 0, d=hd);
flange([-plate.x/2, 0, 0], hf, 180, d=hd);

flange([wbase/2, plate.y/2, 0], wf, 90, wd);
flange([wbase/2, -plate.y/2, 0], wf, -90, wd);
flange([-wbase/2, plate.y/2, 0], wf, 90, wd);
flange([-wbase/2, -plate.y/2, 0], wf, -90, wd);

translate([sbase.x/2, sbase.y/2, 0]) screwhole(sh, sd);
translate([-sbase.x/2, sbase.y/2, 0]) screwhole(sh, sd);
translate([sbase.x/2, -sbase.y/2, 0]) screwhole(sh, sd);
translate([-sbase.x/2, -sbase.y/2, 0]) screwhole(sh, sd);