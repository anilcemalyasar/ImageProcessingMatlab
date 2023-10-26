close all
bild = imread("caribou.png")
bild_gray = rgb2gray(bild)
% figure;
% imshow(bild);

bild_double = double(bild_gray);
bild_2 = bild_double / 255;
% figure;
% imshow(bild_2);

% heller
bild_3 = bild_double/128;
% figure;
% imshow(bild_3);

% dunkler
bild_4 = bild_double / 512;
% figure;
% imshow(bild_4);

subplot(2,2,1);
imshow(bild);
title("Originalbild uint8");

subplot(2,2,2);
imshow(bild_gray);
title("Grayscaled bild");

subplot(2,2,3);
imshow(bild_3);
title("Helles bild");

subplot(2,2,4);
imshow(bild_4);
title("Dunkles Bild");

%%
close all;
clc;
bild = imread("peppers.jpg");

% Konvertieren von RGB zu Grayscale
bild_gray = rgb2gray(bild);

% Maskieren mit Hilfe Threshold Werte
bild_threshold = bild_gray > 125;

% Nur die Pixels, deren Werte größer als Threshold als Weiss gefärbt
bild_threshold2 = bild_gray > 180;

% Total 4 Subplots
subplot(2,2,1);
imshow(bild);
title("Originalbild");

subplot(2,2,2);
imshow(bild_gray);
title("Grayscaled")

subplot(2,2,3);
imshow(bild_threshold);
title("Threshold > 125")

subplot(2,2,4);
imshow(bild_threshold2);
title("Threshold > 180");

%%











