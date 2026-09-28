f0 = 1 / 50;
n = 0:200;
x = sin(2 * %pi * f0 * n);

levels = 64; // Thử thay đổi thành 128, 256
delta = 2 / levels;
xq = round(x / delta) * delta; // Phương pháp làm tròn
eq = xq - x;

Px = sum(x.^2) / length(x);
Pq = sum(eq.^2) / length(eq);
SQNR = 10 * log10(Px / Pq);
disp("SQNR (dB): " + string(SQNR));

clf();
subplot(3, 1, 1); plot2d3(n, x); title("Original Signal x(n)");
subplot(3, 1, 2); plot2d3(n, xq); title("Quantized Signal xq(n)");
subplot(3, 1, 3); plot2d3(n, eq); title("Quantization Error eq(n)");
