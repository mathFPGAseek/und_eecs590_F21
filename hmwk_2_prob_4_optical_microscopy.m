
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
clf
clear
%% sobel filter - edge detection adn cleanup of image; From MATHWORKS
I = imread('cell.tif');

[~,threshold] = edge(I,'sobel');
fudgeFactor = 0.5;
BWs = edge(I,'sobel',threshold * fudgeFactor);

figure(1)
imshow(BWs)
title('Binary Gradient Mask')

se90 = strel('line',3,90);
se0 = strel('line',3,0);

BWsdil = imdilate(BWs,[se90 se0]);
figure(2)
imshow(BWsdil)
title('Dilated Gradient Mask')

BWdfill = imfill(BWsdil,'holes');
figure(3)
imshow(BWdfill)
title('Binary Image with Filled Holes')

BWnobord = imclearborder(BWdfill,4);
figure(4)
imshow(BWnobord)
title('Cleared Border Image')

seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
figure(5)
imshow(BWfinal)
title('Segmented Image');



%% Convert to uint8 for use with image processing functions
rows = size(BWfinal,1);
cols = size(BWfinal,2);

for i = 1 : rows
    for j = 1 : cols
        if ( BWfinal(i,j) == 1)
          BWfinal_gray(i,j) = uint8(255);
        else
          BWfinal_gray(i,j) = uint8(0);
        end
    end
end

            
%% Image rotation and translation


% Rotation of the image
degree = 140;
img = BWfinal_gray;
imgr = imrotate(img,degree,'bilinear','crop');
figure(6)
imshow(imgr);

% Translation of the image
imgt = imtranslate(imgr,[-20,0],'FillValues',0);
figure(7)
imshow(imgt);

% Lets find approx of the minor axis of elliptical which would be the
% height of the fish
[icoor,jcoor,v] = find(imgt);

nnz_size  = size(jcoor,1);
nnz_count = zeros(1, cols);

for j = 1 : cols
    for k = 1 : nnz_size
      if ( jcoor(k) == j)
        nnz_count(j) = nnz_count(j) + 1;
      end
    end
end

minor_axis_image = max(nnz_count);

debug = 1;

% Let's find major axis
imgt_transposed = imgt';
figure(8)
imshow(imgt_transposed);

debug = 1;

[icoor2,jcoor2,v2] = find(imgt_transposed);

nnz_size  = size(jcoor2,1);
nnz_count = zeros(1, cols);

for j = 1 : cols
    for k = 1 : nnz_size
      if ( jcoor2(k) == j)
        nnz_count(j) = nnz_count(j) + 1;
      end
    end
end

major_axis_image = max(nnz_count);

%
% True pixel size is 6.5e-6* 40(mag power)
pixel_size = 6.5e-6*40; % one dim

% Size of the cell
size_of_cell = pi*major_axis_image*minor_axis_image*(pixel_size*pixel_size); 


