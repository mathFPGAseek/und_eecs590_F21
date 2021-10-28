
%---------------------------------------------------------------------
% file name : hmwk_4_prob_1_dct_and_dft.m
% Student: Ray Duran
% Date: 10/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 
% Examples with DCT and DFT
%---------------------------------------------------------------------
clear;
close all;

A = imread('cameraman.tif');
A_doub = double (A);

X_DCT = dct(A_doub);
X_DFT = fft(A_doub);

X_DFT_real = abs(X_DFT)


figure(1)
h = surf(X_DCT)
title('DCT of Cameraman')

set(h,'LineStyle','none')

figure(2)
g = surf(X_DFT_real)
title('DFT of Cameraman')

set(g,'LineStyle','none')



