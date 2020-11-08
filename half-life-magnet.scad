difference() {
    cylinder(r=30, h=5, $fn=100);

    cylinder(r=15, h=2.5, $fn=100);

    translate([0,0,4]) linear_extrude(height=1) difference(){
        circle(r=27, $fn=100);
    
    translate([0,2,0]) scale(0.7)
            import(file = "Half-Life_lambda_logo.svg", center = true);
    }
}