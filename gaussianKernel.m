%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Original Code from Steve Seitz. Modified for clarity and beautification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
close all
clear all

%Create Gaussian Filter 15x15 with simga = 2
g = fspecial('gaussian',15,2);
%Display Filter with scaled colors
imagesc(g)
%Visualize 3D shaded Surface with Lighting
surfl(g)
%Importamos imagenes default matlab in B&W
imgOrig = rgb2gray(imread('peppers.png'));
figure, imshow(imgOrig)
%Apply 2D convolution on the original image with the gaussian filter
gImg= conv2(imgOrig,g,'same');


%Apply Simple Derivative with [-1 1] on original image
figure
subplot(1,2,1)
imagesc(conv2(imgOrig,[-1 1],'same'));
title('[-1 1] on Original Image (Derivative on X)')



subplot(1,2,2)
imagesc(conv2(imgOrig,[-1; 1],'same'));
title('[-1; 1] on Original Image (Derivative on Y)')


figure
%Apply Simple Derivative with [-1 1] on gaussian smoothed image
subplot(2,2,1)
imagesc(conv2(gImg,[-1 1],'same'));
title({'[-1 1] on Smoothed Gauss Image','(Derivative on X)'})

subplot(2,2,2)
imagesc(conv2(gImg,[-1; 1],'same'));
title({'[-1; 1] on Smoothed Gauss Image','(Derivative on Y)'})


%We do the derivative on the Gaussian Filter (Gaussian derivative now)
dx= conv2(g,[-1 1],'same');
dy= conv2(g,[-1;1],'same');

%Apply Simple Derivative with [-1 1] on original image
subplot(2,2,3)
imagesc(conv2(imgOrig,dx,'same'));
title({'[-1 1] on GaussMask and then conv on',' OrigImage (Derivative on X)'})

%Apply Simple Derivative with [-1 1] on gaussian smoothed image
subplot(2,2,4)
imagesc(conv2(imgOrig,dy,'same'));
title({'[-1; 1] on GaussMask and then conv on','OrigImage (Derivative on Y)'})

%We create laplacian of gaussian filter (second derivative of gaussian)
lg= fspecial('log',15,2);

figure
subplot(2,1,1)
limg= conv2(imgOrig,lg,'same');
imagesc(limg)
title('Matlab Builtin Laplacian of Gaussian (2nd Gauss Der)')

subplot(2,1,2)
imagesc(double(imgOrig)+ .2*limg)
title('Original Image + LoG on OrigImage')

