size = [11.5, 42];

h = 24;
wide = [6, 30, h];
narrow = [3, 23, h];
widehole = [3.1, 27.3, h];
narrowhole = [3.05, 20, h];

difference() {
    union() {
        translate([-size.x / 2, -size.y / 2, 0])
            cube([size.x, size.y, 1.1]);

        translate([-narrow.x / 2, 0, 0])
        translate([-wide.x / 2, -wide.y / 2, 0])
            cube(wide);

        translate([wide.x / 2, 0, 0])
        translate([-narrow.x / 2, -narrow.y / 2, 0])
            cube(narrow);
    }

    translate([-narrowhole.x / 2, 0, 0])
    translate([-widehole.x / 2, -widehole.y / 2, 0])
        cube(widehole);
    
    translate([widehole.x / 2, 0, 0])
    translate([-narrowhole.x / 2, -narrowhole.y / 2, 0])
        cube(narrowhole);
}


