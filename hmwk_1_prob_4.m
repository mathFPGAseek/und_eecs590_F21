%---------------------------------------------------------------------
% file name : hmwk_1_prob_4.m
% Student: Ray Duran
% Date: 9/12/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: Model traverse wave nature of light
%---------------------------------------------------------------------
A = 1;
t = [-3*pi:pi/8:2*pi]
y_leading_zeros = zeros(1,83);
y = sin(t - pi );

% pad zeros in front of wave
y_padded = [ y y_leading_zeros];

%plot(t,y)
debug = 1;

t_sample = 1 : 100;

% initial position
figure(1)
subplot(9,1,1)
plot(t_sample,y_padded(t_sample+24))
axis([0 42 -1.1 1.1]);
title('Tranverse Wave Propagated Initial t = T')

%  Transverse wave at 1/8T
y_at_18 = circshift(y_padded,2);% propagate for light ; In model just do a circular shift
subplot(9,1,2)
plot(t_sample,y_at_18(t_sample+24))
axis([0 42 -1.1 1.1]);
title(' Tranverse Wave Propagated t = T + 1/8T')

%  Transverse wave at 2/8T
y_at_28 = circshift(y_padded,4);% propagate for light ; In model just do a circular shift
subplot(9,1,3)
plot(t_sample,y_at_28(t_sample+24))
axis([0 42 -1.1 1.1]);
title(' Tranverse Wave Propagated t = T + 2/8T')

%  Transverse wave at 3/8T
y_at_38 = circshift(y_padded,6);% propagate for light ; In model just do a circular shift
subplot(9,1,4)
plot(t_sample,y_at_38(t_sample+24))
axis([0 42 -1.1 1.1]);
title(' Tranverse Wave Propagated t = T + 3/8T')

%  Transverse wave at 4/8T
y_at_48 = circshift(y_padded,8);% propagate for light ; In model just do a circular shift
subplot(9,1,5)
plot(t_sample,y_at_48(t_sample+24))
axis([0 42 -1.1 1.1]);
title(' Tranverse Wave Propagated t = T + 4/8T')

%  Transverse wave at 5/8T
y_at_58 = circshift(y_padded,10);% propagate for light ; In model just do a circular shift
subplot(9,1,6)
plot(t_sample,y_at_58(t_sample+24))
axis([0 42 -1.1 1.1]);
title(' Tranverse Wave Propagated t = T + 5/8T')

%  Transverse wave at 6/8T
y_at_68 = circshift(y_padded,12);% propagate for light ; In model just do a circular shift
subplot(9,1,7)
plot(t_sample,y_at_68(t_sample+24))
axis([0 42 -1.1 1.1]);
title(' Tranverse Wave Propagated t = T + 6/8T')

%  Transverse wave at 7/8T
y_at_78 = circshift(y_padded,14);% propagate for light ; In model just do a circular shift
subplot(9,1,8)
plot(t_sample,y_at_78(t_sample+24))
axis([0 42 -1.1 1.1]);
title(' Tranverse Wave Propagated t = T + 7/8T')


%  Transverse wave at 8/8T
y_at_88 = circshift(y_padded,16);% propagate for light ; In model just do a circular shift
subplot(9,1,9)
plot(t_sample,y_at_88(t_sample+24))
axis([0 42 -1.1 1.1]);
title(' Tranverse Wave Propagated t = 2T')

debug = 1;
