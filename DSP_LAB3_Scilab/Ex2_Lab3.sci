function [yn, yorigin] = advance (xn, xorigin, k)
if k <= 0 then
error("Giá trị k phải lớn hơn 0.");
end
yn = xn;
yorigin = xorigin + k;
n_x = (1:length(xn)) - xorigin; 
n_y = (1:length(yn)) - yorigin; 

// Vẽ tín hiệu gốc x(n)
subplot(2, 1, 1);
plot2d3(n_x, xn, style=2);
xtitle("Original signal x(n)", "n", "x(n)");
xgrid();


// Vẽ tín hiệu  y(n)
subplot(2, 1, 2);
plot2d3(n_y, yn, style=5);
xtitle("Advanced signal y(n)", "n", "y(n)");
xgrid();
endfunction

// Test
[yn, yorigin] = advance([2, 4, -1, 5, 0], 2, 2);
disp("yn =", yn);          // predicted answer: [2, 4, -1, 5, 0]
disp("yorigin =", yorigin);// predicted answer: 4
