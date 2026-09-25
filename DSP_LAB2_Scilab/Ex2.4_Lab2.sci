n = -5:5;
ur = n .* bool2s(n >= 0);
plot2d3(n, ur, style = 2);
xlabel ("n") ;
ylabel (" Amplitude ") ;
title (" Unit Ramp Signal ") ;
gca () . children . children . thickness = 3;
title("Exercise 4: Unit Ramp Signal ur(n)");

