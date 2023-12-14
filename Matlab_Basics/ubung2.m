%% Polinom olusturma
%(-1,0),(0,-1),(2,3) noktalarindan gecen 
% 2.dereceden polinom elde edelim
clc; clear all;

X = [-1, 0, 2];
Y = [0, -1, 3];
polinom = polyfit(X,Y,2)
plot(X,Y,'bo','MarkerSize',10);

x = -5:0.01:5;
y = polyval(polinom, x);
hold on;
plot(x,y,'r--');
grid on;
xlim([-5, 5]);
ylim([-1, 25]);
% Soru-1
% y=x^2+10*randn fonksiyonunun polyfit ile katsayilarini bulunuz
% y=x^2 fonksiyonu ile birlikte ayni grafige cizdiriniz.
x = -10:1:10;
y1 = x.^2 + 10 * randn(size(x));

coefficients_y1 = polyfit(x, y1, 2);
figure;
plot(x, y1, 'bo', 'Markersize', 3);
hold on;
plot(x, x.^2, 'Marker','+', 'MarkerSize',3);



%% Optimizasyon 
% y = cos(e^x)+x^2-1 fonksiyonunu minimum yapan degeri bulalim
clc;
y = @(x) cos(exp(x))+x^2 - 1;
[min_x, min_func] = fminbnd(y,-100, 100);
[min_x, min_func] = fminsearch(y, -5);

% Soru - 2
% f(x)=cos(4x)*sin(10x)*e^-|x|
% fonksiyonunun [-pi, pi] araliginda 
% fonksiyonu minimum yapan degeri bulunuz

y = @(x) cos(4*x).*sin(10*x).*exp(-abs(x));
[min_x, min_func] = fminbnd(y, -pi, pi)   % min_x = 0.7768
fprintf('Minimum değer: %.4f\n', min_func);
fprintf('Minimumu sağlayan x değeri: %.4f\n',min_x);

%% Numerik turev
clc
a = [1,3,6,7,8,12];
diff(a)

% y = sin(x) fonksiyonunun turevini alalim
x = -pi:0.01:pi;
y = sin(x);
dydx = diff(y) ./ diff(x)
plot(x,y,'r')
hold on;
plot(x(1:length(dydx)),dydx,'b--')
grid on;
xlim([-pi, pi])
ylim([-1, 1])
legend('sin(x)','cos(x)')

%% Sembolik turev
syms x y
clc
% y = sin(x)*x fonksiyonunun turevini alalim
f = sin(x)*x
% x'e gore 2 kez turev aliniyor.
diff(f,x,2)

f = sin(x)*y 
% sirasiyla x ve y'ye gore turev aliniyor
diff(f,x,y)

%% Numerik integral

% y = sin(x)*x fonksiyonunun integralini alalim
y = @(x) sin(x).*x;
integral(y,0,2*pi)


%% Sembolik integral
syms x
clc
% y = sin(x)*x fonksiyonunun integralini alalim
y = sin(x)*x
int_func = int(y,x)
diff_func = diff(int_func,x)

%% Diferansiyel denklem cozumu
clear all
clc
% dydt = 2*t fonksiyonunu hesaplayalim
% y = a*t^2 + b*t
f = @(t,y) 2*t;
t_aralik = [0 5];
y0 = 0;

[t, y] = ode45(f,t_aralik,y0);
plot(t,y)
grid on;


% dx/dt = 3*x+4*y
% dy/dt = -4*x+3*y denklem sistemini cozelim
% x = a(1), y = a(2)
fun = @(t,a) [3*a(1)+4*a(2); -4*a(1)+3*a(2)];
t_aralik = [0 5];
a0 = [0, 0.5];
[t, f] = ode45(fun, t_aralik, a0);
plot(t,f(:,1),'r--');
hold on;
plot(t,f(:,2),'b--');
legend('x','y');
grid on;

m = 1; k = 1; b = 0.2;
% Yay damper sistemini cozelim
%dx/dt = v
%dv/dt = -k/m*x - b/m*v
%x=a(1), v=a(2)
fun = @(t,a)[a(2); -k/m*a(1) - b/m*a(2)];
t_aralik = [0 50];
a0 = [0, 0.5];
[t,f] = ode45(fun, t_aralik, a0);
figure;
plot(t,f(:,1),'r--');
hold on;
plot(t,f(:,2),'b--');
legend('x','v');
grid on;



R = 1; L = 1; C = 1;
% Soru - 3
% Basit bir RLC sisteminin cozumunu yapalim
% dq/dt = i
% di/dt = -q/(L*C)-i*R/L
% Baslangic kosullari [0, 0.25] 
% T zaman araligi [0 20]
fun = @(t, a) [a(2); -a(1)/(L*C) - R*a(2)/L];
t_aralik = [0 20];
a0 = [0, 0.25];
[t, f] = ode45(fun, t_aralik, a0);
figure;
plot(t, f(:, 1), 'r--');
hold on;
plot(t,f(:,2),'b--');
legend('q','i');
grid on;
