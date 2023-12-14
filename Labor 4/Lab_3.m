%% DFT-1 Siyah-beyaz tek kenar
close all; clear all;
a = [zeros(256,128), ones(256,128)];
imshow(a);
a_ft = fftshift(fft2(a));
figure; fftshow(a_ft, 'log');
figure; fftshow(a_ft, 'abs');


%% DFT 2 Siyah zemin beyaz kutu
close all;
a = zeros(256,256);
a(78:178, 78:178) = 1;
imshow(a)

a_ft = fftshift(fft2(a));
figure; fftshow(a_ft, 'log');

figure; imshow(uint8(abs(a_ft)));
%% DFT-3 45 derece cevrilmis beyaz kutu

clc; close all;
[x,y]=meshgrid(1:256,1:256);
b=(x+y<329)&(x+y>182)&(x-y>-67)&(x-y<73);
imshow(b);

b_ft = fftshift(fft2(b));
figure; fftshow(b_ft,'log');


%% Dusuk geciren filtre
close all;
cm = imread('cameraman.tif');
imshow(cm);
cm_ft = fftshift(fft2(cm));
figure; fftshow(cm_ft, 'log');

[x,y] = meshgrid(-128:127, -128:127);
z = sqrt(x.^2 + y.^2);
b = (z < 50);
cm_ft_lp = cm_ft.*b;
figure; fftshow(cm_ft_lp, 'log');

cm_2 = uint8(abs(ifft2(cm_ft_lp)));
figure; imshow(cm_2);


%% Yuksek geciren filtre
close all;
cm = imread('cameraman.tif');
imshow(cm);
cm_ft = fftshift(fft2(cm));
figure; fftshow(cm_ft, 'log');

[x,y] = meshgrid(-128:127, -128:127);
z = sqrt(x.^2 + y.^2);
b = (z > 30);
cm_ft_lp = cm_ft.*b;
figure; fftshow(cm_ft_lp, 'log');

cm_2 = uint8(abs(ifft2(cm_ft_lp)));
figure; imshow(cm_2);

%% Butterworth dusuk geciren
close all;
cm = imread('cameraman.tif');
imshow(cm);
cm_ft = fftshift(fft2(cm));
figure; fftshow(cm_ft, 'log');

bw=tiefbutter(cm,10,2);
cm_ft_bw = cm_ft.*bw;
figure; fftshow(cm_ft_bw, 'log');

cm_2 = uint8(abs(ifft2(cm_ft_bw)));
figure; imshow(cm_2);
%% Butterworth yuksek geciren
close all;
cm = imread('cameraman.tif');
imshow(cm);
cm_ft = fftshift(fft2(cm));
figure; fftshow(cm_ft, 'log');

bw=hochbutter(cm,15,2);
cm_ft_bw = cm_ft.*bw;
figure; fftshow(cm_ft_bw, 'log');

cm_2 = uint8(abs(ifft2(cm_ft_bw)));
figure; imshow(cm_2);


%% Gaussian filtresi (Dusuk geciren)
close all;
cm = imread('cameraman.tif');
imshow(cm);
cm_ft = fftshift(fft2(cm));
figure; fftshow(cm_ft, 'log');

g = mat2gray(fspecial('gaussian',256,15));
cm_g = cm_ft.*g;
figure; fftshow(cm_g, 'log');
cm_2 = uint8(abs(ifft2(cm_g)));
figure; imshow(cm_2);
%% Gaussian filtresi (Yuksek geciren)
close all;
cm = imread('cameraman.tif');
imshow(cm);
cm_ft = fftshift(fft2(cm));
figure; fftshow(cm_ft, 'log');

g = mat2gray(fspecial('gaussian',256,15));
cm_g = cm_ft.*(1-g);
figure; fftshow(cm_g, 'log');
cm_2 = uint8(abs(ifft2(cm_g)));
figure; imshow(cm_2);

%% Periyodik gurultu
% Band filtresi
close all;
cm = imread('cameraman.tif');
imshow(cm);

[x,y] = meshgrid(1:256, 1:256);
noise = 1+sin(x+y/1.5);

cm_n = (double(cm)/128+noise)/4;
figure; imshow(cm_n);

cm_ft = fftshift(fft2(cm_n));
figure; fftshow(cm_ft, 'log');

[x,y] = meshgrid(-128:127, -128:127);
z = sqrt(x.^2 + y.^2);
b = (z<45) | (z>55);
cm_bnd = cm_ft.*b;
figure; fftshow(cm_bnd, 'log');

cm_2 = abs(ifft2(cm_bnd));
figure; imshow(cm_2);

%% Centik (Notch) filtresi
close all;
cm = imread('cameraman.tif');

[x,y] = meshgrid(1:256, 1:256);
noise = 1+sin(x+y/1.5);

cm_n = (double(cm)/128+noise)/4;
figure; imshow(cm_n);

cm_ft = fftshift(fft2(cm_n));
figure; fftshow(cm_ft, 'log');

cm_ft(150:158,:)=0;
cm_ft(98:104,:)=0;
cm_ft(:,168:172)=0;
cm_ft(:,86:90)=0;

figure; fftshow(cm_ft, 'log');
cm_2 = ifft2(cm_ft);
figure; imshow(abs(cm_2));

%%
% Frage 1: Grundlegende FFT-Anwendung
close all;

% Erstellen Sie ein Bild wie frage_1.png
a = zeros(256, 256);

for i = 1:32:256
    a(i:i+15, :) = 0;
    a(i+16:i+31, :) = 1;
end

imshow(a);

% und wenden Sie den FFT-Prozess an
a_ft = fftshift(fft2(a));
figure;
fftshow(a_ft, 'log');



%%
% Frage 2: Frequenzfilterung
% Laden Sie das Bild „cameraman.tif" und fuehren Sie 
% den Frequenzfilterungsprozess unter Berücksichtigung 
% des gegebenen filter_frage_2-Bildes aus

close all;
% Load the 'cameraman.tif' image
cm = imread('cameraman.tif');
imshow(cm);

cm_ft = fftshift(fft2(cm));
figure;
fftshow(cm_ft, 'log');

[x,y] = meshgrid(-128:127, -128:127);
z = sqrt(x.^2 + y.^2);
b = (z > 50);
cm_ft_lp = cm_ft.*b;
figure; fftshow(cm_ft_lp, 'log');

cm_2 = uint8(abs(ifft2(cm_ft_lp)));
figure; imshow(cm_2);


%%
% Frage 3: Rauschreduzierung im Frequenzbereich
close all;

% Laden Sie das Bild „twins_noisy.png“ und beseitigen Sie das Rauschen 
% mithilfe räumlicher Filter und FFT-Rauschanalyse
img = imread('twins_noisy.png');
imshow(img);
