Fs = 5000;
T = 1 / Fs;
n = 0:99;
t = n * T;
F0_list = [500, 2000, 3000, 4500];

for i = 1:length(F0_list)
    F0 = F0_list(i);
    x = sin(2 * %pi * F0 * t);
    subplot(2, 2, i);
    plot2d3(n, x);
    title("F0 = " + string(F0) + " Hz");
    xlabel("n"); ylabel("x(n)");
end
