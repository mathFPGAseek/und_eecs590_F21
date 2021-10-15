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
%
% All code Borrowed from Prof Bo Liang in his Fourier Optics MATLAB demo,
% from EECS 590
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
f0 = wxp/(lambda*zxp); 

fu = -1/(2*du):1/L1:1/(2*du)-(1/L1);
fv = -1/(2*dv):1/L2:1/(2*dv)-(1/L2); 

[Fu,Fv] = meshgrid(fu,fv);

H = circ(sqrt(Fu.^2+Fv.^2)/f0);  % This is logical
H_doub = double(H);
H_area = nnz(H_doub); % Calculate area of aperture
                           

PSF_incoh  = abs(fftshift(fft2(H)))/H_area; % This is also known as the
                                   % Optical transfer function, where 
                                   % we have to square the H because the
                                   % impulse responce of such a system is
                                   % the sqaure magnitude of the amplitude
                                   % impulse response.
                                   % Note: This is essentially the foundation
                                   % of diffraction modeling
                                   % Fraunhofer Diffraction fomrula where
                                   % if we use a far-field diffreaction
                                   % as an approx then the transfer
                                   % fucntiuo is a 2D transform!
                                  
PSF = PSF_incoh;
OTF = fft2(PSF); 
OTF = OTF/OTF(1,1);

figure
subplot(2,2,1)
mesh(uu,vv,PSF) 
subplot(2,2,2)
MTF = abs(fftshift(OTF)); 
mesh(Fv,Fu,MTF)
subplot(2,2,3)
imagesc(u,v,PSF_incoh)
subplot(2,2,4)
MTF = abs(fftshift(OTF)); 
imagesc(fu,fv,MTF) 


%
Gg = fft2(Ig); % Use Ig for incoherent system
Gi = Gg.*OTF;
Ui = ifftshift(ifft2(Gi));
Ui = abs(Ui);
Ii = Ui.^2;
%
figure
subplot(1,2,1)
imshow(Ig)
subplot(1,2,2)
imshow(Ii)






