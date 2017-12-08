clear all;
close all;
clc;

rgb = imread('leaf.jpg');
Igray = rgb2gray(rgb);
Ithresh = Igray > 150;

SE = strel('disk', 4, 8);
BW = imopen(Ithresh, SE);

[H, theta, rho] = hough(BW);

max(H(:))
min(H(:))
Hgray = mat2gray(H);
Hadj = imadjust(Hgray);

figure
imshow(Hadj, 'InitialMagnification','fit'); 
axis normal;

figure(2),
colormap(hot);
imshow(Hadj, 'InitialMagnification','fit','XData', theta, 'YData',rho); 
axis normal;
axis on;
xlabel('\theta, degrees');
ylabel('\rho');
hold on;
P = houghpeaks(H,5);
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'g*')





