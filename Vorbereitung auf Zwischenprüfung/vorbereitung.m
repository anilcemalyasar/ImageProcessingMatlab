%% Lokale Operatoren – Faltungs-Operationen (Sobel-Filter zur Kantendetektion)
close all; clc;
img = [5, 4, 1, 1, 1;
    5, 4, 1, 1, 1;
    5, 4, 1, 1, 1;
    4, 4, 0, 0, 0;
    4, 4, 0, 0, 0
];

sobel = fspecial("sobel");
img_filtered = uint8(filter2(sobel', img));
img_filtered
% 16 12	0
% 16 13	0
% 16 15	0

%% Globale Operatoren – Geometrische Transformationen (Rotation)
close all; clc; clear;

I = imread("building.jpg");
img_gray = rgb2gray(I);
figure;
imshow(img_gray);

img_rotated_90 = imrotate(img_gray, 90, "nearest");
img_rotated_180 = imrotate(img_gray, 180, 'nearest');

figure;
imshowpair(img_gray, img_rotated_180, 'montage')
title("Original Image vs 180° Rotated")

% Die neue Position entspricht i.d.R. nicht genau einem Punkt der Bildmatrix, sodass interpoliert werden muss
% Interpolierung erfolgt z.B. durch: Nächste Nachbar Interpolation, Bilineare Interpolation

%% Globale Operatoren
close all; clc; clear;

