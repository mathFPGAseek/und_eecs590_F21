%---------------------------------------------------------------------
% file name : hmwk_4_prob_5_lucy_deconv.m
% Student: Ray Duran
% Date: 10/24/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 
% Blur and add noise to image and try to deconvolve to restore
%
%
% All code Borrowed from Prof Bo Liang in his MATLAB demo,
% from EECS 590
%---------------------------------------------------------------------%% 
clear; 
close all;
%% Deconvolution
I1 = im2double(imread('cameraman.tif'));
PSF = fspecial('gaussian',5,2);       
I2 = imfilter(I1,PSF,'conv');                % blur
sigma_1 = 0;                                 % noise level
I3 = imnoise(I2,'gaussian',0,sigma_1);       % blur + noise
sigma_2 = 0.0001;                             
I4 = imnoise(I2,'gaussian',0,sigma_2); 
sigma_3 = 0.001;                             
I5 = imnoise(I2,'gaussian',0,sigma_3);

% Note: Matlab recommends using the 
% imgaussfilt function in place of fspecial
% but since we are going to apply a deconvolution
% algorithm we will need the PSF( impulse function)
% and that is easier to use with the fspecial.test imgauss needs a positive sigma
%Example use of imgauss:
% IT2 = imgaussfilt(IT1,0.01,'FilterSize',5); 

figure(1)
subplot(1,2,1)
imshow(I1);
title('Original Image')
subplot(1,2,2)
imshow(I2);
title('Blurred Image')

figure(2)
subplot(1,3,1)
imshow(I3);
title('Blurred Image w/ Gaussian noise sigma = 0')
subplot(1,3,2)
imshow(I4);
title('Blurred Image w/ Gaussian noise sigma = 0.0001')
subplot(1,3,3)
imshow(I5);
title('Blurred Image  w/ Gaussian noise sigma = 0.001')

%% 3. Lucy-Richardson method
I = I5;
I_f5 = deconvlucy(I,PSF,5);
figure(3)
subplot(1,3,1)
imshow(I1);
title('Original Image')
subplot(1,3,2)
imshow(I);
title('Blurred Image  w/ Gaussian noise sigma = 0.001')
subplot(1,3,3)
imshow(I_f5);
title('Image REconstruct Using Lucy-Richardson iter = 5')

I_f6 = deconvlucy(I,PSF,20);
figure(4)
subplot(1,3,1)
imshow(I1);
title('Original Image')
subplot(1,3,2)
imshow(I);
title('Blurred Image  w/ Gaussian noise sigma = 0.001')
subplot(1,3,3)
imshow(I_f6);
title('Image REconstruct Using Lucy-Richardson iter = 20')

%% 4. Blind deconvolution

I = I5;
WT = zeros(size(I));
WT(5:end-4,5:end-4) = 1;
INITPSF = ones(size(PSF));
sigma = 2;
% [J, P] = deconvblind(I,INITPSF,20);
[J, P] = deconvblind(I,INITPSF,20,10*sqrt(sigma),WT);
figure(5)
subplot(221);imshow(I);
title('A = Blurred and Noisy');
subplot(222);imshow(PSF,[]);
title('True PSF');
subplot(223);imshow(J);
title('Deblurred Image');
subplot(224);imshow(P,[]);
title('Recovered PSF');
