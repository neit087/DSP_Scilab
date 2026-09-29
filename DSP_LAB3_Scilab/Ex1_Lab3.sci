function [yn, yorigin] = delay (xn, xorigin, k)
// k <= 0: Báo lỗi và in ra console, k > 0: Hoạt động bình thường
if k <= 0 then
error("Giá trị k phải lớn hơn 0.");
end
yn = xn;
yorigin = xorigin - k;
n_x = (1:length(xn)) - xorigin; // Trục thời gian x(n)
n_y = (1:length(yn)) - yorigin; // Trục thời gian y(n)

// Vẽ tín hiệu gốc x(n)
subplot(2, 1, 1);
plot2d3(n_x, xn, style=2);
xtitle("Original signal x(n)", "n", "x(n)");
xgrid();


// Vẽ tín hiệu  y(n)
subplot(2, 1, 2);
plot2d3(n_y, yn, style=5);
xtitle("Delayed signal y(n)", "n", "y(n)");
xgrid();
endfunction

// Test
[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);
disp("yn =", yn);
disp("yorigin =", yorigin);
