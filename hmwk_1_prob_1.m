%parameters
n1 = 1.0003; % refraction index of air
n2 = 1.5;    % refreactionn index of glass
so = 1200;   % distance of object from sphere in cm
h  = 15;     % height of object in cm
r =  10;     % radius of sphere

% Check that angle is small to use paraxial approximation
% if the angle made by teh object path lo and so is small
% the the angle phi made by center of sphere and horizontal
% from projected line h is small; 
angle_obj = atan(h/so);


% convert to degrees
angle_obj_degrees = angle_obj*360/(2*pi);

if angle_obj_degrees <= 1
    disp('Angle small use paraxial approx')
else
    msg = 'Angle too large do not use paraxial approx error';
    error(msg)
end


% Use paraxial approx; Solve for si
si = n2/( ((n2-n1)/r) - n1/so);

debug = 1;

% Now, apply formula again to back sphere
% Now n2 = n1
% r = -10
% Solve for s1

si = n1/( ((n1-n2)/(-r)) - n1/(-so));

debug = 1;


