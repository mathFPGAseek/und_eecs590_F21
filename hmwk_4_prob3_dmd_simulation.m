
%---------------------------------------------------------------------
% file name : hmwk_4_prob_3_dmd_simulation.m
% Student: Ray Duran
% Date: 10/16/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 
% Model a Digital Micro-Mirror Device(DMD) with a Bernouli Random Matrix
% Calculate the mutual coherence of the sensing and representation matrices
%
%
% Code Borrowed from : 
% compressive_sensing_demo
% Use "L1 magic" by Justin Romberg.
% http://www.acm.caltech.edu/l1magic 
% Download the L1 magic toolbox and add to the matlab dir
%---------------------------------------------------------------------

A = imread('cameraman.tif');
M = 50; %Downsample the image to 50x50 
N = 50;
A = imresize(A,[M N]);
x = double(A(:));
n = length(x);

%___MEASUREMENT MATRIX___
m = 1000; % Number of samples
%Phi = randn(m,n); % Generate Gaussian distribute random numbers
p = 0.2;
Phi = binornd(1,p,m,n);


%___COMPRESSION___
y = Phi*x;

%___THETA___
% NOTE: Avoid calculating Psi (nxn) directly to avoid memory issues.
Theta = zeros(m,n);
for ii = 1:n
    ek = zeros(1,n);
    ek(ii) = 1;
    psi = idct(ek)';
    Theta(:,ii) = Phi*psi;
end

% Calculate coherence
u = mutual_coherence(Theta);
lower_bound_on_mutual_coherence = ((N-M)/(M*(N-1)))^0.5;


%___l2 NORM SOLUTION___ s2 = Theta\y; %s2 = pinv(Theta)*y
s2 = pinv(Theta)*y;
%___BP SOLUTION___
s1 = l1eq_pd(s2,Theta,Theta',y,5e-3,20); % L1-magic toolbox

%___IMAGE RECONSTRUCTIONS___
x1 = zeros(n,1);
for ii = 1:n
    ek = zeros(1,n);
    ek(ii) = 1;
    psi = idct(ek)';
    x1 = x1+psi*s1(ii);
end
%_____ Plots
coherence_str = (['Coherence =' num2str(u)]);
figure('name','Compressive sensing image reconstructions')
subplot(1,2,1), imagesc(reshape(x,M,N)), xlabel('original'), axis image
subplot(1,2,2), imagesc(reshape(x1,M,N)), xlabel('basis pursuit'), axis image
str = sprintf( 'Digital Micro-Mirror Device Single Pixel Camera Simulation \n mututal coherence w/ Bernouli random matrix = %4.2f ',u)
sgtitle(str)
%subtitle(coherence_str)
colormap gray
