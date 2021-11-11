%---------------------------------------------------------------------
% file name : hmwk_5_prob_5_transient_imaging.m
% Student: Ray Duran
% Date: 11/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 
% See Below; All code from Lindell et. al below. In this exercise we just 
% experimented with the different options
% Note: Need to include folders and sub-folders of scripts3D, data and
% results for proper operation.
%--------------------------------------------------------------------- 
% TOWARDS TRANSIENT IMAGING AT INTERACTIVE RATES WITH SINGLE-PHOTON DETECTORS
% Supplementary Datasets
% David B. Lindell, Matthew O'Toole, Gordon Wetzstein
% 
% Datasets
% The raw captured results are stored in the 'data' directory.  These .mat files
% contain both the raw data captured from the sensor, and the calibrated
% measurements formatted as transient images with dimensions arranged as
% [transient_image_idx, transient_frame_idx, row, column]. Processed results are
% stored in the results folder.  Processing code can be downloaded separately
% from the project webpage. Before running the code, be sure to place the 'data'
% and 'results' folders into the same directory as the README file included with
% the code.

%% Prepare the dataset
% filenames of all scenes as well as temporal slices to use
scenes = {  'ghost_highres', 710, 919; ...
            'mirror_highres', 730, 939; ...
            'fiber_highres', 800, 1400; ...
            'david_highres', 760, 879; ...
            'wall_highres', 760, 879; ...
            'diffuser_highres', 710, 889;
         };
     
data_path = 'transient_imaging_code\data\';
sceneIDX = 3;

filename = scenes{sceneIDX,1};
load([data_path, filename '.mat'], 'transient');

% remove dead SPADs
transient(:,:,181,:) = [];
transient(:,:,77,:) = [];
transient(:,:,7,:) = [];

% get number of frames
numFrames = size(transient,1);
disp(['scene: ' filename ' has ' num2str(numFrames) ' frames']);
frameIDX = 1;
raw = squeeze(transient(frameIDX,scenes{sceneIDX,2}:scenes{sceneIDX,3},:,:));

%% Reconstruction
% use dark count or not
bUseDarkcount = true;
        
% options for the spatio-temporal psf:
%   0 - Dirac (no blur at all)
%   1 - spatial Gaussian (only spatial blur, no temporal blur)
%   2 - only temporal psf
%   3 - both spatial and temporal blur
psfoption = 2;

% ADMM parameter - should increase with smaller signal (more noise)
rho = 1e-1; % this seems to work great
lambda = 0.085;

% spatial convolution kernel
d = 5; 
c = fspecial('gaussian', [d d], 1);

if psfoption==0
    psf = 1;
elseif psfoption==1
    % only 2D psf
    psf = reshape(c, [1 d d]);
elseif psfoption==2
    % load temporal psf
    load('transient_imaging_code\scripts3D\misc\timePSF.mat');    
    % 3D psf
    psf = timePSF;
else
    % load temporal psf
    load('transient_imaging_code\scripts3D\misc\timePSF.mat');    
    % 3D psf
    psf = repmat(reshape(c, [1 d d]), [numel(timePSF) 1 1]) .* repmat(timePSF, [1 d d]);
end

% normalize psf
psf = psf ./ sum(psf(:));

if bUseDarkcount
    load('transient_imaging_code\data\dark.mat');
    
    % create 2D volume and scale by dividing by total number of time bins in raw data 
    dark = dark ./ 1536;

    % remove dead SPADs
    dark(:,181,:) = [];
    dark(:,77,:) = [];
    dark(:,7,:) = [];
end

% max number of iterations
maxIters = 25;

tic;

% 3D OTF
otf = psf2otf_3D(psf,size(raw));

% define function handle for 3D convolution
Afun = @(x) ifftn( fftn(x).*otf, 'symmetric');

% run deconvolution
if bUseDarkcount
    x = deconvADMMTV(Afun, raw, otf, maxIters, rho, lambda, false, repmat(dark, [size(raw,1) 1 250]));
else
    x = deconvADMMTV(Afun, raw, otf, maxIters, rho, lambda, false);
end
    
toc;

%% Visualization
figure
[K,M,N] = size(x);
for ii = 1:K
   
   img = squeeze(x(ii,:,:));
   subplot(1,2,1)
   imagesc(squeeze(raw(ii,:,:)))
   subplot(1,2,2)
   imagesc(img)
   pause(0.05);
   
end
