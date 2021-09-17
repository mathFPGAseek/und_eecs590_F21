
%---------------------------------------------------------------------
% file name : hmwk_1_prob_2.m
% Student: Ray Duran
% Date: 9/13/21
% Class : EECS 590 Professor Liang, Fall Semester
% University of North Dakota
% Descr: Use lens equation
%---------------------------------------------------------------------
n1 = 1.0003;
n2 = 1.5; % refractive index
f1 = 30; % mm
so = 75; % mm
f2 = 15; % mm

% Part a.
% use equation: 1/f = (nl-1)(1/R1 - 1/R2)
% First radius of  curvature R1 = 1/2*R2 or R2 = 2R1
% Rewriting above thins lens formula:
% (1/R1 - 1/R2) = (n1-1)/f
% Let R2 = 2R1
% 1/(2R1) = (n1-1)/f
% 2R1 = f/(n1-1)
% R1 =f/(2*(n1-1)) 
% Radius of curvature first lens
R1_first_lens = f1/(2*(1.0003-1));
R2_first_lens = 2*R1_first_lens;

R1_second_lens = f2/(2*(1.0003-1));
R2_second_lens = 2*R1_second_lens;

% Part b
% Determine intermediate image
% Use Gaussina lens formula
% 1/so + 1/si = 1/f
 si = 1/( 1/f1 - 1/so ); % location of intermediate image
% size of intermediate image
M = -si/so;

% Part c
% See Diagram

% Part d
% See Text



debug = 1;

% Experiment!
%so = 20; % Just beyond 2nd focal point
%si = 1/( 1/f2 - 1/so );

