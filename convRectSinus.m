syms x

fplot(rectangularPulse(-pi,pi,x), [-2*pi,2*pi])
hold on
fplot(sin(x))
legend('Impulse response','Sine wave');
grid on
hold off
