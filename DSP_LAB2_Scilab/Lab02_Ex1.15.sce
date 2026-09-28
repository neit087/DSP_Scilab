//1.15a
Fs = 5000;
n = 0:99;
F0_list = [500, 2000, 3000, 4500];
clf();
for i = 1:4
    F0 = F0_list(i);
    x = sin(2 * %pi * (F0 / Fs) * n);
    subplot(2, 2, i);
    plot2d3(n, x);
    title("F0 = " + string(F0) + " Hz");
    xlabel("n"); ylabel("x(n)");
end



//1.15b
Fs = 50000;
F0 = 2000;
n = 0:50;
x = sin(2 * %pi * (F0 / Fs) * n);

// Lấy các mẫu số chẵn (indices 1, 3, 5,... trong Scilab tương ứng với n = 0, 2, 4,...)
k = 0:25;
y = x(1:2:end); 

scf(1);
clf();
subplot(2, 1, 1);
plot2d3(n, x);
title("1. Signal x(n) with F0 = 2 kHz, Fs = 50 kHz (f0 = 0.04)");
xlabel("n"); ylabel("x(n)");

subplot(2, 1, 2);
plot2d3(k, y);
title("2. Signal y(n) - Even-numbered samples (f0 = 0.08)");
xlabel("k"); ylabel("y(k)");
