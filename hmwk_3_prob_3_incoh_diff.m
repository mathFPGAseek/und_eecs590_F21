%---------------------------------------------------------------------
% file name : hmwk_3_prob_3_incoh_diff.m
% Student: Ray Duran
% Date: 10/11/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 
% Calculate the Optical and modulation transfer functions, OTF and 
% MTF of a black box aperture
%
% All code Borrowed from Prof Bo Liang in his Fourier Optics MATLAB demo!!
%
%---------------------------------------------------------------------
A = rgb2gray(imread('USAF-1951.png'));
[M,N] = size(A);
Ig = single(A);
Ig = Ig/max(Ig(:));
Ug = sqrt(Ig); % Amplitude

L1 = 0.5e-3;
L2 = 0.5288e-3;

du = L1/N;
dv = L2/M;

u = -L1/2:du:L1/2-du;
v = -L2/2:dv:L2/2-dv;
[uu,vv] = meshgrid(u,v);
lambda = 0.5*10^-6;
wxp = 6.25e-3;
zxp = 125e-3;
f0 = wxp/(lambda*zxp); % ??? why is this docal length

fu = -1/(2*du):1/L1:1/(2*du)-(1/L1); % why ??? what is this ???
fv = -1/(2*dv):1/L2:1/(2*dv)-(1/L2); % why ??? what is this ???

[Fu,Fv] = meshgrid(fu,fv);

H = circ(sqrt(Fu.^2+Fv.^2)/f0); % why divide by f0 ???
                                % ??? Get error with circ func from mathworks

PSF_coh  = abs(fftshift(fft2(H))); % ??? Is this the PSF amp as shown
                                   % in the Fourier Theory of Image
                                   % Formation ??? ( Yellow block)
                                   % Note: This is essentially the foundation
                                   % of diffraction modeling
                                   % Fraunhofer Diffraction fomrula where
                                   % if we use a far-field diffreaction
                                   % as an approx then the transfer
                                   % fucntiuo is a 2D transform!
                                  
PSF = PSF_coh;
ATF = fft2(PSF); % ???  is the ATF really the coherent transfer fucntion ???
                 % ( Green block)
ATF = ATF/ATF(1,1);

figure
subplot(2,2,1)
mesh(uu,vv,PSF) 
subplot(2,2,2)
MTF = abs(fftshift(ATF)); 
mesh(Fv,Fu,MTF) %% ??? why use Fv and Fu and uu and vv earlier for PSF
subplot(2,2,3)
imagesc(u,v,PSF_coh)
subplot(2,2,4)
MTF = abs(fftshift(ATF)); 
imagesc(fu,fv,MTF) %% ??? Why use fu and fv

% Isn't stuff below the answer ???
% Except for Ug we use Intensity
% ??? and what do we use for ATF Just H^2
%
Gg = fft2(Ug);
Gi = Gg.*ATF;
Ui = ifftshift(ifft2(Gi));
Ui = abs(Ui);
Ii = Ui.^2;
%
figure
subplot(1,2,1)
imshow(Ig)
subplot(1,2,2)
imshow(Ii)






