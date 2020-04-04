close all
clear
clc

[file, path] = uigetfile('*.bmp; *.jpg; *.png', 'image ...');
im = imread([path file]);
hsv = rgb2hsv(im);
im = im2double(im);
gray = rgb2gray(im);
gray1 = rtcprgb2gray(im);
hsv(:,:,3) = gray1;
im1 = hsv2rgb(hsv);

% subplot(221), imshow(im)
% subplot(222), imshow(im1)
% subplot(223), imshow(gray)
% subplot(224), imshow(gray1)

gray = cat(3, gray, gray, gray);
gray1 = cat(3, gray1, gray1, gray1);

cmp_img = cat(2, im, gray, gray1);
[~, w, ~] = size(gray);
imshow(cmp_img)
text(10, 10, 'rgb', 'Color', 'red')
text(10+w, 10, 'rgb2gray', 'Color', 'red')
text(10+w+w, 10, 'rtcprgb2gray', 'Color', 'red')

fig = getframe;
figure, imshow(fig.cdata)
imwrite(fig.cdata, file)
