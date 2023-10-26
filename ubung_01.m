%%
A = [1,2,3; 4,5,6; 7,8,9]
v = [20,50,70]

A(:, 2) = v

v1 = [100,200]

A(1:2, 3) = v1

A

%%

v1 = linspace(0,10,11)
v2 = 0:0.5:5

A = [v1; 2*v1; v1/4]
A2 = [v1', 2*v1', v1'/4]

A_neu = reshape(A, 11, 3)

v1_cop = repmat(v1, 2,2)

%% Masking
clc

A = [1,2,3;4,5,6;7,8,9]
indizes = A > 7

% İstediğimiz bölgeyi maskeliyoruz
A.*indizes

%%
clc

func = @(x) x.^2+4*x+4
func2 = @(x,y) x.^2+4*x+4+y.^3+5*y

t1 = linspace(0,5,100)
t2 = linspace(5,15,100)

y1 = func(t1)
y2 = func2(t1,t2)
