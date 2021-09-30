
%---------------------------------------------------------------------
% file name : hmwk_2_prob_4_optical_microscopy.m
% Student: Ray Duran
% Date: 9/29/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 
% Estimate the number of pixels in cell.tif
% Code borrowed from Matlab example
% https://www.mathworks.com/help/images/detecting-a-cell-using-image-segmentation.html
%--------------------------------------------------------------------- 
%% sobel filter - edge detection
I = imread('cell.tif');

[~,threshold] = edge(I,'sobel');
fudgeFactor = 0.5;
BWs = edge(I,'sobel',threshold * fudgeFactor);

imshow(BWs)
title('Binary Gradient Mask')

se90 = strel('line',3,90);
se0 = strel('line',3,0);

BWsdil = imdilate(BWs,[se90 se0]);
imshow(BWsdil)
title('Dilated Gradient Mask')

BWdfill = imfill(BWsdil,'holes');
imshow(BWdfill)
title('Binary Image with Filled Holes')

BWnobord = imclearborder(BWdfill,4);
imshow(BWnobord)
title('Cleared Border Image')

seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
imshow(BWfinal)
title('Segmented Image');

%% Count white pixels
pixel_count = sum(BWfinal(:) == 1);

