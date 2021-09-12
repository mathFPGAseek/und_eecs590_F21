function createfigure(X1, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9)
%CREATEFIGURE(X1, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9)
%  X1:  vector of x data
%  Y1:  vector of y data
%  Y2:  vector of y data
%  Y3:  vector of y data
%  Y4:  vector of y data
%  Y5:  vector of y data
%  Y6:  vector of y data
%  Y7:  vector of y data
%  Y8:  vector of y data
%  Y9:  vector of y data

%  Auto-generated by MATLAB on 12-Sep-2021 16:47:04

% Create figure
figure1 = figure;

% Create subplot
subplot1 = subplot(9,1,1,'Parent',figure1);
hold(subplot1,'on');

% Create plot
plot(X1,Y1,'Parent',subplot1);

% Create title
title('Tranverse Wave Propagated Initial t = T');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot1,[0 42]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot1,[-1.1 1.1]);
box(subplot1,'on');
% Create subplot
subplot2 = subplot(9,1,2,'Parent',figure1);
hold(subplot2,'on');

% Create plot
plot(X1,Y2,'Parent',subplot2);

% Create title
title(' Tranverse Wave Propagated t = T + 1/8T');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot2,[0 42]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot2,[-1.1 1.1]);
box(subplot2,'on');
% Create subplot
subplot3 = subplot(9,1,3,'Parent',figure1);
hold(subplot3,'on');

% Create plot
plot(X1,Y3,'Parent',subplot3);

% Create title
title(' Tranverse Wave Propagated t = T + 2/8T');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot3,[0 42]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot3,[-1.1 1.1]);
box(subplot3,'on');
% Create subplot
subplot4 = subplot(9,1,4,'Parent',figure1);
hold(subplot4,'on');

% Create plot
plot(X1,Y4,'Parent',subplot4);

% Create title
title(' Tranverse Wave Propagated t = T + 3/8T');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot4,[0 42]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot4,[-1.1 1.1]);
box(subplot4,'on');
% Create subplot
subplot5 = subplot(9,1,5,'Parent',figure1);
hold(subplot5,'on');

% Create plot
plot(X1,Y5,'Parent',subplot5);

% Create title
title(' Tranverse Wave Propagated t = T + 4/8T');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot5,[0 42]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot5,[-1.1 1.1]);
box(subplot5,'on');
% Create subplot
subplot6 = subplot(9,1,6,'Parent',figure1);
hold(subplot6,'on');

% Create plot
plot(X1,Y6,'Parent',subplot6);

% Create title
title(' Tranverse Wave Propagated t = T + 5/8T');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot6,[0 42]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot6,[-1.1 1.1]);
box(subplot6,'on');
% Create subplot
subplot7 = subplot(9,1,7,'Parent',figure1);
hold(subplot7,'on');

% Create plot
plot(X1,Y7,'Parent',subplot7);

% Create title
title(' Tranverse Wave Propagated t = T + 6/8T');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot7,[0 42]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot7,[-1.1 1.1]);
box(subplot7,'on');
% Create subplot
subplot8 = subplot(9,1,8,'Parent',figure1);
hold(subplot8,'on');

% Create plot
plot(X1,Y8,'Parent',subplot8);

% Create title
title(' Tranverse Wave Propagated t = T + 7/8T');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot8,[0 42]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot8,[-1.1 1.1]);
box(subplot8,'on');
% Create subplot
subplot9 = subplot(9,1,9,'Parent',figure1);
hold(subplot9,'on');

% Create plot
plot(X1,Y9,'Parent',subplot9);

% Create title
title(' Tranverse Wave Propagated t = 2T');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot9,[0 42]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot9,[-1.1 1.1]);
box(subplot9,'on');
