function createfigure(cdata1)
%CREATEFIGURE(cdata1)
%  CDATA1:  image cdata

%  Auto-generated by MATLAB on 11-Sep-2021 18:42:32

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
axis off
hold(axes1,'on');

% Create image
image(cdata1,'Parent',axes1,'CDataMapping','scaled');

% Create title
title('Amplitude Spectrum');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.5 256.5]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0.5 256.5]);
box(axes1,'on');
axis(axes1,'square');
% Set the remaining axes properties
set(axes1,'CLim',[0 2000],'Layer','top');
% Create colorbar
colorbar(axes1);

