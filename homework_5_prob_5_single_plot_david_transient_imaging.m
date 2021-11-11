%{
figure(2)
img_single = squeeze(x(601,:,:));
imagesc(img_single)
title('David w/ Spatial & Temporal Blur Fr=601')
%}
%{
figure(3)
img_single = squeeze(x(601,:,:));
imagesc(img_single)
title('David w/ Only Spatial Gaussian Blur Fr=601')
%}

figure(4)
img_single = squeeze(x(601,:,:));
imagesc(img_single)
title('David w/ Only Temporal Blur Fr=601')