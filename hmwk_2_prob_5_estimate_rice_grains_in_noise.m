%---------------------------------------------------------------------
% file name : hmwk_2_prob_5_estimate_rice_grains_in_noise.m
% Student: Ray Duran
% Date: 9/29/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 
% Estimate the number of rice grains
%--------------------------------------------------------------------- 
image = imread('rice_noise.png');
figure(1)
imshow(image)


% Filter
JI = medfilt2(image);
figure(2)
imshow(JI)

figure(3)
imhist(JI)

% Adjust for darkness at bottom of image
% histogram used for range
rows = size(JI,1);
cols = size(JI,2);
for i = 1 : rows
    for j = 1 : cols
        if ( (JI(i,j) > 45 ) && (JI(i,j) < 75) )
            bw1(i,j) = 1;
        else
            bw1(i,j) = 0;
        end
    end
end

figure(4)
imshow(bw1)

[L1,num1] = bwlabel(~bw1,4)

k = 1;

% crop image
% Manually afjust for dark area
for i = 188 : rows
    for j = 1 : rows
        bw1_crop(k,j) = bw1(i,j);
    end
    k = k +1;
end

figure(5)
imshow(bw1_crop)

[L1,num1] = bwlabel(bw1_crop,4)


bw2 = JI > 150
figure(6)
imshow(bw2)

[L2,num2] = bwlabel(bw2,4)

% Estimate
rice_grain_count = num1 + num2;
X = ['Estimate of grain count is:', num2str(rice_grain_count)];
disp(X)


