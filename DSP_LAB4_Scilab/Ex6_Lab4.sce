// ==============================================
// LAB 4 - EXERCISE 6: LINEAR CONVOLUTION
// ==============================================
clear; clc; close(winsid());

 // 1. Input signals
 x = [1, 2, -3, 2, 1];
 h = [1, 0, -1];

 N = length(x);
 M = length(h);
 L = N + M - 1;

 nx = 0:N-1;
 ny = 0:L-1;

 // 2. Folding and shifting method
 y_fold = zeros(1, L);

 for n = 0:L-1
     for k = 0:M-1
         j = n-k;

         if j >= 0 & j < N then
             y_fold(n+1) = y_fold(n+1) + h(k+1)*x(j+1);
         end
     end
 end

 disp("Exercise 6 - Folding/shifting result:");
 disp(y_fold);

 // 3. Matrix method
 H = zeros(L, N);

 for i = 1:M
     for j = 1:N
         H(i+j-1, j) = h(i);
     end
 end

 y_matrix = (H*x')';

 disp("Exercise 6 - Matrix result:");
 disp(y_matrix);

 disp("Exercise 6 - Convolution matrix H:");
 disp(H);

 // 4. Verify using built-in convolution
 y_check = conv(x, h);

 if max(abs(y_fold-y_matrix)) < 1d-10 & ...
    max(abs(y_fold-y_check)) < 1d-10 then
     disp("PASS: folding, matrix and conv() are identical.");
 else
     disp("FAIL: convolution results do not match.");
 end

 // 5. Signal energy
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
 plot2d3(nx', x');
 xtitle("x(n) - input", "n", "x(n)");
 a = gca();
 a.data_bounds = [-0.5, -4; 4.5, 3];
 xgrid();

 // Linear convolution y(n)
 subplot(2,2,2);
 plot2d3(ny', y_fold');
 xtitle("y(n) - linear convolution", "n", "y(n)");
 a = gca();
 a.data_bounds = [-0.5, -5; 6.5, 5];
 xgrid();

 // Energy |x(n)|^2
 subplot(2,2,3);
 plot2d3(nx', ex');
 xtitle("Sample energy |x(n)|^2", "n", "Energy");
 a = gca();
 a.data_bounds = [-0.5, -1; 4.5, 11];
 xgrid();

 // Energy |y(n)|^2
 subplot(2,2,4);
 plot2d3(ny', ey');
 xtitle("Sample energy |y(n)|^2", "n", "Energy");
 a = gca();
 a.data_bounds = [-0.5, -1; 6.5, 18];
 xgrid();
