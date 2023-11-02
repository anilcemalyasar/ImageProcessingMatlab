%% Ortalama filtresi (Durchschnittsfilter)
close all; clc;
img = imread('cameraman.tif');

mean_filter = ones(10) / 100;
img_filtered = uint8(filter2(mean_filter, img));
sum(img_filtered, "all") %% 7599063
imshowpair(img, img_filtered, 'montage')
title("Mean Filter with 10x10")

mean_filter2 = ones(7) / 49;
img_filtered_2 = uint8(filter2(mean_filter2, img));
sum(img_filtered_2, "all") % 7659343 großer als 7599063 deswegen die hohen Frequenzen werden weniger unterdrückt 
figure;
imshowpair(img, img_filtered_2, 'montage')
title("Mean Filter with 7x7")

%% Gaus filtresi (Gaussianfilter)
close all; clc;
img = imread('cameraman.tif');
% imshow(img);

% die letzte Parameter ist sigma threshold
gaus_filt = fspecial("gaussian", 5, 4);
img_gaus = uint8(filter2(gaus_filt, img));
imshowpair(img, img_gaus, 'montage');
title("Original Image (Left) Vs. Gaussian Filtered Image (Right) Sigma Threshold 4");

gaus_filt_2 = fspecial("gaussian", 5, 1);
img_gaus_2 = uint8(filter2(gaus_filt_2, img));
figure;
imshowpair(img, img_gaus_2, 'montage');
title("Original Image (Left) Vs. Gaussian Filtered Image (Right) Sigma Threshold 1");

img_lena = imread('lena.png');
img_lena_rgb = rgb2gray(img_lena);
% Padding : 'symmetric'	Pad image with mirror reflections of itself.
img_gaus_3 = uint8(imgaussfilt(img_lena_rgb, 6, "Padding", "symmetric","FilterSize",7));
figure;
imshowpair(img_lena_rgb, img_gaus_3, 'montage');

%% Median Filtresi ( Median Filter)
% Medianfilter sind am beliebtesten, da sie Impulsgeräusche, auch Salz-Pfeffer-Geräusche genannt, reduzieren können.
img = imread('eight.tif');
figure;
imshow(img);

img_noise = imnoise(img, 'salt & pepper', 0.1);
% figure;
% imshow(img_noise);

img_median = medfilt2(img_noise, [5, 5]);
figure;
imshowpair(img_noise, img_median, 'montage');
title('Noised Image (Left) Vs. Median Filtered Image (Right) 5x5');