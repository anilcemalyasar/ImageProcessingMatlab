close all
bild = rgb2gray(imread('caribou.png'));
bild_double = double(bild);
bild_2 = bild_double / 255;
bild_dunkel = bild_double / 512;
bild_hell = bild_double / 128;
imshow(bild_2)
figure;
imshow(bild_dunkel)
figure;
imshow(bild_hell)

bild_3 = im2double(bild);
figure
imshow(bild_3)
%%
close all
clc
clear 

bild = rgb2gray(imread('caribou.png'));
imshow(bild)

bild_reh = bild > 125;
figure
imshow(double(bild_reh))

bild_reh_2 = bild > 170;
figure;
imshow(double(bild_reh_2))

%%
close all
clc
clear 

bild = rgb2gray(imread('blocks.png'));
imshow(bild)

bild_dunkel = bild - 128;
figure
imshow(bild_dunkel)

bild_dunkel_2 = 255 - bild
figure
imshow(bild_dunkel_2)

%%
close all
clc
clear 

bild = imread('pout.tif')
imshow(bild);
figure
histogram(bild)

bild_2 = imadjust(bild,stretchlim(bild),[0 1], 1)
figure
imshow(bild_2)

figure
histogram(bild_2)

%%
clc; close all;
bild = rgb2gray(imread("caribou.png"));
imshow(bild); figure; histogram(bild);

bild_hist = imadjust(bild, [0.5 0.75], [0 1], 1);
figure; imshow(bild_hist);
figure; histogram(bild_hist);

bild_reh = bild > 170;
figure;
imshow(bild_reh)

bild_reh = bild_hist > 220;
figure;
imshow(bild_reh)

%%
close all
bild = imread('cameraman.tif')
imshow(bild); figure; histogram(bild);

% Frage-1

% Führen Sie einen Histogrammausgleich für verschiedene Optionen durch

bild_hist = imadjust(bild, [0.0353 0.8039], [0, 1], 1);
figure; imshow(bild_hist);
figure; histogram(bild_hist);


% Zeigen Sie das Originalbild und das entzerrte Bild nebeneinander an. (subplot)
subplot(1, 2, 1);
imshow(bild);
title('Originalbild');

subplot(1, 2, 2);
imshow(bild_hist);
title("Entzerrtes Bild");

% Zeichnen Sie die Histogramme beider Bilder.
figure; histogram(bild);
figure; histogram(bild_hist);




%%
close all
bild = imread('peppers.jpg')
imshow(bild)


% Frage-2
% Konvertieren Sie das Bild mit rgb2gray von RGB in Graustufen
bild_gray = rgb2gray(bild);
% Führen Sie einen Histogrammausgleich für verschiedene Optionen durch
bild_hist = imadjust(bild_gray, [0.0902 0.9216], [ 0 1 ], 0.8);

% Zeigen Sie das Originalbild und das entzerrte Bild nebeneinander an. (subplot)
subplot(1,2,1);
imshow(bild);
title("Originalbild");

subplot(1,2,2);
imshow(bild_hist);
title("Entzerrtes Bild");

% Zeichnen Sie die Histogramme beider Bilder.
figure; histogram(bild);
figure; histogram(bild_hist);

% Konvertieren Sie das Ergebnis zurück in RGB
bild_new = cat(3, bild_gray, bild_gray, bild_gray);
figure;
imshow(bild_new);

%%
% Frage - 3
close all
bild = imread('peppers.jpg')
imshow(bild)

% Konvertieren Sie es mit rgb2ycbcr in den YCbCr-Farbraum.
bild_ycbcr = rgb2ycbcr(bild);

% Wenden Sie den Histogrammausgleich nur auf den Y-Kanal (Luminanz) an.
y = bild_ycbcr(:, :, 1);

y_hist = imadjust(y, [0.1412 0.8549], [ 0 1 ], 1);

bild_new = bild
bild_new(:, :, 1) = y_hist

subplot(2, 2, 1);
imshow(bild);
title("Originalbild")

subplot(2, 2, 2);
imshow(bild_new);
title("Auf den Y-Kanal entzerrt")
% Konvertieren Sie das Ergebnis mit ycbcr2rgb zurück in RGB.
bild_rgb = ycbcr2rgb(bild_new);

% Zeigen Sie die Originalbilder und entzerrten Bilder an.
subplot(2, 2, 3);
imshow(bild);
title("Originalbild")

subplot(2, 2, 4);
imshow(bild_rgb);
title("Entzerrtes Bild");