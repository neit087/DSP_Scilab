function [yn, yorigin] = fold(xn, xorigin)
yn = xn($:-1:1);

yn = flipdim(xn, 2);
yorigin = length(xn) - xorigin + 1;
n_x = (1:length(xn)) - xorigin;
n_y = flipdim(-n_x, 2);

// Vẽ tín hiệu gốc x(n)
subplot(2, 1, 1);
plot2d3(n_x, xn, style=2);
xtitle("Original signal x(n)", "n", "x(n)");
xgrid();


subplot(2, 1, 2);
plot2d3(n_y, yn, style=5);
xtitle("Folded signal y(n) = x(-n)", "n", "y(n)");
xgrid();
endfunction

// Test
[yn, yorigin] = fold ([1, -2, 3, 6], 3);
disp("yn =", yn);          // answer: [6, 3, -2, 1]
disp("yorigin =", yorigin);// answer: 2
