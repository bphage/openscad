use <lib.scad>;

$fn = 100;

module template() {
    difference() {
        rounded_regular_triangle(65, 3.6);

        circle(d=7);

        difference() {
            for (phi = [-30 : 120 : 210]) {
                rotate([0, 0, phi]) sector60(17);
            }
            circle(d=10);
        }
    }
}

difference() {
    linear_extrude(height=5)
        rounded_regular_triangle(70, 5);

    cylinder(d=30, h=2.5);

    translate([0,0,4])
        linear_extrude(height=2)
            template();
}
