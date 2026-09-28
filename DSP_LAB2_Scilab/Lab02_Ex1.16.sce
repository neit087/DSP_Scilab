f0 = 1 / 50;
N = 200;
n = 0:(N-1);
x = sin(2 * %pi * f0 * n);

Px = sum(x.^2) / N;

levels = [64, 128, 256];

disp("--- KẾT QUẢ MÔ PHỎNG SQNR ---");

for i = 1:length(levels)
    L = levels(i);
    b = log2(L);
    sqnr_theory = 1.76 + 6.02 * b;
    
    xmin = -1; xmax = 1;
    delta = (xmax - xmin) / L;
    
    xq_trunc = floor((x - xmin) / delta) * delta + xmin;
    eq_trunc = xq_trunc - x;
    Pq_trunc = sum(eq_trunc.^2) / N;
    sqnr_trunc = 10 * log10(Px / Pq_trunc);
    
    xq_round = round((x - xmin) / delta) * delta + xmin;
    eq_round = xq_round - x;
    Pq_round = sum(eq_round.^2) / N;
    sqnr_round = 10 * log10(Px / Pq_round);
    
    mprintf("\nSố mức L = %d (b = %d bits):", L, b);
    mprintf("\n  + SQNR Lý thuyết: %.2f dB", sqnr_theory);
    mprintf("\n  + SQNR Thực nghiệm (Truncation): %.2f dB", sqnr_trunc);
    mprintf("\n  + SQNR Thực nghiệm (Rounding):   %.2f dB", sqnr_round);
end

L = 64;
delta = 2 / L;
xq = round((x + 1) / delta) * delta - 1;
eq = xq - x;

clf();
subplot(3, 1, 1);
plot2d3(n, x);
title("Tín hiệu gốc x(n)");
xlabel("n"); ylabel("x(n)");

subplot(3, 1, 2);
plot2d3(n, xq);
title("Tín hiệu lượng tử hóa xq(n) (L = 64, Rounding)");
xlabel("n"); ylabel("xq(n)");

subplot(3, 1, 3);
plot2d3(n, eq);
title("Sai số lượng tử hóa e(n)");
xlabel("n"); ylabel("e(n)");
