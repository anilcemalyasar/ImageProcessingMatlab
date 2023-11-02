%% Ortalama filtresi
close all; clc;
img = imread('cameraman.tif');
imshow(img)
ortalama_filt = ones(7) / 49;
img_ortalama = uint8(filter2(ortalama_filt, img));
figure;
imshow(img_ortalama)
%% Gaus filtresi
close all; clc;
img = imread('cameraman.tif');
imshow(img);

gaus_filt = fspecial('gaussian', 5, 4);
img_gaus = uint8(filter2(gaus_filt, img));
figure;
imshow(img_gaus)

gaus_filt = fspecial('gaussian', 5, 1);
img_gaus = uint8(filter2(gaus_filt, img));
figure;
imshow(img_gaus)


img_gaus_2 = uint8(imgaussfilt(img,4,'FilterSize',5));
figure;
imshow(img_gaus_2);


gaus_filt = fspecial('gaussian', 5, 5);
img_sonuc = img;
img_gaus_3 = uint8(filter2(gaus_filt, img(100:200, 100:200)));
img_sonuc(100:200,100:200) = img_gaus_3;
figure;
imshow(img_sonuc)

%% Medyan filtresi
close all; clc;
img = imread('cameraman.tif');
imshow(img);



img_gurultu = imnoise(img, 'Salt & Pepper',0.25);
figure;
imshow(img_gurultu)


img_medyan = medfilt2(img_gurultu,[5,5]);
figure;
imshow(img_medyan);


ortalama_filt = ones(7) / 49;
figure;
img_ortalama = uint8(filter2(ortalama_filt, img_gurultu));
imshow(img_ortalama);


%% Birim islemi
close all; clc;
img = imread('cameraman.tif');
imshow(img);

filt = zeros(7);
filt(4,4) = 1;
imshow(img);
img_filt = uint8(filter2(filt, img));
figure;
imshow(img_filt);

%% Resim hatlarini keskinlestirme
close all; clc;
img = imread('lena.png');
img = rgb2gray(img);
imshow(img);

ortalama_filt = ones(11) / 121;
img_ortalama = uint8(filter2(ortalama_filt, img));
figure;
imshow(img_ortalama);

img_gaus = uint8(img - img_ortalama);
figure;
imshow(img_gaus);


img_son = uint8(img + img_gaus*1);
figure;
imshow(img_son)

%% Kenar tespiti
close all; clc;
img = imread('cameraman.tif');
imshow(img);


sobel = fspecial('sobel');
img_sobel = uint8(filter2(sobel, img));
figure;
imshow(img_sobel);


img_kenar_2 = uint8(filter2(sobel', img));
figure;
imshow(img_kenar_2);

img_kenar_3 = edge(img,'sobel','both');
figure;
imshow(img_kenar_3);

img_kenar_3_uint8 = uint8(img_kenar_3*255);
figure;
imshow(uint8(img + img_kenar_3_uint8));

%%
I = imread('lena.png');

% Frage 1
% Konvertieren Sie das Lena-Bild in Graustufen
% Wenden Sie die verschiedenen Kantendetektoren wie Sobel, Prewitt, Canny usw. mit unterschiedlichen Schwellenwerten auf das Bild an. Wählen Sie die beste Kombination
img_gray = rgb2gray(I);
figure;
imshow(img_gray);

img_sobel = edge(img_gray, 'sobel', 'both');
figure;
imshow(img_sobel);
title("Kantenerkennung mit Sobel");

img_canny_1 = edge(img_gray, "canny", [0.1, 0.4]);
figure;
imshow(img_canny_1);
title("Kantenerkennung mit Canny 0.1 0.4");

img_canny_2 = edge(img_gray, "canny", [0.2, 0.5]);
figure;
imshow(img_canny_2);
title("Kantenerkennung mit Canny 0.2 0.5");

img_prewitt = edge(img_gray, "prewitt");
figure;
imshow(img_prewitt);
title("Kantenerkennung mit Prewitt");


% Frage 2
% Erstellen Sie benutzerdefinierte Filter, um Kanten zu erkennen, z. B. horizontale oder vertikale Filter
% Wenden Sie diesen Filter mit dem Befehl imfilter auf das Bild an

% Horizontal Sobel Edge Detection Filter 
sobel = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
horizontale_kanten = imfilter(img_gray, sobel);
figure;
imshow(horizontale_kanten);
title("Sobel Horizontale Kanten");


% Frage 3
% Führen Sie eine Kantenerkennung in jedem Kanal eines Farbbildes durch und kombinieren Sie die Ergebnisse.
[R, G, B] = imsplit(I);

edgeImageR = edge(R, "canny");
R(edgeImageR) = 255;
Rimage = zeros(size(I), 'uint8');
Rimage(:,:,1) = R;

edgeImageG = edge(G, "canny");
G(edgeImageG) = 255;

edgeImageB = edge(B, "canny");
B(edgeImageB) = 255;

kombinierte_Kanten = edgeImageR | edgeImageG | edgeImageB;

figure;
imshow(kombinierte_Kanten);
