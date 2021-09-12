%---------------------------------------------------------------------
% file name : hmwk_1_prob_5.m
% Student: Ray Duran
% Date: 9/9/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 2D FFT of Camerman 
%---------------------------------------------------------------------
X = imread('cameraman.tif');

debug = 1;

sizeX = size(X,1);
sizeY = size(X,2);

% Setup Figure
lims = [ -256 256];
clim = [ 0 2000];
figure(1), clf
plot(1)
imageh = imagesc(zeros(sizeX));
axis square, axis off, axis xy
set(gca,'xlim',[lims(2)-30 lims(2)+30],'ylim',[lims(2)-30 lims(2)+30],'clim',[clim(1) clim(2)])
title('Amplitude Spectrum')


% 2-D FFT
img = abs(fftshift(fft2(X)));

set(imageh,'CData',img);

debug = 1;
