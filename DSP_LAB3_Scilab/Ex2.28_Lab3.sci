a1 = -0.9;
y_minus1 = 0; 
n = 0:50;
y_1 = 0; // Giả sử điều kiện ban đầu y(-1) = 0
y_ss = 10 * ones(1, length(n)); // Xác lập
y_tr = (0.9).^(n+1) * (y_1 - 10); // Quá độ

plot2d3(n, y_ss, style=2); 
plot2d3(n, y_tr, style=5);
legend(["Steady-state", "Transient"]);
title("Transient vs Steady-state Response (a1 = -0.9, y(-1) = 0)");
xlabel("n"); ylabel("Amplitude");
