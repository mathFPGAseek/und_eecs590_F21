%---------------------------------------------------------------------
% file name : hmwk_2_prob_3_gaussian_noise_added.m
% Student: Ray Duran
% Date: 9/29/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 
% help imnoise:
% J = imnoise(I,'gaussian',M,V) adds Gaussian white noise of mean M and
% variance V to the image I. When unspecified, M and V default to 0 and
% 0.01 respectively.
%--------------------------------------------------------------------- 
 J = imread('cameraman.tif');
 
 
 % Add noise
 JN1 = imnoise(J,'gaussian',0,0.01);
 JN2 = imnoise(J,'gaussian',3,0.1);
 JN3 = imnoise(J,'gaussian',1,0.2);
 
 % display
 figure
 subplot(1,4,1)
 imshow(J)
 title('Original')
 
 subplot(1,4,2)
 imshow(JN1)
 title('Noise Mean=0 Var=.01')

 subplot(1,4,3)
 imshow(JN2)
 title('Noise Mean=3 Var=.1')

 subplot(1,4,4)
 imshow(JN3)
 title('Noise Mean=1 Var=.2')
 
 % Save files
 imwrite(JN1,'cameraman_gauss_m_eq_0_v_eq_dot01.tif');
 imwrite(JN2,'cameraman_gauss_m_eq_3_v_eq_dot1.tif');
 imwrite(JN3,'cameraman_gauss_m_eq_1_v_eq_dot02.tif');


