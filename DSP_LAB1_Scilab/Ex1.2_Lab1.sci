subplot (3 ,1 ,1);
t = linspace (0 ,0.1 ,500) ;
x_a = 3* sin (100* %pi *t);
plot (t, x_a , style = 1);
xtitle("Analog signal xa(t)", "t (s)", "Amplitude");

subplot (3 ,1 ,2);
n = linspace (1 ,30 ,500) ;
xn = 3* sin( %pi *n /3) ;
plot2d3 (n, xn , style = 2);
xtitle("Discrete-time signal x(n)", "n", "Amplitude");
 
subplot (3 ,1 ,3);
delta = 0.1;
xqn = floor (xn/ delta )* delta ;
plot2d3 (n, xqn , style = 3);
xtitle("Quantized signal xq(n)", "n", "Amplitude");
