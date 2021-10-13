%---------------------------------------------------------------------
% file name : hmwk_3_prob_1_conv.m
% Student: Ray Duran
% Date: 10/5/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: 
% Convolution example by time-reversal and slide and summation
% direct- method, not using a function
%--------------------------------------------------------------------- 
clf
clear

%-----------------------------
%% Convolve first function
%-----------------------------
% First Function
p = 2.1 : .1 : 5;
f1 = 4*p -8;
figure(1)
subplot(2,2,1)
plot(p,f1)
title(' Original f first function')

% Time reverse our two defined slope function and generate a vector
t1 = 0; % Before start of convolution
p_tr = -5: .1 : -2.1; 
f1_tr = 4*(t1 -p_tr) -8;
%figure(2)
subplot(2,2,2)
plot(p_tr,f1_tr) % is our time-reversed vector that we will sweep across
          % our exponential function
title(' Time -reversed f first function')
          
% Generate second vector to convolve with first function
t2 = -5:.1:10;

% 
h = 2*exp(-t2);
g = -2*exp(-5*t2);
s = h+g;

% Now Let's convolve the functions s and f_tr
time_steps = size(s,2);
length_of_function = size(f1_tr,2);

conv1 = zeros(1,time_steps);
prod1 = zeros(1,length_of_function);
N = time_steps - length_of_function;

for i = 1 : N
    i1 = i-1;
    for k = 1 : length_of_function 
        prod1(k) = f1_tr(k)*s(i1+k);
        %debug
        if k == length_of_function-1
        debug = 1;
        end
    end
    conv1(i) = sum(prod1);
    %debug
    if i == N-5
        debug = 1;
    end
    prod1 = zeros(1,length_of_function);
end

%figure(3)
subplot(2,2,3)
plot(t2,conv1)
title('Approx conv of x with h : first function portion')

conv1_true = conv(f1,s);
length_conv1_true = size(conv1_true,2);
length_t2 = size(t2,2);
conv1_true_plot = zeros(1,length_t2);
%for m = 1 : length_conv1_true
for m = 1 : length_t2
   conv1_true_plot(m) = conv1_true(m);
end
%figure(4)
subplot(2,2,4)
plot(t2,conv1_true_plot)
title('True conv of x with h : first function portion')

debug = 1;
%-----------------------------
%% Convolve second function
%-----------------------------
% Second Function
p = 5.1 : .1 : 7;
f2 = -6*p + 42;
figure(2)
subplot(2,2,1)
plot(p,f2)
title(' Original f second function')

% Time reverse our two defined slope function and generate a vector
t1 = 0; % Before start of convolution
p_tr = -7: .1 : -5.1; 
f2_tr = -6*(t1 -p_tr) + 42;
%figure(6)
subplot(2,2,2)
plot(p_tr,f2_tr) % is our time-reversed vector that we will sweep across
          % our exponential function
title(' Time -reversed f second function')
          
% Generate second vector to convolve with first function
t2 = -7:.1:10;

% 
h = 2*exp(-t2);
g = -2*exp(-5*t2);
s = h+g;

% Now Let's convolve the functions s and f_tr
time_steps = size(s,2);
length_of_function = size(f2_tr,2);

conv2 = zeros(1,time_steps);
prod2 = zeros(1,length_of_function);
N = time_steps - length_of_function;

for i = 1 : N
    i1 = i-1;
    for k = 1 : length_of_function 
        prod2(k) = f2_tr(k)*s(i1+k);
        %debug
        if k == length_of_function-1
        debug = 1;
        end
    end
    conv2(i) = sum(prod2);
    %debug
    if i == N-5
        debug = 1;
    end
    prod2 = zeros(1,length_of_function);
end

%figure(7)
subplot(2,2,3)
plot(t2,conv2)
title('Approx conv of x with h : second function portion')

conv2_true = conv(f2,s);
length_conv1_true = size(conv2_true,2);
length_t2 = size(t2,2);
conv2_true_plot = zeros(1,length_t2);
%for m = 1 : length_conv1_true
for m = 1 : length_t2
   conv2_true_plot(m) = conv2_true(m);
end
%figure(8)
subplot(2,2,4)
plot(t2,conv2_true_plot)
title('True conv of x with h : second function portion')

%-----------------------------
%% Combine funcitons
%-----------------------------
% convolution property is distributive
% So, h*(f_g) = h*f + h*g

% We need to pad the first function as it goes from -5 to 10
% while the second function goes from -7 to 10 by .1
pad_zeros = zeros(1,20);
conv1_padded = [ pad_zeros conv1];
conv_final = conv1_padded + conv2;
figure(3)
plot(t2,conv_final)
title('Final convoloution sum')







