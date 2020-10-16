/*
 * Рисует двумерный треугольник со скруглёнными углами
 *
 * a - длина стороны треугольника
 * radius - радиус скругления, должен быть больше нуля
 */
module rounded_regular_triangle(a, radius) {
    assert(radius > 0);

    hull() {
        for (phi = [0 : 120 : 240]) {
            rotate([0, 0, phi]) translate([0, a / sqrt(3) - 2 * radius, 0]) circle(radius);
        }
    }
}

module sector60(r) {
    difference() {
        circle(r);
        
        rotate([0, 0, -30]) translate([0, 2 * r, 0])
            square(4 * r, true);
        
        rotate([0, 0, 30]) translate([0, -2 * r, 0]) 
            square(4 * r, true);
    }
}
