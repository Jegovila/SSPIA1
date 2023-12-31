clear all
close all
clc

f = @(x,y) (x-2).^2+(y-2).^2;
xl = [-5 -5]';
xu = [5 5]';

% f = @(x,y) x.*exp(-x.^2-y.^2);
% xl = [-2 -2]';
% xu = [2 2]';

G = 500;
D = 2;

sigma = 0.2;

x = xl+(xu-xl).*rand(D,1);

f_plot = zeros(1,G);

for t=1:G
	r = normrnd(0,sigma,[D 1]);
    y = x + r;
    
    if f(y(1),y(2)) < f(x(1),x(2))
        x = y;
    end

%     Plot_Contour(f,[x y],xl,xu); % Gr�fica

    f_plot(t) = f(x(1),x(2));
end

figure
Plot_Surf(f,[x y],xl,xu) % Gr�fica
disp([' m�nimo global en: x=' num2str(x(1)) ', y=' num2str(x(2)) ', f(x,y)=' num2str(f(x(1),x(2)))])

figure
hold on
grid on
plot(f_plot,'b-','LineWidth',2)
title('Gr�fica de convergencia')
xlabel('iteraci�n')
ylabel('f(x)')
