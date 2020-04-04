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

subplot(221), imshow(im)
subplot(222), imshow(im1)
subplot(223), imshow(gray)
subplot(224), imshow(gray1)
