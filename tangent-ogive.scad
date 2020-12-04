$fn = 200;

module tangent_ogive(d, l, rn=0) {
    r = d / 2;
    rho = (r * r + l * l) / d;
    
    x0 = sqrt(pow(rho - rn, 2) - pow(rho - r, 2));
    yt = rn * (rho - r) / (rho - rn);
    xt = x0 + sqrt(rn * rn - yt * yt);
        
    rotate_extrude() {
        union() {
            intersection() {
                translate([-(rho - r), 0, 0]) circle(rho);
                square([rho, xt]);
            }
            translate([0, x0, 0]) intersection() {
                circle(rn);
                square(rn);
            }
        }
    }
}

difference() {
    tangent_ogive(38, 70, 4);
    tangent_ogive(28, 60, 2);
}