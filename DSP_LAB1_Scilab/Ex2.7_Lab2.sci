n = -1:3;
x1 = [0, 0, 1, 3, -2]; 
x2 = [0, 1, 2, 3, 0];  
y = x1 .* x2;
disp(y, "Gia tri cua y(n) la:");

subplot(3, 1, 1);
plot2d3(n, x1, 2); 
title("Signal x1(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3, 1, 2);
plot2d3(n, x2, 5); 
title("Signal x2(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3, 1, 3);
plot2d3(n, y, 3); 
title("Signal y(n) = x1(n) .* x2(n)");
xlabel("n");
ylabel("Amplitude");
