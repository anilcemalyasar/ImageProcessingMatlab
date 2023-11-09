%% Beispiel-1
close all; clc;
img = imread('circuit.tif');
imshow(img);

edges = edge(img, "canny");
figure; imshow(edges)

[H, Theta, Rho] = hough(edges);
peaks = houghpeaks(H, 5);

figure; imshow(H,[],'XData', Theta, 'YData', Rho,...
                'InitialMagnification', 'fit');
xlabel('\theta'); ylabel('\rho'); axis normal; hold on;

x = Theta(peaks(:,2)); y = Rho(peaks(:,1));
plot(x,y,'s','LineWidth',3);

lines = houghlines(edges, Theta, Rho, peaks);

figure; imshow(img); 
hold on

for k=1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end

%% Beispiel-2
close all; clc;
img = imread('circuit.tif');
imshow(img);

edges = edge(img, "canny");
figure; imshow(edges)

[H, Theta, Rho] = hough(edges, 'Theta', -90:0.5:89);
figure; imshow(H,[],'XData', Theta, 'YData', Rho,...
                'InitialMagnification', 'fit');
xlabel('\theta'); ylabel('\rho'); axis normal; hold on;

P = houghpeaks(H, 10, 'Threshold', 0.3*max(H(:)));

x = Theta(P(:,2)); y = Rho(P(:,1));
plot(x,y,'s','LineWidth',3);

lines = houghlines(edges, Theta, Rho, P, 'FillGap', 15, 'MinLength', 10);

figure; imshow(img); 
hold on

for k=1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    
end

%% Beispiel-3
close all;
img = rgb2gray(imread('backe.png'));
imshow(img);

BW = edge(img,'canny', 0.2);
figure; imshow(BW);

[H, Theta, Rho] = hough(BW, 'Theta', -90:0.5:89);
figure; imshow(H,[],'XData', Theta, 'YData', Rho,...
                'InitialMagnification', 'fit');
xlabel('\theta'); ylabel('\rho'); axis normal; hold on;

P = houghpeaks(H, 10, 'Threshold', 0.3*max(H(:)));

x = Theta(P(:,2)); y = Rho(P(:,1));
plot(x,y,'s','LineWidth',3);

lines = houghlines(BW, Theta, Rho, P, 'FillGap', 25, 'MinLength', 10);

figure; imshow(img); 
hold on

for k=1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    
end

%%
% Frage-1
% Aufgabe: Erkennen Sie mithilfe der Hough-Transformation Kreise in einem Bild, beispielsweise Münzen im Bild
% 1- Eliminieren Sie das Bildrauschen mithilfe der Filter, die wir letzte Wochen verwendet haben
% 2- Führen Sie eine Kantenerkennung durch, z.B. Canny, Sobel, Prewitt usw.
% 3- Erkennen Sie die Kreise im Bild mit dem Befehl imfindcircles
% 4- Visualisieren Sie die Ausgabe mit dem Befehl viscircles

I = imread('coins.jpg');
imshow(I)

cleaned_img = medfilt2(I, [5, 5]);

BW = edge(cleaned_img, "canny", 0.5);
figure;
imshow(BW)

[centers, radii, metric] = imfindcircles(BW, [20 60]);
centersStrong = centers(1:9, :);
radiiStrong = radii(1:9);
metricStrong = metric(1:9);

viscircles(centersStrong, radiiStrong,'EdgeColor','r');


%%
% Frage-2
% Aufgabe: Erkennen Sie die Straßenlinien im Bild mithilfe der Hough-Transformation
% Optionell: Eliminieren Sie das Bildrauschen mithilfe der Filter, die wir letzte Wochen verwendet haben
% 1- Führen Sie eine Kantenerkennung durch, z.B. Canny, Sobel, Prewitt usw.
% 2- Verwenden Sie die Befehle hough, houghpeaks und houghlines, um die Linien im Bild zu erkennen
% 3- Visualisieren Sie die Ausgabe
close all; clc;

I = imread('road_with_lines.jpg');
imshow(I)

img_gray = rgb2gray(I);
cleaned_img = medfilt2(img_gray, [3, 3]);

BW = edge(cleaned_img, "canny", 0.2);
figure;
imshow(BW)

[H, Theta, Rho] = hough(BW, "Theta", -90:0.5:89);
figure; imshow(H, [], 'XData', Theta, 'YData', Rho,...
                   'InitialMagnification', 'fit');
xlabel('\theta'); ylabel('\rho'); axis normal; hold on;


P  = houghpeaks(H, 20, 'Threshold', 0.2*max(H(:)));
imshow(H,[],'XData',Theta,'YData',Rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(Theta(P(:,2)),Rho(P(:,1)),'s','color','white');


lines = houghlines(BW, Theta, Rho, P, "FillGap", 25, 'MinLength', 45);

figure, imshow(I), hold on
for k=1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
    
    % Plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','blue');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','yellow');    
    
end



%% 
% Frage-3
% Aufgabe: Erkennen Sie die Linien im Bild mithilfe der Hough-Transformation
% Optionell: Eliminieren Sie das Bildrauschen mithilfe der Filter, die wir letzte Wochen verwendet haben
% 1- Führen Sie eine Kantenerkennung durch, z.B. Canny, Sobel, Prewitt usw.
% 2- Verwenden Sie die Befehle hough, houghpeaks und houghlines, um die Linien im Bild zu erkennen
% 3- Visualisieren Sie die Ausgabe

I = imread('building.jpg');
imshow(I)

img_gray = rgb2gray(I);
cleaned_img = medfilt2(img_gray, [3, 3]);

BW = edge(cleaned_img, "canny", 0.2);
figure;
imshow(BW)

[H, Theta, Rho] = hough(BW, "Theta", -90:0.5:89);
figure; imshow(H, [], 'XData', Theta, 'YData', Rho,...
                   'InitialMagnification', 'fit');
xlabel('\theta'); ylabel('\rho'); axis normal; hold on;


P  = houghpeaks(H, 25, 'Threshold', 0.4*max(H(:)));
imshow(H,[],'XData',Theta,'YData',Rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(Theta(P(:,2)),Rho(P(:,1)),'s','color','white');


lines = houghlines(BW, Theta, Rho, P, "FillGap", 40, 'MinLength', 80);

figure, imshow(I), hold on
for k=1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
    
    % Plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','blue');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','yellow');    
    
end