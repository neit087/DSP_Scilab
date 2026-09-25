nx = -2:1;
x = [1, -2, 3, 6];
ny1 = -nx($:-1:1);
y1 = x($:-1:1);

scf(1); clf(1);
subplot(2, 1, 1);
plot2d3(nx, x, 2); title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude");
subplot(2, 1, 2);
plot2d3(ny1, y1, 5); title("y1(n) = x(-n)"); xlabel("n"); ylabel("Amplitude");

ny2 = nx - 3;
y2 = x;

scf(2); clf(2); 
subplot(2, 1, 1);
plot2d3(nx, x, 2); title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude");
subplot(2, 1, 2);
plot2d3(ny2, y2, 3); title("y2(n) = x(n + 3)"); xlabel("n"); ylabel("Amplitude");

ny3 = -nx($:-1:1) - 2;
y3 = 2 * x($:-1:1);

scf(3); clf(3);
subplot(2, 1, 1);
plot2d3(nx, x, 2); title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude");
subplot(2, 1, 2);
plot2d3(ny3, y3, 6); title("y3(n) = 2x(-n - 2)"); xlabel("n"); ylabel("Amplitude");
