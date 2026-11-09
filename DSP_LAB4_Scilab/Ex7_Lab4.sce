// ==============================================
// LAB 4 - EXERCISE 7: CIRCULAR CONVOLUTION
// ==============================================
clear; clc; close(winsid());

 // 1. Input signals
 x = [1, 2, -3, 2, 1];
 h = [1, 0, -1, -1, 1];

 N = length(x);
 M = length(h);

 n_axis = 0:N-1;

 // 2. Folding and shifting method
 y_fold = zeros(1, N);

 for n = 0:N-1
     for k = 0:M-1
         j = pmodulo(n-k, N);
         y_fold(n+1) = y_fold(n+1) + h(k+1)*x(j+1);
     end
 end

 disp("Exercise 7 - Folding/shifting result:");
 disp(y_fold);

 // 3. Matrix method
 H = zeros(N, N);

 for n = 0:N-1
     for k = 0:M-1
         j = pmodulo(n-k, N);
         H(n+1, j+1) = H(n+1, j+1) + h(k+1);
     end
 end

 y_matrix = (H*x')';

 disp("Exercise 7 - Matrix result:");
 disp(y_matrix);

 disp("Exercise 7 - Circular convolution matrix H:");
 disp(H);

 // 4. Verify using linear convolution
 y_linear = conv(x, h);
 y_check = zeros(1, N);

 for i = 1:length(y_linear)
     j = pmodulo(i-1, N) + 1;
     y_check(j) = y_check(j) + y_linear(i);
 end

 if max(abs(y_fold-y_matrix)) < 1d-10 & ...
    max(abs(y_fold-y_check)) < 1d-10 then
     disp("PASS: folding, matrix and circular check are identical.");
 else
     disp("FAIL: circular convolution results do not match.");
 end

 // 5. Signal energy (one period)
 ex = abs(x).^2;
 ey = abs(y_fold).^2;

 Ex = sum(ex);
 Ey = sum(ey);

 mprintf("Energy: Ex = %.0f, Ey = %.0f\n", Ex, Ey);

 // 6. Plot all signals in one figure
 scf(0);
 clf();

 // Input x(n)
 subplot(2,2,1);
 plot2d3(n_axis', x');
 xtitle("x(n) - input", "n", "x(n)");
 a = gca();
 a.data_bounds = [-0.5, -4; 4.5, 3];
 xgrid();

 // Circular convolution y(n)
 subplot(2,2,2);
 plot2d3(n_axis', y_fold');
 xtitle("y(n) - circular convolution", "n", "y(n)");
 a = gca();
 a.data_bounds = [-0.5, -5; 4.5, 5];
 xgrid();

 // Energy |x(n)|^2
 subplot(2,2,3);
 plot2d3(n_axis', ex');
 xtitle("Sample energy |x(n)|^2", "n", "Energy");
 a = gca();
 a.data_bounds = [-0.5, -1; 4.5, 11];
 xgrid();

 // Energy |y(n)|^2
 subplot(2,2,4);
 plot2d3(n_axis', ey');
 xtitle("Sample energy |y(n)|^2", "n", "Energy");
 a = gca();
 a.data_bounds = [-0.5, -1; 4.5, 19];
 xgrid();
