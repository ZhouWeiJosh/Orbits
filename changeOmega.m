% Constants
R_E = 6731.8;        % Earth's radius in km
altitude = 300;      % Altitude
P = R_E + altitude;  % Perigee distance
e = 0.5;             % Eccentricity

figure;

% for omega = 0:120:360

theta = linspace(0, 2*pi, 1000);  % True anomaly from 0 to 2π radians

r = P ./ (1 + e * cos(theta));

% Position in Orbital Plane (Before Rotation)
x_orb = r .* cos(theta);
y_orb = r .* sin(theta);

plot(x_orb, y_orb);

% % Convert rotation angle from degrees to radians
% omega_rad = deg2rad(omega);

% % Rotation Matrix for 2D Rotation
% R = [cos(omega_rad) -sin(omega_rad);
%      sin(omega_rad)  cos(omega_rad)];

% % Apply Rotation
% rotated_coords = R * [x_orb; y_orb];
% x_rot = rotated_coords(1, :);
% y_rot = rotated_coords(2, :);

% % Plotting
% plot(x_rot, y_rot, 'b-', 'LineWidth', 2);
% hold on;

% end

% plot(0, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
% xlabel('X (km)');
% ylabel('Y (km)');
% title('2D Rotated Elliptical Orbit');
% axis equal;
% grid on;